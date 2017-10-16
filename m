Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5253660116
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 21:50:40 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i5so3684468pfe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 14:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=SePHSxFNPLhAKcy2Nf9q/tU3LH8zN0ko+U+r4XOYub0=;
	b=bcSY4uRSDqNREolxj/g/NRaUST4uEUSXfqswFda8h8dcJIH3jvR3oQv58MJKjoMbG2
	9iOUyp1tJQIeK7Qs7NDPLwaLBQ+5oPILvQ3+YGJ6MMYMNXZiJcGds+EQmERzQT/Vog8m
	noxxRfCc6vRurEFRDBT11F741X0po/7OU33RKpzp4AuQz2TNDKqjkgEX0Jzd2awok/hi
	acHd7jerJYwzHxSwPEVMRkf7A4EFjAjoZSG0N7H+bs205Bsq1r8SgEqVhtyvy6W3lE80
	95vp+0H/mvdbU8+lqcwWdoLzm8AWs9zTZofZV5U+2j5jBnB5BfsPgGVmbFrZE2cImWs1
	Cocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=SePHSxFNPLhAKcy2Nf9q/tU3LH8zN0ko+U+r4XOYub0=;
	b=cc/LvGJLRmF7xZQUJTPjvZBmKLzP2/Ofp7kZpmWgtvEh9oVZWluqla4YMqbul2XBv6
	UX1MU/Qu3oD0DesX/P6e5/86yNHKpFim6XLC8glgN4SFTwGTZgGp2glV//+tOqWn3zW0
	BfqU7K010w0y6kjjTiMjm3dlk5vZ94Q0U7ZMxGu8NzDDF1ioT3MTdSCEvG91MeYqtpGA
	kuzHddQ4YbDELUoGD6VW9BIitlh81HA0rEyy5g7/AV9NXXWj6ctiX6fFt7e7vnu6/o/O
	1Y5Re/zeWEMH4mjbALnRxbAdfKeMF3JwENjjp2dux4s2yYjFhGMlotaCSpwkAQT1d5GV
	TI2Q==
X-Gm-Message-State: AMCzsaX9ZPypNWMDxGKRp9QqanTsFk0EBVGeqT4xnhGtlKYTNj4U0sSV
	8mfumzOVaPxejTMZwknRr+/VAw==
X-Google-Smtp-Source: AOwi7QCDhBpd0lDHA9B5ILXbOOJBwgq1lufPOy3U9G2snhow/YOgits4iU3/p0cPab0kRkzy0jn1bg==
X-Received: by 10.84.241.131 with SMTP id b3mr10336775pll.103.1508190642150;
	Mon, 16 Oct 2017 14:50:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:8194:6b43:14e2:94fc?
	([2601:202:4001:9ea0:8194:6b43:14e2:94fc])
	by smtp.gmail.com with ESMTPSA id
	e84sm16726050pfd.1.2017.10.16.14.50.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 14:50:41 -0700 (PDT)
To: Dan Walkes <danwalkes@trellis-logic.com>,
	openembedded-devel@lists.openembedded.org
References: <1507489523-13556-1-git-send-email-danwalkes@trellis-logic.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <aa238651-2c5e-4407-4d62-58bdf6e5dd26@gmail.com>
Date: Mon, 16 Oct 2017 14:50:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1507489523-13556-1-git-send-email-danwalkes@trellis-logic.com>
Subject: Re: [meta-oe][PATCH] Fix gpsd Yocto pyro build for read only rootfs
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
X-List-Received-Date: Mon, 16 Oct 2017 21:50:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Dan,


On 10/08/2017 12:05 PM, Dan Walkes wrote:
> Attempting to include gpsd on Yocto pyro with IMAGE_FEATURES including
> read-only-rootfs results in an error:

The subject has "pyro" in it. Is this meat for the stable branch "Pyro"
too. It is in Rocko now.

BTW, 3.16 is not in Pyro. looking for clarification.

- armin
> "The following packages could not be configured offline and rootfs is
> read-only"
>
> This stems from a failure during the do_rootfs steps where the /etc/init.d/gpsd
> file is missing during the call to update-rc.d.
>
> This happens because the /etc/init.d/gpsd file is installed during
> package install for gpsd-conf instead of gpsd, and the default value for
> INITSCRIPT_PACKAGES is PN.  To resolve, specify INITSCRIPT_PACKAGES as
> gpsd-conf instead.
>
> Also, as suggested on the Yocto mailing list, refactor to inherit
> update-alternatives and use this to replace the postinst and postrm
> steps.
>
> Signed-off-by: Dan Walkes <danwalkes@trellis-logic.com>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
> index 27a600f..f8e6a2b 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
> @@ -19,8 +19,9 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
>  SRC_URI[md5sum] = "68691b5de4c94f82ec4062b042b5eb63"
>  SRC_URI[sha256sum] = "03579af13a4d3fe0c5b79fa44b5f75c9f3cac6749357f1d99ce5d38c09bc2029"
>  
> -inherit scons update-rc.d python-dir pythonnative systemd bluetooth
> +inherit scons update-rc.d python-dir pythonnative systemd bluetooth update-alternatives
>  
> +INITSCRIPT_PACKAGES = "gpsd-conf"
>  INITSCRIPT_NAME = "gpsd"
>  INITSCRIPT_PARAMS = "defaults 35"
>  
> @@ -86,14 +87,6 @@ do_install_append() {
>      install -m 0644 ${S}/systemd/${BPN}.socket ${D}${systemd_unitdir}/system/${BPN}.socket
>  }
>  
> -pkg_postinst_${PN}-conf() {
> -    update-alternatives --install ${sysconfdir}/default/gpsd gpsd-defaults ${sysconfdir}/default/gpsd.default 10
> -}
> -
> -pkg_postrm_${PN}-conf() {
> -    update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default
> -}
> -
>  PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
>  
>  FILES_${PN}-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc \
> @@ -133,3 +126,9 @@ RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
>  RCONFLICTS_${PN} += "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} = "${PN}.socket"
> +
> +
> +ALTERNATIVE_${PN} = "gpsd-defaults"
> +ALTERNATIVE_PATH = "${sysconfdir}/default/gpsd.default"
> +ALTERNATIVE_LINK = "${sysconfdir}/default/gpsd"
> +ALTERNATIVE_TARGET = "${sysconfdir}/default/gpsd.default"


