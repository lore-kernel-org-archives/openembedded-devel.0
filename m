Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 23E1078685
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 06:04:04 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id o13so2723719pli.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 22:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MiGsl7aHcHlwlYR4IRsjK/Ca4QcdVD5AcGqiBW+DaGM=;
	b=cpmf8c51sVafz1v4XJfoJs8MeoZrUqVsuBcFbWc76boyFhkGHo95iZejyzKZDc+ler
	fpulLtNTvvIB38kdft4ZMhMK0QGRPpRMiJddipbl2eqrUgkWlJMHMHp/I+AXHZczRdMC
	q8ryVi7s8DMEhegk5jxu+pNGFB95TAZqNU29opGhZtTtNSz9clK+rMTomMZZVYT3hlgQ
	Yv1GtIV7sBE6GUUYobdHCk9fRXeSH5iDwAxMsyX4zy7CbY8A5+3rZ184K7vAH4t4oUxt
	2Xx/C76hcngMKQtTAOyzVyy2XId/SVyCo8xmfiKbIrAq/wfoWkdK1CWvIMv8cbdAdVRG
	BKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MiGsl7aHcHlwlYR4IRsjK/Ca4QcdVD5AcGqiBW+DaGM=;
	b=qJ1mZfpcpO2aCbjD4mI5BLZJk7C0vXIHy7L092+Ip7B99TUZ85FBBdQ1h9VvKFTjS4
	NTsw+FA3BmYc2CCG5NujbQUnBSzE74VVCd9NitE2zmSKMC5fluoFLh4x/Z9kCVKRn+90
	IuU0YAvUnk8GWjWITVIL+LcVic8D3eYAPsPG+gOqojYx3CzJ05zD/ylNtUKeIxrfsVHU
	F/RUEAxoOoSJHWTeu3y06n+n/h9joG3Ol+jQyoq/Rk/nUINiHxvQfVdZQ3L7Bzt73E2y
	d8oxzLU2sqRsl2giUfxwBxz7E6FkSVHyaSzNUgMc4e1S8tUWGQdLemmobvgNCTJhSRCV
	+NQA==
X-Gm-Message-State: AKwxytdVyJZ9MChHSe8chd2YvgMxv9Uxn9LvAGCssqXcvQFJ0BzKfaY5
	CgykAo527FPRpSkqkGF2pDkw8w==
X-Google-Smtp-Source: AH8x224y8LPh08Jv16N5MgTSe+wPS3LFki34fidXDSx4SACnVY76Q7Gr1R/FK2XbpehCxLaXk0wzqg==
X-Received: by 2002:a17:902:6f08:: with SMTP id
	w8-v6mr30638377plk.155.1517465046050; 
	Wed, 31 Jan 2018 22:04:06 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	k29sm26264452pgn.28.2018.01.31.22.04.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jan 2018 22:04:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Jan 2018 22:03:52 -0800
Message-Id: <20180201060355.5218-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
Subject: [meta-oe][PATCH 1/4] obexftp: use makefile instead of ninja cmake generator
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
X-List-Received-Date: Thu, 01 Feb 2018 06:04:05 -0000

Fixes

| NOTE: make -j 44 crctable
| make: *** No rule to make target 'crctable'.  Stop.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
index 489861cb7..b4a914d92 100644
--- a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "d40fb48e0a0eea997b3e582774b29f793919a625d54b87182e31a3f3d1
 
 inherit cmake pkgconfig
 
+OECMAKE_GENERATOR = "Unix Makefiles"
+
 PACKAGECONFIG ?= ""
 # fuse support will need meta-filesystems layer
 PACKAGECONFIG[fuse] = "-DENABLE_FUSE=ON,-DENABLE_FUSE=OFF,fuse"
-- 
2.16.1


