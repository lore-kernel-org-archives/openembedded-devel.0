Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 74E7065CA7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Nov 2014 14:23:28 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so10742043wgh.25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Nov 2014 06:23:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=dPceocwfX7H2F9R0/bDhmBTLl3WoCnHPvOiuAk5gsNI=;
	b=knl1wskgvA/ex/O9LdjycnTUWHZ+8Y6tpgXJXzcknD1voyXFBLVxipfbFdSFCzq8Yb
	9LjWkjPC/fpzTnb4zCMJoGmUzitRKQZ+pChPwPcPhI4v6oKZKFDPszvnSunHQRCBpfp7
	YgjhFzkDOnMtK0Kniug9EjCaIviq+Y8iKXp/ekpCel7ek/lQOzrm6L4gCOz/k4vPY/e1
	JejqdN2bQnYBSLAM4lIgrpoNWLp24XOH9FMzjhX/ik8J+j76CI5dnYZiHKFC0y0zSZtv
	0NXPJVVnIeA3zjtFkzt58oRJGs5XIp/byRDlbVr9wIBrqzPIbxk1IYHbEJ85Uargow24
	rW3g==
X-Gm-Message-State: ALoCoQlTsp0VtjwOOwX/E2zRGrH91RMxK1nR+QagScV24n0QpKZPPxd/tX3yvfd0hdIRftO9QTsr
X-Received: by 10.180.90.133 with SMTP id bw5mr27234149wib.50.1417271008962;
	Sat, 29 Nov 2014 06:23:28 -0800 (PST)
Received: from iMac.local (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id c5sm20127453wik.3.2014.11.29.06.23.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 29 Nov 2014 06:23:28 -0800 (PST)
Message-ID: <5479D6DE.9020108@dominion.thruhere.net>
Date: Sat, 29 Nov 2014 15:23:26 +0100
From: Koen Kooi <koen@dominion.thruhere.net>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1417164585-46087-1-git-send-email-biannm@cn.fujitsu.com>
	<1417164585-46087-2-git-send-email-biannm@cn.fujitsu.com>
In-Reply-To: <1417164585-46087-2-git-send-email-biannm@cn.fujitsu.com>
Subject: Re: [PATCH 1/3] [meta-oe]daemontools: add recipe
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
X-List-Received-Date: Sat, 29 Nov 2014 14:23:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Bian Naimeng schreef op 28-11-14 09:49:
> daemontools is a collection of tools for managing UNIX services.
> 
> Though daemontools is a very old tool, but it still supported by some 
> distro such as ubuntu(trusty 14.04LTS).
> 
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com> --- 
> ...or.h-include-errno.h-instead-of-extern-int.diff | 25 ++++++++++++ 
> ....c-.-supervise-may-be-a-symlink-if-it-s-da.diff | 47
> ++++++++++++++++++++++ .../daemontools/daemontools/cross-compile.patch
> | 45 +++++++++++++++++++++ .../daemontools/daemontools_0.76.bb
> | 47 ++++++++++++++++++++++

[..]

All the patches are missing Upstream-status tags

> +++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb @@ -0,0
> +1,47 @@ +SUMMARY = "DJB daemontools" +DESCRIPTION = "supervise monitors
> a service. It starts the service and restarts the \ +service if it dies.
> The companion svc program stops, pauses, or restarts \ +the service on
> sysadmin request. The svstat program prints a one-line \ +status report.
> \ +multilog saves error messages to one or more logs.  It optionally
> timestamps \ +each line and, for each log, includes or excludes lines
> matching specified \ +patterns.  It automatically rotates logs to limit
> the amount of disk space \ +used.  If the disk fills up, it pauses and
> tries again, without losing any \ +data." + +SECTION = "System/Servers" 
> + +LIC_FILES_CHKSUM =
> "file://${COMMON_LICENSE_DIR}/PD;md5=b3597d12946881e13cb3b548d1173851" 
> +LICENSE = "PD" + +SRC_URI =
> "http://cr.yp.to/daemontools/${BPN}-${PV}.tar.gz \ +
> file://0001-error.h-include-errno.h-instead-of-extern-int.diff \ +
> file://0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff " + 
> +SRC_URI_append_class-target = "file://cross-compile.patch"

This one looks safe enough to apply globally, especially because it will
otherwise ignore %{CC} in the non-target cases.


> + +SRC_URI[md5sum] = "1871af2453d6e464034968a0fbcb2bfc" 
> +SRC_URI[sha256sum] =
> "a55535012b2be7a52dcd9eccabb9a198b13be50d0384143bd3b32b8710df4c1f" + +S =
> "${WORKDIR}/admin/${BPN}-${PV}" + +DEPENDS += "daemontools-native"

There's no inherit or DEPENDS, so drop the '+'

> +DEPENDS_virtclass-native = "" + +do_compile() { +    ./package/compile 
> +} + +do_install() { +    install -d ${D}/${bindir} +} + 
> +do_install_append_class-native() { +    install -m 755
> ${S}/compile/chkshsgr ${D}/${bindir} +} + 
> +do_install_append_class-target() { +    install -m755 ${S}/command/*
> ${D}/${bindir} +}

Just collapse these into a single do_install, it doesn't hurt to install
extra binaries in the -native case.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUedbeMkyGM64RGpERAoofAKCVG4s1OQo7QCHUT5SQQHjRFI6DVgCghQH2
n8cWsbFFXW3AbKD8K+2rjt4=
=fCRL
-----END PGP SIGNATURE-----

