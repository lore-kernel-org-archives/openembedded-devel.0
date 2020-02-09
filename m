Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 924CD60E7A
	for <openembedded-devel@openembedded.org>;
	Sun,  9 Feb 2020 16:17:32 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id g6so1810711plt.2
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Feb 2020 08:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4XbJPmY8rEx0tmRH/BvQBNa41lZecO78F79xHf8aBvo=;
	b=EVsh9wuZh/Kdbh10l33/1gGyfow2ouplf384fPPuy/YQ3LsFWEEIYctHowqJNgiKyp
	z4+D1DoGepCBaxf1bA9mcPoCvPiwwmbP1ScflMzHjXGDUfI88tNRUl0iuYyV7LieyjZY
	o8M0POxByFTcHEn8h8YyUZhHxGI0x8Vwu/XOz/YSSOwgq/em7OdCeJmMKLrZ5ciC1Qyc
	/PX3H0h8wejcE3lQuuvCJDCMheCFG6s+GpBfusdH6kXbcLok7j/qntDq35xmk8fysaTJ
	uwUcAfQxWmEJWHX7G59lyxWqbUD5XDGacSHwgHvUNYLnhklvGHID+NKFRmE2SGSYbwiz
	2h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4XbJPmY8rEx0tmRH/BvQBNa41lZecO78F79xHf8aBvo=;
	b=SBl09IYuKJQfxG1prqMmLXa9Mk1x2851vGlAjSPOFt/BLP7rQ4i8BNdKe9rcLDnsk5
	oYaoVPZ2EGdbYtESiKrVrIAI5bUbi6obLpYACKnDljA8XRJrDtP4WpLX9lbGXRfRG3fz
	TTrtbQr0IyZIFChSjuTOYchLPr795n45d3wbdphwti4yppeezom8TeWgWmXJgIU0QHw1
	vRQ/cp2wUJigvStImw027YpvcievrEBizGZIYTgiVpM//X++UBHj8umFG8krQll1CbWn
	UUhabX6m4si7hfIiGGSgWWUy0xhR03bJlFSivNqPxmoUbAygRHV/dE9zPGXQpR59mtxU
	Bv6Q==
X-Gm-Message-State: APjAAAUARBYMVXLBUj7MrTlQBRvbtj3N6A/1FDhqshJ1k5LBTJBid8o7
	3GRMVnoiaB76GkOHFdiXS4LXkxke
X-Google-Smtp-Source: APXvYqwrSlmVM76nvurDCyc/SRnZ4D/dn6ONtgOH4nK+tqIQi5UXtpp6uQCy+w7ApnluAWr5QKYU1Q==
X-Received: by 2002:a17:902:6944:: with SMTP id
	k4mr8919604plt.214.1581265053562; 
	Sun, 09 Feb 2020 08:17:33 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	a19sm8831737pju.11.2020.02.09.08.17.32
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:17:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun,  9 Feb 2020 08:17:18 -0800
Message-Id: <9d6b30b3da3dcbfb573e3ce1f2a94720d014d997.1581264950.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264950.git.akuster808@gmail.com>
References: <cover.1581264950.git.akuster808@gmail.com>
Subject: [zeus 10/11] netdata: Add libatomic to link step
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
X-List-Received-Date: Sun, 09 Feb 2020 16:17:32 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ae4adf2849eb23c7ea1dd53fe5d0c06c840a18a1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.17.1


