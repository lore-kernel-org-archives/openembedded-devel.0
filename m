Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B3EC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 14:31:28 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.22763.1714401083453385431
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 07:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=sfuJiOVn;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.42, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso7649333a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 07:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714401081; x=1715005881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u6qmQLwo7SCVc84g0E6muiMgRh+zi1n2Wo/gbnh3goY=;
        b=sfuJiOVnHco9CiStrnCk2dBxIReczK7GenBSj87ktff1rDFCRubtMIBXaN+n3v0nl2
         G1P1YdvDDl7i8bGNkXUzNzM1mGTZ+ZjJCv8AgBou3SXLSetyQ7Sd6N3PIjElPFvPy4lm
         RYU3re2XyPDJVvymcgg1IKj5k2p42OuFEzO7zhBZQc0DkOXVf4BYe5BATZnfALw/cg2x
         WYrsUYw84XFwN0zBIjuAZN+pvLrvW/Jnui+cFSnJtSdiN3ayIgKckCDrfXW/C7RdEylI
         XtQKaLwFQFH++VFXFt7o1NEVvQfBY7b1sJRVJXWrAaPuDJI7HwTn5GrGnWLSdv71S51d
         aAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714401081; x=1715005881;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u6qmQLwo7SCVc84g0E6muiMgRh+zi1n2Wo/gbnh3goY=;
        b=XsKRMbzvz8MvfZULYfypeALv1+5+KrOcmycAz8Eux6ZdVrQvoiPtSUeqOgNXpoXRhl
         8aTuw6XDMucQEvXoe8H4qRa8/RMs0OsI8/ClHYP9BYscc6x1KMF9tHZPC34rqnQnB21y
         6sFn/pByM3LZiUSxMqsUtb5J9AL/OdZlAwQ6VYvhT4ic23SvNv/rTHNbCCQFDiI514O2
         UZCIzdC7fs0Xx+Fu4tY1ECEMjOyJ9/Gs3FhXnOo/HYmGvYw9HK4n9qCLgn1/b6uWsebD
         1u1swV6ZZ8MF5xwwR7TVkEc23qEvHBQj4JMhu4DgMGF15rwKM5zAuGuaFsziJbtttoiL
         /h9w==
X-Gm-Message-State: AOJu0YxaKgkYWhUWd2UlhV4JYjSqBNykOcBNnGK8ZNOwO+nftzPg6i/V
	o91Cby8mNmk0d0jFHL8zB7J6MiEc+Wurp9U6Hgrqyr9Ynu3lmRejFRjwWml6C9c7eLM7Fl/rjQY
	mNME=
X-Google-Smtp-Source: AGHT+IGPmcImRL6NCknBRJDlDyk0Mi++UhR0Aa7EA5DODexgLOJNP6v7FlZg+lsL3D0H8XktCuNlpQ==
X-Received: by 2002:a50:aad5:0:b0:572:7c5d:6ed5 with SMTP id r21-20020a50aad5000000b005727c5d6ed5mr3316397edc.22.1714401081561;
        Mon, 29 Apr 2024 07:31:21 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id g1-20020aa7c841000000b0056e718795f8sm13092186edt.36.2024.04.29.07.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 07:31:21 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Peter.Marko@siemens.com,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH v2] st: Update status for CVE-2017-16224
Date: Mon, 29 Apr 2024 16:31:17 +0200
Message-ID: <f55f1dca505d41fc4881bc35b100832ad23ffebb.1714399174.git.ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <AS1PR10MB5697E74837D812C45331A8C0FD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <AS1PR10MB5697E74837D812C45331A8C0FD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 14:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110185

The recipe used in the meta-openembedded is a different st package compared to the one which has the CVE issue.
Package used in meta-embedded: https://st.suckless.org/
Package with CVE issue: https://www.npmjs.com/package/st
No action required.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-graphics/suckless/st_0.9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/suckless/st_0.9.2.bb b/meta-oe/recipes-graphics/suckless/st_0.9.2.bb
index 5e0f2e71c..22ad0211b 100644
--- a/meta-oe/recipes-graphics/suckless/st_0.9.2.bb
+++ b/meta-oe/recipes-graphics/suckless/st_0.9.2.bb
@@ -33,3 +33,5 @@ ALTERNATIVE:${PN} = "st st-256color"
 ALTERNATIVE_LINK_NAME[st] = "${datadir}/terminfo/s/st"
 
 ALTERNATIVE_LINK_NAME[st-256color] = "${datadir}/terminfo/s/st-256color"
+
+CVE_STATUS[CVE-2017-16224] = "cpe-incorrect: The recipe used in the meta-openembedded is a different st package compared to the one which has the CVE issue."
-- 
2.44.0


