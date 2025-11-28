Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EA7D116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:19:01 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3260.1764361133233036397
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G10PCt4A;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so24702445e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361131; x=1764965931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldfJNaW1+PjFj4wYgqXLxIi8RkALTMjExhYM11NIAOg=;
        b=G10PCt4AjLS0+K4gpXig35PZSS9Je2nCANgA/8mQfflVpEm3VhYg5vflEP3I7Q4dzW
         360dDl2wefKfOJ+d4siG4ww7DfFZ+wH3B+Qd1f1jERVKHqIe2pM0GciIraYc38XOGk2Y
         /j1sZ8grup+NdQL+506jkdo2YASFZgtUKx/7WZVeg+WvJHpXdjP/zfgmF2vWhsrmQGiS
         YoBimEsDuS/SfTlWEihW/+s7BoqmS5BIEMtLBGp90ZqcoeQIdj0CmsBk7wgUQfpDNm1L
         g8gGv7ZpzdjzRD/euklUoj115Iqx28umedzTU41XGSRqd7WGh1S/J5ksIh4Xyz7/4LUb
         GISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361131; x=1764965931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ldfJNaW1+PjFj4wYgqXLxIi8RkALTMjExhYM11NIAOg=;
        b=RxzsOGhkHlkIZe9/cFYmHCNds3xamzlnNP7eMlmdCkVSWm3bbncz4V3oRJrRgGTuN7
         4ZP34NHZGzaw5mhmCJXUyFxZ7MzhOH5V125xOggtbb+kJxXnsN4xwaLPjO+CiPPqQqps
         7cQEziB5l9ifCy4bC9zlpqtzrH9XbJxqKIfAfkz6KUwqx3wa9YR+/LW8fBLm/Qci8XKa
         POlEmhvbJBI4+LfzlJX3PoKIPFJHZpTYc7+gcJ3o6mSNhtbf/NWIX6nL5yJJDN0XCsfF
         8UNNNbHuTn3vg/HY2ylXB9hge5XYhTx+itUAXKMv9aCBLedatdj1L2HVbRfplxeIUou8
         +KFw==
X-Gm-Message-State: AOJu0YyGLtHt7A6w87wzXG+yRn/LWrJ7NG0ofxsP2AbBJSLamm63BFQT
	jRuC0PVhE37QlRb1u3KoTx6VNRcG3xn7jMQapO4lRyJW0Y6WegaFVVmVAcaFFw==
X-Gm-Gg: ASbGncvTeR9Vp7B64MBZxvxziXhgIuCBSdE8tn8OJgQqXX/nSIMEUcz+fuphnU0xMmr
	tIBOo4wPAuAmKkHAaY6W/GYcQGuAzlhOP7V7bPpqN7cqW4+5FLti2vbRQ7x3jTyMW2xSr539rG8
	H5M478rNR1aFvqxrgf5VyNArVd716/U9TYYE5ipDHwpdjnhDcVSRV2LxHHaDIoauyPYi6UznlEj
	RU2UHYm7C6RE6ZfFi4wJ4svXpZUs7LzELo+E+bXY3lJX1y/npXjN6TWarIBNK2hoSlsqA9pAn4y
	D1AyW8XO5Q8eofmBgK5zRTun+sExWpFcmHrACP70taB9JTh/60ZJU18YB1DukUtMfdT8xOkYwmS
	WjD0T1Z+PUwZGldReq4HLQEA3CjFWs9/DKLJgdspz6mlje9Ze7bFB+OFPOhssQ4iMOjZfwsGaZx
	TKgKzbY7pZ
X-Google-Smtp-Source: AGHT+IG7Nk7x4oqkFCYjjNX5yl5RXzaj6A7zDISq18OzOUJE4pomyEZnMPSH/+olOYEr2X8GwzxOsQ==
X-Received: by 2002:a05:600c:3b11:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-47904aceef6mr152956515e9.5.1764361131489;
        Fri, 28 Nov 2025 12:18:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6064sm11674324f8f.13.2025.11.28.12.18.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:18:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 09/14] libraw: ignore CVE-2020-35534
Date: Fri, 28 Nov 2025 21:18:40 +0100
Message-ID: <20251128201845.2578315-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128201845.2578315-1-skandigraun@gmail.com>
References: <20251128201845.2578315-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122141

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-35534

The fix is already included in the currently used revision.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libraw/libraw_0.20.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
index 41aac581f1..c7e83c05f5 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
@@ -16,4 +16,5 @@ CVE_CHECK_IGNORE += " \
     CVE-2020-35531 \
     CVE-2020-35532 \
     CVE-2020-35533 \
+    CVE-2020-35534 \
     "

