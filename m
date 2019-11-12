Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4C90B7F68F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 22:05:52 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id z24so12771964pgu.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 14:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Qw1lFVAFgTJOZdeQ8PlUf/GGmg5c/44kH2dq2U11Z1s=;
	b=ol3DinYhXDHBJropo7dSmWFgRURvdDCQEagm1cwNAFQLtlXcKiAjUb2Q/D3VC4/yXC
	v5cncT70aP6zG3okq4v4tueW85vWZhr27IUILGJjTfIdlIPvplm9xYytTF5SsIqTz26M
	Dda8dPc1D7rzuvAvsEVLEBg/Fk5SEcv0QK+WFD8hOPLVrc9rRX3h6U6eI7zcsT4TgNOf
	pXQlTUsGDkv3sHCjz2d0232mzrDwtu4B7U/zU6Htd0JB8AUyoPgKp5NXKcohZ/ZTppPe
	npFFDeL2HcBWYypKZecRclnzWHj/gTVihMBx8pFZtruk40X00e4P9EzByiZ/aY0fzTe1
	7t3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Qw1lFVAFgTJOZdeQ8PlUf/GGmg5c/44kH2dq2U11Z1s=;
	b=E94JrIgWihSS0PsmhxHtAJyPet/4wiApNX4wLlemZG1zZriW3ahwU76aVWilTzTdFd
	X9Q8yY9hxayi+AtneOZAKDTmhYGG8o7z+PQgp924QdyduNC7J1fPQDV1jgNyTbewpdFX
	AdHaV3il1UFafY5m4reUxcDXKSOd4biOfRzpQTpb4S3ZfJGi8Q5H72aZGsHXECxb0Hey
	rLaJnVE5iVA8/tVhofIkcxq0aW7fKJ+UcIiEYzQcynhiDPiTJbcOcADURKrwwmEFDu4l
	SKkd1eL/5tuGZak/2aziEwQIsc++IsOjniCGCQChkKwPTpn70nl5oRhBjUGQS8RIlqey
	08OQ==
X-Gm-Message-State: APjAAAWG7UC2NjSpqVoZ3pjoaTphx/RRAq03Mh1Fgzl42WvYY5tkWt1u
	7BV80kbgAu+zFgvO2hyOPdKVYegIN20=
X-Google-Smtp-Source: APXvYqy/oOtx34jOye6896HvGzCdg60SWGZjIGDfbCn3waWZp1JjG1dwrY74wTulBcvLY85kXMGyNQ==
X-Received: by 2002:a63:644:: with SMTP id 65mr29399582pgg.306.1573596352919; 
	Tue, 12 Nov 2019 14:05:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	i123sm29919902pfe.145.2019.11.12.14.05.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 14:05:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2019 14:05:29 -0800
Message-Id: <20191112220529.2433890-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112220529.2433890-1-raj.khem@gmail.com>
References: <20191112220529.2433890-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 2/2] tvheadend: Set CLEANBROKEN
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
X-List-Received-Date: Tue, 12 Nov 2019 22:05:52 -0000
Content-Transfer-Encoding: 8bit

It cant be rebuilt in same configured sources as of now.
| Makefile:755: /support/.mk: No such file or directory
| make: *** No rule to make target '/support/.mk'.  Stop.
| ERROR: oe_runmake failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index d7f749b647..e31fc6bb85 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -23,3 +23,6 @@ EXTRA_OECONF += "--arch=${TARGET_ARCH} \
                  --disable-ffmpeg_static \
                  --disable-libav \
                  "
+
+CLEANBROKEN = "1"
+
-- 
2.24.0


