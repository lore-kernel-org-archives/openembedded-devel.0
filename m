Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB17CC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:20 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32861.1792043115930163088
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M1cp0Qil;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e7e742a2c7so33107425ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043115; x=1792647915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QWEYDV99Zj+PR0BNtmTW2g3aHPvohqUOT6ScDs+PuZE=;
        b=M1cp0QilYNNEKR2QOP40wHG5U7cTS39ph1veSCjQJ+ZWsEFOnK/ReAr2YNSxVG9UdF
         Bv+Z2uZ3hmm+lrY9gzdvYYzPa0VX++3tPD48KkpG+QhjUQWzwpY4N1417nRqWMVoRN//
         ofynF5Mve4i3eXz005vfod0pfwwhN+e+oU+FAjRo5tQR3NZZCEncLk/NvSc2OWFSMQXd
         hWvzYMrKzGL/O/42Xy62Avc1GNpxCWtObWHpT1dtJNbUST58AevOH8jtQfVIseGKxotK
         Z5nHzzfROQyL45F02pTuktwitNEkXd9OieynXauOWnK4zGBdWqu5ybsPrmPoBQqIUjKV
         B3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043115; x=1792647915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QWEYDV99Zj+PR0BNtmTW2g3aHPvohqUOT6ScDs+PuZE=;
        b=VYXiJTek1PzH/XmQs7/zIYVgKO4b1DEojqwWdMG8kFlzt6++kV5ifCrJvZaGC7iwbx
         EpLWibra7qehMo/FABT9voFlJ3k+8YzD+1sq67Es81B161aLp7oo4WXKPmAZA+4Xq2SH
         yqbNVqp8D+EJoklCopt/kfkqO64YfRLzWnOuUb54Hd85RYK41qc++TNpOcLPCv2gFxKK
         gv45j29l5GEpxFx+Icfkg3BXeL5oKXWOm8dOBQ8r7HmoTvRcnePYEMaVIvxV5DZp+frh
         WQNiIYnp1wpSs4R3iNvlaTPTpdlT6raagjKjWm5DDO2Gdubu2FGy6tPayVPLOVoKGgXo
         QxvQ==
X-Gm-Message-State: AFq9FYKvxeZHnYgcyLyUnRfu/OPc+rITuVxBpYnlFyxK6DWq6wHx06sA
	7kpiP4nshjSVK19+iYpluGyXjZcO9GbYraqj5ZWllG37CrcetMcKpIT5bUFKBQ==
X-Gm-Gg: AYBFou3SOjQ2fqp59CKaXa7oMN2+R8uMOQ2RUOydb5bIBS2oIIefWYG1yi9hry22IY7
	MUXquzDT2YKzBgVL1Q7mCoovNHrRTd/pMmMVVb7eL9WtuFFC9z02dJF9FuJi/oyaPoXQxbQysMI
	prJM25wOm1i17fqgaVucIzmEZot2tXb0pX1RAULyYFRGtPh2QZG/IeCbnezkeMjjt+QwykNVvBJ
	3w7jhrFGY+GHNHwYDy6TfjWMEZsGUZmi9gHgI0fVnFmEmAVMszsPl6Vt4B/EgCzJ8gFWaOA3sJd
	bFCVY7OJf7CDdzTOAWgmg9n2oHx+MMrtyj0FDp+FFq/cYHlpY1x017l+KhCMLP5ETNyWSezWRrz
	h/aa8Dw1C0IoFraNBGChRS7q2MfZtVZ4oUYk4AceStTjpuRbkVGs1AuP2IsP8mo3RGMC7Wx2FhE
	0jK2xsdGovNWmlowDlGM1vTY/Kx3i4TyDtUNgrwtvKmQi4WN3xIQmGRBb8dQgrhznXGq5SqOs9L
	m0c2/CIkhBwOjHoV/1GXcoN9Q0eTWMYPQ==
X-Received: by 2002:a17:902:b788:b0:2e8:4ef1:6fd3 with SMTP id d9443c01a7336-2e84ef17552mr81529045ad.13.1792043115182;
        Wed, 14 Oct 2026 22:45:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 68/82] strongswan: patch CVE-2026-78131
Date: Thu, 15 Oct 2026 18:41:56 +1300
Message-ID: <fd217008480dca909c1349d867b5dfa11400335a.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130988

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78131

