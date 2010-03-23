Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NttS6-0001Qy-3n
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 03:02:50 +0100
Received: (qmail 27718 invoked by uid 1003); 23 Mar 2010 01:59:33 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Mar 2010 01:59:32 -0000
Message-ID: <4BA82084.4050504@balister.org>
Date: Mon, 22 Mar 2010 21:59:32 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269255925-13112-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269255925-13112-5-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1269255925-13112-5-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE] procps: apply patch from Ubuntu to finally get	rid of 'Unknown Hz value'
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
X-List-Received-Date: Tue, 23 Mar 2010 02:02:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>


On 03/22/2010 07:05 AM, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> ---
>   .../procps-3.2.8/60_linux_version_init.dpatch      |   61 ++++++++++++++++++++
>   recipes/procps/procps_3.2.8.bb                     |    3 +-
>   2 files changed, 63 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/procps/procps-3.2.8/60_linux_version_init.dpatch
>
> diff --git a/recipes/procps/procps-3.2.8/60_linux_version_init.dpatch b/recipes/procps/procps-3.2.8/60_linux_version_init.dpatch
> new file mode 100644
> index 0000000..d99456a
> --- /dev/null
> +++ b/recipes/procps/procps-3.2.8/60_linux_version_init.dpatch
> @@ -0,0 +1,61 @@
> +#! /bin/sh /usr/share/dpatch/dpatch-run
> +## 60_linux_init.dpatch by<david.sugar@canonical.com>
> +##
> +## All lines beginning with `## DP:' are a description of the patch.
> +## DP: Fix Linux version detection which relied on elf loader side-effect.
> +## DP: This patch also depends on 40_gnu-kbsd-version, which modified
> +## DP: init_Linux_version().
> +
> +@DPATCH@
> +---
> + proc/sysinfo.c |    1 +
> + proc/version.c |    5 +++--
> + proc/version.h |    1 +
> + 3 files changed, 5 insertions(+), 2 deletions(-)
> +
> +--- procps-3.2.8.orig/proc/sysinfo.c
> ++++ procps-3.2.8/proc/sysinfo.c
> +@@ -210,10 +210,11 @@ static int check_for_privs(void){
> + }
> +
> + static void init_libproc(void) __attribute__((constructor));
> + static void init_libproc(void){
> +   have_privs = check_for_privs();
> ++  init_Linux_version(); // make sure we have version before continuing...
> +   // ought to count CPUs in /proc/stat instead of relying
> +   // on glibc, which foolishly tries to parse /proc/cpuinfo
> +   //
> +   // SourceForge has an old Alpha running Linux 2.2.20 that
> +   // appears to have a non-SMP kernel on a 2-way SMP box.
> +--- procps-3.2.8.orig/proc/version.c
> ++++ procps-3.2.8/proc/version.c
> +@@ -31,12 +31,13 @@ void display_version(void) {
> +
> + #define LINUX_VERSION(x,y,z)   (0x10000*(x) + 0x100*(y) + z)
> +
> + int linux_version_code;
> +
> +-static void init_Linux_version(void) __attribute__((constructor));
> +-static void init_Linux_version(void) {
> ++// cannot depend on this auto-running before libproc init...
> ++//static void init_Linux_version(void) __attribute__((constructor));
> ++void init_Linux_version(void) {
> +     static struct utsname uts;
> +     int x = 0, y = 0, z = 0;	/* cleared in case sscanf()<  3 */
> +
> +     if (uname(&uts) == -1)	/* failure implies impending death */
> + 	exit(1);
> +--- procps-3.2.8.orig/proc/version.h
> ++++ procps-3.2.8/proc/version.h
> +@@ -12,10 +12,11 @@
> +  * Copyright 2002 Albert Cahalan
> +  */
> +
> + EXTERN_C_BEGIN
> +
> ++extern void init_Linux_version(void);	/* initialize linux version */
> + extern void display_version(void);	/* display suite version */
> + extern const char procps_version[];		/* global buf for suite version */
> +
> + extern int linux_version_code;		/* runtime version of LINUX_VERSION_CODE
> + 					   in /usr/include/linux/version.h */
> diff --git a/recipes/procps/procps_3.2.8.bb b/recipes/procps/procps_3.2.8.bb
> index 22f54c3..f98b849 100644
> --- a/recipes/procps/procps_3.2.8.bb
> +++ b/recipes/procps/procps_3.2.8.bb
> @@ -1,10 +1,11 @@
>   require procps.inc
>
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
>   SRC_URI += "file://procmodule.patch;patch=1 \
>               file://psmodule.patch;patch=1 \
>   	    file://linux-limits.patch;patch=1 \
> +	    file://60_linux_version_init.dpatch;patch=1 \
>   	    "
>
>   SRC_URI[tarball.md5sum] = "9532714b6846013ca9898984ba4cd7e0"


