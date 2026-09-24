Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94044C98304
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:33:53 +0000 (UTC)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.730.1790224427280783113
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dTEpjR/o;
 spf=pass (domain: gmail.com, ip: 74.125.228.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso1124522a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224427; x=1790829227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFZuLjhTMyCwa2hO2xMU37RqRhtN0t6F2/9DdfnYw94=;
        b=dTEpjR/oYljGfuISm6fJowHgihPsezkU01InxWmdQrOWQNgQ0BxMjDwWst8NMh4v8B
         iSsuQUOluMGhuWeguXsNnNDKQSpHcLIBpo9xKbA2/2zoSCf59qqy6tlLi16b85UiDkkl
         IgHRvG2gmIbg0dgJlV51Ee5ZyR8xw1viZ0tK39X+c6MR0Qi+6CSVSSxBvHUxXjav+h7q
         ukO6rsIeIUXO33KhLZXUw712J1MWRZWETnGWOgCM3lxx1QNQsm1nNsjnBcMA6lapuuOH
         6xdgGGeEvQFZ3WIij9vNJI8uMgmG9G3hrmJYKgx4cvyy+QQacw/5l6cgMMV0GnfV/8Ci
         nRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224427; x=1790829227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFZuLjhTMyCwa2hO2xMU37RqRhtN0t6F2/9DdfnYw94=;
        b=JJolEwDpe0lR/HkNyDcaoTg/FCJzRZxuS3ZIeuAypZ5ct3zD6lvN9xDMW3SAxa8bSM
         xFjuaQ0tgS0D8HBLGTonAwoS1M+62AisvZ3IBAnol3Z95cnR/zFQwZWKOzlIPcHU3pnb
         Mh379howQk7xVbMcZIyt/2zeAKCDSYbspD8OdiYr7Nri3oatmk/7MvhPk28yfxbs6Je1
         9wBGR7mPzic3n3ini9F3cCqLTixF02F1l0GRTnpUEl/btlfRocOh7yDcUfj93myNm1oZ
         tc1tlCGEmH9zACF38HpYy/bi1LZ5RR8R6+YFeFrw2fhtoGbgmemeBHZPZQjceEdnxKon
         DX4Q==
X-Gm-Message-State: AFuF++lAuEkLiDGICLK46+HErFK1Pf/ivkGNpYT6+sZf5c/boyUPFynx
	tBviZ1VcsahzFZOx6x/MDEg1qm6GwvZ75IEJE2HaBn1kxoOPpt7Ci1KMtgfUBg==
X-Gm-Gg: AYBFou3BryBlGjbRCnzfuCjQlQR4EUJuom3nkl958H7OkBr3UC1l8pDMxpilrtx2CdZ
	MGGTunwbU5c+se2ei5tEVazOOeHw0MENZGafNpBcBTtK7t/wvpXa0tR/XLumd5ks1hZe2P/BBLW
	gZ9zNlzt8qCXFlB4W0pJ1hV4LTuJUlbx6RlNZ8V+95ZoPbl6LO85A1uUceNYWKWtI1PekxW972f
	RRy9g9uzorVvCu4sByTQgU5WLndmjN9J4dAp7xBw2Hx4dPE5gkTSPs1F71ViAb/aKpm+Pw6SPxl
	gjgRMLI88sRrQiX/emGvDPGLll9kjx1UIPg2EQVZNrjU54oCblYpjB4oShl74fPOh3q6gq9b6hR
	E8GfH4xOjCx42+SAfyOWffDqVqhUnvZ6uFLTRpZIA9c/1Vxl1Y9G/3qhELQlcVhB/+QxY0tb9Tw
	IdN+sZR8HPqR8fam/t5nxwxUZ4b2K3eutLnNpNdDLGqWghTZ2JLz8OFAeux/MVao7cFJ6ijFUKD
	KKz4HHNJsTokhpAP6tzf3I=
X-Received: by 2002:a05:6300:197:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3de0e7f4b15mr1324327637.1.1790224426599;
        Wed, 23 Sep 2026 21:33:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:33:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 12/24] strongswan: patch CVE-2026-78130
Date: Thu, 24 Sep 2026 16:33:02 +1200
Message-ID: <20260924043315.1663186-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130260

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78130

[1]https://download.strongswan.org/security/CVE-2026-78130/strongswan-5.1.3-6.0.7_x509_ac_issuer_null.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78130).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78130.patch           | 49 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch
new file mode 100644
index 0000000000..36025c8093
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch
@@ -0,0 +1,49 @@
+From 254d971bbe7479fe5fffc34cd1dd1e349a48e7aa Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 19 Jun 2026 11:57:48 +0200
+Subject: [PATCH] x509: Avoid NULL-pointer dereference if issuerName is missing
+ in attribute certificate
+
+If neither authoritiyKeyIdentifier nor issuerName are encoded in an
+attribute certificate, the validation in `acert_validator.c:verify()`
+will cause a NULL-pointer dereference via `issued_by()` (the lookup
+with NULL identity will enumerate all trusted certificates).
+
+Fixes: 26930a8c3e42 ("certificate factory can load certs from file")
+Fixes: CVE-2026-78130
+
+CVE: CVE-2026-78130
+Upstream-Status: Backport [https://github.com/strongiswan/strongswan/commit/bee6ce27761e1f38958be36ebe6688ef963c3d22]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libstrongswan/plugins/x509/x509_ac.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/x509/x509_ac.c b/src/libstrongswan/plugins/x509/x509_ac.c
+index 68b7cf9..11a847e 100644
+--- a/src/libstrongswan/plugins/x509/x509_ac.c
++++ b/src/libstrongswan/plugins/x509/x509_ac.c
+@@ -898,7 +898,11 @@ METHOD(certificate_t, has_issuer, id_match_t,
+ 	{
+ 		return ID_MATCH_PERFECT;
+ 	}
+-	return this->issuerName->matches(this->issuerName, issuer);
++	if (this->issuerName)
++	{
++		return this->issuerName->matches(this->issuerName, issuer);
++	}
++	return ID_MATCH_NONE;
+ }
+ 
+ METHOD(certificate_t, issued_by, bool,
+@@ -935,7 +939,8 @@ METHOD(certificate_t, issued_by, bool,
+ 	}
+ 	else
+ 	{
+-		if (!this->issuerName->equals(this->issuerName,
++		if (!this->issuerName ||
++			!this->issuerName->equals(this->issuerName,
+ 									  issuer->get_subject(issuer)))
+ 		{
+ 			return FALSE;
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index 19f1cc2f69..ffc9d1433e 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78129.patch \
            file://CVE-2026-78133.patch \
            file://CVE-2026-78131.patch \
+           file://CVE-2026-78130.patch \
 "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"

