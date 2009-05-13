Received: from [74.125.78.145] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3D-0006Q0-7P
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:59 +0200
Received: by ey-out-1920.google.com with SMTP id 26so226051eyw.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=yWsUZMZOcGCDoTcY8sNUQ2fwYYST3f2xW7hTglTuO5g=;
	b=Hyw8gQTe7y6CPaBtHgowYE6ptY7cZT5NdP9MrtqYKzAc+magzyGDgciSe89CvW3oax
	qoNfaUbEyscKAb7e0zb1WB1AQ/rnEFP+zqzv+bkTn9y0MocPKpXQ0am8pt1i11se7JN0
	+C+VqihkWpqVl894yv3GzcdsyJAkM33iMZu+8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=MeDjJWJtpRtMA9BfdwbK2AS6zzxsePuhHfYWSSVC0AYNUxd2auiyOadS5LYkilPDWZ
	HpVqdbLoXSOdPLyp3Tj+rN9D7Xmcn/XP5QgDBmZmyl+O8rjGEG8GwkwGU5Wfg8PKqZCK
	+mzPRqq5PA8BCNr06twZP79V00y65eJaZkjoE=
Received: by 10.210.142.10 with SMTP id p10mr84173ebd.99.1242207616741;
	Wed, 13 May 2009 02:40:16 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 10sm2200715eyz.51.2009.05.13.02.40.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:16 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:00 +0200
Message-Id: <1242207556-15601-22-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 21/37] gpe-autostarter_svn: remove 'no strip patch' and hope they fix upstream
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
X-List-Received-Date: Wed, 13 May 2009 09:46:59 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-autostarter/gpe-autostarter_svn.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/gpe-autostarter/gpe-autostarter_svn.bb b/recipes/gpe-autostarter/gpe-autostarter_svn.bb
index 8d275b5..2742952 100644
--- a/recipes/gpe-autostarter/gpe-autostarter_svn.bb
+++ b/recipes/gpe-autostarter/gpe-autostarter_svn.bb
@@ -8,8 +8,6 @@ inherit gpe
 SRC_URI = "${GPE_SVN} \
            file://svn-build.patch;patch=1"
 
-SRC_URI += "file://makefile-fix.patch;patch=1"
-
 S = "${WORKDIR}/${PN}"
 
 export CVSBUILD="no"
-- 
1.6.1



