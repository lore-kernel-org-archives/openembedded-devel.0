Return-Path: <nickaein.i@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 18B1178688
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jan 2018 07:31:43 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id i1so284358qtj.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 23:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S8fqm3By7AnxYrZoG/4wQ4bIuVu+UDBVK4PXkbv8Vng=;
	b=fk1hY7ojIs3Tf6McuzHdnTH8pqHXxWuRIWvO42UGwDr4Dh1Ss7+zp0ZFY3KzUjg42L
	gVbFHxDY21pOweA5dbd2IUHdZwJLvjySQv+/4uKa0bjoqHTnbJpnE7DlXzBze8LT385/
	ZZUGieYDso0zBZvtxjDBYEi5gGPOm7iCDAUyIlUpdHO/z7rnmR7oipM+5QTmOgqOShLB
	+Ws6VL2phVl9vmjvQrlMEoHG9F4AJh/6gkxQVujOjbZQGsbfZpEl6zDcDNmr49eBcJQJ
	p2rNi+WIPfMdDxhCh/rIrB62ebDbsAqTCOqvWSHwkXD35UKcUSfaiS6hlEgbyyo2P2kc
	xLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S8fqm3By7AnxYrZoG/4wQ4bIuVu+UDBVK4PXkbv8Vng=;
	b=X80s3VV+MUMvC196AvhoyXEfNboN3QDRwYDryf1B80i35vO9u10rS9Feq3pTA7xzLm
	Q/Yo7GvIvKl72c046IlbrIPxa/JEQcfrLpMWExr3TiuNQYs6iKE9ae5H2yI9DXGOB3UN
	e4LDW+IY0LvOykSeVjEmvMTi3nVf3+RJpeGc0dAh7s4bJFrzx0hJ3w5nlrel/KsQMFLY
	NaJJlcx4PUw4doen4rJ6au/S+4pGa5r5YkNbgifyRZ6g6TxCMlVDjFGmtLXPAnmh+nJ4
	pZg+s0mj/G3Eyjn+F/uXPoMDgDxNAasG9FdLrvm2AxfgY4G74kNq95TwqE8vLbBwAmHm
	9jXg==
X-Gm-Message-State: AKwxytebKbi0eHwG6crRtIz1c+Mw4KlBId/Vw/OucF+L5b/JJx6y20MN
	hYCk4zzZmfTG9YNSrqLhN1jeMIq14zrnl6SdN8GHzM+9
X-Google-Smtp-Source: ACJfBotHRUi3N+XwxcGIfCyLQXu5/Ff0C4NDhW3PwyWgr5Ur0Hsn6EILXHpud30fY0NKvj2awtK68yTvHH95WvzEFD4=
X-Received: by 10.237.55.9 with SMTP id i9mr52397159qtb.226.1516087904959;
	Mon, 15 Jan 2018 23:31:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.214.82 with HTTP; Mon, 15 Jan 2018 23:31:14 -0800 (PST)
In-Reply-To: <20180115192826.GN9657@denix.org>
References: <CA+NJmkdfNKmdi=6RZDtBt2tiZfp3nqZ=Nd5jy=+fGPXKGNODHw@mail.gmail.com>
	<20180115192826.GN9657@denix.org>
From: Isaac Nickaein <nickaein.i@gmail.com>
Date: Tue, 16 Jan 2018 11:01:14 +0330
Message-ID: <CA+NJmkdTTjH23pKRq+tHMAT8iM-jBhhs4tx2C6rL1sZC-u9fGg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] [rocko] qtbase fails at do_compile for i.MX7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jan 2018 07:31:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 15, 2018 at 10:58 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> Quoting someone from irc:
> "this is an error introduced by meta-fsl"
> "honestly, meta-fsl is a mistery for me"

I guess I should be ready for more weirdness in the future.

>> DISTRO_FEATURES_remove = " x11 wayland wifi 3g bluetooth irda nfc ipv6
>> largefile pam pci pcmcia ppp smbfs"
>>
>> PACKAGECONFIG_append_pn-qtbase = " gles2 eglfs linuxfb "
>>
>> DISTRO_FEATURES_append = " opengles2 egl"
>
> These are not the standard distro features! (*) Adding them here won't do
> anything to qtbase. There is, however, standard "opengl" distro feature, which
> qtbase_git.bb recipe tries to honor. But since you only need "gles2" and not
> full desktop "gl", you can do PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb" to
> tweak it. You may still need "opengl" DISTRO_FEATURES, as many recipes require
> it even for "gles2" support.
>
> * theoretically, distros may potentially extend the list and add own features.
>

Thanks, that was very informative.
Apparently the "immersion" approach to learn Yocto while using it
doesn't work very well.

>
> Anyway, you can check what the resulting PACKAGECONFIG list looks like for
> qtbase by inspecting the environment:
>
> $ bitbake qtbase -e | grep "^PACKAGECONFIG="
>
>

After some digging it becomes apparent that I was wrong about the
source of issue. It wasn't caused by PACKAGECONFIG.

This problem didn't appeared on BSP rocko provided by Toradex. I
checked their repo manifests.xml file and realized they are cloning
meta-qt from a different commit
(d87335a50a9dd35d890786edbd79b8953fdaa11a) while the rocko branch of
meta-qt5 has newer commits. By pinning down the meta-qt5 to this
commit, the compile issue solved.

So this boils to either a bug in meta-qt5 introduced in the recent
commits or a bug in Toradex meta-layers that I have included
(meta-toradex-bsp-common or meta-toradex-nxp).

