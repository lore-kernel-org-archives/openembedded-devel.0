Return-Path: <philip.balister@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id AA4586FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 23:14:08 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id s68so50198077qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 15:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=OhHrB3yCzvbhH94m7VeGeSGE1sf1kHCM791xdBx2KsY=;
	b=dzE5M47PUsqno/psUlCna3ltU4kz/kKRlrQBv4iRW21WN5Oa2elm/NRS538T/ro8if
	wE6peSTTb0ZFhnjuXoX+fOCNJs2KfKMT/K0IfLo77WWYLepn0ZYDaUSDyiTdiK52S/7m
	TrhgiPV6MHPJRTOxHI7WvGkxY0NvjFDrhNZ/FJTsBd9V5htN4D+++rczLcXpUoYYdYEB
	tbXokijXLx/oYk719XE0VEo4bKIP4ub1gEBOu9RM16N5EY8lOZEr9yQCy/p/w1HED0OS
	CcRcmCMzhBR9Zx1T5jCKQlf0izWG1wYCAwMQrZ9Jj4m86Q2W7cFhG5PPVKqdvMzsiIKc
	bjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=OhHrB3yCzvbhH94m7VeGeSGE1sf1kHCM791xdBx2KsY=;
	b=Ka+9NeJjxwpzv6IXwZYU+RFE2IKkpAwBPtKnpZ+3TjVRNy+nvBBSA/xM7KwhMtw6UC
	JS8+n0L5QuKEs3hdgFOdR5eDcucwrAHoYQGC4C476hZL5yc7FlYRvsLFbFBG0IKSHVuf
	qMGV4ogCbK8F2yRpL+sHFgHzsxPN0ICMVwyGUP/2qiBx4mUDTDEpiVvDzDOLYyFvZPkO
	ATDWcbm7HgKi4n/0LFP+Up0U9Hj1+0f/oprEBzfY7+IVw0ajAawzPloRqFG4SDQS4rjR
	z392T7J6aRCIuQy/5jQOOe16E2QZNkG0ab/bZAkwx5DRBL5cXGKAQWNIpCTxaLSwTns6
	CFIg==
X-Gm-Message-State: AG10YOSP3EbrFq8Gnp/kGrRpYFoMQEqNFsjXYe1dtjl9k8+8J82tq3ZkVVcEAU7de8HBdQ==
X-Received: by 10.55.79.17 with SMTP id d17mr16763976qkb.56.1455491648605;
	Sun, 14 Feb 2016 15:14:08 -0800 (PST)
Received: from thuvia.localdomain (pool-108-44-110-59.ronkva.east.verizon.net.
	[108.44.110.59]) by smtp.gmail.com with ESMTPSA id
	b111sm10023677qge.47.2016.02.14.15.14.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Feb 2016 15:14:07 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Feb 2016 18:14:03 -0500
Message-Id: <1455491643-17131-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-python][PATCH] Convert the DESCRIPTION tag to a SUMMARY tag for short summaries.
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
X-List-Received-Date: Sun, 14 Feb 2016 23:14:10 -0000

 * Also update vcversioner to have correct SUMMARY and HOMEPAGE.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb    | 2 +-
 meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb | 2 +-
 meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb     | 2 +-
 meta-python/recipes-devtools/python/python-html5lib_0.999.bb          | 2 +-
 meta-python/recipes-devtools/python/python-idna_git.bb                | 2 +-
 meta-python/recipes-devtools/python/python-ipaddress_git.bb           | 2 +-
 meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb        | 2 +-
 meta-python/recipes-devtools/python/python-ldap_2.3.9.bb              | 2 +-
 meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb           | 2 +-
 meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb            | 2 +-
 meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb         | 2 +-
 meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb    | 4 ++--
 12 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
index aed0c9c..45b793d 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python Remote Objects"
+SUMMARY = "Python Remote Objects"
 HOMEPAGE = "https://pypi.python.org/pypi/Pyro4/"
 SECTION = "devel/python"
 LICENSE = "MIT"
