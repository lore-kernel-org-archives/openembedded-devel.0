Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8404FCA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:39:55 +0000 (UTC)
Received: from zebra.cherry.relay.mailchannels.net (zebra.cherry.relay.mailchannels.net [23.83.223.195])
 by mx.groups.io with SMTP id smtpd.web10.4153.1755635989654717477
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=gv2c+Rtd;
 spf=pass (domain: rootcommit.com, ip: 23.83.223.195, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D292A783EC5
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 20:39:48 +0000 (UTC)
Received: from uk-fast-smtpout2.hostinger.io (100-96-13-182.trex-nlb.outbound.svc.cluster.local [100.96.13.182])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3C74A783F63
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 20:39:48 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1755635988; a=rsa-sha256;
	cv=none;
	b=+F0RGUJpXyxOtNFzdqGuJy1xuuBQHLj3vMeFUMcHTYMemOIOuGuXDFRMBSNYLUab58FQ0A
	mZdnvDgnuxTsQhAhwQkAQ5hrRTAIY1GekLAXkN0iwVmVzsRyXahIRSv/PA1ozHnQ1VKbxt
	DMPRC4GVx7lTpV3pD4MxQdL5BdxmEDUy/PkmB1l8DjE1e+eB6UBELAhL5HMXRXaBVY2lln
	5hRBft2i454IEy+EPUqAhmbKTOpFf7oHwPUp83YO53FZK4uavM7GomKeSWonqXQOzJfjM3
	bmOvOeVRzEigC/F0wjY8SClZDwKZq5Y83E5/rND2VOFZNwt7YZ1X29/Du/hm5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1755635988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=ZBtKEBz/VaboD32cABhNOnqFkIG1hHv1dDX++3v/9tI=;
	b=z9VggLKHSaxoqZvoJon0RJ0M3RX9idtWgNTnQvLm9k8LjkDMeXPvPrLX9pNqfVpYbTDzBD
	LzFhy+g4Z/eLrMzlpr6vFe9iYfruSZfFDBGQ4yocR+QBATQvtbUgCgvWSTQa+4OeFoHtrz
	sHdkjSxHHxKJr2KI+5JVkqV9TNRXOh8n/9jYrJuonnJBEFkV6qTSKuHfcP7hJoIiDbJZq1
	TgLTnI69/nVFe+3sO5QN4OsFHn7TD1YEapIhUvn+r9mJwy8vA2rWtx3wx9E/aHt4yRnxXz
	c5yXH/JPW80g5CNfr0VR0Ro0HNkehWXro1yYtxFqlRrI8ckYM6ipwmteO2OaIw==
ARC-Authentication-Results: i=1;
	rspamd-db96f7987-kh78w;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Whispering-Wiry: 39a23093361d73eb_1755635988715_3159379410
X-MC-Loop-Signature: 1755635988715:3885598162
X-MC-Ingress-Time: 1755635988715
Received: from uk-fast-smtpout2.hostinger.io (uk-fast-smtpout2.hostinger.io
 [31.220.23.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.13.182 (trex/7.1.3);
	Tue, 19 Aug 2025 20:39:48 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4448:6b00:b9da:8c2:6756:6a78])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4c61fV1xxvzBqcXq;
	Tue, 19 Aug 2025 20:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1755635986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZBtKEBz/VaboD32cABhNOnqFkIG1hHv1dDX++3v/9tI=;
	b=gv2c+RtdsGZ3Vso9sIpQCg0v+kM2qfSUhG88jF68Y+DzaAP6rpyDG0RNd8l32ah09dNNyX
	WLkGDTxWhtzubcpGGjc2SNoos+DkIqcx3UrIWHDaYCBMq9xa28460hzu7iJKCz7JgZPD56
	8aoA04/7IorR19TWgOXZPdAVPfSpW7l3nG/FTqwxZixmuhDyXMCE8TPFOH5JPeBxxwFWbF
	t8IPmqqsGJ5Wl1ytTrr744+yiv0SwSo0UkCRKxIbR/yWxxQq8k7oiLAeAeFemLEPe5b51r
	K2Q4igrWo6jZUApG7iMNfaq8SAVe1am7FQPhy6baWGd9EyWpKyl4KDHYy3GM3A==
From: michael.opdenacker@rootcommit.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [meta-oe][scarthgap][PATCH] kernel-hardening-checker: backport recipe
Message-ID: <20250819203929.1272607-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Tue, 19 Aug 2025 20:39:46 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68a4e112 a=uSB5wsWOjj112alojhozyA==:617 a=xqWC_Br6kY4A:10 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=NufY4J3AAAAA:8 a=DOTdC3yS7xyryxYd2Q4A:9 a=NcxpMcIZDGm-g932nG_k:22 a=TPcZfFuj8SYsoCJAFAiX:22
X-CM-Envelope: MS4xfEg+ikHGTq8WzOTnJjJwzqjz1Hz0F0vzW0tuAMcxgxLS3j2BmyULsX+hUFqcx6LZfpirPzGXNKBZv28KCJVbjFd9u2HGJCHVtq5qfUPW9yp3OoKHVPdl 6rILXPqognT+XM4xKxtl4YS8RGasfIEeyPpjafzTXqLt7ErJCu1pEVjOslWT069jysoN1wpFi5CI/UGOUC8XTdDRSGDDk1+Yimh83Sh7bfI9HwOvpDDVGxSP KWo9hQwnXUdIkzQkTZ9DM9G6m10KduHmH7fzaEBYG1i3WgdNQAU5dciLW3XuobF0WpvxuVZ4+Cu0aXQAFJKSObMdylKOyLW0CLyXvyG0OZz/gmi3qdrOpxGa gZeXfwvj
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 20:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119007

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

This recipe is a Scarthgap backport of kernel-hardening-checker_0.6.10.2.=
bb
in the master branch as of August 19, 2025.

Tested on qemux86-64 and on beaglebone-yocto

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 ...ject.toml-fix-up-license-information.patch | 31 ++++++++++++++
 ...-relax-setuptool-version-requirement.patch | 29 +++++++++++++
 .../kernel-hardening-checker_0.6.10.2.bb      | 41 +++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/fil=
es/0001-pyproject.toml-fix-up-license-information.patch
 create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/fil=
es/0002-pyproject.toml-relax-setuptool-version-requirement.patch
 create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/ker=
nel-hardening-checker_0.6.10.2.bb

diff --git a/meta-oe/recipes-security/kernel-hardening-checker/files/0001=
-pyproject.toml-fix-up-license-information.patch b/meta-oe/recipes-securi=
ty/kernel-hardening-checker/files/0001-pyproject.toml-fix-up-license-info=
rmation.patch
new file mode 100644
index 0000000000..4460146722
--- /dev/null
+++ b/meta-oe/recipes-security/kernel-hardening-checker/files/0001-pyproj=
ect.toml-fix-up-license-information.patch
@@ -0,0 +1,31 @@
+From e94c486c6c3473979ce5be627f030cc95ce165e6 Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
+Date: Sun, 17 Aug 2025 17:27:21 +0200
+Subject: [PATCH 1/2] pyproject.toml: fix up license information
+
+Without this change, the Python tooling complains that you
+can't have both "license" and "license-files" settings in pyproject.toml=
.
+
+This issue doesn't happen any more with the Python tooling
+in master (as of August 2025), so it's irrelevant for upstream.
+
+Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
+Upstream-Status: Inappropriate [oe specific]
+---
+ pyproject.toml | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index a0b75c3..79e710b 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -20,8 +20,7 @@ authors =3D [
+ maintainers =3D [
+   {name =3D "Alexander Popov", email =3D "alex.popov@linux.com"}
+ ]
+-license =3D "GPL-3.0-only"
+-license-files =3D ["LICENSE.txt"]
++license =3D { text =3D "GPL-3.0-only" }
+ classifiers =3D [
+     "Development Status :: 5 - Production/Stable",
+     "Topic :: Security",
diff --git a/meta-oe/recipes-security/kernel-hardening-checker/files/0002=
-pyproject.toml-relax-setuptool-version-requirement.patch b/meta-oe/recip=
es-security/kernel-hardening-checker/files/0002-pyproject.toml-relax-setu=
ptool-version-requirement.patch
new file mode 100644
index 0000000000..05a8126c4e
--- /dev/null
+++ b/meta-oe/recipes-security/kernel-hardening-checker/files/0002-pyproj=
ect.toml-relax-setuptool-version-requirement.patch
@@ -0,0 +1,29 @@
+From 7c64511d2dcb58bc4d83dd41667c1f9295ca9712 Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
+Date: Tue, 19 Aug 2025 21:47:05 +0200
+Subject: [PATCH 2/2] pyproject.toml: relax setuptool version requirement
+
+To match with what's available in Scarthgap
+It turns out that setuptools 69 is sufficient for building this tool.
+The developer may have aligned the version with his testing environment.
+
+This patch is not needed on meta-openembedded master which has a recent =
enough
+version.
+
+Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
+Upstream-Status: Inappropriate [oe specific]
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 79e710b..a8b59d8 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires =3D ["setuptools >=3D 77.0.3"]
++requires =3D ["setuptools >=3D 69"]
+ build-backend =3D "setuptools.build_meta"
+=20
+ [tool.setuptools.packages.find]
diff --git a/meta-oe/recipes-security/kernel-hardening-checker/kernel-har=
dening-checker_0.6.10.2.bb b/meta-oe/recipes-security/kernel-hardening-ch=
ecker/kernel-hardening-checker_0.6.10.2.bb
new file mode 100644
index 0000000000..c0ae0f0d3c
--- /dev/null
+++ b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-=
checker_0.6.10.2.bb
@@ -0,0 +1,41 @@
+SUMMARY =3D "A tool for checking the security hardening options of the L=
inux kernel"
+DESCRIPTION =3D "\
+    There are plenty of security hardening options for the Linux kernel;=
 Kconfig \
+    options (compile-time); Kernel cmdline arguments (boot-time); Sysctl=
 \
+    parameters (runtime). A lot of them have to be enabled manually to m=
ake the \
+    system more secure which is difficult to track. This tool helps with=
 this \
+    task by checking and reporting about the settings compared to a list=
 of \
+    recommendation. \
+"
+HOMEPAGE =3D "https://github.com/a13xp0p0v/kernel-hardening-checker"
+BUGTRACKER =3D "https://github.com/a13xp0p0v/kernel-hardening-checker/is=
sues"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dd32239bcb673463ab874e80d4=
7fae504"
+
+SRC_URI =3D "git://github.com/a13xp0p0v/kernel-hardening-checker;protoco=
l=3Dhttps;branch=3Dmaster \
+	   file://0001-pyproject.toml-fix-up-license-information.patch \
+	   file://0002-pyproject.toml-relax-setuptool-version-requirement.patch=
"
+
+SRCREV =3D "0ebece346f187e7d3589883cc1d194fcd1c3cda8"
+
+S =3D "${WORKDIR}/git"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+RDEPENDS:${PN} =3D "\
+    python3-json \
+    python3-misc \
+    python3-compression \
+    bash \
+"
+
+# /boot/config is required for the analysis
+RRECOMMENDS:${PN}:class-target =3D "\
+    kernel-dev \
+"
+
+inherit python_setuptools_build_meta
+
+# allow to run on build host, if you don't want it in the image
+# oe-run-native kernel-hardening-checker-native kernel-hardening-checker=
 ...
+BBCLASSEXTEND =3D "native"

