Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id AAB8C78862
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:54 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id e76so1462566pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=45RKoSgkH6DqqxiePf2kf2+FVR5QSKy5rz3GCFxWpzk=;
	b=t/HZZrUrnpVM37Lx6I5fQJy5D8ughhGr7xlKoeyZI2KU7GU2uWmYlCcNoVGg1xntm/
	9TwQYoEDhR5dL0GyN2Si+GhMJJ0zfUK7bFBegnIm9rH72a5AZUtEXQbhuTfyS4qkYbRP
	jMG/dgeQegWP491fs0pnXY33cCKmxlQhkVPFu6WjEjO95pzXlmEhzExDcn8qekrTWbZB
	eOuXv2B87/4fJr0LNp1ZcSP7IbINHoCBwk6m52eBKCfIwn+2XReKKjQ059MlLA1sUJWP
	jbUi9YBhMQtoSRUQ7RxWZChh9Sayd6x52YEGExFBAOj8cWG2k1biRetu+UVnksnx9NwA
	sRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=45RKoSgkH6DqqxiePf2kf2+FVR5QSKy5rz3GCFxWpzk=;
	b=pD90eCUy1DwT06iEZvF4uOwCCbfqjAxngONmD8X9THF4bsv5bNDXN0LMdrgY9QKhzy
	ba2OV3srh5pTllC8YfRtPGOHBR304Dj90IBfij/5tJ/bLWAjl8JhvgjlbkT3tDtZjwuh
	VBxlXCHMOAlBY/59ywdUCzB246wgIT81G5yW+TM4ZVBaGjM/RE3kCONwXAtkKVIMmOiW
	qiMyV6zL9fp1wtCd2cYQlKNGcNCQB00pA/6W3UVjFqYAS3FfD1upxxjqADUTP7F58ytZ
	1rfYu3F/M7v8zpUGEy0ZfCJJiQoqT6J+sNK7fuszbBCo81lXEr6whsF4xEfX+QmhK6rN
	TFFg==
X-Gm-Message-State: AKwxytdslbKKUPXaq3n64xpctLdmQ8VGElhJddbdly5cd8+XnZZjKmKt
	7yXSTA1IXnmKXLbe1ztUH5DfPQ==
X-Google-Smtp-Source: AH8x224r72Wki+00oazqNhs29jQSXhmI/FDnII20JsKIy45QkofJ9yhgZZTTGAcCcF12h3MxG0R40A==
X-Received: by 10.101.74.5 with SMTP id s5mr17923018pgq.105.1517023494758;
	Fri, 26 Jan 2018 19:24:54 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:14 -0800
Message-Id: <d43e04a183b4aabb44e1eea9094f91d48608455a.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 14/36] phpmyadmin: update to version 4.7.5
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:54 -0000

From: Derek Straka <derek@asterius.io>

includes:
4.7.5 (2017-10-23)
- issue #13615 Avoid problems with browsing unknown query types
- issue #13612 Integrate tooltip into datetime pickers
- issue #13628 Fixed javascript error in server monitor
- issue #13444 Fixed server monitor on non Linux and Windows systems
- issue #13633 Reload javscript messages when changing language
- issue #13604 Fixed crash on invalid ordering data
- issue #13639 Fixed error when browsing non SELECT results
- issue #13533 Fixed saving column to display
- issue #13647 Fixed export of tables with VIRTUAL columns
- issue #13669 Fixed selecting multiple rows accidentally selects the next row too
- issue #13513 Fixed edit index Column alignment issue
- issue #13515 Fixed rendering of add index dialog
- issue #13710 Fixed possible error in server advisor
- issue #13477 Fixed setting input transformations
- issue #13552 Fixed IPv4/IPv6 To Binary input transformation
- issue #13686 Clicking on column name to trigger sort with an active search leads to logout
- issue #13725 Fixed copying tables with specific PARTITION definition
- issue #13761 Fixed listing of bookmarks for a database

4.7.4 (2017-08-23)
- issue #13415 Remove shadow from the logo
- issue #13507 Fixed per server theme feature
- issue #13523 Missing newline in ALTER exports
- issue #13414 Fixed several compatibility issues with PHP 7.2
- issue #13550 Fixed copy results to clipboard
- issue #13562 Add limitation for user group length
- issue #13561 Fixed edit variable link in advisor
- issue #13579 Optimize table link should not be visible in print page
- issue #13553 Improved error handling on corrupted tables
- issue #13512 Fixed rendering of add index dialog
- issue #13606 Fixed refreshing server variables

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 2de93541d924963e20d4cc4b1592cd89183d4be3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../phpmyadmin/{phpmyadmin_4.7.3.bb => phpmyadmin_4.7.5.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.7.3.bb => phpmyadmin_4.7.5.bb} (90%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.3.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.5.bb
similarity index 90%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.3.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.5.bb
index 9949a73..fa447b9 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.3.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.5.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "4b0c5dbaf871eb86671613da3c31e6b3"
-SRC_URI[sha256sum] = "ed51669043f62494dc3bc21a87423373164ff63865a6c6bceaee535ef785f33e"
+SRC_URI[md5sum] = "23f65155f37bef0addb7324d45671a4e"
+SRC_URI[sha256sum] = "e4f53b8a5a8e32cea389718c6f6f282e9ac22ed5f31f67d88266aa27ae0a1ca3"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
2.7.4


