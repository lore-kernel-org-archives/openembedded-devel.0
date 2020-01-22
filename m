Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id A70EE7FD5E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 22:20:00 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 4so489624pfz.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 14:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=h8YaRh5YNHfXX4E4EZF5PaVzwvrbs1cmMw/1zJrl1VQ=;
	b=ahJM/jfSqJUOT9NgxxDd0DpmnZvEP46ITNWl6juyIzBmBanmdRTAnQ0zSLIPgNO758
	ZbRdpTKUHmoyqfSn7l+0E5zPnQyy2zs1iJwtMPQ4rCnGzfX2hVZxiwXoduFK9Ray9iau
	YdCt31/QCRdUBqTu5O7KwojNJo/fLqfx+uRcmc+HcNloeZXPBNuT320mdUScsPrdVuzn
	RpnXTz46UtnGLKBYugZgGW/XITc6bn7aivXYMafr4198Ij+YoH9hhvcBlN9zRdwZYHfB
	WsA1xXP4piqmXLG91Mt7UIzQhPWbNcOuQcX67O1P/Ax2HoXyGhosTC/rzhphJ4y8Ndol
	RXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=h8YaRh5YNHfXX4E4EZF5PaVzwvrbs1cmMw/1zJrl1VQ=;
	b=sLMIwMXUX/Y968eIEvNm8cznZ+8q3DUiZ8lBzZW5uqOzQhJoCcPVDtcu5eC9u83e04
	nJny52g6wfjf2/wMigo0aFODByckQoe4VO0WzwkCqoqd1dxJbSgfRFrr1IMH91zwvpJJ
	vnLcwH6joOB1YY6LMrexQoaLY8t5ud0gmbf1gDf+E/txr3bNQKeajJFMzO4qTleCuR7L
	fmHPmARxd+DMzOsRaozRHYrz//phtt3OVJ5WZd5AAUG45BBwqwVbyGo+3GslXjFe4N8T
	NWKxGsdngPoYp6RvKCvUYECdvRCQ6jehYxAW9wJMgS6DTfazZ6VpNeQTS8OPIDc+Rokr
	ZPyQ==
X-Gm-Message-State: APjAAAUqpoRLX05lzsrrTfdHbqJMlZW+08/H7vBEYpMOQ7rahv94g0io
	g5Vtf+Ih6iLy6XFMcnuuQcUYV6rxPN4=
X-Google-Smtp-Source: APXvYqzQLvL5DybESi0JoFOl4TUFWc4qmcbz73WEiGIpPglCsbSXFrxEOXrcaqsHabUBg8Twq74LcQ==
X-Received: by 2002:a63:de47:: with SMTP id y7mr470384pgi.270.1579731601228;
	Wed, 22 Jan 2020 14:20:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id d14sm8284pjz.12.2020.01.22.14.20.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 14:20:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 14:19:59 -0800
Message-Id: <20200122221959.1407586-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122221959.1407586-1-raj.khem@gmail.com>
References: <20200122221959.1407586-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 3/3] recipes: Turn inherit classes from meta-py2 to conditional constructs
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
X-List-Received-Date: Wed, 22 Jan 2020 22:20:00 -0000
Content-Transfer-Encoding: 8bit

helps parsing without meta-py2 in mix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/cherokee/cherokee_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
index 81805891a4..b31f4c430b 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/cherokee/webserver \
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep pkgconfig binconfig update-rc.d systemd pythonnative
+inherit autotools-brokensep pkgconfig binconfig update-rc.d systemd ${@bb.utils.contains("BBPATH", "meta-python2", "pythonnative", "", d)}
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ffmpeg] = "--with-ffmpeg,--without-ffmpeg,libav"
-- 
2.25.0


