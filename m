Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5496140F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 18:41:26 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id r21so15402252edq.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 10:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EOM0LTgbGMWHIemGWtrDvKtcmnQYx/YgHPr7dJs2SfU=;
	b=c7hOfm0Vqs2jvyMQp4mE1uTPZqYZWalf8JQc6OEUVNB2X6ml2VHXqSbEG4dqhNxmQ4
	VAWqFIXlDnW8VpPLoJ05Z18fxHxKIR6sWCZvNd0srpNX7TVM8VgC8695nOCEOPDktaYs
	o+S/nKDvV82HHJS5EUIJBFb6UzfY2NjC/x1w/PMw06piZKiK2H4ylC+AN0MtKF3gQCk+
	aCcsTgUEwn0dnAliGgU3muyjC0RQMzLL8WQjuNgQHJxBbw0lQYn6w3/s5wAxTvKi1rhJ
	FOsiq1kRe7wdOAY/Y+zYyFm8peFw1zBpLwMs7Cp5/yrcpdRc51A+5iea6XbdUP2coof5
	fMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EOM0LTgbGMWHIemGWtrDvKtcmnQYx/YgHPr7dJs2SfU=;
	b=T0jq5iaZ8H+ZUQwX2Z4dwXBLLm9zSULr2aPL1mXX0nKUMsUgbcvioMHx3waqG3r5qu
	YK6v8xyWzvNMCEu+r7T6MiJ8Vft6qizC1VjZA2AXrJvxvDJmzqs6Ln3/uF/zL4/EVEMA
	cQFSx0sjzguP7LAD2+O90pol/LQHW9ZcGnWOds+I3oNjfzmEoOMsR9F3DFKLXTM5qVsK
	Q9F7oiXiO7lmUDuynbaAx8O7CLIj4vFyUPQz80G9Myg3CrWDTrakKlQV0TM5Kh6q0d/x
	DZJu2PpRvAJ6E7doTyTGYCoUkAsAHe/MTuj77sZZqmnoOYXjQi1ud2Yz3UIPQ10RhEhx
	/gvQ==
X-Gm-Message-State: APjAAAUW7GmSoGyn/ElLVxfRi5QHd4q0IKywxacUnu0aoCVsGBZlMqLs
	8Pzy1dBAzrPLU6IdPrIQhhc6nRb4jvOX5NzEkQs=
X-Google-Smtp-Source: APXvYqxsTEkpw9z335iN1QYmfhnBGT/DywMiQuk4mBCdQE2feudJ5uW42QXSobx9UegHv23WItRtJvd3GPolbh8EDVA=
X-Received: by 2002:a17:906:d0d1:: with SMTP id
	bq17mr8609560ejb.55.1581792087302; 
	Sat, 15 Feb 2020 10:41:27 -0800 (PST)
MIME-Version: 1.0
References: <20200202021738.7440-1-alistair@alistair23.me>
In-Reply-To: <20200202021738.7440-1-alistair@alistair23.me>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 15 Feb 2020 19:41:16 +0100
Message-ID: <CA+chaQeXzg=6gEAGwD4-MORiPjUz6bF2tPOgGrJOxfwy2sFNoA@mail.gmail.com>
To: Alistair Francis <alistair@alistair23.me>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] gpsd: Only require and build for Python3
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
X-List-Received-Date: Sat, 15 Feb 2020 18:41:27 -0000
Content-Type: text/plain; charset="UTF-8"

FYI: this doesn't prevent the scons to detect python(2) in HOSTTOOLS if
some layers adds it there, like meta-updater does, reported here:
https://github.com/advancedtelematic/meta-updater/issues/684

It would be nice to have python PACKAGECONFIG to explicitly disable this
all when not needed.

On Sun, Feb 2, 2020 at 3:17 AM Alistair Francis <alistair@alistair23.me>
wrote:

> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
> v2:
>  - Actually rename everything
>
>  meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb | 24 ++++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
> b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
> index dbbc7140f..f74ebda5f 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
> @@ -2,7 +2,7 @@ SUMMARY = "A TCP/IP Daemon simplifying the communication
> with GPS devices"
>  SECTION = "console/network"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=01764c35ae34d9521944bb6ab312af53"
> -DEPENDS = "dbus ncurses python python3 pps-tools"
> +DEPENDS = "dbus ncurses python3 pps-tools"
>  PROVIDES = "virtual/gpsd"
>
>  SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
> @@ -84,7 +84,7 @@ do_install_append() {
>      install -m 0644 ${S}/systemd/${BPN}.socket
> ${D}${systemd_unitdir}/system/${BPN}.socket
>  }
>
> -PACKAGES =+ "libgps libgpsd python-pygps gpsd-udev gpsd-conf gpsd-gpsctl
> gps-utils"
> +PACKAGES =+ "libgps libgpsd python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl
> gps-utils"
>
>  RPROVIDES_${PN}-dbg += "python-pygps-dbg"
>
> @@ -114,17 +114,17 @@ FILES_gpsd-gpsctl = "${bindir}/gpsctl"
>  SUMMARY_gps-utils = "Utils used for simulating, monitoring,... a GPS"
>  # Python files are required for gps/fake, required for gpsfake.
>  FILES_gps-utils = "${bindir}/* ${libdir}/gps/*.py ${libdir}/gps/*.so"
> -RDEPENDS_gps-utils = "python-pygps"
> -
> -SUMMARY_python-pygps = "Python bindings to gpsd"
> -FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/* ${libdir}/gps/*.py
> ${libdir}/*.egg-info"
> -RDEPENDS_python-pygps = " \
> -    python-core \
> -    python-io \
> -    python-threading \
> -    python-terminal \
> +RDEPENDS_gps-utils = "python3-pygps"
> +
> +SUMMARY_python3-pygps = "Python bindings to gpsd"
> +FILES_python3-pygps = "${PYTHON_SITEPACKAGES_DIR}/* ${libdir}/gps/*.py
> ${libdir}/*.egg-info"
> +RDEPENDS_python3-pygps = " \
> +    python3-core \
> +    python3-io \
> +    python3-threading \
> +    python3-terminal \
>      gpsd \
> -    python-json"
> +    python3-json"
>
>  RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

