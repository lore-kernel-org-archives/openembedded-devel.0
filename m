Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6D5E7C4CE
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 15:07:44 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.12764.1696402819087921601
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 00:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=diIMfrJl;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=bNm8u+hK;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.26, mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 709715C02E7;
	Wed,  4 Oct 2023 03:00:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 04 Oct 2023 03:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1696402818; x=
	1696489218; bh=VVf8fyqFT9yb67GVdhlCa40zv+AMJmpADi215/zdd2Y=; b=d
	iIMfrJlR6N2I+a+XqS6DiAz3PziBhCugd5GTOAKJ6mJvSB4A71xE9HXA2dB6d9Is
	zl+FdM2jfb+Uuqh93BLv5tq/vrj6YrcA7s1o4X4nXI4hF3KyfsGZwsXZtkw3g+EU
	9rAFM/suiv7rnvEqzGi4cxZu90M7YN4Sj5ASg2hIP4+zASBwaz9CckRj+MBSu6M9
	+VWVFCTp4B0kSbCEEHQTUvIOiJ/VCpTog8MQXfjFJUrGG5q+3MU5XSWo+qqd+2fv
	iiytrEzxPtuAbkCsLqabvuUIrZHCQWOZ9OgMJ8W5Gdq8SSwz6wP9NSrE7hD6Btb8
	oSBKIqlmxIeX1ULzE1CCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1696402818; x=
	1696489218; bh=VVf8fyqFT9yb67GVdhlCa40zv+AMJmpADi215/zdd2Y=; b=b
	Nm8u+hK5sEa5qGtjRKIgddfFnPVoiPBluoY/ejuglfxa35RU4ETa/Mlcyr5WmFJi
	c093P/tZjTfOWZXzFB9GAJpQ7/oI1if31MW3Uab2O5btbYW7pQ+aI5wkfRG9uXTF
	7InGcVGljPk5cqvdd2VglJYj/cCL8h692ouo+ujkhVqjqgi4H+3OhateeMlMxJK/
	rUlU33s6gZ9Q4VsPA0EIJRmb1J5hSVTlKlUsTgElMim57ShPsSNsAzfLQGwEXnQX
	X+Gmy11yBJeDw098tbtsYMDbzkjQxFE6zGc51OKoJlpLILDHliPgNTzex2iMSIYa
	XdkXeqhRUL1cJ214izbsA==
X-ME-Sender: <xms:gg0dZb_de_HA8aaJskxaMHIActr5Bo6Ca1vfedcUmvPy_w4WWMu9rQ>
    <xme:gg0dZXsgAXG7DOf63SmPNfQ2o9pq5uhahjZqTGrGjqe_pjE-m_LbTU5oVSWrQmQ6L
    VBywmlLJ12ur2Ro9pw>
X-ME-Received: <xmr:gg0dZZCubbNw9IG771UveTC3819ojbFF8Kq1EbbzmCGORPqXHS2TWF5YjI1ldMDoXtOJVrzFs1IyZV3KOofLDtlC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgedugddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrrghvvghl
    ucgkhhhukhhovhcuudcuoehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrg
    htthgvrhhnpeeikeelheegvdekveetvedvieeltedujefgjeduhfeiuddtgfffteefgfeg
    keetfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:gg0dZXcfLAJ-j3O0E1YGo0icDXXpjiwqHIzi66XGaxFaFzFA1irvyQ>
    <xmx:gg0dZQMUBgHDo-eW-S9CKIPmnESUyDInv5i8_3N4hQDgmtdBNobz9w>
    <xmx:gg0dZZnTO3MJn-g5uBdM6BAUWRWPtmPsQfLtfg7-XH7fO3V7OqLatQ>
    <xmx:gg0dZaUNrBOZCwRVg31aU-5OS28UxosqGtPUHOKT2mhhbdJGc4MDvw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Oct 2023 03:00:17 -0400 (EDT)
From: "Pavel Zhukov" <pavel@zhukoff.net>
To: openembedded-devel@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH 2/3] package_deb: Revert versioned providers workaround
Date: Wed,  4 Oct 2023 08:57:27 +0200
Message-ID: <20231004065728.4283-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004065728.4283-1-pavel@zhukoff.net>
References: <20231004065728.4283-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 15:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105333

