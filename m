Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D74C4707C
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:43 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.218942.1704025420485474894
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gcxTZm3Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a271a28aeb4so421236266b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025419; x=1704630219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gElGiaI2qWJZ9lxLPwjndkZeIXhQw/1/m6DM6s02IgM=;
        b=gcxTZm3ZLskWA3hhY+ovMPmofHwsYNQS7k3dWYOTCj1YkQfsZe5UNeSXp66gmi+nMX
         eCV3bgINOQm0nfz0zkB7EsekA7lSz+B3AeYnL1IBP3kLUTH4jWNswYH1Wb5l0CGVLEg9
         XJRsUVdU+cuUE8aCRJNX/9aImvOrONRhlOBYVweDWP3hqan9nXnR53j6BFpReOzgKfHu
         +28c3GY8KC+0MSb8Xr4GdmaiyR2y8Xdh2IGEfzjAmwwCTuhFwhgsksVQOqVQQq/CGpEa
         uPzdViOEjoANav8gX60GN6TEQH7CiGhoB7KNj7lBJQ/9yQD/ASsLlHkPogCoV/GOCBbs
         domg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025419; x=1704630219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gElGiaI2qWJZ9lxLPwjndkZeIXhQw/1/m6DM6s02IgM=;
        b=Wk35cf+mF347PQQmGEG/FEoWgEi45aqTzpmgIfRbMtp843J4lFc5r8xhiLJ8RaCUqG
         cNurwmg7bNa9ruhuLbxAMqZPLQKSswIY3HXMWQA2XM4wVH8gcJCkAkW9uU8q/nb2FkKk
         2amTls46o0FURyVCGccAjtY1TpC8XAW6eN8N2zARwqd+VmyCM7rw7GJPQYzkSBSQtTV7
         Zi3EW7zM4nWFsVDpsu6kLcJvxK5I0cIsN6QoNNXK62JxwTWenigOlxcP6OIQYF7mTNGU
         3hIpk95sBkJdosaIKQvinw+zcFlukxLMVHZMYWvLXoYIWj7UWNP6zlrivfiI9ITiC+0g
         WPFw==
X-Gm-Message-State: AOJu0Yybcpiz+69nX365rRAlQJM3QaGScbz6TEuIkw9BbN3ghP9c5nZJ
	f+lS/EP0abDzRMJUfCIJ6BTsWqxgseE=
X-Google-Smtp-Source: AGHT+IFBfRt8BnphplbNepxYrMpx+017tgKHczdPOo9XunTr44s26/G3oei9dGqrTOCbQdzooYD9oQ==
X-Received: by 2002:a17:906:440a:b0:a27:a507:a179 with SMTP id x10-20020a170906440a00b00a27a507a179mr1302095ejo.83.1704025418997;
        Sun, 31 Dec 2023 04:23:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/23] mycroft: do not depend on python3-xmlrunner
Date: Sun, 31 Dec 2023 13:23:12 +0100
Message-Id: <20231231122329.405225-6-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107957

Nothing in the source tree refers to it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
index 679789980..444bc1cf3 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
+++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
@@ -61,7 +61,7 @@ RDEPENDS:${PN} += "python3-requests python3-pillow \
                    python3-xxhash python3-pako \
                    python3-six python3-cryptography \
                    python3-requests-futures \
-                   python3-xmlrunner python3-fasteners \
+                   python3-fasteners \
                    python3-python-vlc \
                    python3-padatious python3-padaos \
                    python3-petact python3-precise-runner \
-- 
2.39.2


