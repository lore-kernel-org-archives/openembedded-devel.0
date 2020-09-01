Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.9115.1598952147951420111
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 02:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0819MQHS014961
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 1 Sep 2020 02:22:27 -0700 (PDT)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 1 Sep 2020
 02:22:08 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [dunfell][meta-networking][PATCH] net-snmp: Fix CVE-2020-15861 and CVE-2020-15862
Date: Tue, 1 Sep 2020 12:22:00 +0300
Message-ID: <20200901092200.18034-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Net-SNMP through 5.7.3 allows Escalation of Privileges because of UNIX symbolic
link (symlink) following.

Net-SNMP through 5.7.3 has Improper Privilege Management because SNMP WRITE
access to the EXTEND MIB provides the ability to run arbitrary commands as
root.

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-15861
https://nvd.nist.gov/vuln/detail/CVE-2020-15862

Upstream patches:
https://github.com/net-snmp/net-snmp/commit/2b3e300ade4add03b889e61d610b0db77d300fc3
https://github.com/net-snmp/net-snmp/commit/9cfb38b0aa95363da1466ca81dd929989ba27c1f
https://github.com/net-snmp/net-snmp/commit/114e4c2cec2601ca56e8afb1f441520f75a9a312
https://github.com/net-snmp/net-snmp/commit/2968b455e6f182f329746e2bca1043f368618c73
https://github.com/net-snmp/net-snmp/commit/4fd9a450444a434a993bc72f7c3486ccce41f602
https://github.com/net-snmp/net-snmp/commit/77f6c60f57dba0aaea5d8ef1dd94bcd0c8e6d205

CVE-2020-15861-0005.patch is the actual fix for CVE-2020-15861 and
CVE-2020-15861-0001.patch through CVE-2020-15861-0004.patch are context
patches needed by the fix to apply cleanly.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../net-snmp/CVE-2020-15861-0001.patch        | 164 ++++++++
 .../net-snmp/CVE-2020-15861-0002.patch        |  44 +++
 .../net-snmp/CVE-2020-15861-0003.patch        |  40 ++
 .../net-snmp/CVE-2020-15861-0004.patch        |  33 ++
 .../net-snmp/CVE-2020-15861-0005.patch        | 349 ++++++++++++++++++
 .../net-snmp/net-snmp/CVE-2020-15862.patch    |  87 +++++
 .../net-snmp/net-snmp_5.8.bb                  |   6 +
 7 files changed, 723 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0001.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0002.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0003.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0004.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0005.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15862.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0001.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0001.patch
