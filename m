Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id A294C7C7A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 22:36:56 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v8so5161758wrt.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2019 15:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+SCasVUfRn7BVt1+Ze4XcpSX6hHbEgvriXldoPN/xCg=;
	b=G2WMH8xosk0T3qcjfErApzG3iWsldBm6cQH+eHWGZwPvYz/H3PhNmQG54ms8DMU8iN
	B2p4U2eAIsjcx88RUzNuqutZPI1S0RoCT9z1VNS1PZJhyZHF+XDMi8qOxSDUPws2esRn
	gpCL0fG04itMCjdKESy5RgM873duLM90tw2MKieGZl+G8nUKkQ+WYLbhXLynGFmJl+L0
	tzavROyP5hVsrm6xgS+Pyo1KjfDl45RnpX0ZM7n1GRzHevlMHLq6tmnI9Di3ffnN7bou
	LuITqTsC6zH9lpUYVZX1tKSE+aXFQ3p0WFg2jWYAhPPRA+l+/jxIjGUCapcG2CmkR++7
	AF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+SCasVUfRn7BVt1+Ze4XcpSX6hHbEgvriXldoPN/xCg=;
	b=fcSL4E+atFjC9PLE81qw00zjM8e3tpqUKCsKlms2WIpZySYOmdtU3Ad+eQ4DVUnHa8
	F8CfxPArYRbps/5wGXw6tvquFu2tx349JR49LxigfS9oPfKHUhaoqP3+mvW2Pqib2VFe
	nSGWtXvzKbVXy/0anD1Ncz6O5BzVYBUTZ2vkWol44lIrF+EkkD1wwhvi//89Gx/LYs+N
	tahTgTdlYuAq6xNVe8Ubdp3nMXxqdQCC1g6rMfTXWnAM8tzfDY6TZ1Sy/2fk1+XY8z4J
	xz4DTHD70TcLTgQYOAyhm5zwdrS8UUBI+yWVhs5qImecL7rJ27fZc0ihs16alE0LSmDy
	RE6w==
X-Gm-Message-State: APjAAAU+WQhb9KVZPwWYWLXs/DuZDbtg4OI2gCpTiGbzcYsw0cVyIIfc
	m9OWgpK9Jz55WcV4C4bB4J4Ubh/j
X-Google-Smtp-Source: APXvYqyt8A+uQCcG/wTBHca0GPg364/X2WKgD/YV8S2T9VNSSnLphEhrXYaenCySso5WoeeZn6W1UA==
X-Received: by 2002:a5d:4748:: with SMTP id o8mr4786689wrs.202.1570660617076; 
	Wed, 09 Oct 2019 15:36:57 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F066E38CA93A84B6081E965.dip0.t-ipconnect.de.
	[2003:f0:7f06:6e38:ca93:a84b:6081:e965])
	by smtp.gmail.com with ESMTPSA id w18sm3952236wmc.9.2019.10.09.15.36.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 15:36:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2019 00:36:46 +0200
Message-Id: <20191009223646.4581-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009223646.4581-1-schnitzeltony@gmail.com>
References: <20191009223646.4581-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] fluidsynth: upgrade 2.0.6 -> 2.0.7
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
X-List-Received-Date: Wed, 09 Oct 2019 22:36:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Minor bugfixes

From announcement:
* fix broken audio output when reverb was active after synth creation (#563)
* fix debug console messages not being visible for debug builds on Windows

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 9e1c323fe..c4c623ad9 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -5,8 +5,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
-SRCREV = "f78486a50bd785200412ea16434b38edc4a45a6c"
+SRCREV = "62b38b1c66aec606f83b322bb03bd84810bbda41"
 S = "${WORKDIR}/git"
-PV = "2.0.6"
+PV = "2.0.7"
 
 inherit cmake pkgconfig lib_package
-- 
2.21.0


