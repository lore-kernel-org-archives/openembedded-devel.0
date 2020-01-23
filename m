Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 204C09204D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 05:07:17 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t14so823155plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 21:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sjqHcMrhf0u6qU/iJTRKp/+/HL687n9FRE4mNvSgMtk=;
	b=oEnP8k4UDsdYbrH+SkScTSUxZcvgSe8kdBt8oQuPOu7IjdnVSQMsuYi/fVIHjqEZ8w
	wnqGK1X/JUxJ5rLrwo8ltocguP9GPjIpuEc5a/Yk8N+NhsNZLaSQoCCSCN5Pv9tYiCkv
	kgUUDp0UC2JvPNnEOGFUGKf0bZQTO8bf7gLM243wNLRhN1EVygrARP/3uOxIuARWlj/X
	1DYGtK9y7Dpb07lZtSd17UJB5FM+lawfPO3kz2f+efuGNSLp/FQvvW1xJ8bE8otlB2eH
	09G6UIL1xD+bfAAleNfY6SCmLfxidvRSrMvEA/uUNqEE4auNu5PTNTfXCngwYtelVnya
	zxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sjqHcMrhf0u6qU/iJTRKp/+/HL687n9FRE4mNvSgMtk=;
	b=VkPc+h66bUHNWlRRbujRDtTZGeYuXqjdpYQorNg9d4JTTwrmVahk0e++zapfVlbNyp
	uyG10zqj7hbNaK1aUl3tccuwqJeId6mOQassl/0eddkGlZbZTyngsUy7NDAKQ50e35Vg
	jlVMey0EoBft5vfBgqrdlwCku12Kj542fyKSVlvai/vlIMvEkG7GV8uLe2ihEoknwggJ
	wxIZNZucOnRdB1mkApT/XbGxJhp7bMqPbCwIYXsOjN1GeFquP2Ls8hZieyeL1MUak0yi
	48VFGK+N5j9JeLMvDtnj8eZMfzODeeQfy8oUkbUoZwsO6DtE9ugWiBCUlHt19X4TQqhE
	WIsQ==
X-Gm-Message-State: APjAAAVAx9Q5TjfvAcGsDeBWVbUI9Qmy4Y+JafG2AlF3S8wG4Kwm4anv
	FkxcakKcyD5CX4kIstPUV/zefdOgxDw=
X-Google-Smtp-Source: APXvYqyH/Tkgdw6/u2Fl7Rlznct9XKYMqUArxRzc9sWPYa8DYVJMB8vtLzpIt6ol4+L6f790gwN8Zg==
X-Received: by 2002:a17:90a:b009:: with SMTP id
	x9mr2498902pjq.124.1579756038553; 
	Wed, 22 Jan 2020 21:07:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id 207sm650127pfu.88.2020.01.22.21.07.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 21:07:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 21:07:15 -0800
Message-Id: <20200123050715.300597-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ntop: Pass PYTHON and PYTHON_CONFIG to configure
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
X-List-Received-Date: Thu, 23 Jan 2020 05:07:18 -0000
Content-Transfer-Encoding: 8bit

This aids cross-building, otherwise configure goes into weeks to find
these especially python-config and starts to poke at host files e.g.
if /etc/debian_release exists then it errors out, but if it does not
then it deploys a workaround and continues build, as a result we see
ntop fail the build on debian-like build hosts but not on others eg.
archlinux

Fixes
checking for arm-yoe-linux-gnueabi-python-config... no
checking for python-config... no
Please install python-dev and rerun configure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ntop/ntop_5.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
index 2d37969a70..f06e2dc1f8 100644
--- a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
+++ b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
@@ -37,6 +37,8 @@ PACKAGECONFIG[plugins] = "--enable-plugins=yes, --disable-plugins, ,"
 
 EXTRA_OECONF += "ac_cv_file_aclocal_m4=yes ac_cv_file_depcomp=no"
 
+CONFIGUREOPTS += "PYTHON=python3 PYTHON_CONFIG=python3-config"
+
 do_configure() {
     cp ${STAGING_DATADIR_NATIVE}/aclocal/libtool.m4 libtool.m4.in
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
-- 
2.25.0


