Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 64BFA7841C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 22:49:05 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id p13so3486101qke.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 14:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1wbgml44JmqbpB7XHSdMWLu/ixXKYeZjbSqByJ9Ha1E=;
	b=PNO35E9i2kFqDTIMiWovvUVyeeE+Di+EsATZByE45IgtMHcVHmGRYxPTxeOlmBEJIP
	D+7U1f7rUaggUvGqw6tXVJLNvMxed8eBWUkm8UUUgTZUBqIpAsLHhFS5YlDd4KlZQXRB
	SNS8OvcxGc7lnhhRVe5JSOkNJqYWANoP0JlcoVaPY9iQVeY1GQDvfQC6tHxtVNY/I7Cd
	m8Iq+4ctfubn3baHFBCvdszcLaKb9TfY8+fw+QGRm9UyBr7fLuG5BKKHeVwsZY8grRE/
	cZnzMCOxLOyG8GpgeffDfwt0pa5YoqFoRHZrbtnN4UXsq2twpKU/Cd42Ch1BpOIyF6Qr
	ly9g==
X-Gm-Message-State: AKGB3mL38bBHFHBy87Z7WkeWs+aFo+/BrjDQUfziWkTfQFU9KTgEVn7T
	4gYMr1kRY4eyREgtGlScqkV51kRm
X-Google-Smtp-Source: ACJfBouU0WQu7qzD83cOWIgwBLlR0FwAmpiuw01iTsBTzR9JGHJL6ObDkwLFUUnToA5scJ+EJXmcZQ==
X-Received: by 10.55.43.101 with SMTP id r98mr3828817qkh.213.1515019746845;
	Wed, 03 Jan 2018 14:49:06 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	z17sm1206333qti.59.2018.01.03.14.49.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jan 2018 14:49:06 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 17:49:00 -0500
Message-Id: <1515019740-14013-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update dev version to 1.13.8
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
X-List-Received-Date: Wed, 03 Jan 2018 22:49:06 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.13.7.bb => nginx_1.13.8.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.13.7.bb => nginx_1.13.8.bb} (64%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.13.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.13.8.bb
similarity index 64%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.13.7.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.13.8.bb
index 23e7846..2589097 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.13.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.13.8.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
 
-SRC_URI[md5sum] = "5fcd056b40cb5c47b053fb14a2a89e7d"
-SRC_URI[sha256sum] = "beb732bc7da80948c43fd0bf94940a21a21b1c1ddfba0bd99a4b88e026220f5c"
+SRC_URI[md5sum] = "df4be9294365782dc1349ca33ce8c4ac"
+SRC_URI[sha256sum] = "8410b6c31ff59a763abf7e5a5316e7629f5a5033c95a3a0ebde727f9ec8464c5"
-- 
2.7.4


