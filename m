Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id A7DA87FC3D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:26:32 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id u2so8989249wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EOK2HPvvbJWRjZJM3U//+KPJYUo9Q4mHm2Tif0LctGk=;
	b=qkKAEdOgUf60eK9ywTcwGGj+uemvJW31VO8TXjlq2oj8SxbHG44EuzKcesrdwr+a+Y
	2BCnFVoe0RTvprshapUxcU3kMkXi71f5/jSvnQkV90+CStf3Yzk4ebQ5ynb8yMv7ucru
	aiGNlvjdGNphdH4KZNnWujQQG75U5N9+SdXb1KgTkmal+ZfhOi4A/c7CHfC9XEbpHRWb
	nx+iEYt05f3aQu0tuzQzsoPOdzD6DxALkZ/bcRur6MJXOD/zbDcYmTIKpZJQi6ebJY3T
	IXb8WFScZ1CV4XcBzFofMpXq935dQgCLiQrowYPIgiUbIjRY+9o0T3GcruLkCPGWArWh
	X81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EOK2HPvvbJWRjZJM3U//+KPJYUo9Q4mHm2Tif0LctGk=;
	b=nd9Mnmgi1P6RslHeYNyebDrH9tSc3fTDgoNZ+9kXjflkk6YfrZI42pldnfwrOMrILA
	vB/pHhldCI3b8tj+tOE5nfVFOeDcmwcWrKHV25TMEIUHrn+xIMI2R5HyLKo8DX91SZ6R
	549mAowIqabf2SqDaOS+Op/eXqK5Wb0yZrmZ2fYBggIMDOyFRcG4OF3dlBl7X0dM+9/g
	8rpz9xh8+WBIWJ0pStgkn3HSKZGzH3NzqYIYTlAL17I8Cv1q7Isd9BpDthdfzWmwBoBU
	qi3vB4Y7wQ8Mr5aKwYIzlZKFC6WZOE9L6NtRMvZD6WkshHo9sqMJGbwmF/u5R7vI7bLA
	m8Jg==
X-Gm-Message-State: APjAAAXtPyvZtve5V+Zq9+Hii/lMc9Bkr4vhHI8wJVkZR+v1mVNitjtM
	yYzJBH5iKF1qtckWHQZTNMUONho3BJE=
X-Google-Smtp-Source: APXvYqy20eAarIZ75bZBACH8A4AnhWqdkuXBcPZb2Y0r2SVFUWW3sDN7TiC3DBgFjHz0FKFfs/2V1w==
X-Received: by 2002:a1c:ba89:: with SMTP id k131mr6481767wmf.123.1579296393444;
	Fri, 17 Jan 2020 13:26:33 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id f127sm701415wma.4.2020.01.17.13.26.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:26:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: kai.kang@windriver.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:26:08 +0100
Message-Id: <20200117212615.32526-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212615.32526-1-schnitzeltony@gmail.com>
References: <20200117212615.32526-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] xfce4-session: 4.14.0 -> 4.14.1
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
X-List-Received-Date: Fri, 17 Jan 2020 21:26:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.14.1
========================
- Fix session crash at logout (Bug #16105)
- settings: Don't make 'saved sessions' tab reorderable
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Asturian, Basque,
  Belarusian, Bengali, Bulgarian, Catalan, Chinese (China),
  Chinese (Hong Kong), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, English (Australia), English (United Kingdom), Finnish,
  French, Galician, German, Greek, Hebrew, Hungarian, Icelandic,
  Indonesian, Interlingue, Italian, Japanese, Kazakh, Korean,
  Lithuanian, Malay, Norwegian Bokmål, Norwegian Nynorsk,
  Occitan (post 1500), Polish, Portuguese, Portuguese (Brazil),
  Romanian, Russian, Serbian, Slovak, Slovenian, Spanish,
  Swedish, Thai, Turkish, Uighur, Ukrainian, Vietnamese,

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-session_4.14.0.bb => xfce4-session_4.14.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.14.0.bb => xfce4-session_4.14.1.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.1.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.0.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.1.bb
index 37560c2db..f50a545dc 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.1.bb
@@ -15,8 +15,8 @@ PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
 SRC_URI += " \
     file://0001-configure.in-hard-code-path-to-iceauth.patch \
 "
-SRC_URI[md5sum] = "635361f99a01b2d26c430a520b6d1314"
-SRC_URI[sha256sum] = "14fb6db74eb69eb400673856ba307a0e57f577cf77c3561a5910151e3d52043f"
+SRC_URI[md5sum] = "36593207ac0c67c81907a4846f4b604c"
+SRC_URI[sha256sum] = "dc1c90da56b2d8df18fec6c0c30d6bed4e7646d8c8214fc931c952ba86c3b77b"
 
 ALTERNATIVE_${PN} = "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
-- 
2.21.0


