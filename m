Return-Path: <kaiu@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by mail.openembedded.org (Postfix) with ESMTP id 47BC36013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2015 10:02:27 +0000 (UTC)
Received: from mail-we0-f173.google.com ([74.125.82.173]) by mail.gmx.com
	(mrgmx101) with ESMTPSA (Nemesis) id 0M9OMc-1Ygkyg20oY-00Cl8U for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2015 11:02:28 +0100
Received: by weop45 with SMTP id p45so8737079weo.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2015 03:02:27 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.195.12.71 with SMTP id eo7mr123091877wjd.3.1426500147928;
	Mon, 16 Mar 2015 03:02:27 -0700 (PDT)
Received: by 10.194.1.67 with HTTP; Mon, 16 Mar 2015 03:02:27 -0700 (PDT)
In-Reply-To: <5502F0C9.8050009@balister.org>
References: <CAAKMwirhdq7H2ULjwOXCOfs3JEWCXJR2QyyCmGjFuf1uF6Doqg@mail.gmail.com>
	<CAGiJk9cTPf8TOg+h2rYbsT-Pvyo6EbDkR1_ps+dRPkx=43d9zQ@mail.gmail.com>
	<5502F0C9.8050009@balister.org>
Date: Mon, 16 Mar 2015 11:02:27 +0100
Message-ID: <CAAKMwioTcWrxjnbHvkrzjsDDojeaYn-pjSh--Q8UXuCH57du9Q@mail.gmail.com>
From: Kai Ulrich <kaiu@gmx.de>
To: openembedded-devel@lists.openembedded.org
X-Provags-ID: V03:K0:CuRzOkhTb+41UPovVx+7ghqrRqgxS0/F3I9ilkzOM9G9nntHfZx
	2FSsz2ob5cbporBNNjgFUAt47QIxhaO0NWLxvaBZgc0h1x6UoYcfOvp9pN7CXpjrTMnt5uT
	w5Wjk0pbrj+pZhwAJqZRmWcjBnHUU9J8lkITKM1QLTccMvs2joqm2jL0l5EY/U3h8ROn3kP
	oiNM1Fs+Ds+QYtDEQv2eQ==
X-UI-Out-Filterresults: notjunk:1;
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How is the process to add a recipe to meta-oe?
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
X-List-Received-Date: Mon, 16 Mar 2015 10:02:30 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

thanks for your time.

I created a patch for adding smstools3 to meta-oe.
I decided to add the new recipe to recipes-connectivity, because I found
gammu here as well.
smstools3 provides similar features.
What do you think.

patch:
====================================================================
From 264479fc1417ddff3f39006aa24f8fd049c0a789 Mon Sep 17 00:00:00 2001
From: kulrich <ulrich.kai@gmail.com>
Date: Mon, 16 Mar 2015 10:40:48 +0100
Subject: [PATCH] Add smstools3 http://smstools3.kekekasvi.com to meta-oe
 recipes-connectivity.

Signed-off-by: kulrich <ulrich.kai@gmail.com>
---
 .../smstools3/sms_binpath_and_psops.patch          | 19 ++++++++++
 .../smstools3/smstools3_3.1.15.bb                  | 44
++++++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644
meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
 create mode 100644 meta-oe/recipes-connectivity/smstools3/
smstools3_3.1.15.bb

diff --git
a/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
new file mode 100644
index 0000000..ffcaa09
--- /dev/null
+++
b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
@@ -0,0 +1,19 @@
+Index: smstools3/scripts/sms3
+===================================================================
+--- smstools3.orig/scripts/sms3    2010-05-04 11:21:44.000000000 +0200
++++ smstools3/scripts/sms3    2015-02-22 20:05:51.615074469 +0100
+@@ -24,11 +24,11 @@
+ # Logfile can also be defined in here:
+ LOGFILE="/var/log/smsd.log"
+
+-DAEMON=/usr/local/bin/smsd
++DAEMON=/usr/bin/smsd
+ # A program which turns power off for couple of seconds:
+-RESETMODEMS=/usr/local/bin/smsd_resetmodems
++RESETMODEMS=/usr/bin/smsd_resetmodems
+ NAME=smsd
+-PSOPT="-e"
++PSOPT=""
+ ECHO=echo
+ case `uname` in
+   *BSD|Darwin)
diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
new file mode 100644
index 0000000..55a2583
--- /dev/null
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
@@ -0,0 +1,44 @@
+SUMMARY = "The SMS Server Tools 3 is a SMS Gateway software which can send
and receive short messages through GSM modems and mobile phones."
+SECTION = "network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4d21efa1bb2a186360dde4035f860682"
+HOMEPAGE = "http://smstools3.kekekasvi.com"
+
+SRC_URI = "http://smstools3.kekekasvi.com/packages/${PN}-${PV}.tar.gz \
+           file://sms_binpath_and_psops.patch"
+
+SRC_URI[md5sum] = "0241ef60e646fac1a06254a848e61ed7"
+SRC_URI[sha256sum] =
"ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393ea02f5bf05234814d59"
+
+
+S = "${WORKDIR}/${PN}"
+
+RDEPENDS_${PN} = " bash "
+INITSCRIPT_NAME = "sms3"
+INITSCRIPT_PARAMS = "defaults"
+
+inherit update-rc.d
+
+do_install () {
+
+    install -d ${D}${bindir}
+    install -m 755 ${S}/src/smsd "${D}${bindir}/smsd"
+
+    install -m 755 ${S}/scripts/sendsms "${D}${bindir}/sendsms"
+    install -m 755 ${S}/scripts/sms2html "${D}${bindir}/sms2html"
+    install -m 755 ${S}/scripts/sms2unicode "${D}${bindir}/sms2unicode"
+    install -m 755 ${S}/scripts/unicode2sms "${D}${bindir}/unicode2sms"
+
+    install -d ${D}${sysconfdir}
+    install -m 644 ${S}/examples/smsd.conf.easy
"${D}${sysconfdir}/smsd.conf"
+
+    install -d "${D}${localstatedir}/spool"
+    install -d "${D}${localstatedir}/spool/sms"
+    install -d "${D}${localstatedir}/spool/sms/incoming"
+    install -d "${D}${localstatedir}/spool/sms/outgoing"
+    install -d "${D}${localstatedir}/spool/sms/checked"
+
+    install -d ${D}${sysconfdir}/init.d
+    install -m 755 ${S}/scripts/sms3
"${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}"
+
+}
-- 
1.9.1





2015-03-13 15:14 GMT+01:00 Philip Balister <philip@balister.org>:

> On 03/13/2015 07:23 AM, Samuel Stirtzel wrote:
> > 2015-03-13 12:08 GMT+01:00 Kai Ulrich <kaiu@gmx.de>:
> >> Hi,
> >>
> >> I created an layer with a recipe for smstools3.
> >> You can find it on https://github.com/kaiulrich/meta-smstools3
> >> I would like to share my work with the openembedded commity.
> >> How is the process to add a recipe to meta-oe?
> >>
> >
> > See:
> > http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> >
> > Also see the README file of the layer where you want to put the recipe in
> >
> >
>
> It might be a good candidate for meta-telephony.
>
>
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-telephony/
>
> Philip
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

