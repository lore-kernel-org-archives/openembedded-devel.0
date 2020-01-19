Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 153607FCA5
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 20:50:09 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id e11so6059560pjt.4
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 12:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3QTTqRSWxCQzGhc4dlgGcMtATUO4ydPE5KYu2EizsZU=;
	b=O/9wcNyxDKoVfhNn7qqs2NcmCnOxdlBhgwRdxtPas/pgx3MB5xvHPl3wwLPWeKrzbU
	CVNdz3SoWpcUlI3Cbzq6iOWmmAsVXmsELbmYRelr0XREo/Hkn8Ih6qqa2qiSMW+R6rYw
	D6Nx8I8D9+XyPt8phhwIZCeMLshRudu09QtCFPze5fnUfv1m6IqVC/1U83h8fh4jcUw7
	ilweBW9X0iOIvbBLmEY5sS4uWtlZS0f+cSGg0qjEk8w1rdwPW2QbNFy16wBNZU4p+P54
	OmMG0QIAMpbprxvG5LXkqZ7fld6gIJULEqXt0eiUnLQavM3xCyTXSsqWNGG5prGuCqSw
	cnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3QTTqRSWxCQzGhc4dlgGcMtATUO4ydPE5KYu2EizsZU=;
	b=pOJm7Dsty3sBftgFuEV3a0P2bqh+rXRAJgDa7je1nm5fVEI7pYYrL2nv/NwSA6HYWw
	R85a4niOdni6TapRMXwAVC+8/SXT5sA9pLed1dMw8E0GuOix8XaOBQMjUDXOfI/eInn4
	vyK8+6dZWzwjf2LYMatlzD7ILDtenrDy6iuIEIQgKfNaXmgQx1RdjSLU4YKyzNbZ7F9G
	S7LeB0mnhQphgERUj1K7txdDOqS7MTqhgAiivqit9hFgegdczzlu8gixUaXfFuNFTXYg
	2wnsJzEnz0tnm688VxXaldqrwaWaxUIsiOpO7XYFR08JJZLCXKprVC7SReA51IDt062o
	CN/w==
X-Gm-Message-State: APjAAAWVUhjtML4JGGYsqrwcHarVROtI1vIsCLDDm2Sp45oY3sXOBEWF
	rGCd0HM5Q3zNv33iAz0rUMWgzx3/
X-Google-Smtp-Source: APXvYqzkUS9UxhQtxkJBdy37cvb/E39sbEUzNmbO5+7zdHvEAbYiNNfksLxyMMAKGxcIwGRl91Tp7Q==
X-Received: by 2002:a17:902:bd94:: with SMTP id
	q20mr11378808pls.343.1579467010853; 
	Sun, 19 Jan 2020 12:50:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	k9sm14701403pjo.19.2020.01.19.12.50.10
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 12:50:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun, 19 Jan 2020 12:49:59 -0800
Message-Id: <ff16275b3f51eb24aa27039b738f74deb914b362.1579466920.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579466920.git.akuster808@gmail.com>
References: <cover.1579466920.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [zeus 1/8] nodejs: libatomic patch should be target specific
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
X-List-Received-Date: Sun, 19 Jan 2020 20:50:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

host usually are using gcc/x86_64/aarch64 and all of them have gcc which
can support atomic intrinsics, but not all of them install libatomic by
default e.g. centos-7, so asking for libatomic unconditionally may not
work always

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Andreas Müller <schnitzeltony@gmail.com>
Acked-by: Tim Orling <timothy.t.orling@linux.intel.com>
(cherry picked from commit 86d4131dfabdf4bca27d96de6f271565f1a3a5c6)
[Fixup for zeus context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
index a978eebe47..215d5e7ac0 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
@@ -19,10 +19,10 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
            file://0003-Crypto-reduce-memory-usage-of-SignFinal.patch \
            file://0004-Make-compatibility-with-gcc-4.8.patch \
-           file://0005-Link-atomic-library.patch \
            file://0006-Use-target-ldflags.patch \
            "
 SRC_URI_append_class-target = " \
+           file://0005-Link-atomic-library.patch \
            file://0002-Using-native-torque.patch \
            "
 
-- 
2.17.1


