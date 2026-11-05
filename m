Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28900.1793862642719433327
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AjJ/LheG;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a1947498bso4306191eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 23:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862642; x=1794467442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MI+7R08N0F+Mk54WZMyVAmEPx3Qjr0AqMyq7TTWwTB8=;
        b=AjJ/LheGMGXo7MW+7uMKzw29sdzAu2AM2I7GwxWXZ6IqXUL+HcBUqvM38NtA8UK+ij
         7qklJ/LvKutMuajk9drJIuGtSRhafBlUF+OOaJXzyF65QUbBLM1d4WZp39uUkRjfphA6
         Qpx2NOyzX7Al93EuERVtM+syM3T0Ryl8sjCkgvSc094j27//QIeFU7tqdqFlz1RTK710
         EnoRVA2eg0Yfp0ldyx8N5t0bsO77fOVzdHaA7p8ITwVSZHtnP0ldAAcSCEQAmIplH95n
         fYOWqqGoSkI/DlvS9FEfE5AlYhxOaYepJK1Da+iHokX7doop4XlRshMT1QolcsZmaSI9
         UnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862642; x=1794467442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MI+7R08N0F+Mk54WZMyVAmEPx3Qjr0AqMyq7TTWwTB8=;
        b=2m7M92eKp209XfQWWgPumjBt1qOZwjCQKGqAkT58bQ4IV86pLm64fg7xUjWRSmdMXS
         O62it1N9X7liZXj/mv0L8IXHnFL8KoBN4R1fmVpQZfZTVBu9vKetq3r1zfhxC08NiF+M
         voBblrZu/x+NW4xDLCYbf3MkjT4Ux7VDqdQ+80F7VWQmc4dJmk8it2udBnGQ3lqppjEC
         pSxs0kA+O6oGGJ2BndgHu/L3QhKCZTn1yjE1T36/+rUp8Mi0ReDGjL1lsc6nyoQeXTuP
         fsdSVKQaakIlIl6SVo+UneJoKMQl8RLq3gU84m6TAf0ChG3WP+vTcDezfvny+YLDaybT
         XXXw==
X-Gm-Message-State: APuU4Z8TN6dHdWkXkdU8gzfobtoYBGnBLpqSq0iEWjJLk39w1reUL2MA
	3186NNUYr0eMwNbiva5QHiKVzdKmSLMiBmbkG9ARjieiTENBAwq8jIoqZLBS7IrylbA=
X-Gm-Gg: AYBFou3IqFPJ6OzIk8CNsgqKyIg3u0inE4O41HgpqDS1UbC6hcNQNN2dXDpyERv4nCQ
	TArIUgk0Ewr+jd4Te1/aNLNEnn5yp0G2cE+dcKEPfbjrhTD6UOlj2y+0rpvcaes7+R2yK+AWVe7
	BV7qvA9eoiUwLjt3K9w5BSRKoXP4ogcUSsNqm/71Mys/rEpIGFxUY38M10QuOl0SGJXquwhmEEz
	4W/8NJQC00G7x1TRDDo/rWIUSDyBMvmrjfbiEZxqkBXHl+rCxjmz/tsR/wywcHlng1O4bl2eikr
	y4aV45xdZtNELuIex3OEomZxZhiX8uSDSi6NW+OVNXNTTE2zORlS3t+HdbANPxAhlFJoBmO93ng
	5g8T1M2L8Mn3QueSDMd5Mez6EmIEKeHHKVRiH6V8v2lUk5+t7sPrrpagK3yg8CfcdVH1rzAr+n2
	pz2XMr/KgFTIgiPytYnY4gNr9B/MlamM3Ufs9v2sXCCbV36TudJz8C8DHo87TsbK00ibBv/zyGK
	VYpAIOsnyyf615jhCpPWtsPBkcmWEg/5wjL6/9CTKycUB2lgje66VS560kMCiYV9Tamn9PMO3/D
	3YFRtjkLgCtGTVs8ZSabxAg5d8o1MRV0IvL3iaTc7vVdtHRA379rV5QE3aT7YOEEO46LADAnqsa
	tFKC8KMRnQQnFmOolWaKucHnBXHa4cWQsgt/fplJmgZNPWBTlSI7k8HUGmnLdqidahhhEsIBNbE
	msuGXcxX0JO84qhvMrNDuM3je48mK1tMFazjxBolzgjYyVjP56xE8hVVfe8Rxyj4T2Lpch7ogZh
	By/83sKM/yYMhz8Pyll1303CPr7FDKh3Y1rz1M0bkN9ccdEPZJrwLBhZVLDhh/Bp6y97K2KCABo
	UPrj
X-Received: by 2002:a05:693c:4187:20b0:351:6409:25c9 with SMTP id 5a478bee46e88-36a4241b0bfmr31766802eec.35.1793862641748;
        Wed, 04 Nov 2026 23:10:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm13132205eec.28.2026.11.04.23.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:10:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/4] python3-filelock: Upgrade 4.2.4 -> 4.2.9
Date: Wed,  4 Nov 2026 23:10:35 -0800
Message-ID: <20261105071038.2029943-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 07:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131869
Content-Type: text/plain; charset="utf-8"

4.2.9 needs hatch-fancy-pypi-readme as a build backend plugin, add
it to DEPENDS.

This also fixes ptest failures seen with 4.2.4, e.g.
test_post_open_failure_closes_fd[fstat] and the soft lock
lease/stale tests; all ptests pass now on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-filelock_4.2.4.bb => python3-filelock_4.2.9.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_4.2.4.bb => python3-filelock_4.2.9.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_4.2.4.bb b/meta-python/recipes-devtools/python/python3-filelock_4.2.9.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-filelock_4.2.4.bb
rename to meta-python/recipes-devtools/python/python3-filelock_4.2.9.bb
index c0f4f59e17..442ac4ae82 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_4.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_4.2.9.bb
@@ -9,13 +9,14 @@ CVE_PRODUCT = "tox-dev:filelock"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "c6d8663535e1650ee430507b4ffbac7b464dd64b7647ea0112a9f406499d163d"
+SRC_URI[sha256sum] = "96530b7c538d4ea08493ab067247aab7948c54d8cd622cce711c97cccc5d9896"
 
 BBCLASSEXTEND = "native nativesdk"
 
 inherit pypi python_hatchling ptest-python-pytest
 
 DEPENDS += "\
+    python3-hatch-fancy-pypi-readme-native \
     python3-hatch-vcs-native \
 "
 
