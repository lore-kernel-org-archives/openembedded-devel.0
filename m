Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id C43647FD28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 18:52:24 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id t23so2689558wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 10:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NVb0ZxtFKe7WaXOYhRzSW30MapLgttOJHX0TlGu/Mu4=;
	b=tCu47zalPjIpV5TIhAuVlFvNHEDe+8XBjoGTy3/GRW9YHTqzNBPdOGwbr0diEZvCi1
	WS3a6uhY1hWD5PhzgpBYreprYzECiCApftTGZ9PkxOlwFAaTBC5K3NV6lwYNhbpSlGPg
	7kCT76KUbl6fdMFBjFDP1FfUo+2epyhddtqHqcEWn00vaQkXyMAdBGiMdwIjItfvzC4V
	YLt9w2AW430yteHQuNEzM1AWzfz7t+XJdheOM7MPVFX/vVypS6bhVTH9zmNYeKqdMQwF
	nUEFZ2qLD16xDg/8Al4dyr3COUc6APPS6ihQH3Z7RmIDsYkWvQNKXJpyxUeLLCL0WhEX
	F5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NVb0ZxtFKe7WaXOYhRzSW30MapLgttOJHX0TlGu/Mu4=;
	b=BnH1cEaC3xhCe8ArnTijhhNfI6DsXwUbCWdwai7sOBRgcMfJUBYqCAS/MNc3SPB0+q
	9R/uFovVVcXOAIL9mFmFCaabQq+4jBKyt63GOP+gaOtaANDlUHTC76Jn/LfWOIsfPPdI
	CfVe4SNjth0BWw/9Zt3EhkzE4MngGSC6EU7GX8L+qo7fEPiVGFh/egoYm8th1k6vKp9m
	ankNYoUKRFB4n8YgyQbGFtEyF43Wnvpi92iz11Q4cg684mifJNiiNqy9dBgq0VcY8EoE
	q75tS4zxUqPvZ9NCOHHKnxOhimbnC7j8r05WA8jFmGJVjYDV4BkISO1kt3ndcgv+Xt/s
	AbKw==
X-Gm-Message-State: APjAAAUA/tXPXS0AdHCLRHJ9gAItzyBbe4Q+GwlkKsYAGtaQrslSz8se
	SgebPdy0KifDZyl3e0GDsE4UrLY6
X-Google-Smtp-Source: APXvYqzRvKJg3gFWNjxIx+L3DVmTAh2oRekCYj8S+SakcTSXMArFki7GaVC+w1kYcVjzUObq6OF/ow==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr5301713wmk.172.1579978345268; 
	Sat, 25 Jan 2020 10:52:25 -0800 (PST)
Received: from localhost.localdomain ([93.68.129.122])
	by smtp.gmail.com with ESMTPSA id
	b18sm12051677wru.50.2020.01.25.10.52.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Jan 2020 10:52:24 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jan 2020 19:52:18 +0100
Message-Id: <20200125185219.9160-3-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200125185219.9160-1-costamagnagianfranco@yahoo.it>
References: <20200125185219.9160-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 3/4] boinc: update recipe to version 7.16.4
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
X-List-Received-Date: Sat, 25 Jan 2020 18:52:25 -0000

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
index 1b0af5549..0780993db 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
@@ -29,7 +29,7 @@ DEPENDS = "curl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+ libnotify xcb-util libxscrnsaver', '', d)} \
            nettle \
 "
-SRCREV = "a432e1ccbf864f99c7b29a1645de38056915f944"
+SRCREV = "bc3269f77f570ea0ffd31766ed83846ebb043938"
 BRANCH = "client_release/7/${PV}"
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
            file://boinc-AM_CONDITIONAL.patch \
-- 
2.17.1


