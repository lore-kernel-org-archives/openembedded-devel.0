Received: from mail-iw0-f173.google.com ([209.85.214.173])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PQ5lP-0006iQ-Dp
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 23:12:00 +0100
Received: by iwn40 with SMTP id 40so198374iwn.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 14:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=CnRnlXa+wGagreKPJNvKgpZqe7nmmcxD6pLlg29wSBk=;
	b=frLjKVCCDGIN7jd99uPexTJc7OtRwaTruPzUwdXH+lxDyH75FX0GxHf0HeJzpbCFsx
	yJBqoO19uvvRVLizACuMggeBgiqSxA3bnEzdpa+//Dg9IKwyouZ2OSXH8Gg+IhET+g64
	D55vNSeIFy8h8C5PV5vW42UaWO3CuK1k6uGuY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=oUZga1aK9OHqBXPBkfJ/VYXODU8FDSLTgFLFvNVz2kS87sUMpm1BqABo8QCWsHhq39
	cyFsgosp5PU1V1+jk5wLOXSL4H7wNuM5lg/gTwV2A3cYdqeNVONfRrVIJ7r8GMK1XYu/
	1SiWpalBte6HeYbUswF490azqAv/KnM8LOXFw=
MIME-Version: 1.0
Received: by 10.231.35.75 with SMTP id o11mr8238343ibd.107.1291759832122; Tue,
	07 Dec 2010 14:10:32 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Tue, 7 Dec 2010 14:10:32 -0800 (PST)
