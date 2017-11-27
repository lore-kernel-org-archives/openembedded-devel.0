Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id EF4777832A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 16:04:29 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id w125so33042805qkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 08:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Jc0R8rkKOwT/R5MK2ubbdftUgGWx9Q5RzHNk+jB0JTQ=;
	b=G5TcERCXo1VSOL+cDc+ECqeCbrvx4Fn0F1aMnNdu2UIeCpxd71Ixjhbu/lNLsuRJ8Q
	bcaJpLMBJ7Uoj4bPJE5t+6xxFFMgnFs0wpF4Zr379e0Aw1T9NcikaSj7kzj4simfjFol
	/uJBEm9kzA/Bl0R1V4CEQhG7hk0IZ5pWZFKNpdJ7Xda8Q7mxwBOr0ECvX5NJJnH6MynW
	eHux0SmBwHrHgNjLtZd35f6l+rMS2TBo9EgC67x9uTPLLD4X4icHwfv4Be2OUhu/d1Vi
	B5uYkzGqiUvi0H4u5DadHoWLRtMiWd2j7/B9WSNTZRgINZxLF4N22jsBQEptYPA3bk/i
	YVLg==
X-Gm-Message-State: AJaThX5VvzXZtWwyFvfrDlRjAPEJQ49rYCCk2kDqlg9buIpQnw7IvhXK
	/U56oAAVfVvaycEtu19tN0tJ0ITA
X-Google-Smtp-Source: AGs4zMauNfNRAzb5hIHqb/DCGCts+MjDy4vYt27En0r+7XYB8F5gJpir+oEDGgsloEw6DLR+vGcMNg==
X-Received: by 10.55.178.68 with SMTP id b65mr31999521qkf.139.1511798670639;
	Mon, 27 Nov 2017 08:04:30 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id l9sm20953182qkh.2.2017.11.27.08.04.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Nov 2017 08:04:30 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Nov 2017 11:04:22 -0500
Message-Id: <1511798664-17286-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/3] python-bitarray: add native to BBCLASSEXTEND
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
X-List-Received-Date: Mon, 27 Nov 2017 16:04:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-bitarray.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-bitarray.inc b/meta-python/recipes-devtools/python/python-bitarray.inc
index 7b6e0d1..38a22f6 100644
--- a/meta-python/recipes-devtools/python/python-bitarray.inc
+++ b/meta-python/recipes-devtools/python/python-bitarray.inc
@@ -8,4 +8,4 @@ SRC_URI[sha256sum] = "7da501356e48a83c61f479393681c1bc4b94e5a34ace7e08cb29e7dd92
 
 inherit pypi
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


