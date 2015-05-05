Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id C3C3D73EE9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 19:09:18 +0000 (UTC)
Received: by ieczm2 with SMTP id zm2so10791735iec.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 12:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GzhNWToR9TWNzEqRzdzi2cO0IT1yH41aSij7ZJZOjx0=;
	b=q896IiDJ6jcdDLMSfQheWYOWt2FIKgg++5IP/UyIVKtF0V9GzsbolpIqIb6rjIvq9+
	uJueC8JY1fXMTQASAoIudhQPBaKZ53TcFMpyyS0Re7Vj2e4aVQhVn0eBtfSTk/7uOukM
	z2jykMhXrctuup1f8MFj9fg34SjzJr9X+rLpBAIHW/RypMiIgEH7d8ynoiR3bn7llowT
	b+LvmPnErHWGA23jz/+eNLQA5hcYPpA/bFP/ctmUuOLlgoMDvQE7QUpzjTsfwFl+wz7k
	ounGVPxDCYXxeOAog2GmazzPEKwoZC4LMF4KZuHeYikgD89CWVnCDDYcajQZ52Omcjep
	SRXw==
X-Received: by 10.107.155.81 with SMTP id d78mr35320108ioe.29.1430852959932;
	Tue, 05 May 2015 12:09:19 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id vk8sm135395igb.4.2015.05.05.12.09.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 May 2015 12:09:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 May 2015 12:09:10 -0700
Message-Id: <1430852951-18707-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
References: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 6/7] gdm: Whitelist it
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
X-List-Received-Date: Tue, 05 May 2015 19:09:19 -0000

polkit-gnome has been fixed to build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index fcd51ff..723eee8 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -6,8 +6,6 @@ DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolek
 
 PR = "r18"
 
-PNBLACKLIST[gdm] ?= "Depends on broken polkit-gnome"
-
 inherit gnome update-rc.d systemd useradd
 
 SRC_URI += " \
-- 
2.1.4


