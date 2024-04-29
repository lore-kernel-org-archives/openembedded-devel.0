Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD3EC25B10
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:02:17 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.17868.1714388535683907572
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=0A0Hr+pW;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.52, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso588735066b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 04:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714388534; x=1714993334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fu86/5tF/U3yL0zdmRPXOKsvu/fCSdarhrY0CJWrqUg=;
        b=0A0Hr+pWxIstXMUfYMYZpfnPBHw20MlNYAQyJK86GplTOm4pl9UxwE7dSGLhXw0qqs
         8H/dztXUISFvtyg2xMou4Vr+YobOuR6IyTMJLy7Unazw5UJ2Mh8ZB+ECZ/5GmCtbCTe5
         3OKARdf79V8JBN4TI25rAQcuoSYDrlnI8x7Q45/ILrxOVyj9L9KFKkoo0ifQdWT0ABmd
         zyMLcqvIL+22kl8/syiB16xQwAjPi/OAbCir112nQvH1MTBnR1NYmesZbrmFRS/bTaGo
         wOj6J9MpoCKT9zq3a25QVBilEBiz+Lvn3hAyqUH4/Ds13brwTDDS76Db61P6I6v78TWp
         G4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714388534; x=1714993334;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fu86/5tF/U3yL0zdmRPXOKsvu/fCSdarhrY0CJWrqUg=;
        b=j2HxZ2SD3UPCwEF0hCslaFXkejYz4ArxQAdVCNiGNFaU+ekg9/QLfjUisfeFOqQz5v
         +IjAiRpMZWZFOKBWdLCiOLPQC/WEJ28d1V2zingXXNem6LcarZnU2Wfcy4rywJF+vGY/
         WG8TP+ftmuOh29dsRBCXaiDO7zmsxg3GufrXCYIF2kwyQu4MRGWXpX+ANadrBQETnjNm
         KdD5LFFuN5UHdXYz/z7PGuAUeVAkcySc/V8QdEIRy8V/UfYJaRLvz1vpqTqwtgNCYCQd
         C0ViKu4A1Bg6W9OiWM7ucLkOM00TKW8M0YfKfuvcAbLIldE786FlEjF9f3eUuDR4vU6a
         MO5A==
X-Gm-Message-State: AOJu0Yx83LdYIXRBau064qR17bKMSX4iOM6fk6ZFFxO9aGBK0uDo2Wsq
	nVdmMO7krdc8dprSghmJWcWhPjS/y4n4KLK0kB+7rgE0ajbwCWdrNdWKjGWP+EQqxWWajFH4K0h
	KfV0=
X-Google-Smtp-Source: AGHT+IGDtb4lJop1Ks6yV8EltNa7FV8/J80CEmPM+3UuzHgbgxGIuYSat5YqE3WX+nwgYYCsWC/OoQ==
X-Received: by 2002:a17:906:3896:b0:a55:b7e3:8bf7 with SMTP id q22-20020a170906389600b00a55b7e38bf7mr6923530ejd.18.1714388533972;
        Mon, 29 Apr 2024 04:02:13 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id mc11-20020a170906eb4b00b00a5256d8c956sm13733353ejb.61.2024.04.29.04.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:02:13 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] st: Update status for CVE-2017-16224
Date: Mon, 29 Apr 2024 13:02:07 +0200
Message-ID: <20240429110207.50187-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429110207.50187-1-ninette@thehoodiefirm.com>
References: <20240429110207.50187-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110169

The recipe used in the meta-openembedded is a different st package compared to the one which has the CVE issue.
Package used in meta-embedded: https://st.suckless.org/
Package with CVE issue: https://www.npmjs.com/package/st
No action required.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-graphics/suckless/st_0.9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/suckless/st_0.9.2.bb b/meta-oe/recipes-graphics/suckless/st_0.9.2.bb
index 5e0f2e71c..984695a31 100644
--- a/meta-oe/recipes-graphics/suckless/st_0.9.2.bb
+++ b/meta-oe/recipes-graphics/suckless/st_0.9.2.bb
@@ -33,3 +33,5 @@ ALTERNATIVE:${PN} = "st st-256color"
 ALTERNATIVE_LINK_NAME[st] = "${datadir}/terminfo/s/st"
 
 ALTERNATIVE_LINK_NAME[st-256color] = "${datadir}/terminfo/s/st-256color"
+
+CVE_STATUS[CVE-2017-16224] = "ignored: The recipe used in the meta-openembedded is a different st package compared to the one which has the CVE issue."
-- 
2.44.0


