Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8.1794324455840795064
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dkfhKblT;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so491768f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324454; x=1794929254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjsXai19pBEUSGEMcOYviDnEHX+xkfMMSXqp1awtqYo=;
        b=dkfhKblTkNUURMhyuZGXyBk/3PpoeQEsHRLpJXdWZd2FAzT6GA4p1XLrCAVq77mShJ
         vNauOmJSXKTMG3yBNuSlCS00F10aqwMPA88Bmupn87l6Jt/I7qHaq4wwHLA6CZO3VC6s
         mWJgBdWxToVuSzuhUbbz3eCHD4kGm6jQviExY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324454; x=1794929254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjsXai19pBEUSGEMcOYviDnEHX+xkfMMSXqp1awtqYo=;
        b=ut5UkUvvLiMWf2fmrsQK0g6MPzcRQssX2WJepj5jHHq+XBNFml5ftyRPiKlPr+ShT4
         SX/cnCJH8wHvFhPMCO3uLJBQXAC/GH0VLkrG+K7uGgQpljUtAHSE8fxuOh6/Ymlj9Ix9
         6+LQznGujm794vKQifAHwyJKOk5wu+90BoAjSOAZiBhbSosXEN1015gf/FGcrPX83HIk
         oZTH5RJO9J78u/AT/C+yhLWd0xKrjpH6GiCzRrfuM33JKNa8rOXv5xiqzgwNjLJTSTFk
         NLYqE2hTKzdVdJmtvivxwCf1Pf55sVzxBECBjdNJqbUIk/e0LeW3IQQmFDdFRuY+Ax/S
         Lk1Q==
X-Gm-Message-State: APuU4Z/SHNDONI6SYb/HUaBcqdW06kHpwAnHZOyyPdVgHHU4u9xTr6gb
	CW/h8fQfCRgefKMBezsuygYrRQ87+136UHMhmckXudhHjoqI0wGXDMqZc6sTNaeUicH43ETrN3o
	VXZVe
X-Gm-Gg: AYBFou0dSO9/55fgxkhr70Kpab38DudCLCgFmtggsINNxzSbo6LQcCg6d5Yl3YR3Hmm
	bVM4roB1DRMViyH5DRLzdBfU9SLTDyh6E+xt9sG6QARniIeSQ2+UlPSJpeK/4K0m6KW5UbSwWb9
	hehjAv7++4cYDoCWhZxymBxDTpxRnpfwwXaEw41ynXElTJfk38xiapuxC8L4uYGE2GxQf/Y/50k
	SGhxK2pVJqf1Lh/VyaF4i0o3QmeV8MHoNr8ZEyFXxMyomQgNiofD1dgC0la5C/HE2qZsu46inhc
	9nPVWohQjiFiMb/KRYk/UMGSRBedSq7qibpXxQ+hiQ4fRr48YsKiNnVHHRGaTRREZrx2Ng8BnAu
	IV/nyuN4rnWkI0oNyugR5DtO0PMGKIrGXCgQTiY7cDc7fMwOg9ifIlwXIV0VH8cWwLCtKLOERAB
	qN7rx0M1rGc+2riJoinxW5vgVT/sToKJexuTNrgg/IiZaDJoVQRrTJaNRbDirich0OeidRFFlRB
	LIxfN1R5GzuXQUA+ppyU5F6OGlvdwF8imlUjZOHAgcl4aYzB7MMRkgcpEdqOScOQjWJ0pz03ljJ
	ArNfdIGsAIRLhRw80fKBe8x5ILyUf22gx3QXXnLIenFccuCmDtmPmQ7VmEdJ1n9e12ciek3NxSV
	iWO6Hamq7YzAn/2sNp4WbM5VBoKM34v6Gd+6YFJq8CHWPUX+W25BwZg==
X-Received: by 2002:a05:6000:2997:20b0:48b:108:48cf with SMTP id ffacd0b85a97d-4982f2b5c98mr4245230f8f.25.1794324453961;
        Tue, 10 Nov 2026 07:27:33 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:33 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/19] python3-dunamai: Upgrade 1.26.3 -> 1.26.5
Date: Tue, 10 Nov 2026 17:27:13 +0200
Message-ID: <20261110152729.1065911-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132077
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.26.5:

- Fixed: Using a relative --path would not find a
  .git_archival.json file in a parent directory.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-dunamai_1.26.3.bb => python3-dunamai_1.26.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dunamai_1.26.3.bb => python3-dunamai_1.26.5.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-dunamai_1.26.3.bb b/meta-python/recipes-devtools/python/python3-dunamai_1.26.5.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-dunamai_1.26.3.bb
rename to meta-python/recipes-devtools/python/python3-dunamai_1.26.5.bb
index 00d3198a9b..f63e82e991 100644
--- a/meta-python/recipes-devtools/python/python3-dunamai_1.26.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dunamai_1.26.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "Dynamic version generation"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=059eed55dbfd3fea022510ea62c95dc1"
 
-SRC_URI[sha256sum] = "fe2f732186710ee5048044fdbef6c76c6afbb9ee7de4f6d00cf34256e9ec2e7f"
+SRC_URI[sha256sum] = "b1435d8d2b0aceef240cde8e8f6ba910e85b1aa0e22fa9e21454d2d22fb0a89c"
 
 inherit pypi python_poetry_core
 
-- 
2.47.3

