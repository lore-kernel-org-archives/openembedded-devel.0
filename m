Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48066.1795411902296881300
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Emmy/fXh;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-385d8a00598so3935054eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411902; x=1796016702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOQ8tQOmU3xaU7F/TRNII7p1zSYEQLwX3+QwsNsN/M8=;
        b=Emmy/fXhu+L73/Z+T+KAzn9KAcGNZOe2ynD+If1irt4ztHd96pZpCTAf7SMs9haWka
         omXJZmSteyyapOwztz2kfLM1gLGbwwa+2xbz9FoAgnZPadjzU2Qgj476PVdYgodecSKI
         mSsXARFNV0WDLlAlaRGMXWKOrncXbtzHY04raSWraB5Cf5YCXkh0J5/wu9I1nG99qUB6
         IlIW47CrVBFSQwkoXEBkHdeZjxE9icoSZdHM8JPp2usPRmGYkVgvJ8cV2Af7EmZ30UT9
         5zb4HCGK2Gu5A2qXfBlkoQA9gxQjpnWCZG5CeZChn8WpvWmTwwP+u7pea1u1gIxkEZvv
         sCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411902; x=1796016702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YOQ8tQOmU3xaU7F/TRNII7p1zSYEQLwX3+QwsNsN/M8=;
        b=LwntqJ87h+v5IKI2MJjqkgYG7iBkTETBeQuSPJ80H/l0O7fktN2qnlatZRrYPfb4ur
         iZDIGSM9fkrpLPVU5T9B1elIKhpBZ0e3282zm+spZsvwld/totg9bDEQoKJPhMqRi8W9
         4sPt+xpB7xrxjmK2mNKOEWYNO4JUUtinMjJIlP/GcadSu2fAceU3Pn/fHzBTrB8b3xCT
         TutZyOF9gRhQw+6kFJ6ugHF+zK7Qdg6DsVdL31lgqaTY/6ahD9WFYhX6K9pPJmFB2Mii
         PpgBLudWkCIV0Q2lbJ+X8iSZso2CSMrJ2NuOG59fy5A1Oqli9TGrepp2Mn9fJSo7IMek
         EBCQ==
X-Gm-Message-State: APuU4Z97V4z1JL9LigcPPwSyQYrgwtzG+r3VOH/6k5uYPHCItKhDMtkv
	SMNDnZGR8+Nqu9OIgSK26/0gROH3lZhBbCSvpyVmzI+31fEq80dQseIr2438iiA/kmU=
X-Gm-Gg: AZFdTZed5ljauHKattOpl6WP1C3Cmwv6AlppLr72fdiu4IV0npi36R+EgATwR018ggj
	DnARf1nFFLvAYlGqXHrsh6XuJPnQZKoQ5o4ftKvzECfz00oQ8JfopZA943iD4obsIzeR5N5V0Sl
	wln8svm0gu7+t0iP/F6584f7OHqoqX+q5kKspiCEJCeu122jNU+Jvh7/iRovVkPawhcu8ZaQJo8
	ZLhccreYV/MksOjBGPZqq18hwADed7pT2BPLK51rmtUkRB+s1pmxbVO0uA5kEAJ1FfihWOTO82D
	IbEOQyJL2oTcbQJh1UMCpNjjmIR3Pgd67taY+BZysS8Km8nkOfoZwufngTqGlfUfSKzTfcriBGa
	bfocQAT2agQWFIJVER2L2hOKdR8ietV6iB6Am0g7oTGYehmEUUedc/zcKYB1rUmgQ/3MNq1hBz0
	yZ46AX81g3nsUIfoo+PxwFqB40pFh/E0zZN7TtGnvMO2uS1Zz5/VZCXzke5bGTXkrdpQ3lSkq6Q
	NRtSfPGkkijX7Ui5ev12xzN8nJ7PnHuLuIrE54+brIQx5DQdlxX2dPbTIopB/NoQ6s/7U1JBUEr
	u542tIyChYIigKiiHXVg5axPOCa0c3CA4CXoUtZp8fjAPOKVdmCPze2F65/opOGdlN23b90ocJ7
	8F8Tos04Gx0lPnYHMzVSJNjAneOfSBMPm/xrRU7N3umgU49bkeuyELnATaTPEr5oKbLw334TPgi
	LUq0aAlBB0SDCroJa++GF/vBzRXVhW+CxkFQMfgfxi3OPOJx1UpSKugikzUOdNBc5UsLZqX0Ald
	aXWh9j7hJ/ev8cfJx9TnDKzbKqElnZoFj5rQBxlxafLtYZh15HCYL2mvxuxnFckd41MFwNcr/de
	c8LQN8Yk4Nw2zRJ/adxENwdwiA==
X-Received: by 2002:a05:7300:a9c:b0:386:a8a1:9855 with SMTP id 5a478bee46e88-386a8a1ade6mr3644670eec.1.1795411901675;
        Sun, 22 Nov 2026 21:31:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 12/16] python3-types-python-dateutil: upgrade 2.9.0.20261104 -> 2.9.0.20261116
Date: Sun, 22 Nov 2026 21:29:42 -0800
Message-ID: <20261123052953.3658549-86-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132873
Content-Type: text/plain; charset="utf-8"

Typeshed stub update: tzoffset.tzname and tzfile.tzname are annotated
as possibly returning None.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...61104.bb => python3-types-python-dateutil_2.9.0.20261116.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-python-dateutil_2.9.0.20261104.bb => python3-types-python-dateutil_2.9.0.20261116.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261104.bb b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261116.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261104.bb
rename to meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261116.bb
index 6b027a8492..17695de116 100644
--- a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261104.bb
+++ b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261116.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python/typeshed"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=320eb2c24b8d2e890b6800000ce9352c"
 
-SRC_URI[sha256sum] = "5d0495702a5f7343741f5d842c531bcd1c941da8b4a85307d52ef43ba80252db"
+SRC_URI[sha256sum] = "4213748a3f699431a83edf71969de9caa79d0846a5e8785c8a49072ff1968613"
 
 inherit pypi python_setuptools_build_meta
 
