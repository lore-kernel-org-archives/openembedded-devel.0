Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8307B74F35
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 12:03:32 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id k6-v6so11161266wrp.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 05:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GLdK2Q/nYG5d/eNms6YsJX1Aw/AkyR1AKBhZaCzxSkQ=;
	b=CICkTf99fvi/UT7w++jSzhte3qXvegL/Hi00D3I/uLYxObSu8y74StgZygA6HZxUyi
	lkI85Wunu+RmjPcknk8y9VhWbzgMlBwfF8tjEmDReYKFkYqY0UyzuJkHczCVGPREyT4N
	gxuhFZpprcr34IofsQ7+JXFMY1qMoPUY6uLX7KItiXpq44mej6+eGunNkge5ysPdjuLS
	4ZHko+pcD2rUk+mwQlphKAOJno8CEHDesrJHiADprkuYCOMTN/60bq9nD8H/jJzyQh8a
	Y+lYmY7SBSDRspwVY0lfx4KPCS3rZz0dAl0AHdlEd++gq4nBzzPVjm9++4SRwtqFmIgH
	Enng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GLdK2Q/nYG5d/eNms6YsJX1Aw/AkyR1AKBhZaCzxSkQ=;
	b=Zay/vCic5JOXsr2KUAq1NHh489mGyfvyRrJ19a0DMacwGBNqMhZ5VJO3oQEG3g5TUZ
	oPcC/uIfO4tQflNpZ9ggH0ZQ3FtkXnzwnosYfJ+Ib4E1bt8/sTfOsJ25g7ipCAVa+9+M
	btS15+pAvRVBGfY5XTtLbVQTtmN3k0O8o0K3IzL7JvJ2yGJrViOpztpxoz6/SJthKeOO
	0iIfJEKZ+9nhCVRpNUH7q4EARBFKVKlMib5Y7oEyigzyE+C/wY/FBIgQCTtE/x7TxWKr
	+WUvkRo9BTCNT548TlAQJtefhLWOd/ehslMLBG1o1Pus6JArojsvz4sUkxMNrzTrAMEV
	pN0w==
X-Gm-Message-State: APt69E1eflyNWXoI4Lpcgy1oqQN5DK6GhKGwrLhHgTnTtYFczBV8fMZp
	47hwhkdbglLByamLizXfBjrU/Q==
X-Google-Smtp-Source: AAOMgpf7OsXx7jMk5FPvcpygx5mwGXBrTkYMorx5e4ixsFzjMsai0tYQXaDfpTBlWn5WzYDihI2WeQ==
X-Received: by 2002:adf:b909:: with SMTP id
	k9-v6mr14917193wrf.116.1530360213129; 
	Sat, 30 Jun 2018 05:03:33 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BD2A250E47512CF7CAE17AC.dip0.t-ipconnect.de.
	[2003:f0:7bd2:a250:e475:12cf:7cae:17ac])
	by smtp.gmail.com with ESMTPSA id
	p12-v6sm2096602wrn.31.2018.06.30.05.03.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Jun 2018 05:03:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jun 2018 14:03:10 +0200
Message-Id: <20180630120315.29414-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180630120315.29414-1-schnitzeltony@gmail.com>
References: <20180630120315.29414-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/11] poppler: upgrade 0.64.0 -> 0.66.0
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
X-List-Received-Date: Sat, 30 Jun 2018 12:03:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/poppler/{poppler_0.64.0.bb => poppler_0.66.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.64.0.bb => poppler_0.66.0.bb} (94%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.64.0.bb b/meta-oe/recipes-support/poppler/poppler_0.66.0.bb
similarity index 94%
rename from meta-oe/recipes-support/poppler/poppler_0.64.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.66.0.bb
index b90f3fa35..a50c201c5 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.64.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.66.0.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "f7f687ebb60004f8ad61994575018044"
-SRC_URI[sha256sum] = "b21df92ca99f78067785cf2dc8e06deb04726b62389c0ee1f5d8b103c77f64b1"
+SRC_URI[md5sum] = "6602813e52f02f85f11ba1590e0ef749"
+SRC_URI[sha256sum] = "2c096431adfb74bc2f53be466889b7646e1b599f28fa036094f3f7235cc9eae7"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.14.4


