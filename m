Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id D08D47FCDC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 21:53:53 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id e9so1705807pjr.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 13:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5fMDGPSZGLljRBwRhX7Lm1P79N2xyiXlTuwhrwPqEnc=;
	b=udioxLEiExDcf/AkWpkbKikID32C696YEYtcKyB2USeo02TdABwTvhQBalW5AydGEA
	4NokSwGfkwutRLDZwT8ZB7Rr7D2TJZIPDjTikmY/e0UejfTOUqDZx5DRtTnS4I1Nw5lJ
	F3r/ARZQJQmklZwaAmvQ24qV8DTAr2at/ovywvRdLENb+pRM/L31Eob1nYRToNoq5Gda
	4jdJI3lxwLbAKRh6Lgn8ZIwHvgdxzsg5dO+3pmYQ7uVJUK+t+Jg5JY0u87loTjx7CbXz
	JOEAs9eyNR4xXhe9jdrjMwDP2GwVbKFAbnJUddkPoeARPdB+YqZgkFs5uBoS1yolmb6D
	69qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5fMDGPSZGLljRBwRhX7Lm1P79N2xyiXlTuwhrwPqEnc=;
	b=Z8iXjjlJmS8w6vMN0VoaGypsCg+9lZewzLXCsZgN0qAXUQfpdvJms6LbxEX1KHxAwk
	iabGyHM0gHmnJ4MxkQwo31pWX3s7wHoKUV3qbXmvMHt7RTCHi1BrCSFZyaFyAeCTHw5W
	zaaeX2ZsutJYpBPCkdLSjy3wvOxU/YuRIP2eFEzpV0dT9WIvDvoUq57HBpjpl7KCHC92
	/QbCUQMRciPp5Lheob9qqJC7PuS4OfnUUBrp3oqf8ftLAjlZMbRLkFHdR0FVt0xPMfij
	RXSinG4HpKxIyCIof12cDYFZB716k7nVYtoPifxptH+Kk1OKtxA6yb8JWbWtvA4HOI5/
	uC9w==
X-Gm-Message-State: APjAAAW4Tl7NKsNO68vc2My+32L8drxzznYfGFVWG1Xpo/8jWkCGKKHt
	Ej6cX++LCBQ4ie6RIdbFTIgR8N9G0hs=
X-Google-Smtp-Source: APXvYqwqoSQgFtsyOJsFm/RVaRu6hSfcyI8vS1JiCb49iH+b4pe4crhpKour7oRE8qkNUABcV5yeDg==
X-Received: by 2002:a17:90a:8a98:: with SMTP id
	x24mr7459955pjn.113.1580248434352; 
	Tue, 28 Jan 2020 13:53:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id g8sm26217pfh.43.2020.01.28.13.53.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 13:53:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2020 13:53:53 -0800
Message-Id: <20200128215353.3594210-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200128215353.3594210-1-raj.khem@gmail.com>
References: <20200128215353.3594210-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 3/3] netdata: Add libatomic to link step
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
X-List-Received-Date: Tue, 28 Jan 2020 21:53:54 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
index d179e84e33..d6a5ce0662 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -26,6 +26,8 @@ DEPENDS += "zlib util-linux"
 inherit pkgconfig autotools-brokensep useradd systemd
 
 LIBS_toolchain-clang_x86 = "-latomic"
+LIBS_riscv64 = "-latomic"
+LIBS_riscv32 = "-latomic"
 export LIBS
 
 #systemd
-- 
2.25.0


