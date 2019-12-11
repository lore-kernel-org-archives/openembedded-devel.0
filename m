Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id A3A077FC59
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 00:08:54 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id z3so22114775wru.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 16:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=b4M18LxnjkrhQXI//EL5EKQuQsVadZhfUrexsUGqJvA=;
	b=j/fVD6gwV4x7j8EBoKFHtuQIBk7IJjyymwIM4EqQSQdJulIhZYTxV8kKwgh8PM79Z1
	vf4BftzMnKXXMP9FAeaTLqpEAmooq5YmseeRCxz2DJaxO6u3RS2cQk1OxqYg5OcNngsL
	MXASyRPd8tmjzpXUUnPqrOsHQJ3JumNQ5PmXE/VaYHMM2PFcShuDn++mDr/52LMCcjX+
	+yWYySEki9iMKWDR83rvenDJc9vTzGC61Fcdhkfw57mDrCwqZSN5d2IFktFvt+UseVLz
	aBGS6u4afQOBbAbih3PxHUN6WOn4gbKgGbm9192dJdXK78wSkMh/Rvf7oh2UBC03xukm
	paUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b4M18LxnjkrhQXI//EL5EKQuQsVadZhfUrexsUGqJvA=;
	b=Atx+Nbcdt9URFtgK0TZ9vyobctpJ/h6rf8QGI04ddMRP2SzuF6dkk4Q+T1kUUgOWmn
	Lm304rQFCjlkyc/7UAkg8i258HRqvFz1+o/QfTNTNo/V6aK21Phst8LpGeaLezfnl311
	wgCG6MwcXqR9Sw+i7tTxDsm/xMoxj91KeR07WYq+z9lmVPL/hiLbb4hX62qte1W6+RtO
	+I0tnkFOaeYecmx9XiQdSbVFdz3wXSbM2tzzxBP8ANUtFssIu10hZ2EX5YfeMni0dHuN
	LLXCt5C6KbOcgLAV4Jz9cZIcH8wURSV4kxbDXvjZtw2HPAl8V66KAoo0M/FkcqFbdVa5
	Ad4Q==
X-Gm-Message-State: APjAAAUTzQwZbjrxClA8/Bn5/3lw2cL7+c3my7V2xfzffSYkBiMT/cCk
	EKoS2WJQC070ZnuhAYw15XmuFyey
X-Google-Smtp-Source: APXvYqy8gQHr+yVS6P0YYkKz6FWUnQh+pfZt1SRcTr2Q9IS6zK4zrZic/viAY+zC/tYcQTnszoYK9A==
X-Received: by 2002:adf:b64e:: with SMTP id i14mr237948wre.332.1576022935173; 
	Tue, 10 Dec 2019 16:08:55 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A278D51D7E1425A5C61C.dip0.t-ipconnect.de.
	[2003:f0:7f05:a278:d51d:7e14:25a5:c61c])
	by smtp.gmail.com with ESMTPSA id h8sm163481wrx.63.2019.12.10.16.08.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 16:08:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Dec 2019 01:08:44 +0100
Message-Id: <20191211000845.13166-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191211000845.13166-1-schnitzeltony@gmail.com>
References: <20191211000845.13166-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gjs: exclude mips build
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
X-List-Received-Date: Wed, 11 Dec 2019 00:08:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
index ddd5196b2..02e3e75cc 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
@@ -19,6 +19,10 @@ SRC_URI += "file://0001-Disable-tests-on-host.patch"
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
 
+# for mips qemu crashes compiling girs
+# see https://errors.yoctoproject.org/Errors/Details/296905/
+COMPATIBLE_HOST_mipsarch = "null"
+
 EXTRA_OECONF = " \
     --without-dbus-tests \
     --disable-installed-tests \
-- 
2.21.0


