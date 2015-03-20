Return-Path: <kaiu@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by mail.openembedded.org (Postfix) with ESMTP id ECE8B6013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2015 08:02:34 +0000 (UTC)
Received: from mail-wg0-f42.google.com ([74.125.82.42]) by mail.gmx.com
	(mrgmx101) with ESMTPSA (Nemesis) id 0LuKHz-1ZYZED2OIx-011hzv for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2015 09:02:34 +0100
Received: by wgdm6 with SMTP id m6so82591241wgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2015 01:02:33 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.180.171.35 with SMTP id ar3mr3431177wic.24.1426838553896;
	Fri, 20 Mar 2015 01:02:33 -0700 (PDT)
Received: by 10.194.1.67 with HTTP; Fri, 20 Mar 2015 01:02:33 -0700 (PDT)
Received: by 10.194.1.67 with HTTP; Fri, 20 Mar 2015 01:02:33 -0700 (PDT)
In-Reply-To: <1426674053-3772-1-git-send-email-kaiu@gmx.de>
References: <1426674053-3772-1-git-send-email-kaiu@gmx.de>
Date: Fri, 20 Mar 2015 09:02:33 +0100
Message-ID: <CAAKMwiompwm1vZ=8rBBRDtaEkv4fzKGnjAG1ekc3JXzhZeNjbg@mail.gmail.com>
From: Kai Ulrich <kaiu@gmx.de>
To: openembedded-devel@lists.openembedded.org
X-Provags-ID: V03:K0:L90dHx0Sm/TkFJF+A30P7ac1BdJ6H/Zh2ex6ganEF9c6VQz7vqx
	ZBjqVABNtkZ/YA0T6GW9PXh6fQ9iWgyiPn6I4nroONAyYRt5W0W094mykTSK8yAhbRqyq/w
	lcMWl+DQfwXCYtgOp88tHpP84hKVvxdrHBLhQXSKycTipJPpOxiTWsN7nak4LAsIMLCcTcz
	KDjUzUasDEMDLqrz9Yt7w==
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
X-List-Received-Date: Fri, 20 Mar 2015 08:02:35 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
So better move it to meta-telephonie?
Any thing more I can do?
Regardes
Kai.

Sent from my mobile
Am 18.03.2015 11:20 schrieb "Kai Ulrich" <kaiu@gmx.de>:

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

