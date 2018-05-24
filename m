Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA9174BC3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 18:27:22 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id j186-v6so3634099ita.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 11:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=juKjx/Wmt4XPYPTu8JFKqqI8MUllmycUtCN6wYUAPHw=;
	b=DQZcrUiNRdn0EZACrKmEpD5ZtIma+0nbR2Zg25GcLa5FhkOX+fdnOnk5Ycyskfz28A
	Y/0ZEbPXF/b9P7W3OP1oEl3pQp708cOed+Xg/x/etukIdb2zq1fYjAmoZINul0rTykrd
	QGYOcDB5wNZZbEnhvkPjBLIeus81iLkJZy3GgBYIjM3aZ4GGT1bCvtbb7/rfO/1iVwij
	cRnY2TFELYsvB7Rz3h/rdY/IwArh6s/2U5EdIdZohgPZV8hM2LFefgOwFWKLBQrg3WUT
	jCUMZTb8t2Wmpd72oOgg5zV0cs3Gv7I8fOCFPKogfiEPVTVMmGIoVZKdBAlNs++kxsF9
	0+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=juKjx/Wmt4XPYPTu8JFKqqI8MUllmycUtCN6wYUAPHw=;
	b=akWawhkXuCFw+5mYnhyZ9REjJJUSGMIB9tPCWH7n8FtGnKHz8jya2XYVB0ZszFIjsX
	Qd1UTFbGXBJ0sBDVRxVJHTfSoesmRZFjINS3XiW7Z4a0eBSSJ750iZqu3crTIdVJRYo4
	LBrD5PFX9cWdeZHFtotxKSMI9ALC9xCTDAD1+lgmcn3I7mvsfZyydGepzwN0QK70ldRB
	70jW0xJhJyQfFk2X9SGdII2A9hPXDMTa+k6bJ6feEXkKB9dAT/VJVYTkNEenr6GLRIEc
	aIUfWwQTC7uvCGkKCtKmxDVnzVNaxIkzMVMh/4rRrAUDdGRIb3VNFBygdumsULkM9ScV
	ZJOw==
X-Gm-Message-State: ALKqPwc2oVFgdnWUFDBmDgolU8BeCNSDRoKucxTgNMQNIKv1HRZkCny3
	LVTeSbzeHWvmexJKbOJ87kaNqCIT
X-Google-Smtp-Source: ADUXVKJyie3RD1hmvrNEPD2VhqFssDx+mZz0wn4ux+OObcBTqZYY7kwVff6422nt9RPsxus199otyg==
X-Received: by 2002:a24:d3d5:: with SMTP id
	n204-v6mr255556itg.29.1527186443340; 
	Thu, 24 May 2018 11:27:23 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o1-v6sm2746196ite.37.2018.05.24.11.27.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 11:27:22 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:26:55 -0400
Message-Id: <20180524182659.19986-8-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524182659.19986-1-twoerner@gmail.com>
References: <20180524182659.19986-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH 07/11] glm: variable cleanup
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
X-List-Received-Date: Thu, 24 May 2018 18:27:22 -0000

Reorder recipe variables according to:

	https://www.openembedded.org/wiki/Styleguide

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
index dc0081d031..7f16708edb 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
@@ -4,9 +4,7 @@ mathematics library for graphics software based on the OpenGL \
 Shading Language (GLSL) specifications."
 HOMEPAGE = "https://glm.g-truc.net"
 BUGTRACKER = "https://github.com/g-truc/glm/issues"
-
 SECTION = "libs"
-
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://readme.md;beginline=21;endline=22;md5=3075b5727d36f29edccf97b93e72b790"
 
@@ -16,6 +14,7 @@ SRC_URI = " \
     file://0002-glm-install-headers-only.patch \
 "
 SRCREV = "fcbedf5058ef8613dd02aac62ef00d55dcfeadd7"
+
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.17.0.582.gccdcbd54c


