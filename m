Return-Path: <jpuhlman@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id B784261219
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 02:01:49 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id ay11so4402135plb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 18:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=ZANb+ZRY/3rKxqToNeFJxOCWo/dAeyxUVetIEPzuGg8=;
	b=knh8/BbFtDNMxvCGj8PK29duqpDZ1bckm1jtMehbjn0+PzfFRz4jYh5urD1H+g6xk8
	pYO2JSCk2AXOUdkH89be8Cm0uVW+7nOtDBVTZ0SFRlW3tTRtEsW9FadqOBSG/GLspsLX
	MqAs1Ml35PQXnJMUnyNfRYdj+ZgfNwUmu4GNGA7BvaIfSiFD4TtSE2rlDjU0YPot9jh3
	R8cYYoH+jKeJbzBp9AdXqEizpiStlejXNK54c6PasyrzQ4hrDr3eWCXy/TM2WDhDd4J9
	y+e8YYmHEwx+XX7G7TwrZ4sWFUKl6qUNLTTcrHz5C/q5351icHJVwtkCxYbL0OLZT60A
	Qhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=ZANb+ZRY/3rKxqToNeFJxOCWo/dAeyxUVetIEPzuGg8=;
	b=UDSxg9aUqQxFcZfB2U4JtX+CqrZUvz0lAkIM95DJXLIcEMjCdnSeRPiY8Aa0+m5iAw
	o0ZiksBQgJgJptyJqCj2tGodrmIrTk9g40J5j1+CzV4sU/gdnP/cAzpEJjpLbfH6wjvy
	5DC03ueh8jfSJxErbBO7FOv2TntD1OspwtuylQbYikzIQYfcvxM0YftAELjwIN8xmRCu
	Sbo8bZ9xKoYnlH5rCRb823SKFjzGmDC0L2+6MlICgWEGVgkKAdBtPjq35bpovllA5i0W
	yyuRue6Y2d2T12NTcy+tLAQBfcQRAMOTZzFsDA6yQyTLSv1j7KuKqKCcKv3w8zyMpU4f
	79dw==
X-Gm-Message-State: APjAAAW8GY78Q3Tin4DM4rReKo8CHQMtjo1qXxQDuoFDvYdZoNo6Wvu0
	qI3Y5C2aq96ftTAUKbDMV9J3GAKYOuM=
X-Google-Smtp-Source: APXvYqyXYKaKyl3I1o6FuosjzKI4PrSW3OLrQm/FnQxXXnFV+Ft4gLk9dVgjV4BrEeBrSerdEuB1Gw==
X-Received: by 2002:a17:90b:f06:: with SMTP id
	br6mr6879646pjb.125.1581732110624; 
	Fri, 14 Feb 2020 18:01:50 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	q66sm8667974pfq.27.2020.02.14.18.01.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 18:01:49 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 828D22A04B2; Fri, 14 Feb 2020 18:01:47 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 18:01:45 -0800
Message-Id: <20200215020145.1672-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-python][PATCH] python-pytest: Fix typo in SUMMARY
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Feb 2020 02:01:52 -0000

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta-python/recipes-devtools/python/python-pytest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 402126300..40ca9c2f1 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -1,4 +1,4 @@
-SUMMARY = "Simple powerful teting with python"
+SUMMARY = "Simple powerful testing with python"
 HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
-- 
2.13.3


