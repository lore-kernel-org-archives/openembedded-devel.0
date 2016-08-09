Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id D6A367721C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 15:40:55 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g202so1081192pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 08:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fgJlhXUQ/FLdXvw0TaSKJezxJfEEFpz9cIowi3AKE7c=;
	b=UB+MuWchK1BH+1/X5p8EWYfSDylPoCUvWLm1AwpperG/d6rvyRaqmb3xF1OAaC8/P3
	hpMdF/xiZ7MyZBNltG0XQFloNyFPr0SvmE9tqQ/kAy1RKGrya88d1rwWlAwYg1qQbl7e
	pg3amBcpzJz0hEvGgyFnno9WJgIc5XX3tp85LM0uZGefT4aXbZwHH6M3TJ/nEzPJOnbN
	1hsvrWhj+eHrFVJqdkWvPioJ4046WDEBit8K+WPNQDDl922ojRNWU2lLBQqGOh1qGIAU
	8tNQzUpbhqCrygkS5/m0fpJSBt34eeXp3I6AWo4UHsbxgw6bsDSOq0gaglnwa3oA6i8u
	t7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fgJlhXUQ/FLdXvw0TaSKJezxJfEEFpz9cIowi3AKE7c=;
	b=i5aUaVuFEcYP56FL+UO2G/DpuNU+iaEqqTg0Z5UIU6ssvnEBm5hrCPaV9uZTai2o+8
	PVQqeDAekHYoPX1PKBZEcfBilMMhQAl6YvT7tpYr30LSmDbfFM9y1e4bz2JQaqPjqj30
	7dJy29reA9Zx7s5kNg8msSND8prUxWKfyinZkG9ldoG23zg5vGqER/dBlj1iVi42WsAC
	OSBnbToWD3kCH/9Vfr7VbnlAcXZRqLlAFMhmycYEC3fug2GZFUIg54XUTMVYBqWhlrWu
	mR6bspdUF3OYMRXJ+Q3mEzl7JkxTKBFcRnod+gdv1trYLC13j70QNR0NdIDiyxawj63c
	c1ig==
X-Gm-Message-State: AEkoouswg/IF5j7oT7bzGRsMMlgIolpfoee3lRUUzyYnp8pxXcs3J1qtNls6Zc2AoHkauw==
X-Received: by 10.98.80.220 with SMTP id g89mr173922303pfj.12.1470757256268;
	Tue, 09 Aug 2016 08:40:56 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	k9sm56963914pfj.63.2016.08.09.08.40.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 08:40:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster@mvista.com
Date: Tue,  9 Aug 2016 08:40:40 -0700
Message-Id: <1470757240-9091-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1470757240-9091-1-git-send-email-akuster808@gmail.com>
References: <1470757240-9091-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH][master][krogoth 6/6] breakpad: disable ppc from being built.
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
X-List-Received-Date: Tue, 09 Aug 2016 15:40:57 -0000

 ../trunk/src/client/linux/dump_writer_common/raw_context_cpu.h:48:2: error: #error "This code has not been ported to your platform yet."
 |  #error "This code has not been ported to your platform yet."

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_svn.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
index 7ada3a3..b573ea5 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
@@ -17,6 +17,8 @@ SRCREV = "r1435"
 SRC_URI = "svn://google-breakpad.googlecode.com/svn;module=trunk;protocol=http"
 S = "${WORKDIR}/trunk"
 
+COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
+
 do_install_append() {
         install -d ${D}${includedir}
         install -d ${D}${includedir}/breakpad
-- 
2.3.5