new file mode 100644
index 000000000..f43803a66
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0001.patch
@@ -0,0 +1,164 @@
+From c449946b9d06571b447fce3fc0dcad89e8df05b5 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Wed, 15 May 2019 14:09:25 +0200
+Subject: [PATCH 1/5] CHANGES: libsnmp: Scan MIB directories in alphabetical
+ order
+
+This guarantees that e.g. mibs/RFC1213-MIB.txt is read before mibs/SNMPv2-MIB.txt.
+The order in which these MIBs is read matters because both define sysLocation but
+with different attributes.
+
+CVE: CVE-2020-15861
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/2b3e300ade4add03b889e61d610b0db77d300fc3]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ snmplib/parse.c | 113 +++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 82 insertions(+), 31 deletions(-)
+
+diff --git a/snmplib/parse.c b/snmplib/parse.c
+index 7678b35..51d119b 100644
+--- a/snmplib/parse.c
++++ b/snmplib/parse.c
+@@ -4894,6 +4894,79 @@ add_mibfile(const char* tmpstr, const char* d_name, FILE *ip )
+     }
+ }
+ 
++static int elemcmp(const void *a, const void *b)
++{
++    const char *const *s1 = a, *const *s2 = b;
++
++    return strcmp(*s1, *s2);
++}
++
++/*
++ * Scan a directory and return all filenames found as an array of pointers to
++ * directory entries (@result).
++ */
++static int scan_directory(char ***result, const char *dirname)
++{
++    DIR            *dir, *dir2;
++    struct dirent  *file;
++    char          **filenames = NULL;
++    int             fname_len, i, filename_count = 0, array_size = 0;
++    char           *tmpstr;
++
++    *result = NULL;
++
++    dir = opendir(dirname);
++    if (!dir)
++        return -1;
++
++    while ((file = readdir(dir))) {
++        /*
++         * Only parse file names that don't begin with a '.'
++         * Also skip files ending in '~', or starting/ending
++         * with '#' which are typically editor backup files.
++         */
++        fname_len = strlen(file->d_name);
++        if (fname_len > 0 && file->d_name[0] != '.'
++            && file->d_name[0] != '#'
++            && file->d_name[fname_len-1] != '#'
++            && file->d_name[fname_len-1] != '~') {
++            if (asprintf(&tmpstr, "%s/%s", dirname, file->d_name) < 0)
++                continue;
++            dir2 = opendir(tmpstr);
++            if (dir2) {
++                /* file is a directory, don't read it */
++                closedir(dir2);
++            } else {
++                if (filename_count >= array_size) {
++                    char **new_filenames;
++
++                    array_size = (array_size + 16) * 2;
++                    new_filenames = realloc(filenames,
++                                        array_size * sizeof(filenames[0]));
++                    if (!new_filenames) {
++                        free(tmpstr);
++                        for (i = 0; i < filename_count; i++)
++                            free(filenames[i]);
++                        free(filenames);
++                        closedir(dir);
++                        return -1;
++                    }
++                    filenames = new_filenames;
++                }
++                filenames[filename_count++] = tmpstr;
++                tmpstr = NULL;
++            }
++            free(tmpstr);
++        }
++    }
++    closedir(dir);
++
++    qsort(filenames, filename_count, sizeof(filenames[0]), elemcmp);
++    *result = filenames;
++
++    return filename_count;
++}
++
+ /* For Win32 platforms, the directory does not maintain a last modification
+  * date that we can compare with the modification date of the .index file.
+  * Therefore there is no way to know whether any .index file is valid.
+@@ -4904,12 +4977,11 @@ int
+ add_mibdir(const char *dirname)
+ {
+     FILE           *ip;
+-    DIR            *dir, *dir2;
+     const char     *oldFile = File;
+-    struct dirent  *file;
++    char          **filenames;
+     char            tmpstr[300];
+     int             count = 0;
+-    int             fname_len = 0;
++    int             filename_count, i;
+ #if !(defined(WIN32) || defined(cygwin))
+     char           *token;
+     char space;
+@@ -4957,36 +5029,15 @@ add_mibdir(const char *dirname)
+         DEBUGMSGTL(("parse-mibs", "No index\n"));
+ #endif
+ 
+-    if ((dir = opendir(dirname))) {
+-        ip = netsnmp_mibindex_new( dirname );
+-        while ((file = readdir(dir))) {
+-            /*
+-             * Only parse file names that don't begin with a '.' 
+-             * Also skip files ending in '~', or starting/ending
+-             * with '#' which are typically editor backup files.
+-             */
+-            if (file->d_name != NULL) {
+-              fname_len = strlen( file->d_name );
+-              if (fname_len > 0 && file->d_name[0] != '.' 
+-                                && file->d_name[0] != '#'
+-                                && file->d_name[fname_len-1] != '#'
+-                                && file->d_name[fname_len-1] != '~') {
+-                snprintf(tmpstr, sizeof(tmpstr), "%s/%s", dirname, file->d_name);
+-                tmpstr[ sizeof(tmpstr)-1 ] = 0;
+-                if ((dir2 = opendir(tmpstr))) {
+-                    /*
+-                     * file is a directory, don't read it 
+-                     */
+-                    closedir(dir2);
+-                } else {
+-                    if ( !add_mibfile( tmpstr, file->d_name, ip ))
+-                        count++;
+-                }
+-              }
+-            }
++    filename_count = scan_directory(&filenames, dirname);
++
++    if (filename_count >= 0) {
++        ip = netsnmp_mibindex_new(dirname);
++        for (i = 0; i < filename_count; i++) {
++            if (add_mibfile(filenames[i], strrchr(filenames[i], '/'), ip) == 0)
++                count++;
+         }
+         File = oldFile;
+-        closedir(dir);
+         if (ip)
+             fclose(ip);
+         return (count);
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0002.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0002.patch
new file mode 100644
index 000000000..e54a8b4ac
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0002.patch
@@ -0,0 +1,44 @@
+From 50118392c58c8d9554580373c0dbc542336b58a9 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Thu, 16 May 2019 13:49:05 +0200
+Subject: [PATCH 2/5] libsnmp: Fix two recently introduced issues in the MIB
+ parsing code
+
+Ensure that the first argument passed to qsort() is not NULL. Free the memory
+that holds the directory contents.
+
+Fixes: 2b3e300ade4a ("CHANGES: libsnmp: Scan MIB directories in alphabetical order")
+
+CVE: CVE-2020-15861
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/9cfb38b0aa95363da1466ca81dd929989ba27c1f]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ snmplib/parse.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/snmplib/parse.c b/snmplib/parse.c
+index 51d119b..200ba25 100644
+--- a/snmplib/parse.c
++++ b/snmplib/parse.c
+@@ -4961,7 +4961,8 @@ static int scan_directory(char ***result, const char *dirname)
+     }
+     closedir(dir);
+ 
+-    qsort(filenames, filename_count, sizeof(filenames[0]), elemcmp);
++    if (filenames)
++        qsort(filenames, filename_count, sizeof(filenames[0]), elemcmp);
+     *result = filenames;
+ 
+     return filename_count;
+@@ -5040,6 +5041,7 @@ add_mibdir(const char *dirname)
+         File = oldFile;
+         if (ip)
+             fclose(ip);
++        free(filenames);
+         return (count);
+     }
+     else
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0003.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0003.patch
new file mode 100644
index 000000000..03acbbab9
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0003.patch
@@ -0,0 +1,40 @@
+From c98808036c86a4ac4877ea13dbcef096b57e49f8 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Wed, 22 May 2019 10:08:53 +0200
+Subject: [PATCH 3/5] libsnmp: Fix a compiler warning
+
+Avoid that the compiler complains on Windows systems that tmpstr[] is not used.
+
+Fixes: 2b3e300ade4a ("CHANGES: libsnmp: Scan MIB directories in alphabetical order")
+
+CVE: CVE-2020-15861
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/114e4c2cec2601ca56e8afb1f441520f75a9a312]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ snmplib/parse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/snmplib/parse.c b/snmplib/parse.c
+index 200ba25..0414337 100644
+--- a/snmplib/parse.c
++++ b/snmplib/parse.c
+@@ -4980,7 +4980,6 @@ add_mibdir(const char *dirname)
+     FILE           *ip;
+     const char     *oldFile = File;
+     char          **filenames;
+-    char            tmpstr[300];
+     int             count = 0;
+     int             filename_count, i;
+ #if !(defined(WIN32) || defined(cygwin))
+@@ -4988,6 +4987,7 @@ add_mibdir(const char *dirname)
+     char space;
+     char newline;
+     struct stat     dir_stat, idx_stat;
++    char            tmpstr[300];
+     char            tmpstr1[300];
+ #endif
+ 
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0004.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0004.patch
new file mode 100644
index 000000000..f0e709636
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0004.patch
@@ -0,0 +1,33 @@
+From 545742d1867d70a645a63161ede4a391456691fc Mon Sep 17 00:00:00 2001
+From: Bill Fenner <fenner@gmail.com>
+Date: Mon, 3 Jun 2019 10:01:08 -0700
+Subject: [PATCH 4/5] libsnmp: free filenames from directory listing
+
+Free each filename as we use it, as well as freeing the
+list of filenames.
+
+Fixes: 2b3e300ade4a ("CHANGES: libsnmp: Scan MIB directories in alphabetical order")
+
+CVE: CVE-2020-15861
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/2968b455e6f182f329746e2bca1043f368618c73]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ snmplib/parse.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/snmplib/parse.c b/snmplib/parse.c
+index 0414337..7f98542 100644
+--- a/snmplib/parse.c
++++ b/snmplib/parse.c
+@@ -5037,6 +5037,7 @@ add_mibdir(const char *dirname)
+         for (i = 0; i < filename_count; i++) {
+             if (add_mibfile(filenames[i], strrchr(filenames[i], '/'), ip) == 0)
+                 count++;
++	    free(filenames[i]);
+         }
+         File = oldFile;
+         if (ip)
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0005.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0005.patch
new file mode 100644
index 000000000..66a16f6db
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15861-0005.patch
@@ -0,0 +1,349 @@
+From 83d6c5181828921b3731878588b3728de704d490 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Wed, 22 May 2019 09:56:21 +0200
+Subject: [PATCH 5/5] CHANGES: snmpd: Stop reading and writing the
+ mib_indexes/* files
+
+Caching directory contents is something the operating system should do
+and is not something Net-SNMP should do. Instead of storing a copy of
+the directory contents in ${tmp_dir}/mib_indexes/${n}, always scan a
+MIB directory.
+
+CVE: CVE-2020-15861
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/4fd9a450444a434a993bc72f7c3486ccce41f602]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ .gitignore                       |   1 -
+ include/net-snmp/library/mib.h   |   3 -
+ include/net-snmp/library/parse.h |   2 +-
+ snmplib/mib.c                    | 148 +------------------------------
+ snmplib/parse.c                  |  57 +-----------
+ 5 files changed, 4 insertions(+), 207 deletions(-)
+
+diff --git a/.gitignore b/.gitignore
+index 2d37bc6..94da568 100644
+--- a/.gitignore
++++ b/.gitignore
+@@ -75,7 +75,6 @@ Makefile
+ man/*.[1358]
+ man/default_store.3.h
+ man/manaliases
+-mibs/.index
+ mk/
+ module_tmp_header.h
+ net-snmp-5*
+diff --git a/include/net-snmp/library/mib.h b/include/net-snmp/library/mib.h
+index ab36853..3e81634 100644
+--- a/include/net-snmp/library/mib.h
++++ b/include/net-snmp/library/mib.h
+@@ -124,9 +124,6 @@ SOFTWARE.
+     NETSNMP_IMPORT
+     char            *netsnmp_get_mib_directory(void);
+     void            netsnmp_fixup_mib_directory(void);
+-    void            netsnmp_mibindex_load( void );
+-    char *          netsnmp_mibindex_lookup( const char * );
+-    FILE *          netsnmp_mibindex_new( const char * );
+     int             sprint_realloc_description(u_char ** buf, size_t * buf_len,
+                                 size_t * out_len, int allow_realloc,
+                                 oid * objid, size_t objidlen, int width);
+diff --git a/include/net-snmp/library/parse.h b/include/net-snmp/library/parse.h
+index ce46ab9..7c33d3f 100644
+--- a/include/net-snmp/library/parse.h
++++ b/include/net-snmp/library/parse.h
+@@ -201,7 +201,7 @@ SOFTWARE.
+ #endif
+     void            netsnmp_init_mib_internals(void);
+     void            unload_all_mibs(void);
+-    int             add_mibfile(const char*, const char*, FILE *);
++    int             add_mibfile(const char*, const char*);
+     int             which_module(const char *);
+     NETSNMP_IMPORT
+     char           *module_name(int, char *);
+diff --git a/snmplib/mib.c b/snmplib/mib.c
+index 1c875c0..30d6cde 100644
+--- a/snmplib/mib.c
++++ b/snmplib/mib.c
+@@ -2717,7 +2717,6 @@ netsnmp_init_mib(void)
+     env_var = strdup(netsnmp_get_mib_directory());
+     if (!env_var)
+         return;
+-    netsnmp_mibindex_load();
+ 
+     DEBUGMSGTL(("init_mib",
+                 "Seen MIBDIRS: Looking in '%s' for mib dirs ...\n",
+@@ -2737,7 +2736,7 @@ netsnmp_init_mib(void)
+         else
+             entry = strtok_r(env_var, ENV_SEPARATOR, &st);
+         while (entry) {
+-            add_mibfile(entry, NULL, NULL);
++            add_mibfile(entry, NULL);
+             entry = strtok_r(NULL, ENV_SEPARATOR, &st);
+         }
+     }
+@@ -2888,142 +2887,6 @@ init_mib(void)
+ #endif
+ 
+ 
+-/*
+- * Handle MIB indexes centrally
+- */
+-static int _mibindex     = 0;   /* Last index in use */
+-static int _mibindex_max = 0;   /* Size of index array */
+-char     **_mibindexes   = NULL;
+-
+-int _mibindex_add( const char *dirname, int i );
+-void
+-netsnmp_mibindex_load( void )
+-{
+-    DIR *dir;
+-    struct dirent *file;
+-    FILE *fp;
+-    char tmpbuf[ 300];
+-    char tmpbuf2[300];
+-    int  i;
+-    char *cp;
+-
+-    /*
+-     * Open the MIB index directory, or create it (empty)
+-     */
+-    snprintf( tmpbuf, sizeof(tmpbuf), "%s/mib_indexes",
+-              get_persistent_directory());
+-    tmpbuf[sizeof(tmpbuf)-1] = 0;
+-    dir = opendir( tmpbuf );
+-    if ( dir == NULL ) {
+-        DEBUGMSGTL(("mibindex", "load: (new)\n"));
+-        mkdirhier( tmpbuf, NETSNMP_AGENT_DIRECTORY_MODE, 0);
+-        return;
+-    }
+-
+-    /*
+-     * Create a list of which directory each file refers to
+-     */
+-    while ((file = readdir( dir ))) {
+-        if ( !isdigit((unsigned char)(file->d_name[0])))
+-            continue;
+-        i = atoi( file->d_name );
+-
+-        snprintf( tmpbuf, sizeof(tmpbuf), "%s/mib_indexes/%d",
+-              get_persistent_directory(), i );
+-        tmpbuf[sizeof(tmpbuf)-1] = 0;
+-        fp = fopen( tmpbuf, "r" );
+-        if (!fp)
+-            continue;
+-        cp = fgets( tmpbuf2, sizeof(tmpbuf2), fp );
+-        fclose( fp );
+-        if ( !cp ) {
+-            DEBUGMSGTL(("mibindex", "Empty MIB index (%d)\n", i));
+-            continue;
+-        }
+-        if ( strncmp( tmpbuf2, "DIR ", 4 ) != 0 ) {
+-            DEBUGMSGTL(("mibindex", "Malformed MIB index (%d)\n", i));
+-            continue;
+-        }
+-        tmpbuf2[strlen(tmpbuf2)-1] = 0;
+-        DEBUGMSGTL(("mibindex", "load: (%d) %s\n", i, tmpbuf2));
+-        (void)_mibindex_add( tmpbuf2+4, i );  /* Skip 'DIR ' */
+-    }
+-    closedir( dir );
+-}
+-
+-char *
+-netsnmp_mibindex_lookup( const char *dirname )
+-{
+-    int i;
+-    static char tmpbuf[300];
+-
+-    for (i=0; i<_mibindex; i++) {
+-        if ( _mibindexes[i] &&
+-             strcmp( _mibindexes[i], dirname ) == 0) {
+-             snprintf(tmpbuf, sizeof(tmpbuf), "%s/mib_indexes/%d",
+-                      get_persistent_directory(), i);
+-             tmpbuf[sizeof(tmpbuf)-1] = 0;
+-             DEBUGMSGTL(("mibindex", "lookup: %s (%d) %s\n", dirname, i, tmpbuf ));
+-             return tmpbuf;
+-        }
+-    }
+-    DEBUGMSGTL(("mibindex", "lookup: (none)\n"));
+-    return NULL;
+-}
+-
+-int
+-_mibindex_add( const char *dirname, int i )
+-{
+-    const int old_mibindex_max = _mibindex_max;
+-
+-    DEBUGMSGTL(("mibindex", "add: %s (%d)\n", dirname, i ));
+-    if ( i == -1 )
+-        i = _mibindex++;
+-    if ( i >= _mibindex_max ) {
+-        /*
+-         * If the index array is full (or non-existent)
+-         *   then expand (or create) it
+-         */
+-        _mibindex_max = i + 10;
+-        _mibindexes = realloc(_mibindexes,
+-                              _mibindex_max * sizeof(_mibindexes[0]));
+-        netsnmp_assert(_mibindexes);
+-        memset(_mibindexes + old_mibindex_max, 0,
+-               (_mibindex_max - old_mibindex_max) * sizeof(_mibindexes[0]));
+-    }
+-
+-    _mibindexes[ i ] = strdup( dirname );
+-    if ( i >= _mibindex )
+-        _mibindex = i+1;
+-
+-    DEBUGMSGTL(("mibindex", "add: %d/%d/%d\n", i, _mibindex, _mibindex_max ));
+-    return i;
+-}
+-    
+-FILE *
+-netsnmp_mibindex_new( const char *dirname )
+-{
+-    FILE *fp;
+-    char  tmpbuf[300];
+-    char *cp;
+-    int   i;
+-
+-    cp = netsnmp_mibindex_lookup( dirname );
+-    if (!cp) {
+-        i  = _mibindex_add( dirname, -1 );
+-        snprintf( tmpbuf, sizeof(tmpbuf), "%s/mib_indexes/%d",
+-                  get_persistent_directory(), i );
+-        tmpbuf[sizeof(tmpbuf)-1] = 0;
+-        cp = tmpbuf;
+-    }
+-    DEBUGMSGTL(("mibindex", "new: %s (%s)\n", dirname, cp ));
+-    fp = fopen( cp, "w" );
+-    if (fp)
+-        fprintf( fp, "DIR %s\n", dirname );
+-    return fp;
+-}
+-
+-
+ /**
+  * Unloads all mibs.
+  */
+@@ -3038,15 +2901,6 @@ shutdown_mib(void)
+     }
+     tree_head = NULL;
+     Mib = NULL;
+-    if (_mibindexes) {
+-        int i;
+-        for (i = 0; i < _mibindex; ++i)
+-            SNMP_FREE(_mibindexes[i]);
+-        free(_mibindexes);
+-        _mibindex = 0;
+-        _mibindex_max = 0;
+-        _mibindexes = NULL;
+-    }
+     if (Prefix != NULL && Prefix != &Standard_Prefix[0])
+         SNMP_FREE(Prefix);
+     if (Prefix)
+diff --git a/snmplib/parse.c b/snmplib/parse.c
+index 7f98542..58d777e 100644
+--- a/snmplib/parse.c
++++ b/snmplib/parse.c
+@@ -607,8 +607,6 @@ static int     read_module_replacements(const char *);
+ static int     read_import_replacements(const char *,
+                                          struct module_import *);
+ 
+-static void     new_module(const char *, const char *);
+-
+ static struct node *merge_parse_objectid(struct node *, FILE *, char *);
+ static struct index_list *getIndexes(FILE * fp, struct index_list **);
+ static struct varbind_list *getVarbinds(FILE * fp, struct varbind_list **);
+@@ -4859,7 +4857,7 @@ snmp_get_token(FILE * fp, char *token, int maxtlen)
+ #endif /* NETSNMP_FEATURE_REMOVE_PARSE_GET_TOKEN */
+ 
+ int
+-add_mibfile(const char* tmpstr, const char* d_name, FILE *ip )
++add_mibfile(const char* tmpstr, const char* d_name)
+ {
+     FILE           *fp;
+     char            token[MAXTOKEN], token2[MAXTOKEN];
+@@ -4884,8 +4882,6 @@ add_mibfile(const char* tmpstr, const char* d_name, FILE *ip )
+      */
+     if (get_token(fp, token2, MAXTOKEN) == DEFINITIONS) {
+         new_module(token, tmpstr);
+-        if (ip)
+-            fprintf(ip, "%s %s\n", token, d_name);
+         fclose(fp);
+         return 0;
+     } else {
+@@ -4977,71 +4973,22 @@ static int scan_directory(char ***result, const char *dirname)
+ int
+ add_mibdir(const char *dirname)
+ {
+-    FILE           *ip;
+     const char     *oldFile = File;
+     char          **filenames;
+     int             count = 0;
+     int             filename_count, i;
+-#if !(defined(WIN32) || defined(cygwin))
+-    char           *token;
+-    char space;
+-    char newline;
+-    struct stat     dir_stat, idx_stat;
+-    char            tmpstr[300];
+-    char            tmpstr1[300];
+-#endif
+ 
+     DEBUGMSGTL(("parse-mibs", "Scanning directory %s\n", dirname));
+-#if !(defined(WIN32) || defined(cygwin))
+-    token = netsnmp_mibindex_lookup( dirname );
+-    if (token && stat(token, &idx_stat) == 0 && stat(dirname, &dir_stat) == 0) {
+-        if (dir_stat.st_mtime < idx_stat.st_mtime) {
+-            DEBUGMSGTL(("parse-mibs", "The index is good\n"));
+-            if ((ip = fopen(token, "r")) != NULL) {
+-                fgets(tmpstr, sizeof(tmpstr), ip); /* Skip dir line */
+-                while (fscanf(ip, "%127s%c%299[^\n]%c", token, &space, tmpstr,
+-		    &newline) == 4) {
+-
+-		    /*
+-		     * If an overflow of the token or tmpstr buffers has been
+-		     * found log a message and break out of the while loop,
+-		     * thus the rest of the file tokens will be ignored.
+-		     */
+-		    if (space != ' ' || newline != '\n') {
+-			snmp_log(LOG_ERR,
+-			    "add_mibdir: strings scanned in from %s/%s " \
+-			    "are too large.  count = %d\n ", dirname,
+-			    ".index", count);
+-			    break;
+-		    }
+-		   
+-		    snprintf(tmpstr1, sizeof(tmpstr1), "%s/%s", dirname, tmpstr);
+-                    tmpstr1[ sizeof(tmpstr1)-1 ] = 0;
+-                    new_module(token, tmpstr1);
+-                    count++;
+-                }
+-                fclose(ip);
+-                return count;
+-            } else
+-                DEBUGMSGTL(("parse-mibs", "Can't read index\n"));
+-        } else
+-            DEBUGMSGTL(("parse-mibs", "Index outdated\n"));
+-    } else
+-        DEBUGMSGTL(("parse-mibs", "No index\n"));
+-#endif
+ 
+     filename_count = scan_directory(&filenames, dirname);
+ 
+     if (filename_count >= 0) {
+-        ip = netsnmp_mibindex_new(dirname);
+         for (i = 0; i < filename_count; i++) {
+-            if (add_mibfile(filenames[i], strrchr(filenames[i], '/'), ip) == 0)
++            if (add_mibfile(filenames[i], strrchr(filenames[i], '/')) == 0)
+                 count++;
+ 	    free(filenames[i]);
+         }
+         File = oldFile;
+-        if (ip)
+-            fclose(ip);
+         free(filenames);
+         return (count);
+     }
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15862.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15862.patch
new file mode 100644
index 000000000..419a0c21b
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2020-15862.patch
@@ -0,0 +1,87 @@
+From de36cf1ecbb13a9541ec5d43ce20ab5030861837 Mon Sep 17 00:00:00 2001
+From: Wes Hardaker <opensource@hardakers.net>
+Date: Thu, 23 Jul 2020 16:17:27 -0700
+Subject: [PATCH 1/1] make the extend mib read-only by default
+
+CVE: CVE-2020-15862
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/77f6c60f57dba0aaea5d8ef1dd94bcd0c8e6d205]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ agent/mibgroup/agent/extend.c | 18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/agent/mibgroup/agent/extend.c b/agent/mibgroup/agent/extend.c
+index 5f8cedc..38a6c50 100644
+--- a/agent/mibgroup/agent/extend.c
++++ b/agent/mibgroup/agent/extend.c
+@@ -16,6 +16,12 @@
+ #define SHELLCOMMAND 3
+ #endif
+ 
++/*  This mib is potentially dangerous to turn on by default, since it
++ *  allows arbitrary commands to be set by anyone with SNMP WRITE
++ *  access to the MIB table.  If all of your users are "root" level
++ *  users, then it may be safe to turn on. */
++#define ENABLE_EXTEND_WRITE_ACCESS 0
++
+ netsnmp_feature_require(extract_table_row_data)
+ netsnmp_feature_require(table_data_delete_table)
+ #ifndef NETSNMP_NO_WRITE_SUPPORT
+@@ -742,7 +748,7 @@ handle_nsExtendConfigTable(netsnmp_mib_handler          *handler,
+          *
+          **********/
+ 
+-#ifndef NETSNMP_NO_WRITE_SUPPORT
++#if !defined(NETSNMP_NO_WRITE_SUPPORT) && ENABLE_EXTEND_WRITE_ACCESS
+         case MODE_SET_RESERVE1:
+             /*
+              * Validate the new assignments
+@@ -1068,7 +1074,7 @@ handle_nsExtendConfigTable(netsnmp_mib_handler          *handler,
+                 }
+             }
+             break;
+-#endif /* !NETSNMP_NO_WRITE_SUPPORT */ 
++#endif /* !NETSNMP_NO_WRITE_SUPPORT and ENABLE_EXTEND_WRITE_ACCESS */
+ 
+         default:
+             netsnmp_set_request_error(reqinfo, request, SNMP_ERR_GENERR);
+@@ -1076,7 +1082,7 @@ handle_nsExtendConfigTable(netsnmp_mib_handler          *handler,
+         }
+     }
+ 
+-#ifndef NETSNMP_NO_WRITE_SUPPORT
++#if !defined(NETSNMP_NO_WRITE_SUPPORT) && ENABLE_EXTEND_WRITE_ACCESS
+     /*
+      * If we're marking a given row as active,
+      *  then we need to check that it's ready.
+@@ -1101,7 +1107,7 @@ handle_nsExtendConfigTable(netsnmp_mib_handler          *handler,
+             }
+         }
+     }
+-#endif /* !NETSNMP_NO_WRITE_SUPPORT */
++#endif /* !NETSNMP_NO_WRITE_SUPPORT && ENABLE_EXTEND_WRITE_ACCESS */
+     
+     return SNMP_ERR_NOERROR;
+ }
+@@ -1590,7 +1596,7 @@ fixExec2Error(int action,
+     idx = name[name_len-1] -1;
+     exten = &compatability_entries[ idx ];
+ 
+-#ifndef NETSNMP_NO_WRITE_SUPPORT
++#if !defined(NETSNMP_NO_WRITE_SUPPORT) && ENABLE_EXTEND_WRITE_ACCESS
+     switch (action) {
+     case MODE_SET_RESERVE1:
+         if (var_val_type != ASN_INTEGER) {
+@@ -1611,7 +1617,7 @@ fixExec2Error(int action,
+     case MODE_SET_COMMIT:
+         netsnmp_cache_check_and_reload( exten->efix_entry->cache );
+     }
+-#endif /* !NETSNMP_NO_WRITE_SUPPORT */
++#endif /* !NETSNMP_NO_WRITE_SUPPORT && ENABLE_EXTEND_WRITE_ACCESS */
+     return SNMP_ERR_NOERROR;
+ }
+ #endif /* USING_UCD_SNMP_EXTENSIBLE_MODULE */
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 67316db0d..6b4b6ce8e 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -29,6 +29,12 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://0001-net-snmp-fix-compile-error-disable-des.patch \
            file://0001-Add-pkg-config-support-for-building-applications-and.patch \
            file://CVE-2019-20892.patch \
+           file://CVE-2020-15861-0001.patch \
+           file://CVE-2020-15861-0002.patch \
+           file://CVE-2020-15861-0003.patch \
+           file://CVE-2020-15861-0004.patch \
+           file://CVE-2020-15861-0005.patch \
+           file://CVE-2020-15862.patch \
            "
 SRC_URI[md5sum] = "63bfc65fbb86cdb616598df1aff6458a"
 SRC_URI[sha256sum] = "b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf"
-- 
2.17.1

