Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 58BDF772E1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 15:33:23 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id g62so34187419wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 07:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YI2V7eOQppbHlOE5oUXkvOGjuW6anA2rruRg7kSH5dQ=;
	b=aVQKsYc16hQP0fLOR5mHcDsPI2nK7YhUB2jcaY5io8PSow+3pew41GZsGEAZmHHE0t
	gWoh223lvq6I2uuFg1evfWOhorfkPOUQ8tlmqlQNEn+qmVcTvn+hoDWmYZ+1R6bDoiuL
	aZn8GwHC8/UsCBJEye4CIW6L5ngLIs19u0Y3uKjSTtSBpPE3WTvUTdjmMDr6l4+hreg6
	A9Gf88+gqWiWCQdziD9OFGGG14I+NM8pF9SFenwNRoUc2T7lpSYnk474BXR+Cjzbl3Cb
	Hen5gY+lW51jR3guWzvMWaonDNuxGS/S52Dtb3dz974zJfJuAmAr1UpdHsoJPNmXA6El
	uDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YI2V7eOQppbHlOE5oUXkvOGjuW6anA2rruRg7kSH5dQ=;
	b=YMjZXeRwd7sq03FAd1WAdC0k+ty2D9nxPQ3YHwd4GK/R+rsZtXfCm3WAp38Nw/gYKS
	0aF1HA3zFYUhrGynSaJiXt4WXapHmgu+BKknbowtEDo6tx3PhYzeFNIwSv0cD8Iot1Px
	7FLjKvm5FidOcZYMUf8D1QCGNQdAG0S58YU6dDh328wuSoyKdB3WJIBxWshV7TLZhN9l
	mALhgTe0esNoEWmfQO7euACv/8r/7EqNJzjEISd9XhAmmIMphLfFRxATHI59srpnwk+h
	dFqQJ87px+1e/blaVG8xlC4tvFp0ctuvJhcoA/gMf/h65I1v9zWBXlCTO0EQ1Enyrmyg
	WVdw==
X-Gm-Message-State: AG10YORYr9c8K9DB5RrR9XwWcqGzyI4tlLFwERXxWhb0PQ1Nph2JDj++sPZ2S5Oh7azYOA==
X-Received: by 10.28.12.80 with SMTP id 77mr4177005wmm.19.1456414403431;
	Thu, 25 Feb 2016 07:33:23 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ls5sm8409463wjb.33.2016.02.25.07.33.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 07:33:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2016 16:34:34 +0100
Message-Id: <1456414475-31462-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <CALbNGRS8r8+dO9SVWoK88DrDwzxkLJ-tANBAx3fZiznwjjqT-g@mail.gmail.com>
References: <CALbNGRS8r8+dO9SVWoK88DrDwzxkLJ-tANBAx3fZiznwjjqT-g@mail.gmail.com>
Subject: [PATCH][meta-oe 1/2] zsh: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Thu, 25 Feb 2016 15:33:23 -0000

* This recipe currently relies on EXTRA_OEMAKE having been to set to
  "-e MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make
  this explicit so that the default in bitbake.conf can be changed.
* Unfortunately the build doesn't fail, it just produces almost empty
  output and QA warning is shown:
  WARNING: zsh-5.0.5-r0 do_package: QA Issue: zsh: Files/directories
  were installed but not shipped in any package:
    /usr
  Please set FILES such that these items are packaged. Alternatively if
  they are unneeded, avoid installing them or delete them within
  do_install.
  zsh: 1 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/zsh/zsh_5.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
index 658f3d9..39b2d95 100644
--- a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
+++ b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
@@ -30,6 +30,8 @@ EXTRA_OECONF = " \
     zsh_cv_shared_environ=yes \
 "
 
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
 ALTERNATIVE_${PN} = "sh"
 ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
 ALTERNATIVE_TARGET[sh] = "${base_bindir}/${BPN}"
-- 
2.7.1


