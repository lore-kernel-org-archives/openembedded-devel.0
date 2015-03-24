Return-Path: <kaiu@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by mail.openembedded.org (Postfix) with ESMTP id 18B2D60034
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 07:13:40 +0000 (UTC)
Received: from mail-wi0-f181.google.com ([209.85.212.181]) by mail.gmx.com
	(mrgmx101) with ESMTPSA (Nemesis) id 0M9wrU-1YlKZv0Mqu-00B7KN for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 08:13:39 +0100
Received: by wibg7 with SMTP id g7so66728640wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 00:13:38 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.181.13.82 with SMTP id ew18mr26066079wid.84.1427181218616;
	Tue, 24 Mar 2015 00:13:38 -0700 (PDT)
Received: by 10.194.1.67 with HTTP; Tue, 24 Mar 2015 00:13:38 -0700 (PDT)
In-Reply-To: <1426674053-3772-1-git-send-email-kaiu@gmx.de>
References: <1426674053-3772-1-git-send-email-kaiu@gmx.de>
Date: Tue, 24 Mar 2015 08:13:38 +0100
Message-ID: <CAAKMwipN8SBpyeA4OhxrBSjzgvQubJ-jRCsMxpPfgzprH+fo0w@mail.gmail.com>
From: Kai Ulrich <kaiu@gmx.de>
To: openembedded-devel@lists.openembedded.org
X-Provags-ID: V03:K0:Qr4VfZt7LHppsu7fyAye3AYoriytiABnBxgumeJFWYWI5jh/xrx
	jWGTP+Ppa+XcFKVhRPqTYJ3KJdwjyf1DHUIShq6eS9xR3wGljU59Ad5tpgn4Vo5q0GDUR4l
	diGPSQT1/wdb0+W3A2g/zWXcUPZA8RND6DML3cMIJSZpll4pPrzvyEs50M5eh+A0yx/PtGc
	kP+FTTf0Dn/E/U3elN0Cw==
X-UI-Out-Filterresults: notjunk:1;
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] smstools3: Add smstools3 to meta-oe/recipes-connectivity
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
X-List-Received-Date: Tue, 24 Mar 2015 07:13:41 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

I just saw you merged smstools3.

Thanx
Kai

2015-03-18 11:20 GMT+01:00 Kai Ulrich <kaiu@gmx.de>:

> Signed-off-by: Kai Ulrich <kaiu@gmx.de>
> ---
>  .../smstools3/sms_binpath_and_psops.patch          | 19 +++++++++
>  .../smstools3/smstools3_3.1.15.bb                  | 45
> ++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644
> meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
>  create mode 100644 meta-oe/recipes-connectivity/smstools3/
> smstools3_3.1.15.bb
>
> diff --git
> a/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
> b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
> new file mode 100644
> index 0000000..ffcaa09
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
> @@ -0,0 +1,19 @@
> +Index: smstools3/scripts/sms3
> +===================================================================
> +--- smstools3.orig/scripts/sms3        2010-05-04 11:21:44.000000000 +0200
> ++++ smstools3/scripts/sms3     2015-02-22 20:05:51.615074469 +0100
> +@@ -24,11 +24,11 @@
> + # Logfile can also be defined in here:
> + LOGFILE="/var/log/smsd.log"
> +
> +-DAEMON=/usr/local/bin/smsd
> ++DAEMON=/usr/bin/smsd
> + # A program which turns power off for couple of seconds:
> +-RESETMODEMS=/usr/local/bin/smsd_resetmodems
> ++RESETMODEMS=/usr/bin/smsd_resetmodems
> + NAME=smsd
> +-PSOPT="-e"
> ++PSOPT=""
> + ECHO=echo
> + case `uname` in
> +   *BSD|Darwin)
> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
> b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
> new file mode 100644
> index 0000000..7a72a1e
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
> @@ -0,0 +1,45 @@
> +SUMMARY = "SMS Gateway software"
> +DESCRIPTION = "The SMS Server Tools 3 is a SMS Gateway software which can
> send and receive short messages through GSM modems and mobile phones."
> +SECTION = "console/network"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4d21efa1bb2a186360dde4035f860682"
> +HOMEPAGE = "http://smstools3.kekekasvi.com"
> +
> +SRC_URI = "http://smstools3.kekekasvi.com/packages/${BP}.tar.gz \
> +           file://sms_binpath_and_psops.patch"
> +
> +SRC_URI[md5sum] = "0241ef60e646fac1a06254a848e61ed7"
> +SRC_URI[sha256sum] =
> "ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393ea02f5bf05234814d59"
> +
> +
> +S = "${WORKDIR}/${PN}"
> +
> +RDEPENDS_${PN} = "bash"
> +INITSCRIPT_NAME = "sms3"
> +INITSCRIPT_PARAMS = "defaults"
> +
> +inherit update-rc.d
> +
> +do_install () {
> +
> +       install -d ${D}${bindir}
> +       install -m 755 ${S}/src/smsd "${D}${bindir}/smsd"
> +
> +       install -m 755 ${S}/scripts/sendsms "${D}${bindir}/sendsms"
> +       install -m 755 ${S}/scripts/sms2html "${D}${bindir}/sms2html"
> +       install -m 755 ${S}/scripts/sms2unicode "${D}${bindir}/sms2unicode"
> +       install -m 755 ${S}/scripts/unicode2sms "${D}${bindir}/unicode2sms"
> +
> +       install -d ${D}${sysconfdir}
> +       install -m 644 ${S}/examples/smsd.conf.easy
> "${D}${sysconfdir}/smsd.conf"
> +
> +       install -d "${D}${localstatedir}/spool"
> +       install -d "${D}${localstatedir}/spool/sms"
> +       install -d "${D}${localstatedir}/spool/sms/incoming"
> +       install -d "${D}${localstatedir}/spool/sms/outgoing"
> +       install -d "${D}${localstatedir}/spool/sms/checked"
> +
> +       install -d ${D}${sysconfdir}/init.d
> +       install -m 755 ${S}/scripts/sms3
> "${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}"
> +
> +}
> --
> 1.9.1
>
>

