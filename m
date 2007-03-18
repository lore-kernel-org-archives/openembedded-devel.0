Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <zecke@selfish.org>) id 1HSv9h-00038Y-K8
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2007 14:10:38 +0100
Received: from [88.134.99.50] (helo=[192.168.1.100])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1HSv9h-0004CL-3o
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2007 14:10:37 +0100
Mime-Version: 1.0 (Apple Message framework v752.3)
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
Message-Id: <356565EA-C15E-4E79-809C-F4AFD98E3AB7@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Sun, 18 Mar 2007 14:10:32 +0100
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 88.134.99.50
Subject: RFC Virtual Chroot
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Mar 2007 13:10:39 -0000
X-Groupsio-MsgNum: 1641
Content-Type: multipart/mixed; boundary=Apple-Mail-8-495220731

--Apple-Mail-8-495220731
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

Hi Freaks,

inspired by one of the Project Ideas of MacPorts here is an idea we  
could use. When compiling, configuring, installing software we, the  
developers, have a pretty good idea where the buildsystem is allowed  
to look at. Sometimes the crappy buildsystemd have different ideas.

What I propose is that we define a whitelist and an additional  
blacklist of directories for each task and configuration. E.g. if we  
build packages we whitelist the directories from PATH, but blacklist  
the various possible libraries directors. We whitelist the  
STAGING_LIBDIR and the S directory. On native builds we could  
whitelist the various /lib directories as well.

This could be implemented on FreeBSD and Linux using LD_PRELOAD. The  
code below, which is not yet completed, tries to reimplement the open  
method to apply white and blacklisting. BitBake/OE would need to  
export the LD_PRELOAD variable and the OE_WHITE_LIST and  
OE_BLACK_LIST variable. This tool will enforce this.

Ideas, Comments, Feedback, Code?

	z.




--Apple-Mail-8-495220731
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name=vchroot.c
Content-Disposition: attachment;
	filename=vchroot.c

/*
 * Copyright (C) 2007 Holger Hans Peter Freyther
 *
 * See COPYING.MIT for the license
 *
 */

#include <dlfcn.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

#include <sys/param.h>

#define SIZE_OF(x) (sizeof(x)/sizeof((x)[0]))

/*
 * up to 255 different path's/files are allowed
 */
static const char* allowed_paths[255];
static char  tmp_path[MAXPATHLEN+1];


typedef int (*open_t)(const char*, int, mode_t);
open_t open_method = NULL;


/*
 * use getenv to extract the key and split the allowed paths up
 */
static void parse_environment(void)
{
    /*
     * lame init
     */
    for( int i = 0; i < SIZE_OF(allowed_paths); ++i)
        allowed_paths[i] = NULL;

    /*
     * we don't use strtok here but our own small splitter.
     * We try to split on " " but if we have seen a "'" we need
     * to wait until the next "'". We don't do any unquoting here...
     * If we have more than SIZE_OF(allowed_paths) we will abort
     */
}

/*
 * our special open
 */
int open(const char *path, int flags, mode_t mode )
{
    if ( path == NULL || strlen(path) == 0 )
        return -1;

    /*
     * initialize, make sure we do not use anything that comes from open...
     */
    if ( open_method == NULL ) {
        parse_environment();
        void *clib = dlopen( "libc.so", RTLD_LAZY | RTLD_LOCAL );
        if ( clib == NULL ) {
            fprintf(stderr, "Failed opening the C lib, aborting\n");
            abort();
        }

        open_method = (open_t) dlsym( clib, "open" );
        if ( open_method == NULL ) {
            fprintf(stderr, "Failed loading the real open method\n");
            abort();
        }
    }

    /*
     * 'audit' the path. We can be easily tricked by '../../' or relative directories
     */
    char *audit_path = 0;    
    int string_len = strlen(path);

    /*
     * Is this a relative
     *   foo
     *   .foo
     *   ./foo
     *   . and string_len == 1 is opening a dir...
     *
     *   are all relative
     */
    if ( path[0] != '/' ||  (string_len == 1 && path[0] != '.') || (string_len > 1 && path[0] == '.' && path[1] != '.') ) {
        if( getcwd(tmp_path, MAXPATHLEN) == NULL ) {
            fprintf(stderr, "Getting the current working directory failed\n");
            abort();
        }

        /*
         * copy the new absolute path
         */
        int copy_len = strlen(tmp_path) + 1 + string_len + 1;
        audit_path = (char*)malloc(copy_len*sizeof(char));
        strcpy(audit_path, tmp_path);
        strcpy(audit_path+strlen(tmp_path), "/");
        strcpy(audit_path+strlen(tmp_path)+strlen("/"), path);
    } else if ( string_len >= 3 && path[0] == '.' && path[1] == '.' && path[2] == '/' ) {
        /*
         * the ugly part... and I wonder why C is considered harmful
         */
    } else if ( path[0] == '/' ) {
        /*
         * ugly as well this and the above branch should call a common method to
         * fixup the ../
         */
    }


    /*
     * we now have the path we want to audit. Let us look in the whitelist
     */
    char *white_path = NULL;
    int  i = 0;
    while ( (white_path=tmp_path[i++]) != NULL ) {
        char* result = strstr( audit_path, white_path );
        if ( result == white_path )
            return open_method( path, flags, mode ); 
    }


    /*
     * Access violation
     */
    fprintf(stderr, "OE QA Access violation. This software wants to access '%s' => '%s'\n", path, audit_path); 
    abort();
}

--Apple-Mail-8-495220731--
