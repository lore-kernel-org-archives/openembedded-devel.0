Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 81B89719F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 17:17:37 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id t37so3705497qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 10:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eNaV3yj6MmOcwdyNVvHQ3dCCNpOAFp3qwyHPW4f8nzQ=;
	b=ArSIsZjYwkWq9FfX0eE6dwmkUix8AaH8RwxB54GkG0hQ9T1eQ12lgZuoDOwkADCORF
	kd8kTsBtAjwX5twMFUUpTDJtBEIvOfsdNkXIGCzY1x91MXMz900pwWOMbl1oC1Il0TO8
	dMObCbbSZM52+bVQmTvPMz6ZDMGBuS2fHPRdHnWeWUD0i6IepusP1HUiOhl+52QoxOYt
	w12FgIj9ynk0soMd4p39ia7PWiboX7MKdj50jQ6Ibs20MOG1EMZFTwYjMh/G2M6s1ktB
	Ja5IgbdEYruTJDpRXhGTmMLFkrBolISscFXRF676vrtgxBe9BrJxr0NsEYtjsTNE0dYC
	HChw==
X-Gm-Message-State: AHYfb5jLzOZyT/yRHfCsbTVTZM9PS6qsayvOF6JU7lsAhHSTbTvhUnbm
	GhgAEp8NwdQnRIOVWzw=
X-Received: by 10.200.49.230 with SMTP id i35mr6334404qte.113.1502212658347;
	Tue, 08 Aug 2017 10:17:38 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id u22sm956690qth.43.2017.08.08.10.17.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Aug 2017 10:17:37 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 13:17:29 -0400
Message-Id: <1502212649-19734-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update development version to 1.13.3
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
X-List-Received-Date: Tue, 08 Aug 2017 17:17:37 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.13.1.bb => nginx_1.13.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.13.1.bb => nginx_1.13.3.bb} (64%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.13.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.13.3.bb
similarity index 64%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.13.1.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.13.3.bb
index d0d162e..479ace6 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.13.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.13.3.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
 
-SRC_URI[md5sum] = "5c2fe93447140b8b1a815a13bc89355b"
-SRC_URI[sha256sum] = "a5856c72a6609a4dc68c88a7f3c33b79e6693343b62952e021e043fe347b6776"
+SRC_URI[md5sum] = "1f8529568f825dfa4da4e99ba483678e"
+SRC_URI[sha256sum] = "5b73f98004c302fb8e4a172abf046d9ce77739a82487e4873b39f9b0dcbb0d72"
-- 
2.7.4


