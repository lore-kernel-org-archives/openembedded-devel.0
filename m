Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PJRGq-0003h6-8Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 14:44:57 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PJRFj-00058s-7y from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 05:43:47 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 19 Nov 2010 05:43:46 -0800
Received: from [172.30.6.141] ([172.30.6.141]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 19 Nov 2010 06:43:45 -0700
Message-ID: <4CE67F0F.4090108@mentor.com>
Date: Fri, 19 Nov 2010 06:43:43 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE600FF.4000207@gmail.com>
In-Reply-To: <4CE600FF.4000207@gmail.com>
X-OriginalArrivalTime: 19 Nov 2010 13:43:45.0413 (UTC)
	FILETIME=[C9490350:01CB87EF]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [release-2010.12][PATCH] mioctl_git.bb: Add glib-2.0 to DEPENDS.
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
X-List-Received-Date: Fri, 19 Nov 2010 13:44:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2010 09:45 PM, Graham Gower wrote:
>
> | make[3]: Entering directory `/mnt/oe/tmp/work/mipsel-oe-linux/mioctl-1_0.1.0+gitr0+43fae6cf5e3aa57f5d7fed467896d2d4d0f69679-r0/git/tools/mioctl/src'
> | mipsel-oe-linux-gcc -march=mips32 -DHAVE_CONFIG_H -I. -I.. -pthread -I/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/include/glib-2.0 -I/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/lib/glib-2.0/include   -include ../config.h   -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/include  -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -MT main.o -MD -MP -MF .deps/main.Tpo -c -o main.o main.c
> | main.c:25:18: fatal error: glib.h: No such file or directory
> | compilation terminated.
> | make[3]: *** [main.o] Error 1
>
> Signed-off-by: Graham Gower<graham.gower@gmail.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>   recipes/freesmartphone/mioctl_git.bb |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/freesmartphone/mioctl_git.bb b/recipes/freesmartphone/mioctl_git.bb
> index c04fc9d..8d9571c 100644
> --- a/recipes/freesmartphone/mioctl_git.bb
> +++ b/recipes/freesmartphone/mioctl_git.bb
> @@ -6,6 +6,7 @@ LICENSE = "GPL"
>   SRCREV = "43fae6cf5e3aa57f5d7fed467896d2d4d0f69679"
>   PV = "0.1.0+gitr${SRCPV}"
>   PE = "1"
> +DEPENDS = "glib-2.0"
>
>   SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia.git;protocol=git;branch=master"
>   S = "${WORKDIR}/git/tools/mioctl"


-- 
Tom Rini
Mentor Graphics Corporation


