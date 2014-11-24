Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4F78072201
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 22:59:52 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id gq1so8036307obb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 14:59:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lMkezXqQ7PWU18oX+cTIdRFZrIdKwgy3T2ipX+Owpvo=;
	b=iVRNgjzxLN3rWMDEE/fYBONO8uG1TLEgtcmlFIdLeLPhtC2GcZCu0+ksbuZ+eQfYa0
	ypoc0CdMZ3UcSxqF43zwEOFu2uxfn9qSaek2gYRUertKmxAkqVkXey9dTvLsNLYWiysX
	eISQhvVqKcnLvROT5blw/BmEh+wf4VRgQXffs785B3rJGWeXdr/O+Mc055OnPFtOSoqT
	v/dP64LDWT8Pv6lPfCpXkAtPcA/p6atImSB0E6lrK5wxJhAFn2kvlJIHbwYuhGBv3H1V
	TOT1/woPs22jqNH09BZZnuQ9rnWtGlnsIDBKYShq39jHBIpl08/SPxQkiHI1YiTclcxg
	OsGw==
X-Gm-Message-State: ALoCoQkkH76c1buceUIhnVG8i7UAyDSpJi3lQ/5DvHHbdy8jlr/1w8RdOzH5HtoF7ESdVKkP/353
X-Received: by 10.182.50.168 with SMTP id d8mr14250914obo.2.1416869992835;
	Mon, 24 Nov 2014 14:59:52 -0800 (PST)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id n7sm6298616obh.25.2014.11.24.14.59.51
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Nov 2014 14:59:52 -0800 (PST)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Nov 2014 16:59:13 -0600
Message-Id: <1416869955-13519-2-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1416869955-13519-1-git-send-email-gary.robertson@linaro.org>
References: <1416869955-13519-1-git-send-email-gary.robertson@linaro.org>
Subject: [meta-oe][PATCH 1/3] libhugetlbfs: Add ix86 to list of compatible host architectures
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Nov 2014 22:59:58 -0000

From: "Gary S. Robertson" <gary.robertson@linaro.org>

COMPATIBLE_HOST included support for x86_64 but not for
32-bit x86 architectures - added generic 32-bit x86 arch names

Upstream Status - not applicable - recipe change only

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 .../libhugetlbfs/libhugetlbfs_git.bb               |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index c2262ea..737acb9 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -23,7 +23,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
+COMPATIBLE_HOST = "(i386|i486|i586|i686|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
 LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
 LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
-- 
1.7.9.5


