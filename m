Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD697888B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:59 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id z17so1376736pgc.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fJFCfkV0douUXke0m6gxAws6Yf4pLycIgW+vZLhw49k=;
	b=UIo5ZCwG6rQtP+stszJ31bcGsjc5w0dxxDmpu0kAgRzaL7kyscH8ZDk1V5cKlX/o58
	dIemEFGEagXMYJjjRwMnoPuD5D7JdQhP7Jtj9/ZA+ryTe9x+4SfOHuj3z83lDu+7cnQE
	5gj6qRoeYQa/wL5WcdSMMVbD4eXAL8hsx0QA/mZOW/msRYNrrXjsnp0VLnFXQh8yRou/
	Wr0SuJpDUj9jHJJYaSWj4gFSj5Lb20WhnMQY2lXdbAjK1LLxPdslc8iUjLqjdWLrx3zC
	luTiYSs3qJeC2Zsuio+Z3J9pievKT0DDDqUYJ7XKOH1es3lnyGPdWEMHfU1/nJ9mKIJS
	1HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fJFCfkV0douUXke0m6gxAws6Yf4pLycIgW+vZLhw49k=;
	b=iQUJldrHyL0vH+mkaYS/IOSBwfN6q/Wnt3znzp412DLz26Ue/19BfkNBjC+bTUgUMX
	1fS/3qrogBMUEa+miCMJuwgyq5xdV/a2Bg7loald35mAM6mban9NKGNbI1Hh4zDsyOm5
	vQ04EtQ2KoWVu9Ll5kL77x/TZ4SvIFvBh5K9kZrQ7aLRbfea3MxsjwqqvDWLbEJkbjRA
	8iCka4AiPbG8TXmwviISSWZfX+FPC5zD7wENVI+ECesCCtJxTgKkuXVz7mN/i8evFXDd
	vUDhTGicqV/rEAlxo/0RlzDQZNYplLZz0+v3d9BZlffXjlQy/HISo2WCCjpa4KHCESoN
	s1QQ==
X-Gm-Message-State: AKwxytdi1sx94YptdRnCOeSxDOguckEGBs92DBhK4pxTwQ2Mu+6AW3VK
	iq2ZnVcxpzPponV3/XO7uUs=
X-Google-Smtp-Source: AH8x227MfVIe5EEKeFtinR937iI4fBuO1iO02Ekj3pQGlpgAqDKxTwL6u8HAQe80Dn9c3Pdg8gRqgQ==
X-Received: by 10.98.200.153 with SMTP id i25mr20539382pfk.241.1517023500659; 
	Fri, 26 Jan 2018 19:25:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:21 -0800
Message-Id: <d9aad847dbb00f93bc2adafa5a127d79c9bec81c.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 21/36] phpmyadmin: update to version 4.7.6
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:59 -0000

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit c186045e8b753efb343b16518c907d5c97c90335)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../phpmyadmin/{phpmyadmin_4.7.5.bb => phpmyadmin_4.7.6.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.7.5.bb => phpmyadmin_4.7.6.bb} (90%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.5.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.6.bb
similarity index 90%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.5.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.6.bb
index fa447b9..672db58 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.5.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.6.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "23f65155f37bef0addb7324d45671a4e"
-SRC_URI[sha256sum] = "e4f53b8a5a8e32cea389718c6f6f282e9ac22ed5f31f67d88266aa27ae0a1ca3"
+SRC_URI[md5sum] = "a9aec05d44c68b4ac5e4987118d70cd7"
+SRC_URI[sha256sum] = "5fab6b92336386646bbb189d55817799487b5c27b06cab0cdfdcab3c88f5988f"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
2.7.4


