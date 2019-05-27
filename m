Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7D15D7D69E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 14:22:02 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id w22so9199109pgi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=x4cGVK/WtK0oVUnw5KYUiG1nUmUThrYrh5OTDctW1Zk=;
	b=mYnlf1mZbHF0JZ92Oy0Sgz95oP6RuDhrMioiCDotFGS43UCG7JzhyewJyJh0rGQXhm
	M4PMFWhMWNghzkaYXKmhvZB68Ahfh6tmXGKkXADWCzYNJw7F6EEe5DYoS3RCrf5NKQrt
	ZQKNBFgSacVOWE5KEw5XZP2tRY/BKiotFyi6ngl0akV9/+iDQZ4jKDoSQUoITTCpuAxH
	rZro4/b8l0gAlB9S3R5XKwxbxunZkhoPrjD94Jx/2nJnm4Vhc1dRhaH6Kqyz/yU0g7Ko
	hcHoBKN1PBcsRWwZh30W6aBEaM/RHniIZQJiW21T+Wvb1g4wwfPR8cavP9NiLB+ZLPDS
	FkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=x4cGVK/WtK0oVUnw5KYUiG1nUmUThrYrh5OTDctW1Zk=;
	b=WNszCY0lIzLWDuQoOgSrQDQekLYoRgyz95IEWR2hjj475P0WHOZetmxQFJL6m+0rgE
	sNWrzOlmscjk5Xf28fD95H8kMWpobQzIsG2Ev6g2XVXZVqpW4AV0rbRPyMv9jClYygNa
	JlT+E3h3oIuEmKVO0yV9Ie4Mfcwxiyao50vdbmpu+59l0RuuY4ykx2gkLU4gC2qCzk4l
	L0JCBbq9UWjsBPAAZLiL1fYXMN4BlPtafbtbIPVxSm3auC2Zg9wbkajQRBXP7APV9Xkj
	FyPn6iW+qBLBRY5KFx3e5ONsswFcjofpiXSxo7IjSbiTjI3Ahq+4US7ZnobJxjitwIR6
	HufQ==
X-Gm-Message-State: APjAAAV4sXdh+O4/PmDNgDLNCuocYuc1QI32xexIrmzSujmz379vT0G1
	U66SLGQ4G/1uFIMj5nQ/fD/rSNWo
X-Google-Smtp-Source: APXvYqwHTC5dnpEMmE/AgNZlUrM6q7jveL+R3WCk9nYKFO5eJ+O6QVJ+Mivmwdd6UaeFo2PYHDPSMA==
X-Received: by 2002:a63:1919:: with SMTP id z25mr1727121pgl.440.1558966923472; 
	Mon, 27 May 2019 07:22:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:6833:552f:fefb:d39])
	by smtp.gmail.com with ESMTPSA id
	11sm16902190pfu.155.2019.05.27.07.22.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 May 2019 07:22:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 May 2019 07:21:57 -0700
Message-Id: <d86834a5a12b6856694181afaca0dd8572ac39ae.1558966857.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558966857.git.akuster808@gmail.com>
References: <cover.1558966857.git.akuster808@gmail.com>
Subject: [thud 1/3] netkit-rsh: don't build under musl
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
X-List-Received-Date: Mon, 27 May 2019 14:22:02 -0000

From: Tom Rini <trini@konsulko.com>

Uses iruserok and ruserok which are GNU extensions available in glibc
but not in musl

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index 03dd963..d034cd8 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -39,6 +39,8 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = " , --without-pam, libpam, libpam"
 
+COMPATIBLE_HOST_libc-musl = 'null'
+
 do_configure () {
     ./configure --prefix=${prefix} --exec-prefix=${exec_prefix}
     echo "INSTALLROOT=${D}" > MCONFIG
-- 
2.7.4