[1]https://download.strongswan.org/security/CVE-2026-78131/strongswan-5.5.3-6.0.7_x509_ac_leaks.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78131).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 41cb8cca46d3f97981245f2213942d2006df121f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78131.patch           | 86 +++++++++++++++++++
 .../strongswan/strongswan_6.0.7.bb            |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch
new file mode 100644
index 0000000000..da53f8e5a0
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch
@@ -0,0 +1,86 @@
+From d1d29ac675b42a8c4a6454db84803bfecf5a0d99 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 12 Jun 2026 15:55:43 +0200
+Subject: [PATCH] x509: Fix memory leaks when parsing attribute certificates
+
+This can be triggered by an attribute certificate with lots of GeneralName
+entries or AuthorityKeyIdentifier extensions.  There is no verification
+before the certificate is parsed.
+
+Fixes: 3134379ac7f1 ("x509: Fix some whitespaces and do some minor style cleanups in acert")
+Fixes: 26930a8c3e42 ("certificate factory can load certs from file")
+Fixes: CVE-2026-78131
+
+CVE: CVE-2026-78131
+Upstream-Status: Backport [1][2]
+
+[1]https://github.com/strongswan/strongswan/commit/23c9b9a2708e4958292d828424523fa63c0be829
+[2]https://github.com/strongswan/strongswan/commit/9762cc3b091b423543510113a5d05215daf16951
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libstrongswan/plugins/x509/x509_ac.c | 33 +++++++-----------------
+ 1 file changed, 9 insertions(+), 24 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/x509/x509_ac.c b/src/libstrongswan/plugins/x509/x509_ac.c
+index 3fc5de2..68b7cf9 100644
+--- a/src/libstrongswan/plugins/x509/x509_ac.c
++++ b/src/libstrongswan/plugins/x509/x509_ac.c
+@@ -186,41 +186,25 @@ extern bool x509_parse_generalNames(chunk_t blob, int level0, bool implicit,
+ static bool parse_directoryName(chunk_t blob, int level, bool implicit,
+ 								identification_t **name)
+ {
+-	identification_t *directoryName;
+-	enumerator_t *enumerator;
+-	bool first = TRUE;
+ 	linked_list_t *list;
+ 
+ 	list = linked_list_create();
+ 	if (!x509_parse_generalNames(blob, level, implicit, list))
+ 	{
+-		list->destroy(list);
++		list->destroy_offset(list, offsetof(identification_t, destroy));
+ 		return FALSE;
+ 	}
+-
+-	enumerator = list->create_enumerator(list);
+-	while (enumerator->enumerate(enumerator, &directoryName))
+-	{
+-		if (first)
+-		{
+-			*name = directoryName;
+-			first = FALSE;
+-		}
+-		else
+-		{
+-			DBG1(DBG_ASN, "more than one directory name - first selected");
+-			directoryName->destroy(directoryName);
+-			break;
+-		}
+-	}
+-	enumerator->destroy(enumerator);
+-	list->destroy(list);
+-
+-	if (first)
++	if (list->remove_first(list, (void**)name) != SUCCESS)
+ 	{
+ 		DBG1(DBG_ASN, "no directoryName found");
++		list->destroy(list);
+ 		return FALSE;
+ 	}
++	if (list->get_count(list))
++	{
++		DBG1(DBG_ASN, "more than one directory name - first selected");
++	}
++	list->destroy_offset(list, offsetof(identification_t, destroy));
+ 	return TRUE;
+ }
+ 
+@@ -539,6 +523,7 @@ static bool parse_certificate(private_x509_ac_t *this)
+ 						DBG2(DBG_ASN, "  need to parse crlDistributionPoints");
+ 						break;
+ 					case OID_AUTHORITY_KEY_ID:
++						chunk_free(&this->authKeyIdentifier);
+ 						this->authKeyIdentifier =
+ 								x509_parse_authorityKeyIdentifier(object,
+ 											level, &this->authKeySerialNumber);
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index bd3191d35d..af687f5e4d 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78127.patch \
            file://CVE-2026-78129.patch \
            file://CVE-2026-78133.patch \
+           file://CVE-2026-78131.patch \
 "
 
 SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"

