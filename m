Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19D6C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:36:41 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.28424.1719412593591200092
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=CyM9mzLP;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.214.175, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f6fabe9da3so55351795ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719412593; x=1720017393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2/+CaxwFSv7P0bxDjxUq4gTyjJDHWGm8cJQFOTrmxkc=;
        b=CyM9mzLPGwYu75p2S2h+avAsGQNzzeNhyGlMkL20+2ZQCsbmjRGnd2WC2823MC21B1
         k13adun2koYpu13JW29q+7VCagqaHnvPhaXjoZFeI0WXn1tW6b0bZk7SAxXIVSILE91U
         Q+/chxnnx3zA16PTdGMTbfMHHWtBpssWFtfoKFQpqkdp1LvtB3fxbrGleebC0rxPBmqQ
         I5DRX34j6CLXsvQOqPQALCJU5D3heN9/RBu1ak/HT22whE8BsY0dtlhEZr7ViHOawMEA
         URY5SFN57CazM+Ekw6/F+SvMILpZPvzw80pMBrj2ID2NHVaTZRv9tnMK3Z71qIY/0MNh
         DkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719412593; x=1720017393;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/+CaxwFSv7P0bxDjxUq4gTyjJDHWGm8cJQFOTrmxkc=;
        b=mLGjWhOjrvEjPINaU+O4DJxyuCFw6SgTD6oQUqN62cvv0kIwRU+fVQciNzkre1B96Q
         crOrHNo2/xEJwybZa23dtOuljec/NVEpoJfimfi2+aK8OlC9q9UB3c3HUrSDoPGJBSw1
         d5xVRRXWfTP2UyHyQLIs5M7yRsZGjwla3KxP3kbxmYiKN+wfdikeZM5qM+/oxYUFIji8
         TRwgryR1jqP382vuGnSO3nQPeblwkBMjL9EtnBncLMZ4cQU1x5DZvql4AFv+a8OKT9Lo
         14V/+2ghIqPPghxv8q3nc/d5E8aPsKGPzduqHEnJIbrpjPE7vBmCTLp0dfIoTwBCanKt
         jqeQ==
X-Gm-Message-State: AOJu0YzQf5NOt6B1BkLpfVKvHJKskatBDXkvtVQ+kSWgBiCsZ5js4qzA
	j48CNg0PoONQvt9G7ReADTKbXMT54/MrUqSb8GIJP9M/a94dwudI1IQ2doM4eYhAm5mttsCjOPy
	u
X-Google-Smtp-Source: AGHT+IHs8XUTuakb/ly/cJoUyngsJG3yqx3D49EHTrx2uPEc9nTvzloD+Vx+2jzeTrQsK+JE97lpOQ==
X-Received: by 2002:a17:902:e806:b0:1f9:d282:7a29 with SMTP id d9443c01a7336-1fa23ecd377mr119960655ad.24.1719412593008;
        Wed, 26 Jun 2024 07:36:33 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fa3229f936sm63871445ad.85.2024.06.26.07.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:36:32 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] links: CVE status update for CVE-2008-3319
Date: Wed, 26 Jun 2024 07:36:28 -0700
Message-ID: <20240626143629.84191-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 14:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111099

The recipe used in the `meta-openembedded` is a different links package compared to the one which has the CVE issue.
Package used in `meta-embedded`: twibright links http://links.twibright.com/download.php
Package with CVE issue: Maian Links https://www.maianmedia.com/

Ninette Adhikari (1):
  links: CVE status update for CVE-2008-3319

 meta-oe/recipes-support/links/links_2.29.bb | 2 ++
 1 file changed, 2 insertions(+)

--
2.44.0


