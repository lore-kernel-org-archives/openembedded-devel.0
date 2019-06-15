Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 82DE471BB9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:40 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id l19so3400473pgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GUtQkksRAdgBXTzjXZvJM05e/JuiwRsETmjyukxwN1o=;
	b=e8tdiRHIkeyE7Q36AEU9Ys6KlzAnw6DV51BwyscAH1mwAEPGHu9mCU22/XZZJ91Pvx
	sAR7CgIzMQGjBAJ6QEK3zj9XxD2spdVfs6JzrJxZDoDTk7IBW/84ZYKoBK1DYRFXgP9l
	/PkdCVtXa18GxCC78JueCmxKtoMzVyY1eDdN6y18sjX2vjehjRRe8RiiRo6Imo0aFGfd
	CiHrGow4nCVq7+GJa9iuqf7PHoFpjQ+OmL8Id1+/e29K9/IRBzhRXJ2C8yDqCNEQ/eFh
	w2kwXy1Fdtfocxvhq1dMTGab588x9nAlcxvlpnMfx90RSxwugMT5SG2HCbkZpco3YUqr
	9mFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GUtQkksRAdgBXTzjXZvJM05e/JuiwRsETmjyukxwN1o=;
	b=UKoXLCodNhetaiCUA2WqVXRjfpyHzhb68BtnTaLcjeAB8QLXOWTuxzTC8D8kUBR99N
	OLjfP5Go4EvxOxbzMQIybzFCxfq6NPlSurWxE/yChkwAKcVcvHWW/8UjMtg27J5OZE1U
	1whfpVLZMR+KUWCePvKTYJ7LaKsfdxnRf571B0uMDJRQe1pa3RGf/aivVpD3pBHt46ac
	q0gBsufmYhAYfn9dOngx6mrstMX6lHaKF3QUnZ5mlPucw+0Orp6tbjC7T7d5ZOdzLvOB
	c4Nv8D06/bJqhLiBoT9ba1y2Ro0DC/3V4Q+fre1RiGOPUf9iEn/LaZw/Y7sXFjrAUTbF
	xvlQ==
X-Gm-Message-State: APjAAAVkH+NyH/mn7kFuxWGpnNJadENEb8A2RQmlKMMS1k7katKdJi9D
	zaLoV6uUCmNZ0+0eujdC+d3lo0qc
X-Google-Smtp-Source: APXvYqwI7HWGkoJun/VTx4qqme3fZtMCV/7FMs7dF1W22Ogwn8gPcDK6K+ahBQOLunfAmlbS9nDRfQ==
X-Received: by 2002:a65:56c2:: with SMTP id w2mr42494054pgs.49.1560621461439; 
	Sat, 15 Jun 2019 10:57:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:14 -0700
Message-Id: <e7a0f311e3ce9abd6fe1d06ed255e15d48916b3c.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 10/23] libvncserver: set PV in the recipe
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:40 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* last SRCREV bump commit says:
  libvncserver: Update to latest commit post 0.9.12
  but there is no PV in the recipe, so the version was just:
  git-r0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
index 6a806ff..bc47a3f 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
@@ -32,6 +32,6 @@ inherit cmake
 
 SRC_URI = "git://github.com/LibVNC/libvncserver"
 SRCREV = "c0a23857a5c42b45b6d22ccf7218becd1fa69402"
-
+PV = "0.9.12+git${SRCPV}"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


