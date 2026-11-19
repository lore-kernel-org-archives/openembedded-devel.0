Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1859.1795113384834574319
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ATmoSKx6;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06e79e152so75481b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113384; x=1795718184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zudrIfrE1pI014KRNuMvLvxz8wAPES1V8X15tzHXsak=;
        b=ATmoSKx6yOOaZLxbOAgXBRZ9EV6bdRIESjFX80eeSJgY0F4OyF3Zx6y7t84SlTxpO+
         824yLcDt8jyUXr0ACHNCU9Pt8xp0ag8wp94bIsihGaM+lXUrUPnR2matGp8rDm7oyRAB
         QZUUSBMT/dc674iS4X+6lf1LCz2EG7Py8G76zRf5msoQRJnnPCHQQBDH4fHajNyHMKv5
         w/SDWIR6ODCmJS7R+YZCLGevWNumAq45B3e4rW53hEBLOg3fYIiI72A4q1cKaYnEBIrp
         lY8/XMIC7PYwsBO8OpsKKMOCDjoX4aLAYssEwH86apjwDNGftDRhRhTOMNsgD6bOVoNd
         h1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113384; x=1795718184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zudrIfrE1pI014KRNuMvLvxz8wAPES1V8X15tzHXsak=;
        b=eo3aBnhjaMeH1k86oIWnkj2itP569IxieVXHhMWxazGynkzQWQfKcAjU5uxeZL0wnL
         QGwGAZ/DLEzvdEu6L2w7xueTej38P44XT9RBk6BBKNkTwm60s+HXqRnLP6xQWLwzl92T
         ImPdWJ6xuf+E1e/PMW7OP8lPjMg8fAC/Yk9sJu5etjbyzELu/9fCHmqlEDMiad2F9ib0
         fl70OGxnlJhlzMIU65LR8/nh7RtoqaCfJ9gcHjY4S57cURmvJs3D9thEZTYeUYX3wmLB
         704SCsQCEDpJNtEIO1Fd6kjj5M+XBKpVw/ET/k6Vc4yyPqC6Z280CkKWu5Q0KBzS4vDv
         fx3A==
X-Gm-Message-State: APuU4Z85hs1oeurfaocOit2poAow9jiA0jq7Tv1PMYPmOam3HMDUe+wf
	P3zkroh+AfS6wElqCfjULVzEOjJIEETpaWrQRCho4W36JbOCDV8IGhchQHMcig==
X-Gm-Gg: AYBFou3vRPDqj7EXTYZh4DgLAEmVABASL3buarmaCC7VZ/qp83++xJEu89eIm0gmp7k
	VTum5CPSc+uUjG5ZumiezQnJUaPMCd+P2Qq/JAOd+IWinecyoES90q3h5Wtcmrm5FlTIL9qTWl7
	itop9o/Dq6LJ5qFWZVvveA3KN0hNayCXDFqC3Usq/aVX9MPKIc+eUDJAz9i+Z1/FTfoQKxR0aZe
	/StnFa5sQ865z976CZBm/fHx5byBCsgKzB9eoNQZXs9596+ScNGMsuWEHq1VS3s7rQeMZNmtXHx
	TZZEc6FUPUd4llSLc3oDGGohgogOvy+ZObm58vU8EpwCn1twsqYoo670xFUg9Mx+GrQvSYRO2Nk
	bX9DGgVPqYx5Ww9ZFv8025FOJMAU13RCZehoLP/2wZCdHVQbt2Ax9Qu+HBZ4S10jgscX/iblGHs
	9NJ8Fd9xiiajqulzeDdjlqtZosYupWPLgh5i2prU+AoPpYOYDfVOqovJw8tmsrpoVneW+mNUORi
	NUAfBTCEpv5T2uW/Tj/gv99LPu/JelduzS0SvVG6d+SPHeD5Y6QePSQyRm+n5H8WBXpuw/i0COM
	iMZSsuzsbJ5+2jKn1Jsuunm0/yHcrzHyJJV+GRb+sI2SyHfw9T312PaK2kONiQ==
X-Received: by 2002:a05:6a00:812:b0:89f:172b:3b88 with SMTP id d2e1a72fcca58-8c87d11a780mr380712b3a.47.1795113384178;
        Thu, 19 Nov 2026 10:36:24 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:23 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 11/64] python3-tzdata: Upgrade 2026.5 -> 2026.6
Date: Fri, 20 Nov 2026 07:32:39 +1300
Message-ID: <2fb9b9c2a9babf9121850fd2ac197b1f3e01b5fb.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132701
Content-Type: text/plain; charset="utf-8"

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 2026.6:

- Cuba will not fall back 2026-11-01; stays on -04 through
  2027-11-07.
- No more leap seconds, and leap second tables no longer expire.
- Improve 1965/1966 data for Brazil.

Changes to future timestamps:

- Cuba will not fall back to -05 on 2026-11-01 and instead plans to
  maintain -04 through 2027-11-07.

Changes to past timestamps:

- In 1965 Brazil ended DST on 03-31 at 24:00 not 00:00, and in 1966
  it ended DST on 03-01 at 01:00 not 00:00.

Changes to documentation and commentary:

- Documentation and commentary now reflect leap seconds' demise.

Changes to commentary:

- Discussion on timekeeping in northwestern Ontario has been updated
  to reflect that provincial regulation has been issued to allow
  these areas to stay aligned with America/Winnipeg and follow
  Manitoba's adoption of year-round -05 after all.

- Discussion on timekeeping in Saskatchewan has been updated to
  document its new Time Act, 2026 which comes into force on
  2026-10-30. No change is expected.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 5d70416431f6acf354d600f74ba57200854de64c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tzdata_2026.5.bb => python3-tzdata_2026.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.5.bb => python3-tzdata_2026.6.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.6.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2026.6.bb
index 4590cec28d..b13eae98f6 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=804220b73c90950be376e7ff7b2066bb \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     "
 
-SRC_URI[sha256sum] = "8cc73c0a0bfca7dbfa59235d60b2eff82231dee33f53d206db1acd9173cfc0a7"
+SRC_URI[sha256sum] = "85d2cd9c09f81f0bb29db27759fc83af4f1e620efb814f8c5bf8b4cc4feece6d"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
