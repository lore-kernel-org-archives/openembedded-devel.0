Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 050677886D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:59 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 13so167377plb.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Voh0sO2CJrcnmyiM3BCA+uBu+VjJ5Nr+d5uXe8v+yak=;
	b=tYecBGGwzyfzEGpyc5Se+5WGaeoe7mmIr1p0qByA3mF21EPVv8MG1cw8yiSGzBnxHB
	BJ5MhA0LV2qxMFpHmAAWgrbfSLjFC/ba8EGYQ+gBWilhFeTQQFx8M9fJ6nS00yaA59hj
	8ZlOIT9VQyXaY39lnKfCaKGe0Kf7ctxxbqi6oWHNbgyHi0g5iqlFIR4zEWPP05kiRDyZ
	EwixA3vKoM94RvTkj4Evu9nywHuyJgojcleDpu9HmsCfOd/cYoCiKUGZ9Ml3/FRhoEWX
	X8xgb/4odE2Ca7LW8b95FO+bFDvsGJx+xs9U3OC7ATXda5fmIvXyZUgCIplZBhxPnNe4
	7xTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Voh0sO2CJrcnmyiM3BCA+uBu+VjJ5Nr+d5uXe8v+yak=;
	b=e7SiwjzzZbB5fvFU0MUqD0GW6ratWYJeRTECAgnMYBLp3xANvywvItzHaximCK4siD
	e1VO3Mu+kx35MsYN0ZSAKCKGcjnxxCvYo2uxUxQhWAJx3B3em+4BFmaxU0JTlaGVZbUM
	Vz5oP3r5tpw64YZQHt3agAABh9eIDWaP81KZKi8KTacrCuCQH8ctsB6raF42oEiJa2lg
	d0UGs6QDf/ePOmaYE2ozYp3PR9Ix1LJFghYsvI2p4R1ecl+rwrLntFVoOkm0ClRHNWhH
	TyG4+ZmPSPbfCEbkkQdF5DavUjBB18wa085x6UvcvkCkShm25Di3EuXApPhN8t5QASG3
	uziw==
X-Gm-Message-State: AKwxyteTAb2tWZSJW7o+9TonRN0UshRvDqcN/aDgLiWdlK5DpWKzQg9T
	rEjCCP0bLJeXKfRKuXztuyw99Q==
X-Google-Smtp-Source: AH8x226FbwoWqGYKehLya+2lNVZnndXWkW+T9haedQhTe5FFQ8HlWxKEQcKI3ASkyaq8ZAEDbEWXJw==
X-Received: by 2002:a17:902:1c3:: with SMTP id
	b61-v6mr15791100plb.190.1517023501451; 
	Fri, 26 Jan 2018 19:25:01 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.25.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:22 -0800
Message-Id: <78804e1d5d2bbc7b351c5bae085d8fc93e035fcb.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 22/36] Adding LUA to SDK
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
X-List-Received-Date: Sat, 27 Jan 2018 03:25:00 -0000

From: Romain Forlot <romain.forlot@iot.bzh>

A project could need to have LUA in SDK, an example is
to compile LUA scripts which checks its syntax before embedded
them into a project compiled by Yocto.

Change-Id: I3c36acd58d45121c3344b5322244bdc0b12061b9
Signed-off-by: Romain Forlot <romain.forlot@iot.bzh>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 13c84c645b6126f0cb3d768e8934992f594a82ab)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/lua/lua_5.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.4.bb b/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
index 28d71fa..8f4e8fe 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
@@ -56,4 +56,4 @@ do_install_ptest () {
         cp -R --no-dereference --preserve=mode,links -v ${WORKDIR}/lua-${PV}-tests ${D}${PTEST_PATH}/test
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


