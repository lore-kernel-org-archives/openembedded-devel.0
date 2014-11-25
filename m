Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 35F467227D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 11:36:05 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so1101711wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 03:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m90DdXRhCjGOa4WuuDXZ2emDDK9hwH6eSJdsQ7r4qEo=;
	b=wY2yCP3IKHDigfDXItb3NVvaRSHXAiRL16HDUtIjYKM0q0D2LbAvhaC19rO9gBHuNQ
	60rHSrhp77J1TevoipETTSEJXNXMFVOe+zOtirbACF60cxvAtd8khtzkJ6VdQkoqKmzM
	wwoLCRkqPd8ZEkItydS0eUkhtT6jzrDkYP5HuJeeEoeLH/AAydvn+Xdr0+deeQ5zqkIU
	w0FlIBRcXnk82BTxdgbGlKvpVRuf1VGJZs4w71ymIOkYzGb+cZ5bJWjo1IecGHFuosDM
	VyIi9KR6KR5EI5TiIvDeZ0BvsY+vCiJsW256MLA0TmXbssCV+W721vbauZrswaeYoPUW
	6FRg==
X-Received: by 10.180.78.9 with SMTP id x9mr30667962wiw.39.1416915365655;
	Tue, 25 Nov 2014 03:36:05 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g16sm1512580wjq.20.2014.11.25.03.36.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Nov 2014 03:36:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Nov 2014 12:36:04 +0100
Message-Id: <1416915364-14986-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <68C425C6-14C9-4C9E-AA9B-AA2624C735D1@dominion.thruhere.net>
References: <68C425C6-14C9-4C9E-AA9B-AA2624C735D1@dominion.thruhere.net>
Subject: [meta-oe][PATCH] acpitests: Blacklist failing recipe
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
X-List-Received-Date: Tue, 25 Nov 2014 11:36:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/acpica/acpitests_20140828.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/acpica/acpitests_20140828.bb b/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
index 2a089f8..75e10f6 100644
--- a/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
+++ b/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://tests/aapits/atexec.c;beginline=1;endline=115;md5=e92
 
 DEPENDS = "bison flex"
 
+PNBLACKLIST[acpitests] = "fails to find string.h since sysroot poisoning was added in internal toolchain"
+
 SRC_URI = "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.tar.gz;name=acpitests \
            https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz;name=acpica \
            file://aapits-linux.patch \
-- 
2.1.3


