Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id BD5777D2AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 11:20:53 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id i3so15773023wml.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 04:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pdrbTmYOGlzBUro7ScARA7HrdD4ostyHGORP7NhEWt0=;
	b=HCM7S7Eu2FE+bQmTvC0SnmYjmbySQkKJ3z8vCNwH2/aDmCpvYbb/v2LLip+4rbIzTh
	mFv6PVSbETwOwjuyZQYuo3vzRSJ4ZAN5PU9N6Fhy1m923hXESuotZzmMBiOOTpAsmoq0
	cRFkAUbLWq30WtAixg5iXLRnbAFsJAXFNEzSGWD+W1h7UYEw/aZqfTIxbeZcMvYqOw4E
	mmTZoeBUHnstel1WgQt4OYnAsLJHKpD3Ei+QwnGb92hcsHSulP7YF0XcTou/fLYokFrb
	GUkJBDGDT0EuPTOtgSZNetUZSTQLze1Jbq4v02oaM0EJkV0/reoCLYzGJo261S8w8lR6
	BxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pdrbTmYOGlzBUro7ScARA7HrdD4ostyHGORP7NhEWt0=;
	b=iTw7WjfBY/UvGCfx5VNNJx1j9Zlebkkmmg5AyVLnLZ8rV2AKnfDi7dQI/YGyB+MwoG
	0vq86d2aALRRsfUluGvRkg/6Fq89PYIwWcHt664qlRcCeJ829ys3Ih7gNYvrs0z/+ajJ
	SCLHeeO/+ApHBvfKWCyLe+d2gTsDMHL4rsHEYYN9KXueDyyQClPPs4KgRnN9B6lWqrQc
	4nGY68LWgnjMEZbP2PRaLbAV0m5MAYT2R1YMicNO+WB5/8FvAitsTN/YwyHCPtrUnvpd
	0w8Nf4pud/eD343CCNlsEn5NEqE+6kjwez0Vz76xaSWC+IaDY5txanhXwPAInuhDvarR
	Di6A==
X-Gm-Message-State: APjAAAWfHdyT+VMOniEvNGyiDAkBFp1svoRbdxItasDJZXSAF8wTANiY
	gQ80FW6PtG5rcKaCbQNRETaM05yx
X-Google-Smtp-Source: APXvYqzGu7EA/xglgqkrnpx0tWm/fuPGEJTt2IvgZ2V4O315SvxuirbGkq6wHsHAvNuX2NUc1Dyzkw==
X-Received: by 2002:a7b:cf08:: with SMTP id l8mr8825583wmg.173.1558956054104; 
	Mon, 27 May 2019 04:20:54 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g16sm9917994wrm.96.2019.05.27.04.20.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 04:20:53 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 May 2019 12:20:24 +0100
Message-Id: <20190527112023.30190-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] nginx: add PACKAGECONFIG[http-auth-request]
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
X-List-Received-Date: Mon, 27 May 2019 11:20:54 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index c4c776e37..e202e8563 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -40,6 +40,7 @@ PACKAGECONFIG ??= "ssl"
 
 PACKAGECONFIG[http2] = "--with-http_v2_module,,"
 PACKAGECONFIG[ssl] = "--with-http_ssl_module,,openssl"
+PACKAGECONFIG[http-auth-request] = "--with-http_auth_request_module,,"
 
 do_configure () {
     if [ "${SITEINFO_BITS}" = "64" ]; then
-- 
2.20.1


