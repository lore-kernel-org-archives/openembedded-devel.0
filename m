Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 87DFE7F8B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 20:08:19 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y8so8791725pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 12:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OXd7LPt0kIeFbqy4IbbZzL0pyuz4FGUjJ9RpaQ5Pcoc=;
	b=bSE9JJe1d7G0JRRrKHn68jEIv1U0ITCL0yGHofmM/iyjfZgSEOUeXEaNR20YKzIyLK
	LMKkpWaqtqGx3pLRJB28qfF6pcxnx9uDBNN5hOJDVF7wIye1xUI5LbXKz77MxE4AMXbx
	Y+3b0evbtDUrw5Z0uSWwErkOX9qAxrodT1BD3TgoqkjKry7mLnau2YgyvkBp/aHFJdDg
	OpjQ38xJa4c5jsmCV1uojZBEKsjhKUThDhp7yHOHfKM9dBwJ4ZnLtxTtdBQ3JkY/sK1f
	h5But3gcWJrhUVAXVVDaFgCSCOaBADCH02fmfh92jeiWGODSRnfAc7Qsry8lgM8ipTtn
	LjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OXd7LPt0kIeFbqy4IbbZzL0pyuz4FGUjJ9RpaQ5Pcoc=;
	b=qzZWfr0d5fBtxCTYRyFZDCgRSOFPTvWNjsqwr6ZOwuxAGvA+TH+ibtRXv/9BA9ntM5
	zP3R7WP09WVEe9ctCGjzs2qG/mzQ5hDqz1UzK6PXEoUczWBw83RaXOwEumv62DB3FkW+
	wwsIZN7epdr+bXJQpebCzbqdfkPSkG72d3tGRwYwtnCLfPg+PQG07xh5y1GoZbkpCP8f
	hJuUSlT/zDqQHkR3UXSYOEikvHQIT2n3FtW0Hu2RGPvlEqhf+FNWhsrK7cyRwZK6tvjg
	z5ps9740ms6L8wkOtjY0O1y3enjEJWMwGLNJfrKRlMCLzZ7aJCG3DVV9XN/6t4ncxI+e
	zI3w==
X-Gm-Message-State: APjAAAVHHC2HhUZ+PA40He5ZI0emxIW7KrRRVENmocHolprNYOSovhn0
	E852Xy2Cneun7oRKp/u0EcPXtUU2mdA=
X-Google-Smtp-Source: APXvYqxUs6v25GwgZpNQJJD1C88IdyVXxLUirkUbIUbYLl+v4JUiN+Ff6E3hkZjkHfAo9QhDHX0gug==
X-Received: by 2002:a17:902:d205:: with SMTP id
	t5mr22991978ply.138.1579205300027; 
	Thu, 16 Jan 2020 12:08:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id
	x22sm26578340pgc.2.2020.01.16.12.08.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 12:08:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jan 2020 12:08:14 -0800
Message-Id: <20200116200814.3496874-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mpv: Disable lua support on powerpc
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
X-List-Received-Date: Thu, 16 Jan 2020 20:08:19 -0000
Content-Transfer-Encoding: 8bit

luajit is not supported on ppc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
index 29bcfe49f5..c327c45e66 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
@@ -30,6 +30,7 @@ LUA ?= "lua"
 LUA_mips64  = ""
 LUA_aarch64  = ""
 LUA_powerpc64  = ""
+LUA_powerpc  = ""
 
 # Note: both lua and libass are required to get on-screen-display (controls)
 PACKAGECONFIG ??= " \
-- 
2.25.0


