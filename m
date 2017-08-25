Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 183AC783C0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 07:14:32 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 63so2735440pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 00:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZZy+P1ME+jcMrwiNJSsZSDWAmOp3Jik4O6Fokp/CtBU=;
	b=BbkI3amCC8htqQulPxdvTOk0rU+J8Xm90OXzcKeKbESdBKSwTHwUhY+G3VPGZ5iD/c
	jkFV0PKSNFwJU0i6dxUlT899VJDvQtmFhEgCo70yjoFURT/lBC2+PdgP0MHK60ICoobq
	v9E16dOmyD3Rfw2IMch25ITx7v37I/DC75Bei4+ZTGLUCVnvHY8x2zjI8KQ5QhZltANE
	Wv3I4yFIhWeo58vz/S2C9vfA1370AaNYXip4kV/g2F0KgPJ2zL9DrmnG3sXlC7v0QiKo
	sHFbQv9s34DMioC3tTZur2aTKBCg/mVtgas3P7yXhw0+Fth8eNwrtZCjP/b52hUWlU60
	3OfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZZy+P1ME+jcMrwiNJSsZSDWAmOp3Jik4O6Fokp/CtBU=;
	b=LXnUAqK7WPvouC2h7f1Qvrnc7IGSOTfd19NJgjzVwg5ze9BDZjrF+S6CELzHmIMkg+
	FyiA6XLSMzm5OrBzoPcmM3OXGFUfJQw8rtRKVkx39TX6MURVZZw6MZOXXdpN5ogqbU/G
	yZFmojrRaB2mfSJhrl4BpuWFkIOy92fjXOsn0kmbW/IfdgjrevfYZh+I6/jurWtb2BDv
	o2apB0yo13JZON39baMoOi0CZVxnCJx/btaYvEnKfHbL/FfZN762cvFtfQNyGQNLVsnz
	kUagsnE8yRD789lDKcipKD61Xhf6ZAPy7AFzrD0bB9UoWML+wHtoAO/EkbjpTjIARrMG
	foBg==
X-Gm-Message-State: AHYfb5iNPLLyMuLcjL1zU0pEdEuEVM/e8pezBh/8lnr0HtPipWxOLW0h
	8tigeizjaLa05R5W
X-Received: by 10.99.124.25 with SMTP id x25mr8930623pgc.280.1503645274236;
	Fri, 25 Aug 2017 00:14:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	x11sm11730377pfk.43.2017.08.25.00.14.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Aug 2017 00:14:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Aug 2017 00:14:21 -0700
Message-Id: <20170825071422.3969-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170825071422.3969-1-raj.khem@gmail.com>
References: <20170825071422.3969-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/4] squid: Disable format-truncation warning only with gcc
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
X-List-Received-Date: Fri, 25 Aug 2017 07:14:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/squid/squid_3.5.26.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
index 24cd15669..0260497e7 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
@@ -22,10 +22,11 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://set_sysroot_patch.patch \
            file://squid-don-t-do-squid-conf-tests-at-build-time.patch \
            file://0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch \
-           file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
            file://gcc7-fixes.patch \
            file://0001-tools.cc-fixed-unused-result-warning.patch \
            "
+SRC_URI_append_toolchain-gcc = " file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
+
 SRC_URI[md5sum] = "dc1830cd361e077814aa39bcc3691d8b"
 SRC_URI[sha256sum] = "41d8845863dcd026c856508cd1599d417c8947ffd96e86e24085f9893cb8b8c2"
 
-- 
2.14.1


