Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194B7E7719D
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:17 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.48451.1736119452407576362
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d3OnplP6;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e53ef7462b6so14220666276.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119451; x=1736724251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2CcRy1Dt8xrMfPf3YNrJYqwv+54cKHmiJFugWDD1uw=;
        b=d3OnplP6T2cHZNdTAzlPuFQjdQ0+5N103R5mXkDkz2ZnHK9+vywWZqpf2c+vyBxMkD
         3nC0vIE/liK8NXrCdXG/KDsa0AKa9czegyxtW4Ign134JBkvSa4xiV9gTrRli4lKfKPO
         I6z2IX54F+vqcijFfLDoRr3x7RLnpWeZC1Pal8j1bJCLNN4y34pU1Lg1AJtLZ9sOpN0d
         Ex+5269MgwVtYQh+dyYWvFKfn5DpulTwOyJmCIlIRSGOmsHOGuZqYzFiIaQYjrLEG0wa
         oajdYjW/CMFvCvgZBk1C5kR6nPk5TYZizuPix0wDBXUElyNJ8CCYJQDwDn9RCpzGQcAk
         xhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119451; x=1736724251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2CcRy1Dt8xrMfPf3YNrJYqwv+54cKHmiJFugWDD1uw=;
        b=d4qv7jcseonLih4894bnGn88m6Jx5W1MPCfdi1lZAco+9YTEl2OLSHKx92TsFdVI04
         uVfsqlGEz8F0GOLAjY1nJq+w6PwU54BVxcDi9H6oP81i6Wn+MxWhop2wjkCXCHHT/26o
         LKaNmYJyX3duz8QiJwcOW38RwFQtqIjCzyYI/irSrpj52NQE6CpJ7TMNns4F4JZ7lWVD
         ifD0FW1i0wkdwXDgPYK28Y9CxOqsiWsG7pVBf4aVO1QvZUhjMT6aAyfzw1/Fa5ZHHMur
         kFrMzqAqERbKlB2H0Zn8vFEuN1K4kep0k6d8g99EmzM8k8MPqfQLG9KpkaI9uf9km/CX
         35qg==
X-Gm-Message-State: AOJu0Yw7jDmqyQNnvzQ5nONiiJMuliqFKYDaw54AdDWrEgVoh+7yHAIZ
	4q61KU0r9+9BZ5QGbcpvTeSoGx3tmRQEMjXNBJmGuQfgNlpR5fazxuyzriZP
X-Gm-Gg: ASbGncvCzMI29zST3PWnZDHeW2Gjbbe1u0AIi3W6coKq1fhEm5fpwLAdnCRO3vX3l8s
	MZsDJrkZoQz5Wo/jVl/Yy6junNjb+inuJqnGxSUL5iQQehbdUWp+q1+/jIXHlSsWks2mC0bYkF1
	CqVWuikrDsQ/LgmWC1CjKbzSkgFS1r87+vDRyRmFfVngx1W0jcq0Plp5sGuojvRskMb1IrWIKUx
	E7VT3NaVRsB9TAwlSo7iOArhJvRUsSRyxdB95s8px2k/XatRSyHpQ8OMqArhdowMYMKzg==
X-Google-Smtp-Source: AGHT+IGNMsGf3g3HXBzYpDFWexN7BIoWoyUbH0koRKfL1Hg9kmZICNG7qe3mlnFwyLr2Ljisi9EsLA==
X-Received: by 2002:a05:690c:9986:b0:6ef:79d1:2f69 with SMTP id 00721157ae682-6f3f8213f2fmr461065597b3.31.1736119451518;
        Sun, 05 Jan 2025 15:24:11 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 19/24] apache2: ignore disputed CVE CVE-2007-0086
Date: Sun,  5 Jan 2025 18:23:52 -0500
Message-ID: <20250105232358.1502946-19-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114649

From: Peter Marko <peter.marko@siemens.com>

This CVE is officially disputed by Redhat with official statement in
https://nvd.nist.gov/vuln/detail/CVE-2007-0086

Red Hat does not consider this issue to be a security vulnerability.
The pottential attacker has to send acknowledgement packets periodically
to make server generate traffic. Exactly the same effect could be
achieved by simply downloading the file. The statement that setting the
TCP window size to arbitrarily high value would permit the attacker to
disconnect and stop sending ACKs is false, because Red Hat Enterprise
Linux limits the size of the TCP send buffer to 4MB by default.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit da2b5e8b93c248363581b1bd4ff67ff1d8357c41)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
index 3a988f2494..bba00fb95c 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
@@ -40,6 +40,7 @@ CVE_PRODUCT = "apache:http_server"
 CVE_STATUS[CVE-1999-0289] = "not-applicable-platform: The current version is not affected. It only applies for Windows"
 CVE_STATUS[CVE-1999-0678] = "not-applicable-platform: this CVE is for Debian packaging configuration"
 CVE_STATUS[CVE-1999-1412] = "not-applicable-platform: this CVE is for MAC OS X specific problem"
+CVE_STATUS[CVE-2007-0086] = "disputed: this CVE is officially disputed by Redhat"
 CVE_STATUS[CVE-2007-0450] = "not-applicable-platform: The current version is not affected. It only applies for Windows."
 CVE_STATUS[CVE-2007-6421] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
 CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
-- 
2.43.0


