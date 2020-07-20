Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.34068.1595236813074710643
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2020 02:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06K9Jp7e015828
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2020 02:20:01 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Mon, 20 Jul 2020 02:19:28 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] radvd: add /etc/radvd.conf
Date: Mon, 20 Jul 2020 17:16:00 +0800
Message-ID: <20200720091600.2755371-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 06K9Jp7e015828
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Changqing Li <changqing.li@windriver.com>

When starting radvd without any configuration the following errors would
be triggered.

"""
root@intel-x86-64:~# systemctl status radvd
=E2=97=8F radvd.service - Router advertisement daemon for IPv6
Loaded: loaded (/lib/systemd/system/radvd.service; enabled; vendor preset=
:
	enabled)
Active: inactive (dead)
        Condition: start condition failed at Tue 2019-09-24 13:29:36 UTC;=
 3s ago
	    =E2=94=94=E2=94=80 ConditionPathExists=3D/etc/radvd.conf was not met
"""

Normally the user should create and configrue the /etc/radvd.conf
manually.  However the radvd provide a example file for redhad located
at "radvd/redhat/radvd.conf.empty". When installing, it would copy
radvd/redhat/radvd.conf.empty to /etc/radvd.conf. Also add this empty
conf here to used as an example of configuration

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-daemons/radvd/files/radvd.conf     | 18 ++++++++++++++++++
 .../recipes-daemons/radvd/radvd.inc            |  5 ++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/radvd/files/radvd.con=
f

diff --git a/meta-networking/recipes-daemons/radvd/files/radvd.conf b/met=
a-networking/recipes-daemons/radvd/files/radvd.conf
new file mode 100644
index 000000000..c006f8631
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/files/radvd.conf
@@ -0,0 +1,18 @@
+# NOTE: there is no such thing as a working "by-default" configuration f=
ile.=20
+#       At least the prefix needs to be specified.  Please consult the r=
advd.conf(5)
+#       man page and/or /usr/share/doc/radvd-*/radvd.conf.example for he=
lp.
+#
+#
+#interface eth0
+#{
+#	AdvSendAdvert on;
+#	MinRtrAdvInterval 30;
+#	MaxRtrAdvInterval 100;
+#	prefix 2001:db8:1:0::/64
+#	{
+#		AdvOnLink on;
+#		AdvAutonomous on;
+#		AdvRouterAddr off;
+#	};
+#
+#};
diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-netwo=
rking/recipes-daemons/radvd/radvd.inc
index 59a07d78d..802dbe34e 100644
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -18,7 +18,8 @@ SRC_URI =3D "http://v6web.litech.org/radvd/dist/radvd-$=
{PV}.tar.gz \
            file://radvd.init \
            file://radvd.service \
            file://volatiles.03_radvd \
-           file://radvd.default"
+           file://radvd.default \
+           file://radvd.conf"
=20
 inherit autotools useradd pkgconfig systemd
=20
@@ -52,6 +53,8 @@ do_install_append () {
     for i in radvd.conf.example README; do \
         install -m 0644 ${S}/$i ${D}${docdir}/radvd; \
     done
+
+    install -m 0644 ${WORKDIR}/radvd.conf ${D}${sysconfdir}/radvd.conf
 }
=20
 USERADD_PACKAGES =3D "${PN}"
--=20
2.17.1

