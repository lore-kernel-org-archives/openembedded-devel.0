Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8223.1795739740361097876
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AxRRbh0u;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso10175027c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739740; x=1796344540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bi16w2zUoR2tryt7zVs3Vaarlx7z15ItkQy0VDv7tg8=;
        b=AxRRbh0ubj8q9eCV6aIg/PE2+ZVTR0p9nJfHihTwdXIoPbnu+CKQA7qGUUhfr0yFL/
         bbehJk3IRcWnpNttOITTLJez7HKhpFZ+09PFDlWV4QOUNvpoeWg8bjE44b6b6QiQMAID
         /+TFDV3hR1KBEKHnsAIR6h1CxKQtBMCMN6V0eGwxpauWsue10svI507ecIkvloetxZ1E
         xzdw6oiROLb0g803jUFDeGXXqrGQCKrQkPwfp+wuzMa1PsuQzH3nmexw/gbG3CLEwNFM
         XoGWsndLVCnMCBwXXLP6UqEGyr75EV1+HgFh0rClWoYfuD4bkUksxISxLvxA49NYcVtZ
         zrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739740; x=1796344540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bi16w2zUoR2tryt7zVs3Vaarlx7z15ItkQy0VDv7tg8=;
        b=bUFb/Oo+86RRS0+xZfkKxG5sbMECZbTtb+j5DyZH7Oo4ZTAfUJ7Oe+259FS3CWmYFq
         GgYQfmbXkHVSMqNK9ngFm0ocLbcy4WrpBJOrUWOIo8KACKHhxkd9WPjuAQZFFyHeYndo
         7kIVpGQol/hs0v0/FNotFJI6r8/liNImKuKG4w85V2zpK+JjvYLQ+UQsdp3/oeUmeWNs
         QuCVez+IhhZG+zdN/igzHa1AgeN26TFnpx9byRL9o5Cr8Wabfl2OP+EZHh+oCi6Wla4P
         MaXkFftnWpSc+vkfXAWsw6Rujff5LKaatWcwF461v6lWLtrmeypu/s2rFgv44Dyb1J+I
         upSA==
X-Gm-Message-State: APuU4Z8v0mjl3n8vczA9z3edzxcbKN0n68KAARuTYxVyaR6M0/AuPwce
	eAiR9PCoBFvIocxpB0kR1ZMQfTg3WdUpXRoqMgGGCKaOiib/tX5YMaSPFSqzRf59
X-Gm-Gg: AZFdTZeIYsVRs0Q9xw8EVkClzITk3yzTAEygqNCkhtoyAhxBfh/2SgNzZ5E7oOtidcx
	64EDchlZ3LRB+6fv7m7ixqYDcgpZpm/CgUSKE73M0xRjVIm9S4hJ0q1aA0nhOGk+rTei3LMf/xs
	Ks8PkesJfYNoZgxI8fZLLbiccDwHwnfTWHavBJlvdrTTuMhLqUn6Le8foH3qm4nmgJ8jK6ijGnp
	79CcLYGuEjKGmcXdUEp/CBQ0GFSp6do0et3lGl4NUOgSFXaMsMAeKOcUU/E8fPO35GqRKdC//ep
	heGSel0qG0gGjbGXztHt71mkkLBvlZ6NT8kUKMzz//2rYYRf79bTS0s9K3/pz98TW0ARU/juInx
	sunBBDUZr3CwGry5hiKbrBLZ4FMErsJ7GIDTXpSk7g/m9p4B0W0WZBSeWAh/jzkB/3prd1hsfQb
	vruG8P/EXJubU86VB0hG6orLMoqfxy0YPIH5SemR850XWRHj5joi2wKj12Kj4h4R0nfTYgd5yM0
	CKknb2Axkxgnh5ZnCsAWjDl6ByRG7A4paG6o0/tcn+tWEADssVpj41XrHPRVcOhNfXANJ8r8zVr
	Ck1ZfT0RRt2A+3joCFm+eEr7Jwl9OK0Ok2Z7iMLkie9lIyBo8tIxxZMb08kiltD6J3O7PxIMeaH
	G3oEe7j4Zo/o+OGSrAcMjUDj8M1I04I0OAu1QA1PCjAqimje2SnNUHT7aCi5nMaPdQuCkvTKZqm
	78Gy3ufnaGbvO/ZhzWjMVehQih1mOREwVTRCosU1i7zcwjquV6S5B2nRGUYYAsgE1DVjNQO4Bir
	07dsL12X7No3Y1d+07b7UxU7eYUyCtsFbOAI1p1Ai6U/YzNmimtykIITVYKcjGmv8lu+UId/dOn
	qGz1qMh2GeoQd343eZ3aG+jFdw==
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr32260876eec.38.1795739739643;
        Thu, 26 Nov 2026 16:35:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 66/69] websocketpp: Check the cpprest-lts branch for new commits
Date: Thu, 26 Nov 2026 16:34:22 -0800
Message-ID: <20261127003425.2166632-67-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133166
Content-Type: text/plain; charset="utf-8"

The fork's only tag is 0.8.4+cpprest-lts, which the tag check cannot
compare with PV 0.8.4-cpprest-lts, so it reported UNKNOWN_BROKEN.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../websocketpp/websocketpp_0.8.4-cpprest-lts.bb               | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.4-cpprest-lts.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.4-cpprest-lts.bb
index dde4d0b367..8db348b228 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.4-cpprest-lts.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.4-cpprest-lts.bb
@@ -20,6 +20,9 @@ RDEPENDS:${PN}-dev = ""
 # tag 0.8.4+cpprest-lts
 SRCREV = "c011de4608e8221412f2ea9be5d755a68a4e5e29"
 
+# The fork has no release tags to compare PV with, so check for new commits
+UPSTREAM_CHECK_COMMITS = "1"
+
 
 inherit cmake
 
