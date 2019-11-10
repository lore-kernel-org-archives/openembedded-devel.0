Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC157F969
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 22:05:13 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 8so11346939wmo.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 14:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1Y7w/YaMeyQtbw5lM+sT2tnUYbKyfjUROSpnKTML4g4=;
	b=DMKU8xdA82Az9KJXkQ0z9Tu6tBVcx3sacpCi7xE5NjEVD43A74k+5s+fTxTMTrg+bY
	18FGnEW6KnR93MwxP5pQQ2tqOLUO2CDij/kGOkoyVsgSchL39rMJXVdUa2jpzWCebWNe
	Py4gIkJrIHumFlpbKkp3aO/pXCiuBhGyUmruRIZ/j1fcg3harWduf0re48SpHwcURaWK
	Wii+gffO/fZPrYMW3/UXflknEYqUET01zSas6avtyEPtXUJbG4qjF1J1LNUOCEqVhYwr
	8NQZuq1uL34+CFUgBMO6fw/Hv8NfztbGV7dO869ifCwnb5hOXP7fDwAVBBkVQyjbUM8m
	a0IA==
X-Gm-Message-State: APjAAAWMDs5usEIzI4upevsvUog3wm9BzOTM14bqqAgjpGbigVx3WB5L
	xxkr8cFz8oYv8YD4jlnsGJirINN6
X-Google-Smtp-Source: APXvYqzH52rZA+JbJQUbgLsA8HzK4yyIPCRhVJOeEw9HrR8zDAG8owwrIQtIIHkmcvmp/NhKYyi7CQ==
X-Received: by 2002:a1c:2395:: with SMTP id
	j143mr16988378wmj.128.1573423514587; 
	Sun, 10 Nov 2019 14:05:14 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	t24sm29925375wra.55.2019.11.10.14.05.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 10 Nov 2019 14:05:14 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Nov 2019 22:05:10 +0000
Message-Id: <20191110220510.10077-5-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191110220510.10077-1-git@andred.net>
References: <20191110220510.10077-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/5] nodejs: support long directory names for ${B} / ${S}
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
X-List-Received-Date: Sun, 10 Nov 2019 22:05:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Part of the NodeJS build builds V8, which at some stage tries to call
ar with all objects with *absolute* paths (and printf the command line
first).

This will fail if the build path is too long:
    make[1]: execvp: printf: Argument list too long
when trying to create Release/obj.target/deps/v8/gypfiles/libv8_base.a
via below gyp-generated out/Makefile rule:
    cmd_alink_thin = rm -f $@ && $(AR.$(TOOLSET)) crsT $@ $(filter %.o,$^)
i.e. something like
    printf rm -f Release/obj.target/deps/v8/gypfiles/libv8_base.a && arm-poky-linux-musleabi-gcc-ar crsT Release/obj.target/deps/v8/gypfiles/libv8_base.a ...

The above failure happened on a build-directory S with 204 characters
on a Jenkins machine.

While one could probably increase the ulimit on that specific machine,
that would be a pretty specific build machine fix which would need to
be applied everywhere, or switch to non-verbose builds / compilation,
but fortunately we can change all object references to be relative to
the build directory itself by setting the builddir_name make variable
and thus avoid the other two possible work-arounds.

Signed-off-by: André Draszik <git@andred.net>
---
 meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
index b189d2247..205e24889 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
@@ -69,6 +69,8 @@ EXTRA_OEMAKE_append = "\
     CXXFLAGS.host='${CPPFLAGS} ${CXXFLAGS}' \
     LDFLAGS.host='${LDFLAGS}' \
     AR.host='${AR}' \
+    \
+    builddir_name=./ \
 "
 
 python do_unpack() {
-- 
2.23.0.rc1


