Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id B576C7739B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 16:43:25 +0000 (UTC)
Received: by iofh3 with SMTP id h3so139547862iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 08:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=G1ddrcA104hnjqhwmmnefA3r5pOWS2EZv8/mW6DfT3Q=;
	b=n4wMZXwYy2zVnrwHOOqar/VoXp/1NjRcVt7wVxy0RW1z/B6qlZyMaSI9IWxn49Mtob
	g/m+Icjfnbkt/dwZiYuQp8U/w0nqd4LUDrruPduS+tb6KyqgtPCPWFLLGN4yK8RC1bR4
	ca0sjfHPUdxcorPQnIKkcst5kx3M3rjjDy0ahUQp97XMeWS79929/gxM8/zt/PZ6EZYi
	z+yvMxSNfCBXrZfB/k6n8pYLkTpTnqaYPK/EKu9Qtvk35qmi3mnEhuPRHrjWMMQ2eEdx
	i0E1qBLg196kBi7747K1IPnCZw5j4Q+TcL/wKS7DYY4lE2TRr1muUmzcjmR96KjuBg7O
	u5Dw==
MIME-Version: 1.0
X-Received: by 10.107.130.155 with SMTP id m27mr32424668ioi.133.1447605806024; 
	Sun, 15 Nov 2015 08:43:26 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Sun, 15 Nov 2015 08:43:25 -0800 (PST)
In-Reply-To: <1447604260-5460-7-git-send-email-Martin.Jansa@gmail.com>
References: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
	<1447604260-5460-7-git-send-email-Martin.Jansa@gmail.com>
Date: Sun, 15 Nov 2015 17:43:25 +0100
Message-ID: <CALbNGRR7EUtEYLHuZwFZzAP2f6UHvwFTCSrz5ceBj2_4dJEqTA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe 7/8] gvfs: don't depend on samba by default
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
X-List-Received-Date: Sun, 15 Nov 2015 16:43:26 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 15, 2015 at 5:17 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * we don't want to introduce dependency on meta-networking just because of this
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
> index 166e5d2..fb5185f 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
> @@ -22,7 +22,7 @@ FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${datadir}/gvfs/mounts/trash.moun
>  RDEPENDS_${PN} = "gvfs-gdu-volume-monitor"
>  RRECOMMENDS_gvfsd-ftp += "openssh-sftp openssh-ssh"
>
> -PACKAGECONFIG ?= "libgphoto2 ${@base_contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'samba', d)}"
> +PACKAGECONFIG ?= "libgphoto2"
>
>  PACKAGECONFIG[libgphoto2] = "--enable-gphoto2, --disable-gphoto2, libgphoto2"
>  PACKAGECONFIG[samba] = "--enable-samba --with-samba-includes=${STAGING_INCDIR} \
> --
> 2.6.3
>
Yet another PACKAGECONFIG I have to watch for to keep my images
working as I want them to. As it turns out that I loose overview of
all these packageconfigs around: Is there a possibility to set all
packageconfigs globally?

Andreas

