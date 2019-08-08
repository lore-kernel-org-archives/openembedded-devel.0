Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id E4DBC7ED62
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 21:52:59 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id v38so1477175qtb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Aug 2019 14:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4yqt+1QxzCz1bo49WlmhZkJoGbxrcP9dFfg5y1ugyts=;
	b=fxWlXjlMzWkTv2ifFhEik3rJhn9+Xc21NQLcuhREI6YfrPZ6AOVqWdJhJRPii+AYkm
	tmWOIEIDtQbk3lAmRFWGXmyowJmKTIUCrZG8wjI9R/eya3NR8TXOSyJeyXnSUDq+Vcc6
	sdN85O8jTfcgeYx+YSulq6eSYFlO5DqPjicXcMug72xMovkYOxe8TcYA8MBMBiXlqHGF
	72qnRqV1JuudxNh4loRd8AjtUBU452nvhg3OsccTWTOHciOpwxLAgtq3ekTW80q8hQgS
	cCaJKXz6K/VfafQe7KDroUeyw8Cwqtn8SXhJZPkJrgfeJjStJdirvgurzzjA50zw1YJF
	fJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4yqt+1QxzCz1bo49WlmhZkJoGbxrcP9dFfg5y1ugyts=;
	b=nkooszV5yTcvNQhmBpBLCj00qfsoJpojImg3RJ9ThLaj0O2keLz1ykyelTCioN4/S5
	uXT1eKuPEOSo2XoSmgifMyGeOp/4W05W+NofK/2Zgv9+eqDc9neC8D8QFKoZrds4W4Z0
	l6SNc6lfugzH5E4jTa2QDudlKS8pU25lya4/q8HrW5LqIugt61VA0pGflCHbRoARoVW6
	4VgHS6YDU3mttOnnOXMphPvglgFuFi7YEc4slrtuvhNG718Pk6812vHLOs/RMwNyoDRP
	1Mu2NN1ZJ1j0oyXUyZGrORDNV9Fdm2MktcC5MJJqgsYIhUDhSHI4coxf1tQquMokNCEU
	MqJQ==
X-Gm-Message-State: APjAAAWl7ljD0YY9dV6FyZY4bGIODj5FN24wc2zmwZVQWJxj0UbHqagD
	eTUmtdJzCgZelI6D0+QDPuDNTPhUYWXyTcpl9cs=
X-Google-Smtp-Source: APXvYqy7ZQ78nL04eeHe1UijIAuW8gWz3/k/yBUHbDbhkvCOg1oJGQ6EQbZRc0UHMzAs/nYj68bhF+x8IXzYRWq4Dic=
X-Received: by 2002:ac8:525a:: with SMTP id y26mr15300882qtn.378.1565301180504;
	Thu, 08 Aug 2019 14:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190808093210.149215-1-kai.kang@windriver.com>
	<20190808093210.149215-2-kai.kang@windriver.com>
In-Reply-To: <20190808093210.149215-2-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Aug 2019 14:52:34 -0700
Message-ID: <CAMKF1soxeBna0ocvLeqGSj4pemgaSv0JoxR5TS2TDvpXvOcVZA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] xfce4-datetime-setter: add recipe
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
X-List-Received-Date: Thu, 08 Aug 2019 21:53:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 8, 2019 at 2:33 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Because xfce4-settings turn back to its official upstream, it missing
> function to set date and time. Add it from Andreas's repo on github.
> It depends on dbus service org.freedesktop.timedate1 which is provided
> by systemd, so add systemd to RDEPENDS.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../xfce4-datetime-setter_3.32.2.bb            | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
>
> diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
> new file mode 100644
> index 000000000..7a28b6101
> --- /dev/null
> +++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "A fork of (early) gnome-control-center datetime panel for XFCE. \
> +It is based upon GTK3 and embedds into recent xfce4-settings."
> +HOMEPAGE = "https://github.com/schnitzeltony/xfce4-datetime-setter"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
> +
> +DEPENDS = "glib-2.0-native libxfce4ui"
> +
> +SRC_URI = "git://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=https"
> +SRCREV = "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit gettext meson
> +
> +FILES_${PN} += "${datadir}/icons/hicolor"
> +
> +RDEPENDS_${PN} = "systemd tzdata"

On systemd-less systems it wont work

ERROR: Nothing RPROVIDES 'systemd' (but
/mnt/a/yoe/sources/meta-openembedded/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
RDEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'systemd' (not in
DISTRO_FEATURES)

> --
> 2.20.0
>

