Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pc3D3-00030L-5V
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 22:53:57 +0100
Received: by pzk12 with SMTP id 12so3869498pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Jan 2011 13:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=f0xFNssaQFrqg9/y7XwaHSWAmfCnBHX+u/L5Yfh9Adk=;
	b=rYjJbl1s0kj/1QWVqItG5Kl7qxyh7EEVV9R+l251VsbFLv8r2kU7TuUbQ5NG2/5SIk
	ZrN64qUss7ctANtfwnk6CqhzgvPg2eoPGkI2do0nwhTGa8hHbdqbpQzeOTBruLHDEK++
	DBy7RI7U3t1dY+9sCkkKeV6m6OOnQeP3u3NX4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=YzCYtrlF9pxZfstwPGPocN2oYDhetMnubxj4DJBhlNgW4JzZpMDcZSBAwU/NVdD7bX
	MotVkiE58u4oSyEw4DZYaQRbtfqBDMhtWzJCcmJ+hYpquhXIqIvv1up6Fcg6QWI/bujg
	ilk+TgbYp1QDci53iBw5wY0ui2KQPGMd4ZwdM=
Received: by 10.142.111.11 with SMTP id j11mr3737865wfc.327.1294610005586;
	Sun, 09 Jan 2011 13:53:25 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b11sm6661489wff.9.2011.01.09.13.53.24
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Jan 2011 13:53:24 -0800 (PST)
Message-ID: <4D2A2E56.6010802@gmail.com>
Date: Sun, 09 Jan 2011 13:53:26 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294607995-10242-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1294607995-10242-1-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH] busybox-1.18.1: add latest fix
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
X-List-Received-Date: Sun, 09 Jan 2011 21:53:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/9/2011 1:19 PM, Eric Bénard wrote:
> modprobe-small: support compressed modules in insmodmaster
> http://git.busybox.net/busybox/commit/?id=e9d12b57bfb941e754d09a7d5f54c183ca7dbb25
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>
OK

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>   .../busybox-1.18.1/busybox-1.18.1-hush.patch       |    2 +-
>   .../busybox-1.18.1-modprobe-small.patch            |   21 ++++++++++++++++++++
>   recipes/busybox/busybox_1.18.1.bb                  |    3 +-
>   3 files changed, 24 insertions(+), 2 deletions(-)
>   create mode 100644 recipes/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch
>
> diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
> index 5281a52..590ed88 100644
> --- a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
> +++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
> @@ -1,6 +1,6 @@
>   diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
>   --- busybox-1.18.1/shell/hush.c	2010-12-21 05:31:04.000000000 +0100
> -+++ busybox-1.18.1-hush/shell/hush.c	2011-01-07 14:59:19.649956156 +0100
> ++++ busybox-1.18.1-hush/shell/hush.c	2011-01-09 21:00:02.000000000 +0100
>   @@ -913,7 +913,7 @@ static const struct built_in_command blt
>     */
>    #if HUSH_DEBUG
> diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch
> new file mode 100644
> index 0000000..c1d5615
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch
> @@ -0,0 +1,21 @@
> +diff -urpN busybox-1.18.1/modutils/modprobe-small.c busybox-1.18.1-modprobe-small/modutils/modprobe-small.c
> +--- busybox-1.18.1/modutils/modprobe-small.c	2010-12-20 01:41:27.000000000 +0100
> ++++ busybox-1.18.1-modprobe-small/modutils/modprobe-small.c	2011-01-09 21:00:26.000000000 +0100
> +@@ -844,13 +844,15 @@ int modprobe_main(int argc UNUSED_PARAM,
> + 		void *map;
> +
> + 		len = MAXINT(ssize_t);
> +-		map = xmalloc_xopen_read_close(*argv,&len);
> ++		map = xmalloc_open_zipped_read_close(*argv,&len);
> + 		if (init_module(map, len,
> + 			IF_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE(options ? options : "")
> + 			IF_NOT_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE("")
> +-				) != 0)
> ++			) != 0
> ++		) {
> + 			bb_error_msg_and_die("can't insert '%s': %s",
> + 					*argv, moderror(errno));
> ++		}
> + 		return 0;
> + 	}
> +
> diff --git a/recipes/busybox/busybox_1.18.1.bb b/recipes/busybox/busybox_1.18.1.bb
> index 69daef5..7c7f21f 100644
> --- a/recipes/busybox/busybox_1.18.1.bb
> +++ b/recipes/busybox/busybox_1.18.1.bb
> @@ -1,5 +1,5 @@
>   require busybox_1.1x.inc
> -PR = "${INC_PR}.2"
> +PR = "${INC_PR}.3"
>
>   SRC_URI += " \
>   	file://busybox-1.18.1-hush.patch \
> @@ -7,6 +7,7 @@ SRC_URI += " \
>   	file://busybox-1.18.1-bzip2.patch \
>   	file://busybox-1.18.1-mkswap.patch \
>   	file://busybox-1.18.1-warning.patch \
> +	file://busybox-1.18.1-modprobe-small.patch \
>   	"
>
>   SRC_URI[md5sum] = "f15fe752d8b7012aa5e59f83b88ccb1c"



