Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id B7636613FD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 02:42:59 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id fa20so6482549pjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 18:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KebnYMGWVMO9p/8KXA9JxkPYz2rtEke2Qdc1zIzqU8M=;
	b=N3jAJsZx8/wmZ2qqWi67nvYM/jPt5nvZrcISJ96lUsTKg4sHygIjO79aY7ZYiEKPQ/
	0kImvc9li2azluPVfMInmS+VsvY/sFjbE3endnO1yUnNi0/fnG6oeidWWTs3097ffrw+
	JX+oWFAida9FPugt3Qnw3Qpb8m4DNCbtUxLWgirlGUBTDN4knCtPiWhapSTXYaIbFmtO
	xpaLaG5JNA9vocfOVoi471VtmWtBoJ+IqlAZ6U+FV0o+dqHjGcuo5UusoAMNKp8ewvzU
	D2UBeibT4y8T2O7nKnportUefl6QA8eMIzogRaYsGVOJjITIf65AIsnac8HvmuVeVn73
	vK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KebnYMGWVMO9p/8KXA9JxkPYz2rtEke2Qdc1zIzqU8M=;
	b=pSbTQZcRygzxjQL5FZYhcTQzRN7JDy3jJYsvo8FV/7Id0ytBQEn0ZvEw4K4G8eIlaw
	h1pqErTRMvVB0WUYWp3tWAqiPlBDxZf9YgT5qVu5d2agBLEIH2f2ilEh60Hhvs1c/Dcm
	UpEHJeB8y8/uPsgn66XfDk3/CT6UukoPZAYFrPhv+h/FRcCoTIstbsAvfsvt71HIgdrE
	vvJwjVTpfGbuoRAg0Kt1QyfLRoUurEwU9o7cqc0UZ+q9ylDcvDCAM1O013Rwq3X5Jech
	xVpLScyZaIw/bdX1LzIRU8VaN+btbsD8KckhKdkf6VeTJdxWLgQlc5b20FVv9XSo4mWK
	YOsw==
X-Gm-Message-State: APjAAAWDsamEl1bnStXJ2H6lcAMoVrZlsf/qWjy07x15Li3+3VU5ykbS
	1RUEpdg4LYWfZHyt6On5QyBV5IGcFyc=
X-Google-Smtp-Source: APXvYqwbpqLpSDhsCyjIhtRSiC7dwFegBjdLyHlLAaxNHi6wfG7gPRr0BeqQU6nIwjGJNYlGFDqt0Q==
X-Received: by 2002:a17:90b:3011:: with SMTP id
	hg17mr17138679pjb.90.1581907380492; 
	Sun, 16 Feb 2020 18:43:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	64sm14141008pfd.48.2020.02.16.18.42.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 18:43:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Feb 2020 18:43:01 -0800
Message-Id: <20200217024304.1131392-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217024304.1131392-1-raj.khem@gmail.com>
References: <20200217024304.1131392-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/7] remmina: Inherit mime-xdg
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
X-List-Received-Date: Mon, 17 Feb 2020 02:43:02 -0000
Content-Transfer-Encoding: 8bit

Fixes
remmina-1.3.6: package contains desktop file with key 'MimeType' but does not inhert mime-xdg: remmina path '/work/aarch64-yoe-linux/remmina/1.3.6-r0/packages-split/remmina/usr/share/applications/remmina-file.desktop'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
index 14fbc94b21..f9963ff65e 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea5
 
 S = "${WORKDIR}/Remmina-v${PV}"
 
-inherit cmake features_check
+inherit cmake features_check mime-xdg
 
 # depends on avahi-ui with this restriction
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-- 
2.25.0


