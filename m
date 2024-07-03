Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820F4C30653
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 16:50:07 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.55366.1720025404242603675
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 09:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=P9LN6986;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.210.175, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70af4868d3dso459057b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 09:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720025404; x=1720630204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VtwnNM+KF5ej4sMqbFqKKZJJUsd3GskenzTzw+z9aKk=;
        b=P9LN69867CX0mkuHAya+v1U+Uql0fnK5jW+5Bll/2JYQ6CV9xik4m7I6gq9Ht/YaIi
         dIqlvQCeTvVN2M0ntXLQHJvzuqIerqsyPp1OD6V4kgQ+YbttX9xZXAWNMA4y0c3F5DdC
         xxWRBpC3R6SXvZ3vIGFd8m0iMVf8HlVmYzAR47Ipx756nq0AEA1TFKI7KySOa7P897Yk
         qTD2K/ofNGWAUX3sIEmvYadF1YFRvuJJPUOgXdBbDw4XnEA+1QkGrazWfCLIUsNXlIzw
         gjy1EMLZjgDr/y1mRIC1z6NOsEAoLapn+tpOMULUKNEjvGe+LegnaBwVDwSW2Bfs8iyb
         1vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720025404; x=1720630204;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtwnNM+KF5ej4sMqbFqKKZJJUsd3GskenzTzw+z9aKk=;
        b=fRmys9CdtKcw/wUOt2WOueDDZZ7AR59blntVa3VGLhuiSlDG9CNR5mU4lGp4luzlCq
         FyZ8iN5f3QQTYRro1DEWT/Vw6Pt1vnp5bX8SWQlGPpfoQKCG/TA5EhmX8sR0PpPQcrAC
         UJf3yl5h4iFlnZ/WnurTYBmslne9pWTfVHRS+faImAJnvXtH09/CKDud6SNM4yfHSzgI
         Pa8HJuBiZQ598rHHBdwur0PVHYnfMZlOxaUM9JMZ6RlHRu7fwdoxefe2SU+6PtUNwPAg
         TzoMA7nDkM7LInj2KQekW3nPnpoyqOWd29vzA6famSA+V9eXaNTVb2dbKHP+sE/ftSks
         w0Qg==
X-Gm-Message-State: AOJu0YzOF08WRBeRoeLdDK+IW98cqWs7lJWt7ZNdduGPQndUxxQ99fJx
	92cMN101/0yEmyO1XfVy1N3gzI7YdhxOaVLlP+gv5iTP2wS3Zrzt6eqNU55MU60hxrW756m2HQ5
	4
X-Google-Smtp-Source: AGHT+IGkZlIV/pSHx1rir+QxmaQb5MKVFEhj3qQSqNg1AFjuzvL3jbQVZMiCkE++jUjX6sMwJ7iFTg==
X-Received: by 2002:a05:6a00:92a2:b0:706:747c:76b6 with SMTP id d2e1a72fcca58-70aaaee27cdmr11156712b3a.22.1720025403693;
        Wed, 03 Jul 2024 09:50:03 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708043b76a5sm10991116b3a.149.2024.07.03.09.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:50:03 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] gimp: CVE status update
Date: Wed,  3 Jul 2024 09:49:59 -0700
Message-ID: <20240703165000.28528-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 16:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111232

Update status for: CVE-2007-3741, CVE-2009-0581, CVE-2009-0723, CVE-2009-0733

Ninette Adhikari (1):
  gimp: CVE status update

 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 5 +++++
 1 file changed, 5 insertions(+)

--
2.44.0