From: Pavel Zhukov <pavel@zhukoff.net>

dpkg and apt seem to handle versioned provides correctly now [1] so this
workaround is not needed anymore.
This fixes [Yocto #14995] for package_deb.

[1]
Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/classes-global/package_deb.bbclass      | 9 +--------
 meta/recipes-core/meta/dummy-sdk-package.inc | 9 ++++++---
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/meta/classes-global/package_deb.bbclass b/meta/classes-global/package_deb.bbclass
index 5aba3837bd..d7bbfae3fb 100644
--- a/meta/classes-global/package_deb.bbclass
+++ b/meta/classes-global/package_deb.bbclass
@@ -184,8 +184,6 @@ def deb_write_pkg(pkg, d):
             #   '<' = less or equal
             #   '>' = greater or equal
             # adjust these to the '<<' and '>>' equivalents
-            # Also, "=" specifiers only work if they have the PR in, so 1.2.3 != 1.2.3-r0
-            # so to avoid issues, map this to ">= 1.2.3 << 1.2.3.0"
             for dep in list(var.keys()):
                 if '(' in dep or '/' in dep:
                     newdep = re.sub(r'[(:)/]', '__', dep)
@@ -200,10 +198,6 @@ def deb_write_pkg(pkg, d):
                         var[dep][i] = var[dep][i].replace("< ", "<< ")
                     elif (v or "").startswith("> "):
                         var[dep][i] = var[dep][i].replace("> ", ">> ")
-                    elif (v or "").startswith("= ") and "-r" not in v:
-                        ver = var[dep][i].replace("= ", "")
-                        var[dep][i] = var[dep][i].replace("= ", ">= ")
-                        var[dep].append("<< " + ver + ".0")
 
         rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
         debian_cmp_remap(rdepends)
@@ -220,8 +214,7 @@ def deb_write_pkg(pkg, d):
                         del rrecommends[dep]
         rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS") or "")
         debian_cmp_remap(rsuggests)
-        # Deliberately drop version information here, not wanted/supported by deb
-        rprovides = dict.fromkeys(bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES") or ""), [])
+        rprovides = bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES") or "")
         # Remove file paths if any from rprovides, debian does not support custom providers
         for key in list(rprovides.keys()):
             if key.startswith('/'):
diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index 6ccafbf8bc..8a07a431ab 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -18,15 +18,18 @@ ALLOW_EMPTY:${PN} = "1"
 PR[vardeps] += "DUMMYPROVIDES"
 PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
 
+DUMMYMAXVER ?= "999.9-r9"
 DUMMYPROVIDES_PACKAGES ??= ""
 DUMMYPROVIDES_PACKAGES_FILTERED = "${@' '.join([pkg for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split() if d.getVar('IMAGE_INSTALL') is not None and pkg not in d.getVar('IMAGE_INSTALL').split()])}"
 DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_FILTERED').split()])}"
+DUMMYPROVIDES_MAXVER := "${@' '.join(['{} (= {})'.format(pkg, d.getVar('DUMMYMAXVER')) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_MULTILIB').split()]) + d.getVar('DUMMYPROVIDES')}"
+DUMMYCONFLICTS := "${@' '.join(['{} (< {})'.format(pkg, d.getVar('DUMMYMAXVER')) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_MULTILIB').split()])}"
 DUMMYPROVIDES += "${DUMMYPROVIDES_PACKAGES_MULTILIB}"
 
 python populate_packages:prepend() {
     p = d.getVar("PN")
-    d.appendVar("RPROVIDES:%s" % p, "${DUMMYPROVIDES}")
-    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
-    d.appendVar("RREPLACES:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
+    d.appendVar("RPROVIDES:%s" % p, "${DUMMYPROVIDES_MAXVER}")
+    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYCONFLICTS}")
+    d.appendVar("RREPLACES:%s" % p, "${DUMMYCONFLICTS}")
 }
 
-- 
2.41.0


