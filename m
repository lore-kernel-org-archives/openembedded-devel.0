Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E52856013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 02:41:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6G2fhDn004315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Jul 2015 19:41:43 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 15 Jul 2015 19:41:42 -0700
Message-ID: <55A719E5.60603@windriver.com>
Date: Thu, 16 Jul 2015 10:41:41 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1436174216-14196-1-git-send-email-rongqing.li@windriver.com>
	<20150715160631.GC29923@mentor.com>
In-Reply-To: <20150715160631.GC29923@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] inetutils: Fix deadlock in telnetd when cleanup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jul 2015 02:41:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年07月16日 00:06, Joe MacDonald wrote:
> Is this fix even relevant?  Has anyone seen this or able to trigger it
> (maybe by using the script in the first link?  I wasn't.)  If someone
> thinks this is still required, I'll merge it, but on the surface it's a
> five year old patch for a different piece of software (netkit-telnet vs.
> inetutils) that causes a deadlock on a much older version of a libc
> library and a five-and-a-half-year-old kernel.
>
> -J.


Ok, please drop it;

Our customer reported a telnetd deadlock issue on our old product,
And Wang fixed it by porting this patch; but I can not reproduce it
whether in old or new product.

-Roy

>
> [[oe] [PATCH][meta-networking] inetutils: Fix deadlock in telnetd when cleanup] On 15.07.06 (Mon 17:16) rongqing.li@windriver.com wrote:
>
>> From: Li Wang <li.wang@windriver.com>
>>
>> the patch comes from:
>> https://bugs.launchpad.net/ubuntu/+source/netkit-telnet/+bug/507455
>> https://launchpadlibrarian.net/37882973/0001-telnetd-Fix-deadlock-on-cleanup.patch
>>
>> The cleanup function in telnetd is called both directly and on SIGCHLD
>> signals. This, unfortunately, triggered a deadlock in eglibc 2.9 while
>> running on a 2.6.31.11 kernel.
>>
>> What we were seeing is hangs like these:
>>
>>    (gdb) bt
>>    #0  0xb7702424 in __kernel_vsyscall ()
>>    #1  0xb7658e61 in __lll_lock_wait_private () from ./lib/libc.so.6
>>    #2  0xb767e7b5 in _L_lock_15 () from ./lib/libc.so.6
>>    #3  0xb767e6e0 in utmpname () from ./lib/libc.so.6
>>    #4  0xb76bcde7 in logout () from ./lib/libutil.so.1
>>    #5  0x0804c827 in cleanup ()
>>    #6  <signal handler called>
>>    #7  0xb7702424 in __kernel_vsyscall ()
>>    #8  0xb7641003 in __fcntl_nocancel () from ./lib/libc.so.6
>>    #9  0xb767e0c3 in getutline_r_file () from ./lib/libc.so.6
>>    #10 0xb767d675 in getutline_r () from ./lib/libc.so.6
>>    #11 0xb76bce42 in logout () from ./lib/libutil.so.1
>>    #12 0x0804c827 in cleanup ()
>>    #13 0x0804a0b5 in telnet ()
>>    #14 0x0804a9c3 in main ()
>>
>> and what has happened here is that the user closes the telnet session
>> via the escape character. This causes telnetd to call cleanup in frame
>> the SIGCHLD signal is delivered while telnetd is executing cleanup.
>>
>> Telnetd then calls the signal handler for SIGCHLD, which is cleanup().
>> Ouch. The actual deadlock is in libc. getutline_r in frame #10 gets the
>> __libc_utmp_lock lock, and utmpname above does the same thing in frame
>>
>> The fix registers the SIGCHLD handler as cleanup_sighandler, and makes
>> cleanup disable the SIGCHLD signal before calling cleanup_sighandler.
>>
>> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
>> Signed-off-by: Li Wang <li.wang@windriver.com>
>> ---
>>   .../telnetd-Fix-deadlock-on-cleanup.patch          | 108 +++++++++++++++++++++
>>   .../inetutils/inetutils_1.9.2.bb                   |   1 +
>>   2 files changed, 109 insertions(+)
>>   create mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnetd-Fix-deadlock-on-cleanup.patch
>>
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnetd-Fix-deadlock-on-cleanup.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnetd-Fix-deadlock-on-cleanup.patch
>> new file mode 100644
>> index 0000000..3ec7613
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnetd-Fix-deadlock-on-cleanup.patch
>> @@ -0,0 +1,108 @@
>> +telnetd: Fix deadlock on cleanup
>> +
>> +the patch comes from:
>> +https://bugs.launchpad.net/ubuntu/+source/netkit-telnet/+bug/507455
>> +https://launchpadlibrarian.net/37882973/0001-telnetd-Fix-deadlock-on-cleanup.patch
>> +
>> +The cleanup function in telnetd is called both directly and on SIGCHLD
>> +signals. This, unfortunately, triggered a deadlock in eglibc 2.9 while
>> +running on a 2.6.31.11 kernel.
>> +
>> +What we were seeing is hangs like these:
>> +
>> +  (gdb) bt
>> +  #0  0xb7702424 in __kernel_vsyscall ()
>> +  #1  0xb7658e61 in __lll_lock_wait_private () from ./lib/libc.so.6
>> +  #2  0xb767e7b5 in _L_lock_15 () from ./lib/libc.so.6
>> +  #3  0xb767e6e0 in utmpname () from ./lib/libc.so.6
>> +  #4  0xb76bcde7 in logout () from ./lib/libutil.so.1
>> +  #5  0x0804c827 in cleanup ()
>> +  #6  <signal handler called>
>> +  #7  0xb7702424 in __kernel_vsyscall ()
>> +  #8  0xb7641003 in __fcntl_nocancel () from ./lib/libc.so.6
>> +  #9  0xb767e0c3 in getutline_r_file () from ./lib/libc.so.6
>> +  #10 0xb767d675 in getutline_r () from ./lib/libc.so.6
>> +  #11 0xb76bce42 in logout () from ./lib/libutil.so.1
>> +  #12 0x0804c827 in cleanup ()
>> +  #13 0x0804a0b5 in telnet ()
>> +  #14 0x0804a9c3 in main ()
>> +
>> +and what has happened here is that the user closes the telnet session
>> +via the escape character. This causes telnetd to call cleanup in frame
>> +the SIGCHLD signal is delivered while telnetd is executing cleanup.
>> +
>> +Telnetd then calls the signal handler for SIGCHLD, which is cleanup().
>> +Ouch. The actual deadlock is in libc. getutline_r in frame #10 gets the
>> +__libc_utmp_lock lock, and utmpname above does the same thing in frame
>> +
>> +The fix registers the SIGCHLD handler as cleanup_sighandler, and makes
>> +cleanup disable the SIGCHLD signal before calling cleanup_sighandler.
>> +
>> +Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
>> +Signed-off-by: Li Wang <li.wang@windriver.com>
>> +---
>> + telnetd/pty.c     |   17 ++++++++++++++++-
>> + telnetd/telnetd.c |    2 +-
>> + telnetd/telnetd.h |    1 +
>> + 3 files changed, 18 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/telnetd/pty.c b/telnetd/pty.c
>> +index 21b0b69..22a17c5 100644
>> +--- a/telnetd/pty.c
>> ++++ b/telnetd/pty.c
>> +@@ -145,7 +145,7 @@ start_login (char *host, int autologin, char *name)
>> +  * reported exit code.
>> +  */
>> + void
>> +-cleanup (int sig)
>> ++cleanup_sighandler (int sig)
>> + {
>> +   int status = EXIT_FAILURE;
>> +   char *p;
>> +@@ -168,3 +168,18 @@ cleanup (int sig)
>> +   shutdown (net, 2);
>> +   exit (status);
>> + }
>> ++
>> ++void cleanup(int sig) {
>> ++    sigset_t mask, oldmask;
>> ++
>> ++    /* Set up the mask of signals to temporarily block. */
>> ++    sigemptyset (&mask);
>> ++    sigaddset (&mask, SIGCHLD);
>> ++
>> ++    /* Block SIGCHLD while running cleanup */
>> ++    sigprocmask (SIG_BLOCK, &mask, &oldmask);
>> ++
>> ++    cleanup_sighandler(sig);
>> ++    /* Technically not needed since cleanup_sighandler exits */
>> ++    sigprocmask (SIG_UNBLOCK, &mask, NULL);
>> ++}
>> +diff --git a/telnetd/telnetd.c b/telnetd/telnetd.c
>> +index cf7ce0f..4fe95b5 100644
>> +--- a/telnetd/telnetd.c
>> ++++ b/telnetd/telnetd.c
>> +@@ -527,7 +527,7 @@ telnetd_setup (int fd)
>> +   signal (SIGTTOU, SIG_IGN);
>> + #endif
>> +
>> +-  signal (SIGCHLD, cleanup);
>> ++  signal (SIGCHLD, cleanup_sighandler);
>> + }
>> +
>> + int
>> +diff --git a/telnetd/telnetd.h b/telnetd/telnetd.h
>> +index ce90fbc..8bac120 100644
>> +--- a/telnetd/telnetd.h
>> ++++ b/telnetd/telnetd.h
>> +@@ -326,6 +326,7 @@ extern void add_slc (char func, char flag, cc_t val);
>> + extern void check_slc (void);
>> + extern void change_slc (char func, char flag, cc_t val);
>> +
>> ++extern void cleanup_sighandler (int);
>> + extern void cleanup (int);
>> + extern void clientstat (int, int, int);
>> + extern void copy_termbuf ();
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
>> index 9bb9fe8..5c5699a 100644
>> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
>> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
>> @@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
>>              file://telnet.xinetd.inetutils \
>>              file://tftpd.xinetd.inetutils \
>>              file://inetutils-1.9-PATH_PROCNET_DEV.patch \
>> +           file://telnetd-Fix-deadlock-on-cleanup.patch \
>>   "
>>
>>   SRC_URI[md5sum] = "aa1a9a132259db83e66c1f3265065ba2"
>> --
>> 1.9.1
>>

-- 
Best Reagrds,
Roy | RongQing Li

