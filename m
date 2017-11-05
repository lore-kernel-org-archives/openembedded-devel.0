Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C5E6C782D3
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Nov 2017 22:08:17 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b9so10718741wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Nov 2017 14:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0iPjURyKxx5fxnX/m2c3/iMwfRhImhV0zEdK2cjBWe8=;
	b=hdSUrWdz5lYU/nEiVbJIFNSydQfclDwG1DockAHrbVY1TXqlvM3lx49l29lGDuver4
	d4S6/CewpojihxVOPqNJm9k8GySY7EREioMVYeSDfIOreSp2Lz+91YaqWWlxWIik7X8f
	gafw8IneW0CJJYCVESwPATefLXyMgvuuy7qhiy69D3niCUu+HfIcZHgb8QrWt/KT6pPD
	JuvJQWE3cPtk9a4QrrWyUFtG4J6mLwY3PdwUSd/aboTe2IVhU9o7r9Ts36JzMfnx5oPF
	efeMuE403JLPYo9+alFrE4VugZpO+sldgfYYalso1/axObsGuPVca/yldc1fzDAOP2on
	AoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0iPjURyKxx5fxnX/m2c3/iMwfRhImhV0zEdK2cjBWe8=;
	b=G2LjF2GtrlgEeCuByYFjjW3L+Y8Ll2uFtpNi1rAQBYmsiM67AnRvgNlCRRnObv6fAF
	0qt74rD4XmAxoiS2czowXKxZO2+j9ZdvnTpaQKrjXofD/cGJJBaHe4US6TXDiiaOH5aA
	PeL39wcBuMBcILUwlU36xfEv2QTlUntaKoGIXnlNq0jn5FdhRyaSLObHmAU1q/+G2Agh
	UgFUs0ujp6akPcK5xk1RHwGfpv+6INlxvb/JAGCgQkvYsmtHa4QtSeYGXhscyCn0WmGE
	kOLW+2wfrDmkcaVE9FdG7pXwv724xDFZhFqqIMndv/nqHlzTbI0sXAs0aj3ZR8OpnEyF
	bsJg==
X-Gm-Message-State: AJaThX5vO49wsb6YW2gqhACjwggFGw/bRx2Jz/P0tFgteWmupVs80WOH
	Rh46UyEZtPk+IPWRM5l4WPWclZFQ
X-Google-Smtp-Source: ABhQp+SunCweV8VZZN6gkTWxiMxao2RavTwxsgHDo0WAE1GsnWvt8ns+2Iv9/lS7hdyIsvHyC9cRhQ==
X-Received: by 10.28.141.194 with SMTP id p185mr3954082wmd.149.1509919698068; 
	Sun, 05 Nov 2017 14:08:18 -0800 (PST)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	q124sm13845688wmg.18.2017.11.05.14.08.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Nov 2017 14:08:16 -0800 (PST)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Nov 2017 22:07:24 +0000
Message-Id: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 0/8] Recipe updates and an addition
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
X-List-Received-Date: Sun, 05 Nov 2017 22:08:18 -0000

All updated and new recipes have been build tested on qemux86, qemux86-64 and
various raspberrypi models as well as very minimally runtime tested on qemux86.

Paul Barker (8):
  toybox: Switch to v0.7.5 release
  mercurial: Update to v4.4
  mercurial: Support building for target
  dash: Update to v0.5.9.1
  ddrescue: Update to v1.22
  htop: Update to v2.0.2
  tmux: Update to v2.6
  dumb-init: New recipe

 .../toybox/{toybox_git.bb => toybox_0.7.5.bb}      |  10 +-
 .../mercurial/files/mercurial-CVE-2017-9462.patch  | 135 ---------------------
 ...{mercurial-native_4.0.1.bb => mercurial_4.4.bb} |  17 +--
 .../dash/{dash_0.5.8.bb => dash_0.5.9.1.bb}        |   4 +-
 .../{ddrescue_1.19.bb => ddrescue_1.22.bb}         |   4 +-
 .../recipes-extended/dumb-init/dumb-init_1.2.0.bb  |  15 +++
 meta-oe/recipes-extended/tmux/tmux_2.1.bb          |  21 ----
 meta-oe/recipes-extended/tmux/tmux_2.6.bb          |  23 ++++
 .../htop/files/0001-Use-pkg-config.patch           |  46 +++++++
 .../htop/{htop_1.0.3.bb => htop_2.0.2.bb}          |   9 +-
 10 files changed, 107 insertions(+), 177 deletions(-)
 rename meta-oe/recipes-core/toybox/{toybox_git.bb => toybox_0.7.5.bb} (90%)
 delete mode 100644 meta-oe/recipes-devtools/mercurial/files/mercurial-CVE-2017-9462.patch
 rename meta-oe/recipes-devtools/mercurial/{mercurial-native_4.0.1.bb => mercurial_4.4.bb} (57%)
 rename meta-oe/recipes-extended/dash/{dash_0.5.8.bb => dash_0.5.9.1.bb} (86%)
 rename meta-oe/recipes-extended/ddrescue/{ddrescue_1.19.bb => ddrescue_1.22.bb} (90%)
 create mode 100644 meta-oe/recipes-extended/dumb-init/dumb-init_1.2.0.bb
 delete mode 100644 meta-oe/recipes-extended/tmux/tmux_2.1.bb
 create mode 100644 meta-oe/recipes-extended/tmux/tmux_2.6.bb
 create mode 100644 meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
 rename meta-oe/recipes-support/htop/{htop_1.0.3.bb => htop_2.0.2.bb} (58%)

-- 
2.7.4


