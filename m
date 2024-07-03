Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6B5C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 16:40:47 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.55972.1720024846171099910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 09:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=Ozj/ZSYf;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.210.175, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-706524adf91so4545806b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720024845; x=1720629645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f6rF1h+Ix8tTI/+rW7RMCjum692ZF49KftX3L84Vq00=;
        b=Ozj/ZSYfUiM2XGYGeV92Q1EcJSuEh4cDL7K2fJIuqqppjuMZotBi9kNrJMQj8h+/T7
         yNBDDhzqSJl5E1L6TrMtdjh7Ha+DKYEtnsEmiTDZTKlqkFpehi69wbRWOmKaTRsMesyP
         w8dcb9lUgMWk8qyX+55ziSlqvvavNqdUB0pUYEHk4scymYCdLfYYOn4Hx5R40EdKBcMB
         1vGZj0kAl5j2dnVd3ciJZxroKEFTw3TXj64E4X6befwD35e1bL97aqIeWWnQXchy6M1e
         j1tGjsF84406llp9VobdE0uLcNe79NMRkOrbCH9xxgewNhDKCTPupgaPD8TJc388V84Q
         JY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720024845; x=1720629645;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6rF1h+Ix8tTI/+rW7RMCjum692ZF49KftX3L84Vq00=;
        b=iI9MXhygvfoX+W1iTlPqqMgzcaaNWA/X7doO0SYUvsvzsBUr85Ec6O4Z9VBYwg4Thg
         zArUd3tTK1pWFgYYrPg8Qe7SslDcU1Ez6fPM4VOgGGS7rPTsqSPISjJzvdUdK8QtMPcF
         77jRTXg2EBcURfVUcjxQw14+Yoe2aZWfIU0YwdHBygmcSlo7vCIQSZ//Yz9qvV+vCTTK
         DBeRlIVNDuDjN9QqIRcN+4ltlzjMI/1DHGaPJqHztuuU8Wcr8CgDsd6f5W8UaEhiFBSZ
         ETf1UO01JB8EDeXHCqjt+43BdBb502g1mKadU+363C87zHGuFWLltuK1e/Zmll8Bx+Jr
         T+kw==
X-Gm-Message-State: AOJu0YxK1Yx+JpA9+UwCJZrbQZvWLHaO+zW5Z+ovJf+TFVzK6qNxQjsy
	IaiIWk2wk4FmfyRnGwhmOuZa6MvzLxBMQeF/O5P7BJfRXb9RVIFjBAmvZ+7LzCDuZsKVR+QpKTy
	R
X-Google-Smtp-Source: AGHT+IGo3mhH7GVknZ4fHbeFaLpZknejCNVsa+OCnZTlMlM0JJjl14PwR55JFCjV56hBw0+X2m/TCg==
X-Received: by 2002:a05:6a00:9290:b0:70a:efd7:ad9b with SMTP id d2e1a72fcca58-70aefd7b02amr2145172b3a.17.1720024845564;
        Wed, 03 Jul 2024 09:40:45 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7084d7061a0sm10356982b3a.219.2024.07.03.09.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:40:45 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] apache2:apache2-native: CVE status update
Date: Wed,  3 Jul 2024 09:40:41 -0700
Message-ID: <20240703164042.20929-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 16:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111229

Update status for: CVE-2007-0450, CVE-2010-0425

The current version (2.4.59) is not affected. It only applies for Windows.

Ninette Adhikari (1):
  apache2:apache2-native: CVE status update

 meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb | 2 ++
 1 file changed, 2 insertions(+)

--
2.44.0


