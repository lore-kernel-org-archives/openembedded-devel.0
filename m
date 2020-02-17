Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 26BD460859
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 02:42:59 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id dw13so6476316pjb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 18:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3z+0mrKkRVR+rfwWSdjm8HOgbJSjZg1UH4s3euUQi3o=;
	b=DV6F6qQyuYDB/eRksDSf80cLLH6wUPMn8HYpvFah6UvmswL9ScUtL9KF2YKQvem2Xy
	xXmj+woKEHkt1gLzA75nKAxceF5rtyxtbkxS+7/GTIBL05wpsuhDQJ1mt6MoEFTELpg0
	vYeBWp31xnEld1TjtMQqY389fYHqclhOvKqyXXqtWRcDhssf6Z5sZ0/2KoQDhVYsak16
	WRCEhnIS/vXXvABIV5yXMN90p5q/xYIKYnq6hAOPfLOJ3Yr49ydXPTG79AuDSjc0hrxh
	h8dN19U2hDCLJDUSP6C7XtQ9we7W/+aQPGJae1/2ihCITMRdbIFf5k3Q3TsAYyInfnIh
	OIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3z+0mrKkRVR+rfwWSdjm8HOgbJSjZg1UH4s3euUQi3o=;
	b=J+PhcsTP3GH0lV8d8fmiezHp0hoDYAqK2zjjyYeT6pZErfDZ9fcPta4C2hLE3Ql/CR
	fMEA3FMZJSe/q1IFj/OqQq/wZfTeGApQILALbNi+Dn0xRiY6bju5k2nUKGRpVZdZdVSh
	9cxrOoB6zFArrREp2F6R8nHVUeMEDUQvXgR1gQo1oQzz1ZpVDX73ZLrvOeMaAAI9p13T
	RuZFFbQw9uAi+3iSr4t3esif42ZvWtoukwE4vdt1TJQ+4D4i5vvmFvUZlCy5sTQlctRR
	u92LntSTnS5HAs740M2vd+gRN7CJlSJeB/YZzLPSlvGAWdFDy0O/M8z2qpUl6p3mghQG
	8S0A==
X-Gm-Message-State: APjAAAX6SyTUjQprWn1hYnYG1eAwLvnzU6bzPp058SEA4p03aTZe4gzv
	gjdhBIac6lIGGqZIgi9wt5v93eCvSnI=
X-Google-Smtp-Source: APXvYqw17U1KC0SoYm77WQWNDrpopGwHivnQeUQRlWScRrPuG0cxz1bGJXW1/L95DTK3FR/D5pD9RA==
X-Received: by 2002:a17:90b:3115:: with SMTP id
	gc21mr16662022pjb.54.1581907379764; 
	Sun, 16 Feb 2020 18:42:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	64sm14141008pfd.48.2020.02.16.18.42.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 18:42:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Feb 2020 18:43:00 -0800
Message-Id: <20200217024304.1131392-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217024304.1131392-1-raj.khem@gmail.com>
References: <20200217024304.1131392-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/7] joe: Inherit mime-xdg
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
X-List-Received-Date: Mon, 17 Feb 2020 02:42:59 -0000
Content-Transfer-Encoding: 8bit

Fixes
joe-4.6: package contains desktop file with key 'MimeType' but does not inhert mime-xdg: joe path '/work/aarch64-yoe-linux/joe/4.6-r0/packages-split/joe/usr/share/applications/jpico.desktop'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/joe/joe_4.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/joe/joe_4.6.bb b/meta-oe/recipes-support/joe/joe_4.6.bb
index b79e028f30..674736a68a 100644
--- a/meta-oe/recipes-support/joe/joe_4.6.bb
+++ b/meta-oe/recipes-support/joe/joe_4.6.bb
@@ -9,7 +9,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/joe-editor/joe-${PV}.tar.gz"
 PACKAGECONFIG ??= "curses"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,ncurses-terminfo"
 
-inherit autotools-brokensep
+inherit autotools-brokensep mime-xdg
 
 SRC_URI[md5sum] = "9017484e6116830d846678b625ea5c43"
 SRC_URI[sha256sum] = "495a0a61f26404070fe8a719d80406dc7f337623788e445b92a9f6de512ab9de"
-- 
2.25.0


