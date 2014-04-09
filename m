Return-Path: <Christian.Ziethen@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id B7EF465E00
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 09:14:46 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Wed, 9 Apr 2014
	11:14:46 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4442)	id BF01C288415;
	Wed,  9 Apr 2014 11:14:46 +0200 (CEST)
From: =?UTF-8?q?Christian=20Zieth=C3=A9n?= <Christian.Ziethen@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Apr 2014 11:14:44 +0200
Message-ID: <1397034884-36008-1-git-send-email-Christian.Ziethen@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: Christian.Ziethen@enea.com does not
	designate permitted sender hosts)
Subject: [meta-networking][PATCH v4] dnsmasq: update to 2.68
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
X-List-Received-Date: Wed, 09 Apr 2014 09:14:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixes a bug with libvirt and DHCP, which is fixed in 2.66.

"Handle the situation where libc headers define
SO_REUSEPORT, but the kernel in use doesn't, to cope with
the introduction of this option to Linux. Thanks to Rich
Felker for the bug report."

Signed-off-by: Christian Zieth=C3=A9n <Christian.Ziethen@enea.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb |    4 ----
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb |    4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb b/meta=
-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb
deleted file mode 100644
index 2df3713..0000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI[dnsmasq-2.63.md5sum] =3D "43e771997615ebcd8f6c6ffa60c3e40b"
-SRC_URI[dnsmasq-2.63.sha256sum] =3D "fd86e3bcc6a63c76e35e4a20baa790e7bbbfc=
7b43845cae85ca8ffd024467710"
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb b/meta=
-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
new file mode 100644
index 0000000..b1bef7a
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
@@ -0,0 +1,4 @@
+require dnsmasq.inc
+
+SRC_URI[dnsmasq-2.68.md5sum] =3D "6f8351ca0901f248efdb81532778d2ef"
+SRC_URI[dnsmasq-2.68.sha256sum] =3D "402019d61f53f1ccc04cc6218719fd3b158ea=
3fca9a83ab55471f981a2097c2f"
--=20
1.7.10.4