Date: Tue, 7 Dec 2010 23:10:32 +0100
Message-ID: <AANLkTimDrTj0Z=1H0FL2zDh8WetgziWx7s8o5+4WeTMJ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.173
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: mediatomb configure: linker issue: nonrepresentable section on output (hidden symbol `__gnu_thumb1_case_uqi')
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Dec 2010 22:12:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Anyone an idea how to resolve this???

When running mediatomb configure for sheevaplug, distro minimal I get:

onfigure:12009: checking for
/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/armv5te-oe-linux-gnueabi/usr/include/js/jsapi.h
configure:12009: result: yes
configure:12077: Will search for js (spidermonkey) libraries in
/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/armv5te-oe-linux-gnueabi/usr/lib
configure:12080: checking for JS_NewObject in -ljs
configure:12105: arm-oe-linux-gnueabi-g++ -march=armv5te
-mtune=arm926ej-s -mthumb-interwork -mthumb -o conftest
-isystem/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/armv5te-oe-linux-gnueabi/usr/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
-fpermissive -fvisibility-inlines-hidden -DXP_UNIX
-isystem/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/armv5te-oe-linux-gnueabi/usr/include
-DXP_UNIX -L/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/armv5te-oe-linux-gnueabi/usr/lib
-L/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/armv5te-oe-linux-gnueabi/usr/lib
-Wl,-rpath-link,/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/armv5te-oe-linux-gnueabi/usr/lib
-Wl,-O1 -Wl,--hash-style=gnu -ljs  conftest.cpp -ljs   >&5
/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/x86_64-linux/usr/armv5te/lib/gcc/arm-oe-linux-gnueabi/4.5.2/../../../../arm-oe-linux-gnueabi/bin/ld:
conftest: hidden symbol `__gnu_thumb1_case_uqi' in
/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/x86_64-linux/usr/armv5te/lib/gcc/arm-oe-linux-gnueabi/4.5.2/libgcc.a(_thumb1_case_uqi.o)
is referenced by DSO
/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/x86_64-linux/usr/armv5te/lib/gcc/arm-oe-linux-gnueabi/4.5.2/../../../../arm-oe-linux-gnueabi/bin/ld:
final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status
configure:12105: $? = 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "MediaTomb"
| #define PACKAGE_TARNAME "mediatomb"
| #define PACKAGE_VERSION "0.11.0"
| #define PACKAGE_STRING "MediaTomb 0.11.0"
| #define PACKAGE_BUGREPORT "jin@mediatomb.cc"
| #define PACKAGE_URL ""
| #define PACKAGE "mediatomb"
| #define VERSION "0.11.0"
| #define EXTEND_PROTOCOLINFO 1
| #define UPNP_VERSION_STRING "0.11.0"
| #define UPNP_VERSION_MAJOR 0
| #define UPNP_VERSION_MINOR 4
| #define UPNP_VERSION_PATCH 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_WAIT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE__BOOL 1
| #define HAVE_STDBOOL_H 1
| #define TIME_WITH_SYS_TIME 1
| #define HAVE_SYSLOG_H 1
| #define HAVE_STDDEF_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_FCNTL_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_SYS_FILE_H 1
| #define HAVE_SYS_IOCTL_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_WAIT_H 1
| #define HAVE_LANGINFO_H 1
| #define HAVE_LOCALE_H 1
| #define HAVE_SCHED_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_SCHED_GETPARAM 1
| #define HAVE_SCHED_SETPARAM 1
| #define HAVE_MKDIR 1
| #define HAVE_GETOPT_H 1
| #define HAVE_GETOPT_LONG 1
| #define HAVE_MKFIFO 1
| #define EXTERNAL_TRANSCODING 1
| #define HAVE_EXECINFO_H 1
| #define HAVE_TIME_T 1
| #define HAVE_FSEEKO 1
| #define SIZEOF_OFF_T 4
| #define SIZEOF_SIZE_T 4
| #define SIZEOF_TIME_T 4
| #define SIZEOF_UNSIGNED_INT 4
| #define SIZEOF_UNSIGNED_LONG 4
| #define HAVE_STRTOLL 1
| #define HAVE_NL_LANGINFO 1
| #define HAVE_SETLOCALE 1
| #define HAVE_BACKTRACE 1
| #define HAVE_BACKTRACE_SYMBOLS 1
| #define RETSIGTYPE void
| #define HAVE_LONG_MAX 1
| #define MAXLLONG LLONG_MAX
| #define HAVE_ALLOCA_H 1
| #define HAVE_ALLOCA 1
| #define CLOSEDIR_VOID 1
| #define HAVE_FORK 1
| #define HAVE_VFORK 1
| #define HAVE_WORKING_VFORK 1
| #define HAVE_WORKING_FORK 1
| #define HAVE_STDLIB_H 1
| #define HAVE_MALLOC 1
| #define HAVE_STDLIB_H 1
| #define HAVE_REALLOC 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define SELECT_TYPE_ARG1 int
| #define SELECT_TYPE_ARG234 (fd_set *)
| #define SELECT_TYPE_ARG5 (struct timeval *)
| #define LSTAT_FOLLOWS_SLASHED_SYMLINK 1
| #define HAVE_VPRINTF 1
| #define HAVE_DECL_STRERROR_R 1
| #define HAVE_STRERROR_R 1
| #define HAVE_STRFTIME 1
| #define HAVE_GETHOSTNAME 1
| #define HAVE_GETTIMEOFDAY 1
| #define HAVE_LOCALTIME_R 1
| #define HAVE_MEMMOVE 1
| #define HAVE_MEMSET 1
| #define HAVE_REGCOMP 1
| #define HAVE_SELECT 1
| #define HAVE_STRCASECMP 1
| #define HAVE_STRCHR 1
| #define HAVE_STRDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_STRNCASECMP 1
| #define HAVE_STRRCHR 1
| #define HAVE_STRSTR 1
| #define HAVE_STRTOL 1
| #define HAVE_STRTOUL 1
| #define HAVE_UNAME 1
| #define HAVE_SIGACTION 1
| #define HAVE_SIGPROCMASK 1
| #define HAVE_IOCTL 1
| #define HAVE_TOLOWER 1
| #define HAVE_TOUPPER 1
| #define HAVE_INET_NTOA 1
| #define HAVE_SOCKET 1
| #define HAVE_GETHOSTBYNAME 1
| #define HAVE_GETHOSTBYNAME_R 1
| #define HAVE_IF_NAMEINDEX 1
| #define HAVE_IF_FREENAMEINDEX 1
| #define UPNP_HAVE_DEVICE 1
| #define UPNP_HAVE_WEBSERVER 1
| #define HAVE_PTHREAD 1
| #define HAVE_CLOCK_GETTIME 1
| #define AUTO_CREATE_DATABASE 1
| #define HAVE_SQLITE3 1
| /* end confdefs.h.  */
|
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char JS_NewObject ();
| int
| main ()
| {
| return JS_NewObject ();
|   ;
|   return 0;
| }
configure:12114: result: no


