Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 431CE7F699
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:04:07 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d7so9053543pls.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=asYOh2fvQ7fTBPKuXtadHlqcW3oee9k+4v9UxQ7C7A8=;
	b=iGP5IUjj1fEodkhui5GY7zrB6jnW7hzPA179j7+RJpmBKfqceOEWv3LoAC3C9tOFwM
	Z+AnMcXUUd4yIWi/MDWO/joQ/ke7l0ju/cIhEi1EnVL9NOw5nesySfGhL/s53bUr6b9n
	Nztpa4W77VzlaPp78+eCXMLL8mmTGsN2W/fGY2fY7KQhv+eXUClIVOsBIlyMGPhqnFbw
	qtEZJTa4EvxieYJS2KCRdDxB+8QymckFdQrX7kM2/0FHofDnOZc0mfS51SgzZtJQ+mkF
	63lMzJEV9zgiGIlDr0J4JAIvwsJ++V0o91Fl1YWHfD4PIINR3WRq52kFXtgo4M9mwEdn
	Xk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=asYOh2fvQ7fTBPKuXtadHlqcW3oee9k+4v9UxQ7C7A8=;
	b=lzr3LorHMMubiAAON5zMjxVwa+wXPraSVtcxkkl6pUk+EzUAAr5O8J4Okayx8ZzlRe
	1Z8rEEVa3anj50eHiF0zBJYFbKnNj4/40zpw6UhHDNURzVKCDgNHPncRjTWES6eweldU
	PllaMzt/+5QORZqCLs4nQHz4ZsU0nuUKRNW6RpByR8bM/a0WJwBpakGpVvVb9sbZTNvE
	aTlDikFpamod2WMPlPoCibZCBcxZW7YGA4udhrEhrjz9ck6PUM5HjUD1zdLCWuufvspY
	+SUsWMb3cLiPRObvZUudjWeeucWzsJR2lmUKIzpbOi3TvSWvIMk3kmXaub7FYLUdSu0E
	gOJA==
X-Gm-Message-State: APjAAAXf3WGcUI5aepJasY4uFNbAC/ZU7I8CGzjsEyq/nzGh7K3vQWY0
	Ed3PxFH2ME9ftoLRdJ4H38VejfkcVSs=
X-Google-Smtp-Source: APXvYqylJQURNbG58+eyWvC0jGFl2ZlC/wR3c6MD7byNhlqp2045OYf36T76Tp6QRa7LuMCYVUNcxQ==
X-Received: by 2002:a17:90a:ff02:: with SMTP id
	ce2mr37319145pjb.117.1574053447891; 
	Sun, 17 Nov 2019 21:04:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	y6sm16881131pfm.12.2019.11.17.21.04.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 17 Nov 2019 21:04:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Nov 2019 21:03:50 -0800
Message-Id: <20191118050352.1379153-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118050352.1379153-1-raj.khem@gmail.com>
References: <20191118050352.1379153-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/5] rsyslog: Dont force enable atomic builtins on mips
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
X-List-Received-Date: Mon, 18 Nov 2019 05:04:07 -0000
Content-Transfer-Encoding: 8bit

This would ensure that checks are performed properly before using them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
index f50f9a34bb..951bf4d5c1 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
@@ -39,6 +39,7 @@ inherit autotools pkgconfig systemd update-rc.d ptest
 
 EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"
 EXTRA_OECONF += "--enable-imfile-tests"
+EXTRA_OECONF_remove_mipsarch_toolchain-clang = "ap_cv_atomic_builtins=yes"
 
 # first line is default yes in configure
 PACKAGECONFIG ??= " \
-- 
2.24.0


