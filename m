Return-Path: <joshuagloe@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id E8A837ECB2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 15:46:18 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id p74so19142311wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 08:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=V676cx9bQO/LRJaRdDxqE8dlEa4UpvnERxprJjhK2NQ=;
	b=HTTT9FhVDrXQzf6zvJJKwuHWlV8bfNqI6jI/gJYH7OQRVvuxbYGfkWwn/tx1x28cpW
	jTRFyFJq7vaL9/6AtextaiHJ6C0NMd6P4KEX4TfUZUSFJ9W7K/ZdEeUkSaLddDlYii6G
	GYQdC/b8VpiN/61KkqFpWw9q+PmXrYnd3WZTbUIHTbJ1S0Zw7w3tf/K4nEZgiWOmrCh8
	4CKjNtwIIArDkukG2tbG9VG3ZXt0zqWTWoCS8RCKPz7EhjyvEEbVJ9QJfdVGUngjyNVb
	aKl6YvbTtXeW7JdMQaIIyDoYqMi64cIVnbAgjNcBzAHwBxjxVJj/OQzBoyrfhNj57Ija
	Oiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=V676cx9bQO/LRJaRdDxqE8dlEa4UpvnERxprJjhK2NQ=;
	b=i7HE3xQmJJJX78AXQKCUEp4InX1jk0WnzawDTC5YOfDVKOuoPdw5Efd1Ci0yenp239
	x6pUES/2bhFFuIAS8phjhhk/UdTYj5dmcWTH3MCa6IklKmDRJzPc6JcxlS7zacHdDPLD
	gWxCWQAnHyugGbPO/EiR3TlT6dGqNCiBuXPd9fhxipzubNEPjfwhH6hetz7nyBHHeK3S
	pkUrvCXZfPFZarlNBOYGIE+2fPOhO02Hfvzuv0brgE9t7+Ix89CXMNTdyXtG0y+h+WFl
	mT4ub5TVefsxrWWZH9o0URdxFzYAxkrUsJWZATEwCGR5Patj6UA/CcdM79tlUhGP+asD
	+VqQ==
X-Gm-Message-State: APjAAAWd53YJrR0u1WdFZZLkVnlsM6e2nnH5LzVCnOtAOm9I/m9uC4Gf
	dJ+QJojHDhPS2mMDGMvIskYsSmfDkf4=
X-Google-Smtp-Source: APXvYqyrTzvLL/ZFtIXk/wf6243L21mffIHGalwePY2pxodbnfUdMT2o6+xmNu1f/XVkamZhAQ8Q1g==
X-Received: by 2002:a1c:9c8a:: with SMTP id f132mr31423365wme.29.1563291979602;
	Tue, 16 Jul 2019 08:46:19 -0700 (PDT)
Received: from localhost.localdomain
	(host165-120-157-205.range165-120.btcentralplus.com.
	[165.120.157.205]) by smtp.gmail.com with ESMTPSA id
	o6sm39537200wra.27.2019.07.16.08.46.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Jul 2019 08:46:19 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <jlock@vmware.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Jul 2019 16:45:46 +0100
Message-Id: <20190716154546.3601-3-jlock@vmware.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190716154546.3601-1-jlock@vmware.com>
References: <20190716154546.3601-1-jlock@vmware.com>
MIME-Version: 1.0
Cc: Joshua Lock <jlock@vmware.com>
Subject: [meta-python][PATCH 3/3] python-dateutil: add native BBCLASSEXTEND
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
X-List-Received-Date: Tue, 16 Jul 2019 15:46:19 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Joshua Lock <jlock@vmware.com>
---
 meta-python/recipes-devtools/python/python-dateutil.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index e230f15dd..8cc2373cd 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -21,3 +21,5 @@ RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-stringold \
 "
+
+BBCLASSEXTEND = "native"
-- 
2.21.0


