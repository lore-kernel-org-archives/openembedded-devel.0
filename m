Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7D9CCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 17:16:08 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.6131.1760030166297860412
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 10:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BJzkTPjk;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62fca01f0d9so2329438a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760030165; x=1760634965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s4KVcA0VUNfh1ncA0W/kHCln6tR89UAOhB/kyLDjnnc=;
        b=BJzkTPjkWdeFTCOKXTRt0ni4U6B/tRhHUC64/0JrDA4anvmI5YloLUoTpf/kn3T3yF
         w4A+ZVZZlEpmcvTTzMD1mFHPs8IxTu+9IKU/QfWhAeBXY1EPnlw9a/2novIOaRLVXjP/
         oGyg2au6i4Pjhmt+834v92uzWLVrZYxZnIZJ9bu6VLEjw6O1NCbEAOPbfRMIOVahktLQ
         7DbDr1vYRrWFDTOU3Qi4bfvQuzGw+SQ+jEaSzblS4243CPlOneU3jD/KL5W6fEtN4UuY
         MGU5paYLraQsvCzDvjAwk8KmyHBiqUlvh4twEg39Fk9njfbFTmTcO1Bh1+oY2jCiil/w
         aiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760030165; x=1760634965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4KVcA0VUNfh1ncA0W/kHCln6tR89UAOhB/kyLDjnnc=;
        b=OccaChOZ2KneEWLjSjqDSUX5yM8g5xUhzfqWcvEije5AyDfELLh7R0B/Kw6IiRVO5A
         sv2IU/VWCus1SrZw2Xweixr0T5cUZ/qtm9UYFPgs0UxUw1zoyLR/En32JZpkcV9Y13ZA
         8dS0OgK7cQtMNIJY7NHHvrbDcO5CrMVdFI4F32epWjVbVx75VXyF62reMUHWxdePrtxi
         bHb4lF3wlB9Xxs1THUTd9YEKbCogdgv8jn2DEqtNFXza4/uDYPiMpzEsFXJ6iGcxOnhj
         f1HKR30otdi+tQ3HwmVtdHZm0w4gw6oCcIC0wHoY4SYr+yHX5hJ8zU+L6L4j+mt532qa
         jE1g==
X-Gm-Message-State: AOJu0YzW0i+qpwE19lC262S3rYz02IWdsEoX3s+c9zD1vcastfwvWf9M
	kPCwvUfeUu3dzNqi+899YU9sLRFBNV+pBPZjqeCyi4aebc2Hy+rx8/gXwKMnDA==
X-Gm-Gg: ASbGncuhPQOO5LwFU5923ZncEx50RtLgLPD5JHOs5JM2dpP71b794BVBBBpw/7RBKJb
	ZPU8TOioKbVFP1LgqYN+uM03gkdOOjsbiN+GfkMJ3TiA7/NQHhgf/+YncGLs8I6MyTzK9ijSCMA
	UIn/mpSFHmjXNVFGZVTKxng6uE0e1NOf3iq12IQJdiAUAt7gLfPHSbZ2kfSsOip/jqekKpvrgbp
	zEWI9CrAmnvcfTzvY9h5PejaXAlp1EkB9Aqd8rAPUJ27aQs5uYdKy4iwkYmorMzFlMHfRcfWIS6
	SSza4nNxFjs6S+whrdpt7ES8cRXmevRmUmQ6/doppHbUSF6iS4EOj8yDYaazO9vamOLwWzPo3TK
	kmnCBf2D2CnM1k6lY62qpTuTvRw6v8bPU6MrXIl86eiZr
X-Google-Smtp-Source: AGHT+IEKa+ScTcSvA3o10En49eJ+aP25l3B1IusKKyn05LxvIJcVT2z36AzsrFozWRQqrkSihh3rZg==
X-Received: by 2002:a05:6402:26c9:b0:639:dab5:d5e8 with SMTP id 4fb4d7f45d1cf-639dab5da69mr7654718a12.12.1760030164604;
        Thu, 09 Oct 2025 10:16:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c134062sm204000a12.36.2025.10.09.10.16.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 10:16:03 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] iperf2: ignore irrelevant CVEs
Date: Thu,  9 Oct 2025 19:16:02 +0200
Message-ID: <20251009171602.6543-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 17:16:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120435

These CVEs are for iperf3 - which is a similar application in its goals (and name),
but an independent project from this, and the projects are independent implementations
also, they share no common code.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aedf74e08230f60c270032e8b937d1ab9bd2fc9c)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
index c353ce02e1..9341bb3c2d 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
@@ -20,3 +20,6 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 CVE_PRODUCT = "iperf_project:iperf"
+CVE_STATUS[CVE-2025-54349] = "cpe-incorrect: the vulnerability is in iperf3, which is a different project"
+CVE_STATUS[CVE-2025-54350] = "cpe-incorrect: the vulnerability is in iperf3, which is a different project"
+CVE_STATUS[CVE-2025-54351] = "cpe-incorrect: the vulnerability is in iperf3, which is a different project"

