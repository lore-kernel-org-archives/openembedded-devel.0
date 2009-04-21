Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwMuH-00057z-T6
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 22:49:29 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LwMpy-0001VY-6P
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 20:45:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 20:45:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 20:45:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Apr 2009 22:29:55 +0200
Message-ID: <gslac4$lqt$2@ger.gmane.org>
References: <1238144638-7541-1-git-send-email-khimov@altell.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1238144638-7541-1-git-send-email-khimov@altell.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] busybox: update appletlib dependency patch
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
X-List-Received-Date: Tue, 21 Apr 2009 20:49:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Koen Kooi <koen@openembedded.org>


On 27-03-09 10:03, Roman I Khimov wrote:
> Previous version still failed from time to time on clean-start builds
> with 4 bitbake threads and '-j16'. Building busybox as sole target worked
> well.
>
> The reason is that previous version introduced a race between applets make
> processes spawned from top-level Makefile and from libbb Makefile.
>
> Fix it with high-level dependency that doesn't create races.
> ---
>   .../files/busybox-appletlib-dependency.patch       |   24 +++++++++++--------
>   1 files changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/recipes/busybox/files/busybox-appletlib-dependency.patch b/recipes/busybox/files/busybox-appletlib-dependency.patch
> index 85a61e8..3efd4c0 100644
> --- a/recipes/busybox/files/busybox-appletlib-dependency.patch
> +++ b/recipes/busybox/files/busybox-appletlib-dependency.patch
> @@ -1,11 +1,15 @@
> ---- a/libbb/Kbuild	2008-11-09 20:28:09.000000000 +0300
> -+++ b/libbb/Kbuild	2009-02-17 17:41:48.718747865 +0300
> -@@ -147,3 +147,8 @@ lib-$(CONFIG_PGREP) += xregcomp.o
> - lib-$(CONFIG_PKILL) += xregcomp.o
> - lib-$(CONFIG_DEVFSD) += xregcomp.o
> - lib-$(CONFIG_FEATURE_FIND_REGEX) += xregcomp.o
> +Index: busybox-1.13.2/Makefile
> +===================================================================
> +--- busybox-1.13.2.orig/Makefile	2009-03-19 15:44:37.419270265 +0300
> ++++ busybox-1.13.2/Makefile	2009-03-19 15:45:57.737521296 +0300
> +@@ -471,6 +471,10 @@
> + 		util-linux/ \
> + 		util-linux/volume_id/ \
> +
> ++# Lib interdeps
> ++# libbb uses headers generated in applets
> ++libbb: applets
>   +
> -+libbb/appletlib.o: include/usage_compressed.h include/applet_tables.h
> -+
> -+include/usage_compressed.h include/applet_tables.h:
> -+        $(Q)$(MAKE) $(build)=applets $@
> + endif # KBUILD_EXTMOD
> +
> + ifeq ($(dot-config),1)




