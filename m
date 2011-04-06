Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7MzM-0007x9-Nm
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:17:16 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so887124fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 00:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=dPRxNKIRf590LTsibC9riV3lT2wVHxhSFcCbwZWXU+c=;
	b=pSUdHF6pqZoIZhQDcT0SdtUSFFJU3GBpv1nyhO94XGijrp55FXt/CifpT4Xa/Sm9L2
	lXOVCF/hNhF68t7MDcjafHOTd45yE0kcBnQNqvlnsRBgYWCehTDVLYZnQzl04YSsxOkp
	FIdtSIaHx73abJkMZoVwxhK0B45MnXx4IS8g4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=P29Oo1e8I3kSKlDF7UWtXMNGsIT54o0Hgivqp5gsRH1FxFB8eG7q6Kn0z883h+pwuQ
	tDAr26dBapC57MqY/nSghk+4V3Irqel6uAzxG+Zm3jwXDW8hmTKTiXK4aPV+JdZbSO00
	PdK21wZPLxZNd4IbvCOvrP5A8srhqgYd2o5Ro=
Received: by 10.223.59.146 with SMTP id l18mr654878fah.58.1302074112486;
	Wed, 06 Apr 2011 00:15:12 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id o17sm82273fal.1.2011.04.06.00.15.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 00:15:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 09:15:10 +0200
Message-Id: <2c6e93f6c89a19403e3c466630e41e62173cc558.1302074016.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302074016.git.Martin.Jansa@gmail.com>
References: <cover.1302074016.git.Martin.Jansa@gmail.com>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: [PATCH 4/8] elementary: inherit gettext
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
X-List-Received-Date: Wed, 06 Apr 2011 07:17:16 -0000

---
 meta-efl/recipes-efl/efl/elementary_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index 2fdd0dd..a28927c 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -6,7 +6,7 @@ PV = "0.7.0+svnr${SRCPV}"
 PR = "r11"
 SRCREV = "${EFL_SRCREV}"
 
-inherit efl
+inherit efl gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
-- 
1.7.4.1