diff --git a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb
index ec2ea0c..d0c4af7 100644
--- a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python bindings for the Apache Thrift RPC system"
+SUMMARY = "Python bindings for the Apache Thrift RPC system"
 HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
diff --git a/meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb b/meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb
index ceed228..0b2ac11 100644
--- a/meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb
+++ b/meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Twisted Web Sockets"
+SUMMARY = "Twisted Web Sockets"
 HOMEPAGE = "https://github.com/MostAwesomeDude/txWS"
 
 LICENSE = "Apache-2.0"
diff --git a/meta-python/recipes-devtools/python/python-html5lib_0.999.bb b/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
index 34a8b30..f90630c 100644
--- a/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
+++ b/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "HTML parser based on the WHATWG HTML specifcation"
+SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
 HOMEPAGE = "https://github.com/html5lib/html5lib-python"
 SECTION = "devel/python"
 LICENSE = "MIT"
diff --git a/meta-python/recipes-devtools/python/python-idna_git.bb b/meta-python/recipes-devtools/python/python-idna_git.bb
index f5ce658..dcd9105 100644
--- a/meta-python/recipes-devtools/python/python-idna_git.bb
+++ b/meta-python/recipes-devtools/python/python-idna_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Internationalised Domain Names in Applications"
+SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
diff --git a/meta-python/recipes-devtools/python/python-ipaddress_git.bb b/meta-python/recipes-devtools/python/python-ipaddress_git.bb
index 3d13833..6b7148f 100644
--- a/meta-python/recipes-devtools/python/python-ipaddress_git.bb
+++ b/meta-python/recipes-devtools/python/python-ipaddress_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python 3.3+'s ipaddress for Python 2.6, 2.7, 3.2."
+SUMMARY = "Python 3.3+'s ipaddress for Python 2.6, 2.7, 3.2."
 HOMEPAGE = "https://github.com/phihag/ipaddress"
 SECTION = "devel/python"
 LICENSE = "Python-2.0"
diff --git a/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb b/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb
index 1af13a9..0710b21 100644
--- a/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Resolve JSON Pointers in Python"
+SUMMARY = "Resolve JSON Pointers in Python"
 HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
 SECTION = "devel/python"
 LICENSE = "BSD"
diff --git a/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb b/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
index bc4993b..8c1eaae 100644
--- a/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
+++ b/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "LDAP client API for Python, C wrapper module around OpenLDAP 2.x with an object-oriented API" 
+SUMMARY = "LDAP client API for Python, C wrapper module around OpenLDAP 2.x with an object-oriented API" 
 SECTION = "devel/python" 
 LICENSE = "Python-style" 
 LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb b/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
index 206b03d..1b6d765 100644
--- a/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
+++ b/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "MessagePack (de)serializer"
+SUMMARY = "MessagePack (de)serializer"
 HOMEPAGE = "https://pypi.python.org/pypi/msgpack-python/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb
index 202e4dc..7f81c51 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb
+++ b/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python library implementing ASN.1 types."
+SUMMARY = "Python library implementing ASN.1 types."
 HOMEPAGE = "http://pyasn1.sourceforge.net/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
index 3fc5142..6337cf1 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
+++ b/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A pure Python netlink and Linux network configuration library"
+SUMMARY = "A pure Python netlink and Linux network configuration library"
 LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=3b83ef96387f14655fc854ddc3c6bd57"
diff --git a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
index 152034b..a21d66d 100644
--- a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
@@ -1,5 +1,5 @@
-DESCRIPTION = "Twisted Web Sockets"
-HOMEPAGE = "https://github.com/MostAwesomeDude/txWS"
+SUMMARY = "Python vcversioner, automagically update the project's version"
+HOMEPAGE = "https://github.com/habnabit/vcversioner"
 
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=260625d695c5e0c9dd2c2ef898833c7d"
-- 
2.5.0


