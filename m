Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 31EF37842F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 16:21:21 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id d54so15157379qtd.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 08:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0Z0GJCcy8nusBkgxsMo3K3uCk/SojUDrDYo8r5T16Qc=;
	b=CspQoK8PyorithEGbGkxIRmZNyp7Mv9xZQ7puU3B/R2J9quhzshvSOkN7fH4HK3Do7
	VukOW25dNNx0raWKKejshGuaSW7Bn+AAdvN4E6GbiZD7IwdXlbbG1l8Sm781BFlW4QZt
	yC97FRAMFGrih9xBEnnF1a4DM5xx3ZJZNJbWGHgNaqkFAR3iYXy621i+0LvA74vKJI1s
	iOsihn4w03H6HFajtr/V2J0pW0xXfsXbdsIqBhYo+qUPwm2oN2N4WyzLcOgodtjti9mJ
	NYnBdqAL5SHomWicdE67GidtKaw/j67H7q9EzPGC2m1HlEZrjw+aapCqdTsm3sNgxh2k
	QXzw==
X-Gm-Message-State: AKwxytdvAqi7Wfw+0yGPBWG4w6YvL9C9rq76uS8MrL5cHEIbQjfFeWqF
	DssSTLOd9vfCoqFRgoiPE2nvnq4a
X-Google-Smtp-Source: AH8x224Vqh98h20HupEuYfjHtPXvxcFh03gdSmA8J3VYdu36jMOCjoT+ADD9fy7d96U5u0rBg51NIw==
X-Received: by 10.55.121.130 with SMTP id u124mr4522872qkc.329.1516551682892; 
	Sun, 21 Jan 2018 08:21:22 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g103sm10121879qkh.75.2018.01.21.08.21.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 08:21:22 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 11:20:28 -0500
Message-Id: <1516551637-32255-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516551637-32255-1-git-send-email-derek@asterius.io>
References: <1516551637-32255-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 01/10] Remove deprecated python3-signal from the RDEPENDS
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
X-List-Received-Date: Sun, 21 Jan 2018 16:21:22 -0000

The python3-signal package was removed as part of the migration to the
json manifest file.  The signal functionality is now part of core

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
index 177a2b5..429c6bf 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
@@ -27,6 +27,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-doctest \
     ${PYTHON_PN}-enum \
     ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-signal \
     ${PYTHON_PN}-xml \
 "
-- 
2.7.4


