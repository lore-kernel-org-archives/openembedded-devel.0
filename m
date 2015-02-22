Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 278DA606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Feb 2015 16:38:06 +0000 (UTC)
Received: by pdjy10 with SMTP id y10so19628258pdj.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Feb 2015 08:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WC/ee2KyZV/uekBzl4PHkh5MQSjGK7ZmXLjz1I8p5f0=;
	b=dXxvSQOEGsQk18zguGp4dGx/haai2qeKO+/uxBfPiBbCX0wBkT1XXbCxMRCXEQSxbC
	5nPOcpKI5O/7cREgETJlj/G37UnUqt4oWI+g4YVdLl980O35OXl7EfHatjrwLcrQXTJ3
	33sDiFVMscY2j0ECFrD3W8zbQ3zSlEpy+TnFH0Bj0MIHMeYlam20qPrYISyvnNpA8eV9
	66UeysMCVGuyxUtF24PCcj0Y0ji/L0qhGCFG0SRnvch50bzGQl80Eh8awZbRPdRan8Q6
	hAhH/ORzFVrdMlDU9eEctWWdRfcJmkTSd6XrABJVzmYTshO1QQh4yI29UGqdyWtjtmGi
	tajg==
MIME-Version: 1.0
X-Received: by 10.70.103.236 with SMTP id fz12mr12351384pdb.167.1424623088033; 
	Sun, 22 Feb 2015 08:38:08 -0800 (PST)
Received: by 10.70.36.36 with HTTP; Sun, 22 Feb 2015 08:38:07 -0800 (PST)
In-Reply-To: <1424621742-17713-1-git-send-email-ashcharles@gmail.com>
References: <1424621742-17713-1-git-send-email-ashcharles@gmail.com>
Date: Sun, 22 Feb 2015 17:38:07 +0100
Message-ID: <CALbNGRR1Q_JOMPPWR21-Y0WmQGTA=r8TRDuSfRwUUsV-yh11Xw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Ash Charles <ashcharles@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] xfce4-session: Make package MACHINE specific
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
X-List-Received-Date: Sun, 22 Feb 2015 16:38:09 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 22, 2015 at 5:15 PM, Ash Charles <ashcharles@gmail.com> wrote:
> Because the xfce4-session recipe has a machine-specific pkg_postinst_,
> the package itself must be considered machine specific.
>
> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> ---
>  meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
> index 74289fb..f804487 100644
> --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
>  DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf"
>  RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth upower"
>
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
>  inherit xfce update-alternatives
>
>  SRC_URI[md5sum] = "1757657c1d590aa6274b7b7cbba33352"
> --
> 2.1.0
>
Have you tried to remove postinst - is it still necessary?

Andreas

