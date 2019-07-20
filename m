Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id DFFD37CF9E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2019 05:14:29 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x15so4982921pgg.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 22:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=66G6jxm9XeLmzsw/46dEmuqdY1HHOwslaZmxG+rvZps=;
	b=o8qT2OzJH724jCykfqW29nts3MbK1W5BeG+AoQXs2VcV4//fWQvm8zlozXFncEiCs7
	wYk1iyIjv1MExnTgt5gQ3XlL9A3BJH96034XtnA9lpc1JZXzJ9ZKY/iNJ2vJuW06F5WO
	CvoZC+F8ODJoAWahj0wOy4hRYLQGu1udonsAErUHDOzV/t+eHBNXY+ayBOok44Y67H/t
	SX/GamuJld5hfvJvDinqsk9odRVQOvIyFdpC7seI4rTdLtldoA/phN/4Ew12e7JLHaJN
	vQ8HYqXGxGR+OyrGv3APnkBvbxreI/Rk2p3Gh0YdO9jeEORp4psT143kfQcVPmKK4aIG
	ZHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=66G6jxm9XeLmzsw/46dEmuqdY1HHOwslaZmxG+rvZps=;
	b=moXcyWFilKFCt1n8MXjW4l1okCeGtpilzCy7XxGM7BHES+af7+I0OIIbzCZnUolpbM
	gd0vsAHu0PLm+r9NkSwfoFi0MHyu66hyCN4aQMts7UdF25DDGtD4Yitjc5eAzJQAuEig
	wjdH4ceVk2929QgrqvAQiUdqk7LEADQfNi+Ffmic84bQZWOAM88+Fs6tMNbdOeQG/Kih
	h5zws0RpsKOPzPNAHv9uHXYXz0mUPqALp2f5Esr5SlEdUs4CXhATA3fLTMAJ2dvKaIS0
	bjvOZqkMnrotbxlbX5WKpY3ZNz0Cr+ZRFwa5zQB8YA7MWSdCX3bfAw7EXc/tMFcOJAYu
	p1Og==
X-Gm-Message-State: APjAAAV4FljRhUCB3191CtD23LU9am6s7SOWhDQn5b5H28LXZPCCOfPi
	8Lu9E23+gjbfOsZvemCdQeryTbvGLOk=
X-Google-Smtp-Source: APXvYqzEtuWqaP03BQjjTGE1/6HA4DFoZhqvZumWOHYcSAYUJjbRCTdRwETKZ2WEbHxLlWWOiCOtPQ==
X-Received: by 2002:a63:3046:: with SMTP id w67mr19649299pgw.37.1563599670252; 
	Fri, 19 Jul 2019 22:14:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	u69sm38863075pgu.77.2019.07.19.22.14.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 22:14:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Jul 2019 22:14:18 -0700
Message-Id: <20190720051418.15137-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] librelp: Pass Wno-error to compiler
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
X-List-Received-Date: Sat, 20 Jul 2019 05:14:30 -0000
Content-Transfer-Encoding: 8bit

After autoconf-archive was upgraded to 2019.01.06 it started to add
extra warning flags via WARN_CFLAGS along with -Werror which means that
now compiler could be stricter and break the build if any of the new
warnings are flagged

The difference is

old

WARN_CFLAGS='-fno-strict-aliasing  -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Werror -Wno-suggest-attribute=format -Wunused-parameter -Wmissing-field-initializers'

new

WARN_CFLAGS='-fno-strict-aliasing  -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -pedantic -Wunused-parameter -Wmissing-field-initializers -Werror -Wno-suggest-attribute=format -Wunused-parameter -Wmissing-field-initializers'

Hence we started seing build failure like https://errors.yoctoproject.org/Errors/Details/252684/

This fix just turns off warnings-as-errors so build can still go on, if
we need to fix the warnings they still are present in log.do_compile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
index 9e57dd520d..16c63a7523 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
@@ -14,3 +14,5 @@ SRCREV = "e96443dda3c080fa991decec26bc4ac98d24b9a2"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+CPPFLAGS += "-Wno-error"
-- 
2.22.0


