Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041F9CD691B
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 09:40:07 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.87410.1696930796698045469
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 02:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=To8MTZCD;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-32d3755214dso246954f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696930795; x=1697535595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O125sec/IcYFsb66agGOG04KDoY7xwOim3wBU8plccM=;
        b=To8MTZCDg1lMnDcJUJd3lsl3EPtwji7bWbF/ix6UphD1Znlfyj2u9KbTHj+ssyQAmV
         odLsUf9r1jlrQlq9EzOU4ivXFCnThnKUxd9vcZtXz5Pse4sv6Fd+jFT0hBBTP2csoCsh
         GaVmt0c/eXTOqIOmEETbki8uxYrcP3yDgJ9PpbPvFUb1QkCQ0UQ2Wv4kG0ok13mlRSG5
         01ay4dNmZb+7DFTbcJvQN2OHp/tD8mOWSfoI4HsJizfjS4PlSWai2OOc0z0uW1rzgEVE
         OQEdXdsOftkhq6AQjIh397He9cCVrVWqK91SiR7r6u/6KT0YwTejHLRkxXw9Iq9hGseX
         DViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696930795; x=1697535595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O125sec/IcYFsb66agGOG04KDoY7xwOim3wBU8plccM=;
        b=uSC1B3PzISE07O0i9rQzvwr4tsTBm2AyNYuWjq2/bUp3mT6eONit2Ju10RUqIEPYkK
         hpy2sAjv9Hc97ckJ8Kr3MSF9JtegpAZYhiXCzjKtAGpqYF3V93SCmd3RKKlvT5J538Ur
         0VDG2eVoJ7Dg+9Eu7Lw+l6iqcQTTnSKAVhpwtjR24UzLAloJmR0vVg4opnCAJlPbQ9/I
         lF6G0HDQcfhebp8aHcNCznjziQdHoZ2GORa1Pk+BLGfnGea3Ppf81jTPQLMjrmXxKI0K
         6XRKx74rG78pqXKfGUIXb1P6qPBNJppySvk+FrJovjxqURh1KlqNDOCXn2EN5xJzysXj
         ulbg==
X-Gm-Message-State: AOJu0YxUJa4tPPUI1Scu4Bt5HZPvNO8xV9pDDej4CmqwHrnwtBEE6XUn
	I0vT1NwXgBM1ptuA8TUGPsVvibmBadKsiMf/MmM=
X-Google-Smtp-Source: AGHT+IHY7+UdM2ZkloqddeaTcjulEOW+sSg5ZtopCE4nqd8l49TVYLqe9LHdZWX0Us2jueW1T4LeZQ==
X-Received: by 2002:a05:6000:5c9:b0:329:69b4:c0f8 with SMTP id bh9-20020a05600005c900b0032969b4c0f8mr12349088wrb.26.1696930795040;
        Tue, 10 Oct 2023 02:39:55 -0700 (PDT)
Received: from p-nan-fatho.home (2a01cb0584747e00ad7461ecf2f04d44.ipv6.abo.wanadoo.fr. [2a01:cb05:8474:7e00:ad74:61ec:f2f0:4d44])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d68c4000000b003232f167df5sm12150639wrw.108.2023.10.10.02.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:39:54 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Fabien Thomas <fabien.thomas@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-webserver][PATCH 7/7] Add static-passwd and static-group files
Date: Tue, 10 Oct 2023 11:39:40 +0200
Message-Id: <20231010093940.75037-7-fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010093940.75037-1-fabien.thomas@smile.fr>
References: <20231010093940.75037-1-fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 09:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105403

In order to pass reproducible tests, recipes that use the
useradd class must have static ids configured.

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-webserver/files/static-passwd-meta-webserver | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-webserver/files/static-passwd-meta-webserver

diff --git a/meta-webserver/files/static-passwd-meta-webserver b/meta-webserver/files/static-passwd-meta-webserver
new file mode 100644
index 000000000..028cf8d94
--- /dev/null
+++ b/meta-webserver/files/static-passwd-meta-webserver
@@ -0,0 +1,2 @@
+www:x:690:nogroup::/:/bin/nologin
+netdata:x:691:nogroup::/:/bin/nologin
\ No newline at end of file
-- 
2.34.1


