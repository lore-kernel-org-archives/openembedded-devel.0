Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22160CC6B0F
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:48 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3519.1791885583712087236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RwPvVgmQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1549549a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885583; x=1792490383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/spFjGBu+l/0TF0RD9LUyxEsSeNwPyZCTqz2qpNpq9g=;
        b=RwPvVgmQxXeMVNc0auM6jo9PgWQCelx4EpVLAOWSWNBkNb4WcARWrSnNEj6FlbPFqK
         gzsS/2oMmlJZ6iipnC7MQR3MbZlUvUpEY1uVRro+z5N9QsXUXJ22420xAmMEZ1Z/8afe
         XZ95fqdl6deUtwhd9PVX/LCdeT6zBXbgduos8jg9C1PpcdKPTxc2cLkk14s1e09recg7
         7XZRmp7iG7sGLux07GlGwTmRPKgKJ5/Nd94ATlqor11K4n7UF9rAFB3q0Od875PCodw7
         vhSXDljsqO9VyOQzDGBclYR2OxVMX5rsgUfvRShKcE9/Sq1l9DVTsCM1XoBaSWmzl5Tr
         xOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885583; x=1792490383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/spFjGBu+l/0TF0RD9LUyxEsSeNwPyZCTqz2qpNpq9g=;
        b=PTmkVdQloGNj9AzoZXzsWxZkVYDt0KTOfvpNdtgg7pbQUT+WwhM/TP63osC/eXYTuN
         2HMxlalrIm9AAtD9GYtdgxTOW1OsyZ4yLqcd3uZoqR6GXwtgrqYgpKhjd4YVN4e9ysFF
         Wbp2KFskKeBhuucNqMNw4KQKIUmORk7UTCsDpO7dA3zQePe1N+QeO5Psfza3gt22ilj6
         dP5PJYxHrnGQbTgQiE1PX+15MH+T92q0WjHG0QOs0GfU4mMRxbst2LJMgYuoeIE1PCBD
         YhFj9NH3xqRZU4K3v9ZEA4hu6LA+Syw6XkmTLfQtMAaqNCuLcCkmIx+QRXcVa1jd+WM0
         Dnzw==
X-Gm-Message-State: AFq9FYKI1fI3M8tGsLKpdBnHBZPnpabJJEfi1VR/z6yGjmWNMkTVbd8H
	YemgK7z7l+mjlBY2vNCxXZNNzn9YBPHRmqgw36mYVr/EJdRwUIzn+HIV3BSRsA==
X-Gm-Gg: AYBFou2zW7RUD8EVejRxHueKXWdb0BuHC5nViAbm771e74g3z0D29SLRn0F2r2TctA0
	Vm/MMTYbZC/FjxtD7hOkrEy4BQHqnnKKaocD/+5z1yBeNn7nB5YrzYIa+7mDsVbvff+j6BccsXk
	bxiauZQOuRPstKt6P9CcPeb19obflyhnCpTUO04ykOEqDUKp6FN01IsQsKwvI0c/sUjC41zW/7P
	OEz3WCcG1AQjqm9kKFBGAMQNwIc9Xuuvg83GkkgO+/gqx7GqvTUpm2Rhqs4uVx8BrnNTKgXVDLp
	iuwVh4Jfc63zyqHan94vXTYtMKWupDH8OEBVLRpW1DFdRmuZhWvsneSa5LjUZW4rRaUnCWF8K5f
	CY0UTU2+lWY7FrLBfn7pidtXAk7I3ex5DOn0+/H0+u1QqZJ6ns8XL8t3jajdFA4hsjJ6ZkOW9Ge
	dhY4iJ6bbV8qjN46vVYIeTs3IQIos7b0ID8CconV3dBoz0M8m2o5ZTECn5aoYahmLXLX4eBkfAS
	p2IfI5cw0SPdPzzgpb3cEuPjrlUUx3ALWRHFw4=
X-Received: by 2002:a17:90b:4a8f:b0:3aa:fc22:8ab0 with SMTP id 98e67ed59e1d1-3ab3a8e55damr10022373a91.38.1791885582941;
        Tue, 13 Oct 2026 02:59:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:59:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 12/28] strongswan: patch CVE-2026-78126
Date: Tue, 13 Oct 2026 22:58:47 +1300
Message-ID: <20261013095903.3544906-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130845

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78126

[1]https://download.strongswan.org/security/CVE-2026-78126/strongswan-4.4.0-6.0.7_eap_aka_sync_fail.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78126).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit e228e7711e49349b1342ae2be83530ab34883f98)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78126.patch           | 37 +++++++++++++++++++
 .../strongswan/strongswan_6.0.7.bb            |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch
new file mode 100644
index 0000000000..307d1a9834
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch
@@ -0,0 +1,37 @@
+From 13aa926cad7ec7f668249b6513c938b8c2e95af4 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Thu, 4 Jun 2026 10:00:02 +0200
+Subject: [PATCH] eap-aka: Only accept AKA-Synchronization-Failure if expected
+
+This fixes a NULL-pointer dereference if the client sends such an error
+before the server issued a challenge and allocated this->rand.
+
+Fixes: 26e246769224 ("ported EAP-AKA branch into trunk")
+Fixes: 4735965fc048 ("EAP servers check if the received EAP message was expected")
+Fixes: CVE-2026-78126
+
+CVE: CVE-2026-78126
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/7bedb451346261370256d390a8c155b86e4b455d]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libcharon/plugins/eap_aka/eap_aka_server.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/libcharon/plugins/eap_aka/eap_aka_server.c b/src/libcharon/plugins/eap_aka/eap_aka_server.c
+index 0712ccc..95d4b03 100644
+--- a/src/libcharon/plugins/eap_aka/eap_aka_server.c
++++ b/src/libcharon/plugins/eap_aka/eap_aka_server.c
+@@ -505,6 +505,12 @@ static status_t process_synchronize(private_eap_aka_server_t *this,
+ 	simaka_attribute_t type;
+ 	chunk_t data, auts = chunk_empty;
+ 
++	if (this->pending != AKA_CHALLENGE)
++	{
++		DBG1(DBG_IKE, "received %N, but not expected",
++			 simaka_subtype_names, AKA_SYNCHRONIZATION_FAILURE);
++		return FAILED;
++	}
+ 	if (this->synchronized)
+ 	{
+ 		DBG1(DBG_IKE, "received %N, but peer did already resynchronize",
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index 82cd4738fb..2abc616c37 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -11,6 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78123.patch \
            file://CVE-2026-78124.patch \
+           file://CVE-2026-78126.patch \
 "
 
 SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"

