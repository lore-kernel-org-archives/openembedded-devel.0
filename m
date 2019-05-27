Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 78ADA7DFE2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 14:22:04 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 33so6235728pgv.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 07:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wuHykQuzBP7aQ03bAZLrhus5Y0d/hclhDU6OmSfkbI4=;
	b=MNavPKiSJP4dSJUBpRdaplfJthu8lJLqBnYPSxU15eilTDRnOKkRLkP1Z+cLSclCOs
	1p65iX5dKADZj5DgoHuVxVlflq0OJ5WtQSxCwO7+xedTwx9CRJlGOph/rBd3PaV/PPfA
	A/2DZjm/cqIg//N4LG/dyX8zP8FkwWCIyYKDB4SinW25bgf5KnbCMZOxSPiXemq7M6Ko
	ZfIF7lnOfSzEk/7TBkHaBUhk5pNzMesEUTk6v9FGge8YwZJitbhMTmWsdjt3Fi4qn8jq
	XYRlvCNmuMt/3Rsctnkvv97w+zu80Rwtorp8ysAGyKdDLHcDPfLb7S9dK/IOMHEzKBAa
	zEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wuHykQuzBP7aQ03bAZLrhus5Y0d/hclhDU6OmSfkbI4=;
	b=Svf/J4xFMuZLN5cXQT68UlJBbXxQ54KynHXb4OElI5IRXSJGZMLmqrCB9vuHxFUCu5
	aiytULInC88jEs8QQT6qF076s3LVskniNUcuTtkPAyiDD++4F0CI/9x3L5q4YQKR3ogz
	0MYcDkMKOzPINETr5k61JLtwUVre2vrgOwTfhn9Wx61lJsg3QCuLge4I4924V5IlFlDd
	w84KlLi+IA4s6SWdySkW4b7T1bhFjScnXFama3IEJhTfLlretzp9azR6/qBfN2KbIM5t
	FXX1Gt+bmhk/9rsAb4SUCZeJsu2lE9WxdlkU0ySaqqyYypZ/RuQ1kZn3x+2UjyTE6Qe5
	gKRQ==
X-Gm-Message-State: APjAAAUvoJGrPaEabbNq257Ey2A+s0xRRKRN2St6TEfv2AmsUmGat8O9
	t/+OfYlecldoBgnaBDBlQjOfkxYU
X-Google-Smtp-Source: APXvYqylWfmJRCWFN1qdBh9B+5h5NhKhx4I9nQcmQ0wBknWdZwhuNMZwb9iqJcOO03yC2wvLDGR2cg==
X-Received: by 2002:a62:2e46:: with SMTP id
	u67mr137837685pfu.206.1558966925492; 
	Mon, 27 May 2019 07:22:05 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:6833:552f:fefb:d39])
	by smtp.gmail.com with ESMTPSA id
	11sm16902190pfu.155.2019.05.27.07.22.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 May 2019 07:22:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 May 2019 07:21:59 -0700
Message-Id: <38ae0919fe8eb8ae33a5906e603595222189caa4.1558966857.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558966857.git.akuster808@gmail.com>
References: <cover.1558966857.git.akuster808@gmail.com>
Subject: [thud 3/3] netkit-rsh: add tag to CVE patch
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
X-List-Received-Date: Mon, 27 May 2019 14:22:04 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
index 4381f5b..285667b 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
@@ -10,6 +10,8 @@ Origin: https://github.com/openssh/openssh-portable/commit/6010c0303a422a9c5fa88
 Upstream-Status: Backport [Debian]
 [https://sources.debian.org/src/netkit-rsh/0.17-20/debian/patches/fix-CVE-2018-20685-and-CVE-2019-6111.patch]
 
+CVE: CVE-2019-7282 CVE-2019-7283
+
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  rcp/rcp.c | 5 +++++
-- 
2.7.4


