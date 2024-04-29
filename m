Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F2BC04FFE
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:07:47 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.17950.1714388863015973879
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=E5JqZRbJ;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.181, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2def8e58471so65556321fa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 04:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714388861; x=1714993661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l8mWtREBBHabT70yrA//cOKgqChi/CrejAhKK6HLaRA=;
        b=E5JqZRbJroxPBl2L+90H8a9YBQoXRqUui5NkQ1Vb3qgDk39v4fRZQTcri5ReE3l/qb
         Y0hd+RkyTM1NNFURjOQvcYpfCANJtw2Xu/LAYMkMiYosaJqmxf2tk1FRprXrg+caXqc3
         hB+MYU5RhDWuV96JGIibpRJPho7ek2PSx0rvmmjjKsTFjnsGLlCZ0I/0QoPT7U3hlQ+K
         SNq/ykrCwr+thFgyM1JxOHteqs5V059ooEsydkAZC5Pm6wdGejO97PwChi8k8Nq7LHJN
         Di6FaVEheaoDPxfOqLrtwlgk5+yY3YBVKYK47AYReSBh9mdNX/EkxKuD1UjibuFnpD5C
         Bk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714388861; x=1714993661;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l8mWtREBBHabT70yrA//cOKgqChi/CrejAhKK6HLaRA=;
        b=W01HyOiuh1LbzDMrEYaNqjXGx4URS2QE0iORtAFCewHhi8hyqbsxV7RinmJz9Uxemd
         jB8w/hLzRLcAv3jtJnyfxW4FiCd0UoSW/98VsRJkqesGBoYFOrrQWn86IH3YJlooDZkE
         oBQGiZCJl8mCTcmiRWE7TZplw4QOk8izVgtPNDMykdsbgEA8Aye34POTYQYVkZ8i6Ih6
         MXps06q8CRf5NTyTjJ8uiXxOU943IdYS5UbtPIja1t28Iz8noZZIeSCHayzZ6oBlP1aM
         HuOy0iTPZ6Gdy/TxlIJB0PFNlmhj44BHi8IPyJtLofhzxt/TKYRo0+r2MQFabK4wGfB4
         ZmHQ==
X-Gm-Message-State: AOJu0YxxKxgmAy2c8YjdGut1jwPlnJxa/Sp6ZS1hjRKhV+C8tAWWQaxn
	fgZ3D6KwcLJUaqAxeb+BD86NXkRspC5vQPrCS5XpvmW8QwuU+trhDj5AOkKSTc6UebC83fpsg4Q
	bO/g=
X-Google-Smtp-Source: AGHT+IFSSgUyacExrUl/e9jOLScFyoBdqfJxeE08vTS/n2oRQe32HEiWCLJ1SMmho6wM+3dz40XD2w==
X-Received: by 2002:a2e:b81c:0:b0:2e0:6740:112b with SMTP id u28-20020a2eb81c000000b002e06740112bmr1866890ljo.47.1714388860370;
        Mon, 29 Apr 2024 04:07:40 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c350f00b00418d68df226sm41907683wmq.0.2024.04.29.04.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:07:40 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] mpd: Update status for CVE-2020-7465 and CVE-2020-7466
Date: Mon, 29 Apr 2024 13:07:35 +0200
Message-ID: <20240429110735.54205-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429110735.54205-1-ninette@thehoodiefirm.com>
References: <20240429110735.54205-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110173

The recipe used in the `meta-openembedded` is a different mpd package compared to the one which has the CVE issue.
Package used in `meta-embedded`: http://www.musicpd.org 
Package with CVE issue: https://sourceforge.net/projects/mpd/
No action required.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
index a762fc832..90211bd29 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
@@ -100,3 +100,6 @@ USERADD_PARAM:${PN} = " \
     --home ${localstatedir}/lib/mpd \
     --groups audio \
     --user-group mpd"
+
+CVE_STATUS[CVE-2020-7465] = "ignored: The recipe used in the meta-openembedded is a different mpd package compared to the one which has the CVE issue."
+CVE_STATUS[CVE-2020-7466] = "ignored: The recipe used in the meta-openembedded is a different mpd package compared to the one which has the CVE issue."
\ No newline at end of file
-- 
2.44.0


