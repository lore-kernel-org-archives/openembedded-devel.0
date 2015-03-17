Return-Path: <kaiu@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id 3636B60034
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2015 14:52:01 +0000 (UTC)
Received: from mail-wg0-f52.google.com ([74.125.82.52]) by mail.gmx.com
	(mrgmx001) with ESMTPSA (Nemesis) id 0MQ2Wx-1Yd5VZ26CZ-005LXZ for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2015 15:52:02 +0100
Received: by wggv3 with SMTP id v3so10594414wgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2015 07:52:01 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.180.171.35 with SMTP id ar3mr134268899wic.24.1426603921983; 
	Tue, 17 Mar 2015 07:52:01 -0700 (PDT)
Received: by 10.194.1.67 with HTTP; Tue, 17 Mar 2015 07:52:01 -0700 (PDT)
In-Reply-To: <550821AC.6080908@balister.org>
References: <1426528097-14698-1-git-send-email-kaiu@gmx.de>
	<20150317120552.GA4738@jama> <550821AC.6080908@balister.org>
Date: Tue, 17 Mar 2015 15:52:01 +0100
Message-ID: <CAAKMwiphPcGqXcX6WBrst0BSeJZ_rsazju8L3gQNLB1t2CxZQw@mail.gmail.com>
From: Kai Ulrich <kaiu@gmx.de>
To: openembedded-devel@lists.openembedded.org
X-Provags-ID: V03:K0:KiLrVxhcC8FUXYDQwoIpCHfeNrlNCnHgUZudI5hVqAujnYj29qw
	5Ntka+kc0DlUQT99zBPSGPWowyG3wTcmy026G6PmFd1orgGdQgIlhNqx6cwCldBIL3bz1CM
	+hh+9e007cCUsHPsqbjy1t9yAv2IpXfbP+abHXvpjDQP5X0/MKIbpqV+Wcfz/0FD+x4ZnmL
	trdmZfg23Kf4VF3WHM/TQ==
X-UI-Out-Filterresults: notjunk:1;
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] Add smstools3 http://smstools3.kekekasvi.com to meta-oe recipes-connectivity.
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
X-List-Received-Date: Tue, 17 Mar 2015 14:52:02 -0000
Content-Type: text/plain; charset=UTF-8

Well, smstools3 main-feature is a smsgateway.
Gammu SMSD provides similar functionality and is located
recipes-connectivity.
So if somebody is looking for these features, both alternatives are located
in the same place.
So we might move Gammu as well?

2015-03-17 13:44 GMT+01:00 Philip Balister <philip@balister.org>:

> Also does this belong in meta-telephony?
>
> Philip
>
> On 03/17/2015 08:05 AM, Martin Jansa wrote:
> >
> > subject should start with smstools3:
> >
> > On Mon, Mar 16, 2015 at 06:48:17PM +0100, Kai Ulrich wrote:
> >> From: kulrich <ulrich.kai@gmail.com>
> >>
> >> Signed-off-by: kulrich <ulrich.kai@gmail.com>
> >> ---
> >>  .../smstools3/sms_binpath_and_psops.patch          | 19 ++++++++++
> >>  .../smstools3/smstools3_3.1.15.bb                  | 44
> ++++++++++++++++++++++
> >>  2 files changed, 63 insertions(+)
> >>  create mode 100644
> meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
> >>  create mode 100644 meta-oe/recipes-connectivity/smstools3/
> smstools3_3.1.15.bb
> >>
> >> diff --git
> a/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
> b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
> >> new file mode 100644
> >> index 0000000..ffcaa09
> >> --- /dev/null
> >> +++
> b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
> >> @@ -0,0 +1,19 @@
> >> +Index: smstools3/scripts/sms3
> >> +===================================================================
> >> +--- smstools3.orig/scripts/sms3     2010-05-04 11:21:44.000000000 +0200
> >> ++++ smstools3/scripts/sms3  2015-02-22 20:05:51.615074469 +0100
> >> +@@ -24,11 +24,11 @@
> >> + # Logfile can also be defined in here:
> >> + LOGFILE="/var/log/smsd.log"
> >> +
> >> +-DAEMON=/usr/local/bin/smsd
> >> ++DAEMON=/usr/bin/smsd
> >> + # A program which turns power off for couple of seconds:
> >> +-RESETMODEMS=/usr/local/bin/smsd_resetmodems
> >> ++RESETMODEMS=/usr/bin/smsd_resetmodems
> >> + NAME=smsd
> >> +-PSOPT="-e"
> >> ++PSOPT=""
> >> + ECHO=echo
> >> + case `uname` in
> >> +   *BSD|Darwin)
> >> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
> b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
> >> new file mode 100644
> >> index 0000000..55a2583
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
> >> @@ -0,0 +1,44 @@
> >> +SUMMARY = "The SMS Server Tools 3 is a SMS Gateway software which can
> send and receive short messages through GSM modems and mobile phones."
> >
> > SUMMARY should be short, split to SUMMARY and DESCRIPTION.
> >
> >> +SECTION = "network"
> >> +LICENSE = "GPLv2"
> >> +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=4d21efa1bb2a186360dde4035f860682"
> >> +HOMEPAGE = "http://smstools3.kekekasvi.com"
> >> +
> >> +SRC_URI = "http://smstools3.kekekasvi.com/packages/${PN}-${PV}.tar.gz
> \
> >
> > ${PN}-${PV} -> ${BP}
> >
> >> +           file://sms_binpath_and_psops.patch"
> >> +
> >> +SRC_URI[md5sum] = "0241ef60e646fac1a06254a848e61ed7"
> >> +SRC_URI[sha256sum] =
> "ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393ea02f5bf05234814d59"
> >> +
> >> +
> >> +S = "${WORKDIR}/${PN}"
> >> +
> >> +RDEPENDS_${PN} = " bash "
> >
> > drop unnecessary spaces around bash.
> >
> >> +INITSCRIPT_NAME = "sms3"
> >> +INITSCRIPT_PARAMS = "defaults"
> >> +
> >> +inherit update-rc.d
> >> +
> >> +do_install () {
> >> +
> >> +    install -d ${D}${bindir}
> >> +    install -m 755 ${S}/src/smsd "${D}${bindir}/smsd"
> >> +
> >> +    install -m 755 ${S}/scripts/sendsms "${D}${bindir}/sendsms"
> >> +    install -m 755 ${S}/scripts/sms2html "${D}${bindir}/sms2html"
> >> +    install -m 755 ${S}/scripts/sms2unicode "${D}${bindir}/sms2unicode"
> >> +    install -m 755 ${S}/scripts/unicode2sms "${D}${bindir}/unicode2sms"
> >> +
> >> +    install -d ${D}${sysconfdir}
> >> +    install -m 644 ${S}/examples/smsd.conf.easy
> "${D}${sysconfdir}/smsd.conf"
> >> +
> >> +    install -d "${D}${localstatedir}/spool"
> >> +    install -d "${D}${localstatedir}/spool/sms"
> >> +    install -d "${D}${localstatedir}/spool/sms/incoming"
> >> +    install -d "${D}${localstatedir}/spool/sms/outgoing"
> >> +    install -d "${D}${localstatedir}/spool/sms/checked"
> >> +
> >> +    install -d ${D}${sysconfdir}/init.d
> >> +    install -m 755 ${S}/scripts/sms3
> "${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}"
> >> +
> >> +}
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
>
>

