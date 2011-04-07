Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q7pAO-00027P-FE
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 15:22:32 +0200
Received: by mail-yx0-f175.google.com with SMTP id 22so1008936yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 06:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=2Ett1qQmnCexPCZ8viTU18mYRD8oadyZQV3ZFevK+FQ=;
	b=QGI3mKsWJqDZu76legNBd6yYWrfa2+c2hpR88sfG6ag9vznIC406eV32axQHvjKLvQ
	u1pF2nIq3KOnZsqmWezhmM/aX7Dak/Q7M8MR5hsHeC5jeoQSqjJ6FkBeuFwvqW4C7Ikp
	wZlZBM38PG8cvo3Y9jnmalphBYIfzm23Y2U0w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=hxBh8yD04TdkSYDx5IjipSFZ4nVN28mpoW7L4JxXIGEUHwOKxQs7HLpKVaAqEj1pmY
	/YgsvivVnnXiLcMmCcfMNl6MFkIgO/WQJXQm/pvBrzvJjJaqdnMgL98U6Fo9H4a9Co4r
	49XI22T7adqQeiGgiUYqmwQCd1d3vzx/U1sfM=
Received: by 10.236.185.200 with SMTP id u48mr1101312yhm.135.1302182424243;
	Thu, 07 Apr 2011 06:20:24 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l43sm726453yhn.36.2011.04.07.06.20.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 06:20:23 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Apr 2011 13:19:55 +0000
Message-Id: <1302182396-4171-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1302182396-4171-5-git-send-email-otavio@ossystems.com.br>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-4-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-5-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 5/6] xserver-xorg (git): enable xephyr
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Apr 2011 13:22:32 -0000

---
 recipes/xorg-xserver/xserver-xorg_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xorg-xserver/xserver-xorg_git.bb b/recipes/xorg-xserver/xserver-xorg_git.bb
index 98831ef..d37c61e 100644
--- a/recipes/xorg-xserver/xserver-xorg_git.bb
+++ b/recipes/xorg-xserver/xserver-xorg_git.bb
@@ -6,7 +6,7 @@ require xorg-xserver-common.inc
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
 PV = "1.9.99.1"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 PR_append = "+gitr${SRCPV}"
 PE = "2"
 
@@ -32,7 +32,7 @@ do_install_prepend() {
 PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
 XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
 
-EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
 EXTRA_OECONF += " --enable-dri2 --disable-unit-tests "
 
 export LDFLAGS += " -ldl "
-- 
1.7.2.3



