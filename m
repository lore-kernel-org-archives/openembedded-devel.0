Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9B5CA9ED3
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:10:53 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3511.1791763846762327861
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q/uwpAnU;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3aacde0cc0fso460283a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763846; x=1792368646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvesF0Vep8chKF3Hj+95VrPPTpeej9DI7y0P/dY8fYQ=;
        b=q/uwpAnUyievWV3T7WZLiNxz6P4CnbFROGU0iqWIrc8sfsiu4z7djN3MPohtIp99JX
         w6IAWW606kOLKzQtTnxtrCvkb0PIt8lhzHSIBilQLb3ctSu+wYhuAk1YxVsZZokgnuEy
         ax3M/xwVWfz32G4FAbEzcUjwgGqkPLMIe6ztFbPXxWb8HWvILJV9HFnmiHQn35hvKM8u
         GTkeYvnQ+ZuXHFCa4E9mfFcRwUPUB0Mk3+rZiV22eoM6LeRL6Q94Dh3KG7KpjHQdbhc8
         ABxFqOWEWtvszaPCRIZbm5A6G2aIb+yy6BAJa2J3nQKIaAsp2o9sHQ2pI4tq/tjAd1oN
         +nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763846; x=1792368646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dvesF0Vep8chKF3Hj+95VrPPTpeej9DI7y0P/dY8fYQ=;
        b=M8L/Puwsv8BVVPbkiwxaVJZE90Op2YltaeY0RuQSZWNmO3Ydz6ZZCJlN7ITcVCGzHK
         VBMl7ic9HQAXYDomS1Otq424CAIl3LewuU3oc2DS5WSmWPHXoqZ+UKv8j/9NynefvHia
         O3vOVYHz9NRQgDu1WfZrxtrCWT/u0bSIZhxUKrtiN0y3txxrDLtBP38RvZKbdSwZmUP2
         WeCD1vCQQasYklmf2i52XlN94gP1ytL9XtBCM+d+AifwfNBVNaC+NsMGfh9qH85vTwTf
         GiWgYKPrcyQWU5Es54TuSb4JzO8aXPK35kTYSU6j/OQY2dkTYfJ/a3Qu72cGVpic9PbY
         odNw==
X-Gm-Message-State: AFq9FYIQJVUi7KKDXZOhFGR4V3iHq5KLm4S/tQXsSFNSrCSk/AfEoHYk
	pTymHlJ2oVSiqOKUxyE7/e73xi7bxQW5peMoTV62UNTD7YUpQnXIhm/QV4NvjXnQgfM=
X-Gm-Gg: AYBFou2jQgFG5HE+XQmUHjKzk7QIhDMh/J9Jsb+hV9maqS0m/7nZfJ0G7PfqJZ4nkSW
	NxMVnT4iD2Xzluk7hN1wzKHdv0MLSSozeVzKfySuHLwTdKglfCRtLiqQUxmBAT//wLx8IkOCQHR
	xJwyC8IQLvFQKnTq1BwkA2DTlb6IZv1JueUjrPmyVyTGIpA8iP0HQxNYNPkaQiFOPqX6YbIE2Ly
	HZ6f+fj70x8ssgkFogTXa2usMqmMv3g7kwsrmm+8Jn+5ojpQA6YHarkE26jq/qKHBf0xt5msvKe
	WXM6o1fredS6rs/TBOWf6rWRVOXRKiC7S+xbOT6Nb7Oj7eSVk7wNy9m0S5qJbCzZYwpP+m/iRZE
	CvlijAbiv6HWNbTzfSRydfSKAZsZV54c7TCLytYhbSCIl9icyBjLCSRobF96129AI87VYHDJh7W
	1rfrRYd3Oix4MU4uSj1YGTPsrE2gZaA4Tynm0KW+9DKhvQdEljccuWplsWeGCbAZ8/yfSupfcLC
	1UqA9YlVZd6cOisMvnwXCVVRrpVPsaux1C4z30=
X-Received: by 2002:a17:90b:3904:b0:3a4:7195:ecbb with SMTP id 98e67ed59e1d1-3ab3a98c83cmr6946325a91.30.1791763846121;
        Sun, 11 Oct 2026 17:10:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 12/28] iniparser: mark CVE-2025-0633 pached
Date: Mon, 12 Oct 2026 13:09:50 +1300
Message-ID: <20261012001007.2541673-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130737

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also mentioned in the release notes[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-0633

[1] https://gitlab.com/iniparser/iniparser/-/releases/v4.2.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 86fba2b5805f6c8ff0a5f936106a9be630bc54d9)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb b/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
index 9ab713ee92e..5958ecb9c6c 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
@@ -15,3 +15,5 @@ EXTRA_OECMAKE = " \
 	"
 
 FILES_${PN}-staticdev += "${libdir}/cmake/iniparser/iniparser-staticTargets*.cmake"
+
+CVE_STATUS[CVE-2025-0633] = "fixed-version: fixed in v4.2.6"

