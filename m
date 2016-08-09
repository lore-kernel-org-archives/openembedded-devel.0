Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0AD9A7721A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 15:40:54 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i6so1077350pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sGp/GHKTMIPQCRRaqAdb87hmHuP4qp8aYdlKMCXjt3Y=;
	b=E0zKYGO8+3jsDOOibnjFptcZ2JH1cTTFmzMB1zc2bILlMptWgdy72A3JiE746zfWgo
	ba8p1cW7B8XkFHPhovcMI6wdX8izq0xXkzCtvGp2PX1zAp497i40ZnZcKZ4qw0A2APX1
	4PE29GcKeG4pRUrCzmC2+cAhj+qKTdOFzJ+ELQlUu9ZzZtkY4Wl1yl/fgBPQKLb+sLTv
	HU9si7etNWKR5zfvvR4u+mI2yCGDsMomeDo2YGJB3vcLxMjy/aaNbc+nVNGD46oWZ83K
	bEKS5Uty4la8NFe4mZErMTXa8McItwjChYL+6F9Ij8P6Wc8ntDnzxxi1NcSxLkotr/Jf
	hD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sGp/GHKTMIPQCRRaqAdb87hmHuP4qp8aYdlKMCXjt3Y=;
	b=ajXhM4pqNqnAlsNhKNFLY1g1AKTZI/FUm3CFvkN4EaQi6ZpJfXRcoptf+LcZy/Zz9r
	uEV1rpciJYJGzg54i/S8pWLy3lbS7SUU4xsFuXx4aOMOh/Uj6NreihmU/pT8wdTl9Gun
	dbw5f5lTcbDwJ2G/UXyvJRiHxKUDIXxPjz0DCVj0kNZ3fCTce5pPWv1zDlFQ9Txpfi27
	RDxbCGoCLeIZjDaKukp1LxiC4t8JJS5eqx/2RmLbbfkgUi5UXIbgBtiWczS0onFazjOJ
	LdemIpDiom3XBZLT7iJ3FDAjMy9WdNb2AvBNLftEaKiDAQfTY+QDEffG4rORKNmp2npP
	8Ebw==
X-Gm-Message-State: AEkoouujHlSOA3u1NWjFxhAjt/NEYg7vYNkY+aPE5KF6bvw/XcEwBJEoushtmOKIkrAmzQ==
X-Received: by 10.98.95.129 with SMTP id t123mr68250323pfb.148.1470757254628; 
	Tue, 09 Aug 2016 08:40:54 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	k9sm56963914pfj.63.2016.08.09.08.40.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 08:40:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster@mvista.com
Date: Tue,  9 Aug 2016 08:40:39 -0700
Message-Id: <1470757240-9091-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1470757240-9091-1-git-send-email-akuster808@gmail.com>
References: <1470757240-9091-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH][master][krogoth 5/6] mongodb: failes to build on ppc
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
X-List-Received-Date: Tue, 09 Aug 2016 15:40:54 -0000

 Checking if C compiler "powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400 -mno-spe --sysroot=/home/..../poky/build/tmp/sysroots/qemuppc" is GCC... yes
 | KeyError: 'powerpc':

add powerpc to COMPATIBLE_MACHINE.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/mongodb/mongodb_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index 6522a67..cb6c1b3 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -27,6 +27,7 @@ PACKAGECONFIG_remove_armv6 = "tcmalloc"
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
 COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
+COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
 
 PACKAGECONFIG[tcmalloc] = "--use-system-tcmalloc,--allocator=system,gperftools,"
 PACKAGECONFIG[wiredtiger] = "--wiredtiger=on,--wiredtiger=off,,"
-- 
2.3.5


