Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0580E7719C
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:06 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.48447.1736119444572241927
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mAEjkgMI;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e3a0acba5feso15524882276.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119443; x=1736724243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RV1omrnScDZSmkDW4SUE3yPGyKq7LEzn1FA+LVsp7RA=;
        b=mAEjkgMInJHPb8NshNku0XMf69UX3x+fDhiaX+ZQA+iMehT53poOfvP6JTKUnoStwN
         IaiYoQN8FIiDbEFsKdeBH4c9rCkhPtJ3yq+rnTiLJry0KKoVZHLGvUO7B3lYi+S6MFdE
         prhPrthd++EgkwH5AOV002jUo6O9zC14Cea10S4QMDpBZz86hsbTKUSZh1cdcT3YWdeg
         plnm/RMo0yCuRFiewEX3T4Guxfu/LHL8mP/d5tMvis9qroArQDIThOjI9V7VeEQxR4rC
         AhbN5R8OSdMpIzDC3Ii8y/Sxunt1mPK5mLC+1amngjOQf0W8SH5K77Xq3kV0Buh0Ztl+
         8uEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119443; x=1736724243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RV1omrnScDZSmkDW4SUE3yPGyKq7LEzn1FA+LVsp7RA=;
        b=EcxrG91aIEsvyB47CwK/CpoXLmf0b//RTaRUE9dMQJtO84aOV00WtcvqYGq0JwZjgv
         uITIbXE2PSHkIj8S4ySKZyfJ+INQFlUVp4OISYthvcTXHIW6L/xT6eh1DMagU2sbIVC0
         fEXjokgSRDNqwuspBjLf+HJFMDl1ObVImULexgdXH8Sv9FZGyBn5Dr7xll5oF4o9Hpq/
         +OeWAd0ohraAJ+ENCmibwGEaXCMU1rl6cWgECEzL992k5RDSUEScbCiy9ktcucJIKw2k
         PUBwPfmuF25o7I0T6f2ecG50AmWoDjBmJCWIv6Yx5XoNo6ptPNAf8wh6z1vPTt9V3euX
         0tJg==
X-Gm-Message-State: AOJu0Yy5I2OrkuDGLiKfbvqEyI1CQm4zvaDCxxEJvue1+zARwL1f9RGQ
	jnvp467CVaNOrQo6eW9qMl3Te5F1hwzq8uzoUnd7nfTSxmJRLdIiw+yU1rCL
X-Gm-Gg: ASbGncsa51AIqZxU04u1O9XMuCNSwZ8o+IWcZ18ge0ZBZjQssUk8+L7mrtGl0Ud5N6P
	yhV0BTvWYJKSWY1aOD+an3LcB93Sfuoe3i94Gd1KB0uCV02EgZdzVJSQ7V9Btfyn82eJeLv4Pws
	XpbDAdyCk2LK86Eh7BNlUC6NJwxawJhe2M8hmb/WDZY2LzKQBlDWFmLJVzPuOb9kFoHa3wWeoit
	xoztEEnVA4k2CYCdB4nhj/LkSOn8C/Pezj0YVozC+6pnnfYv7vP7vM2Bdb1JwyCTqZt+A==
X-Google-Smtp-Source: AGHT+IGDmfig6IX8cud7VqcZfoaqCsujSUUCnSiYQgpH296ENIiwO1bl/CRrClogIC3w2fdvsko7jw==
X-Received: by 2002:a25:aa6d:0:b0:e54:9a72:9a02 with SMTP id 3f1490d57ef6-e549a729bddmr4556156276.24.1736119443595;
        Sun, 05 Jan 2025 15:24:03 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 08/24] proftpd: set status of CVE-2001-0027
Date: Sun,  5 Jan 2025 18:23:41 -0500
Message-ID: <20250105232358.1502946-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114637

From: Peter Marko <peter.marko@siemens.com>

This ancient CVE [1] is unversioned ("*") in NVD DB.
"mod_sqlpw module in ProFTPD does not reset a cached password..."

Looking at history and changelog, the module was removed [2] around
the time when this CVE was published, likely as reaction to this CVE.
"mod_sqlpw.c, mod_mysql.c and mod_pgsql.c have been REMOVED from the
distribution. They are currently unmaintained and have numerous bugs."

Note: It was later re-introduced as mod_sql when it got fixed under
new maintainer.

[1] https://nvd.nist.gov/vuln/detail/CVE-2001-0027
[2] https://github.com/proftpd/proftpd/blob/v1.3.8b/NEWS#L3362

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 03a1b56bc7ce88a3b0ad6790606b0498899cc1e3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
-- 
2.43.0


