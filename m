Received: from mail-vc0-f170.google.com ([209.85.220.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Ttlmx-0004QD-Md
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2013 22:05:20 +0100
Received: by mail-vc0-f170.google.com with SMTP id fl11so1872070vcb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2013 12:50:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=Ru3/3LysnHz2x1kWGh+FutZcTu0kgzPkvz/8CoPsD2w=;
	b=JKG3cyrgracN3HClfMi5rpb32GOpfOkU7JEdPpfGT47goH0ULN7+8VlkPkKRdrQvnx
	StYp3lNDQzGrmH2n4qefQ0paODin0PfnE72SN9Xv1FUJH0S35H8C3bo1jKjCyk85YSMm
	QxBhuCSQG6D2RdyPf8LqatGB2DOjrLqS4fqekSg9AWR4TiSeUco7Rt7psk/nLJdL/3Wj
	F0t0RxOElOUf9Av9E7Kl37N0eme+lNwOIFjP6tJ8aM7oHjGAre0dVC5Tzqgjkj/e1m/f
	KwzNTOTGxC9Wj2wUVF6EPCIOb0yQMzGLzmFkXTGCP6j0l9GL/qUjNB+UbdMEnV/ByyF+
	KJqA==
Received: by 10.58.248.41 with SMTP id yj9mr97958106vec.29.1357937404047; Fri,
	11 Jan 2013 12:50:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.102.132 with HTTP; Fri, 11 Jan 2013 12:49:43 -0800 (PST)
X-Originating-IP: [5.13.223.33]
In-Reply-To: <1357936861-8245-1-git-send-email-philip@balister.org>
References: <1357936861-8245-1-git-send-email-philip@balister.org>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 11 Jan 2013 22:49:43 +0200
Message-ID: <CAK18fxENpqFbRG9fOdLVB5_o+A+E1zvDjZZCzwXv61wao9KT_A@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkZ9dFpAxLbfVlquwQCIySlO8xoO5DaDkYLVUUtMUlgtvI6LhNDhr+sQ60Ko3KCew+khW+t
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 1/3] uhd-firmware : Update to version 3.5.0.
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
X-List-Received-Date: Fri, 11 Jan 2013 21:05:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Send emails with -M flag please. Thanks.



*Andrei Gherzan*
mobile +40.744.478.414  fax +40.31.816.28.12
Email: andrei@gherzan.ro
Email: andrei.gherzan@windriver.com
Romania


On Fri, Jan 11, 2013 at 10:40 PM, Philip Balister <philip@balister.org>wrote:

> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  .../uhd/uhd-firmware_003.004.000.bb                | 27
> ----------------------
>  .../uhd/uhd-firmware_003.005.000.bb                | 27
> ++++++++++++++++++++++
>  2 files changed, 27 insertions(+), 27 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/uhd/
> uhd-firmware_003.004.000.bb
>  create mode 100644 meta-oe/recipes-connectivity/uhd/
> uhd-firmware_003.005.000.bb
>
> diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bbb/meta-oe/recipes-connectivity/uhd/
> uhd-firmware_003.004.000.bb
> deleted file mode 100644
> index b445307..0000000
> --- a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -DESCRIPTION = "Universal Hardware Driver Firmware"
> -HOMEPAGE = "http://www.ettus.com"
> -
> -PE = "1"
> -
> -LICENSE = "GPLv3"
> -LIC_FILES_CHKSUM =
> "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=d8a4f8958d3b56a11bbb1bb134826b28"
> -
> -inherit allarch
> -
> -SRC_URI = "
> http://files.ettus.com/binaries/uhd_stable/releases/uhd_${PV}-release/uhd-images_${PV}-release.tar.gz
> "
> -SRC_URI[md5sum] = "4269fac82df1fe593ba76206773ce551"
> -SRC_URI[sha256sum] =
> "4b80ebf90079a823212d3b77e5311ef1b467497a4a3585c2cfb4fe65bff71acf"
> -
> -S = "${WORKDIR}/uhd-images_${PV}-release"
> -
> -do_install() {
> -       install -d ${D}${datadir}/uhd/images
> -       install -d ${D}${datadir}/uhd/images/bit
> -       install -m 0644 ${S}/share/uhd/images/bit/*
> ${D}${datadir}/uhd/images/bit
> -       rm -rf ${S}/share/uhd/images/bit
> -       install -m 0644 ${S}/share/uhd/images/* ${D}${datadir}/uhd/images
> -}
> -
> -PACKAGES = "${PN}"
> -FILES_${PN} = "${datadir}/uhd/images"
> -
> diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bbb/meta-oe/recipes-connectivity/uhd/
> uhd-firmware_003.005.000.bb
> new file mode 100644
> index 0000000..ee771fb
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "Universal Hardware Driver Firmware"
> +HOMEPAGE = "http://www.ettus.com"
> +
> +PE = "1"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM =
> "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=8df143216c46b7c49804f95056c7057a"
> +
> +inherit allarch
> +
> +SRC_URI = "
> http://files.ettus.com/binaries/uhd_stable/releases/uhd_${PV}-release/uhd-images_${PV}-release.tar.gz
> "
> +SRC_URI[md5sum] = "dd2373263740d2d48fb39e57846bcd2a"
> +SRC_URI[sha256sum] =
> "352fbf69fbfff03a02b5d9b3c398771db40e4c5b77f99f0fdbff67c547cc0d18"
> +
> +S = "${WORKDIR}/uhd-images_${PV}-release"
> +
> +do_install() {
> +       install -d ${D}${datadir}/uhd/images
> +       install -d ${D}${datadir}/uhd/images/bit
> +       install -m 0644 ${S}/share/uhd/images/bit/*
> ${D}${datadir}/uhd/images/bit
> +       rm -rf ${S}/share/uhd/images/bit
> +       install -m 0644 ${S}/share/uhd/images/* ${D}${datadir}/uhd/images
> +}
> +
> +PACKAGES = "${PN}"
> +FILES_${PN} = "${datadir}/uhd/images"
> +
> --
> 1.7.11.7
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

