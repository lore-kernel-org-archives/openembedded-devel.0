Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E4DCC6B0F
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:58 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3523.1791885595570286027
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HCo3WWbr;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1152088a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885595; x=1792490395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWEYDV99Zj+PR0BNtmTW2g3aHPvohqUOT6ScDs+PuZE=;
        b=HCo3WWbrSwhl9atC4C3/LVpGF1/eytJvJnnuacoT7I1VyISvqNGyIr+01llwHnRkp/
         wO16+Szy6PwzDvlL7YbGY772NnXCaEnCXfRTLfMvUF7OsQ9AhN678mV/z+q2/5xaUOkV
         tPaD2ZphT/BCaFlAGkqmhkpBCmBySjzLyYbUTG2IfoCsSYiao9uZLgFZ6dizqbkKhOL4
         Hsz7WhVTHR+WFPRQBm8ilxSVz0ektkYCyNDGhOXfXmLTOAbcWfERY3mKDuVtqcjBWzGK
         Px2/j8K4ttaUoiLE3SMyhyROw3dq68cBAqj2ptYnKn2pwzwWHMgTX32T2TkLrkbTGLBv
         D4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885595; x=1792490395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QWEYDV99Zj+PR0BNtmTW2g3aHPvohqUOT6ScDs+PuZE=;
        b=ooMq919uB6x4FKgbLwd3YUgg2LPImIj0/+K+C6M5NTygf3lc/Pz0X4xqcdIy4AlRuJ
         pDGI+XDAklyjEYt0wuBGPO/qxpCH7zMOqI4K8Djh5lMplctJkG8wDWrjUvzTkYJax3is
         D9yY+c83+AL9sTiimuj9mykisFvRRBdbhvfXdT+iZH+PnR80+DsE8UfXxjG1VFYg05N3
         JbgHK2iJuqs5+QXvNYpN4caN0l8H5/ods/LQJPktla3Gm/yPfNER8XwVrh3hyQmP56aD
         lq1reeH8TECo8oW0IUI/W2q9t2z80VZFc8C6fGkxuWxE7ZFg3iQHbdht37p+MwqwsyxN
         XT/w==
X-Gm-Message-State: AFq9FYL5ldKOpG/3lpKfyhwtpXoYPTPtkLacvEYuqH95UDgfPtMrI1fK
	pHF1ihWO7KSyJT3Y6qUYcpg1ViizQwAkA389k688Dz6VBobaJq2CPUpPpDiXHQ==
X-Gm-Gg: AYBFou1E5FkxRV0Cu7XM3whxLOEd5rxZMwOXsBjY+qLNhCdJ/VBlG/yXL18qxzDLW+D
	ioIE2NSo9DWBjQbhci9p5fIJw3r2DixyGYA6SjeofvKg2zvMDzE1D6bFgaZCPO3GFt/mhSW/fUp
	jB24I7l4WTV6O4TuT7BEdFBDXS/GP+lIjPtDPJj2hhsXB3HOwYamkuMMPoRAnCPMbD1/5pvuxb9
	zWCCBa7bnzUT2+ct0Bihs+eQAlBODVzgMkKxaqZnsNFeOAscI1m3ChNbr5e0vOvvkK0d6uP3nQ1
	MgSdADNHF03U/SrmbTyz/NvYG6ON6ecjs8Yj0gqLyfXzvgJCEPOfd4gHrQnue6IeJaOuAihUv7L
	1CCpm8WYSql4bXgVUeICJjqhoAqw5Mrb1eYaTy8GwbDVVtOP6pH/P73cGslrowxFlOkiX/1C9Hn
	FkS1ojbfkT3XmgzpWBHgnc8Go1ChQJF1PZEZiavdR2182WrdvE7SFSSTyTrlljxB5yimxodnn/C
	sSbdlg94Fj2mJNTL1p2sYo9tWgFRKMT3BLePsUf3CERXdDO0g==
X-Received: by 2002:a17:90b:164b:b0:39e:6c69:34da with SMTP id 98e67ed59e1d1-3ab3a91169cmr9968860a91.62.1791885594944;
        Tue, 13 Oct 2026 02:59:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:59:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 16/28] strongswan: patch CVE-2026-78131
Date: Tue, 13 Oct 2026 22:58:51 +1300
Message-ID: <20261013095903.3544906-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130849

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

