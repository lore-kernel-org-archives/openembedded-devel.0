Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8D2D33A43
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.27715.1730831881511307522
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CoR3x2uK;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e5cec98cceso46349077b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831880; x=1731436680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VNNk1H64lyxXvx5shn2Qy3SLQvUIA1TlFhiV3rKHtI=;
        b=CoR3x2uK3HU7CKgqhN9MrqZQrPVTA2dTuzrHg1PhsKz5HC18YdCQD8Jx8fqpj+ov8G
         hwxYp53Fd7jHsOSyA3vGaASNsYA40bb9nwPWDMJMps3XUOjaJwjw5QnNs+Nh5Wx7Zk3P
         Sr8lXYvHS9yHsHmJNquXnFXyKWs7UvqOmD5vRxSPZ6TnnAm4R1V87zVDgp1dOyQHmCCM
         favduxwqMk7tIoakceqZon5OCru5dNGgQTjAf727UAG2jNDhQZa2oUWB/ZC6ASUp+Kip
         Ms1jkY4Nii8Pi9QoPSPcE6E7AopU0aBsgVA84cUEa9KBQbelEJlK5RrlJGmDKDBDRJ/V
         Ua3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831880; x=1731436680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VNNk1H64lyxXvx5shn2Qy3SLQvUIA1TlFhiV3rKHtI=;
        b=XhVPgpUAgXMgYZhN+ytaC1sh7ZJfFVPpYJpSOjbKO04xpxlMvM79HY3XTn5f7z2hQr
         ZEtbE8SlPXQuFRO+aqN6RzmPBq8l7M6o2Lk/d0J08b3DQnVMvJPs9kgVhQMZ0msOZGV7
         WjUG7+Hwvk/GtNGT209VOVvSxJaPUxFqxC2w3uxi4kFejlGdm9w4xlZDfnjS2CBpHC3+
         SH9OxMcxsRlzFp9Zax5kcl71DvFH+LdycJsj+BVQvT0RXdql9fZqalE77AL1dsuNaUNm
         Gsq9ChzIema2Hu7R9Nk0oVF6J/xtLkhKlvYQMxwMyZlHtVUzsE+qGAFuNJET10oVvTsQ
         FDuw==
X-Gm-Message-State: AOJu0YwkBIAtsVjXHJIPJd1QzlXgtKwSetbJtcNF5yZ1psDK+AM74A8g
	/kMYIXRp5gfYe7bUWIer9piI//7OlSmK682Szr6uZOjPzzJdXZPkNEctZa5g
X-Google-Smtp-Source: AGHT+IG/3+yf0E4NAv0lsWwiyoh9gGpeVTf/bvqIqC815Op6gkXDpanJvkcYJRBMwsXZEZLMI69W6Q==
X-Received: by 2002:a05:690c:4d87:b0:6dd:fb48:118c with SMTP id 00721157ae682-6ea52525befmr215071867b3.31.1730831880218;
        Tue, 05 Nov 2024 10:38:00 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:37:59 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 004/161] dhrystone: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:40 -0500
Message-ID: <20241105183658.34982-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113519

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
index db4377f53..4cc1999cf 100644
--- a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
@@ -6,7 +6,6 @@ SRC_URI = "http://www.netlib.org/benchmark/dhry-c;downloadfilename=dhry-c.shar \
            file://dhrystone.patch \
            file://dhrystone-c89.patch \
 "
-SRC_URI[md5sum] = "75aa5909c174eed98c134be2f56307da"
 SRC_URI[sha256sum] = "038a7e9169787125c3451a6c941f3aca5db2d2f3863871afcdce154ef17f4e3e"
 
 # Need to override Makefile variables
-- 
2.43.0


