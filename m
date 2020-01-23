Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 01F087CBDD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 18:35:31 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w2so1939040pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 10:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sE7TSJOUYXTMzs2bctDRvRSiGd4A0vnqMEimPK4jjlk=;
	b=JVjR/4tnYiooQO9iCV5/+nTOcGuDRdQrdzZPQxLsRfUm6Kx5a3auK4D/ot4XFh8hVP
	U695sIFYMBEROr25PNnb3G4DzYCMrYM6NpTDAqHNDymWYi7W8cJwp/ohcmVv6zQnaSPd
	yt6DmMzZlv/eLVgsylrv47sxkRkOCzsAU+WXkyJKSAKHtshnen7t4gMN+xu0l61GlWeQ
	l0tqRhSJmf1b+13qITTkE9Z/ilRxvjA8Y0Jvl9DUmgaOwmrFVE5ojMh/tuqaVN9BsxPB
	u/O5C/0c+An3bgyB8hQEqpLnFcBYOYVUaS3txUvRcqI0yqAm1vWQva7u991kanvjP6IL
	1z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sE7TSJOUYXTMzs2bctDRvRSiGd4A0vnqMEimPK4jjlk=;
	b=nkqSVCWmWB+p1WIFxEEuJN4ueYhdI339jAGmRx6maJPbmGZgT/b9UUA/rgi2WdepOQ
	wfnQTJEC8Oe0gxHIauWDAATmvmJq08/oCcno3ixNc+x3Jq2yuJYdrci67KNo+tuOoIRy
	EDL556QJN9Yco0ihsQME/Cg/kEvQ6xQAEchx0c1C5OVnWo0iZrTQK0ty9OmW7TSPYYek
	gnEHG6BGiVIpcUruVLT353NwZSJllmdq8fil0fpw4k4Q3RLEr4QG5hTVwsCv2DkraIXr
	1baEl6wzmz/L/HcCcS1exvoXq/Vc6uHtlatX3hVZaMUc2TIj2YUiUKVbeNhb79QOnXSP
	YChw==
X-Gm-Message-State: APjAAAXevoREE/jDMNsHv00wvVS6bznSGLf4WM/8Aqi8yBEvE6+JuExc
	tq8SnuQss6WHFkRKlLWosxd6EE8zfLY=
X-Google-Smtp-Source: APXvYqzZIsTNtG4BV2THG2RI1SG8rbQnlAqnjxu6t4V9sdNhmfkEvycacKpyAg6h8SfO9iX/ewPovA==
X-Received: by 2002:a62:be09:: with SMTP id l9mr8343084pff.57.1579804531770;
	Thu, 23 Jan 2020 10:35:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	c68sm3551271pfc.156.2020.01.23.10.35.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 10:35:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jan 2020 10:35:31 -0800
Message-Id: <20200123183531.2066136-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] ruby: Remove __has_include and __has_include_next from preprocessed header file
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
X-List-Received-Date: Thu, 23 Jan 2020 18:35:32 -0000
Content-Transfer-Encoding: 8bit

one of the build steps ruby has is that it generated rb_mjit_header.h
during configure using gcc preprocessor using -dD which emits built-in
defines as well, problem happens when this header is later included in
subsequent compiles, where compiler errors out stating that an existing
internal define is redefined

| /tmp/20200123-2021083-2c601q.h:13849:9: error: "__has_include" cannot be used as a macro name
| 13849 | #define __has_include __has_include
|       |         ^~~~~~~~~~~~~
| compilation terminated due to -Wfatal-errors.

Since compiler already will take care of it internally we can edit it
out from this header file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/ruby/ruby.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index ce1b02f012..d5cd329e65 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -38,3 +38,10 @@ do_configure_prepend() {
     sed -i "s#%%TARGET_CFLAGS%%#$CFLAGS#; s#%%TARGET_LDFLAGS%%#$LDFLAGS#" ${S}/common.mk
     rm -rf ${S}/ruby/
 }
+
+do_compile_prepend() {
+    if [ -e ${B}/rb_mjit_header.h ]; then
+        sed -i -e "/#define __has_include __has_include/d" ${B}/rb_mjit_header.h
+        sed -i -e "/#define __has_include_next __has_include_next/d" ${B}/rb_mjit_header.h
+    fi
+}
-- 
2.25.0


