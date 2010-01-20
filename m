Received: from fg-out-1718.google.com ([72.14.220.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NXZhn-0002WZ-4X
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 13:30:43 +0100
Received: by fg-out-1718.google.com with SMTP id 19so637141fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 04:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=nHq7hk2sfTT0xSjgFU6uDwko6lxKjTMwMFT5Lp7f/XI=;
	b=wUoo61j8HPTc2+B5SfbU1NZz1reMX3WlSU1wvl5NsXTcguUKl+Dh3cuhSHZBusLHg6
	C6Hg2frihKgjTYDlATnG54u4xn1QlCIU3d8g3EfJk61OeRtp1KDswhSmdWvnCm+nzayK
	nD2Glvifa1Ijt6BNLc/U7U/cRMMyJs8VxaSMU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lOUy/sRigxqevRMTbPEoelan/bH6izl92XtaATAzvS9Lk5FDcV0JiX41z5661efHb+
	FNRNrfmEAMXCDpDt2xH9v9ZAYy74r7RVk5jirCkkQyhkJGPN3k5KqT1Ukn+bVvJ7deKB
	Xc0ZbHJc32FqhPst3k+bPFg5z6PHQmMYgn8jY=
Received: by 10.87.66.11 with SMTP id t11mr74760fgk.18.1263990505491;
	Wed, 20 Jan 2010 04:28:25 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm3161749fxm.8.2010.01.20.04.28.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Jan 2010 04:28:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2010 13:27:57 +0100
Message-Id: <1263990478-28107-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <1263990478-28107-5-git-send-email-Martin.Jansa@gmail.com>
References: <1263990478-28107-1-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-2-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-3-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-4-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-5-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 5/6] pixman_git: add BBCLASSEXTEND=native (pixman-native used in cairo-native)
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
X-List-Received-Date: Wed, 20 Jan 2010 12:30:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/xorg-lib/pixman_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/xorg-lib/pixman_git.bb b/recipes/xorg-lib/pixman_git.bb
index 1b5ca63..0c3008d 100644
--- a/recipes/xorg-lib/pixman_git.bb
+++ b/recipes/xorg-lib/pixman_git.bb
@@ -4,9 +4,11 @@ DESCRIPTION = "Low-level pixel manipulation library."
 LICENSE = "X11"
 
 PV = "0.17.3"
-PR = "r4"
+PR = "r5"
 PR_append = "+gitr${SRCREV}"
 
+BBCLASSEXTEND="native"
+
 SRCREV = "c97b1e803fc214e9880eaeff98410c8fa37f9ddc"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.6.6



