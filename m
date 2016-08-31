Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA29760B0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:41:31 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c133so291656wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jyagGshVPeWSYrnpmfQCgMDD3nm75qUTykSwpeAtgIM=;
	b=Cp23/Cc56976B4ZaS0DaqDsSJPe2Ok+oNpCpoudaA0aIh9N0OgYylfIQdjPuroKSu6
	h6rfTIswgNZZjfjIRZ0DGk+rz3xNUJlOxrZ0fNDCjUVf4IYEsY6Phi5ZxYct2LzNGKAQ
	f5qEJVPXyOcxQ1+ZOs2UMqRDFcNYMs/xXgQZBWLDywkPFZIWjBvFNgp6565EbmhlJcQM
	MGVEXcd0Pv5W6i6T+Qo87aLN+S/pedhxVbYqlgnZ4e1UMFGzvrpgbEYNbLAdvx1IyolH
	T+0lvaoG6PgyBfLwrQHuB9fv5GIQ6KD7cwtCacLR6IDtGPKX9eUyMnnqJV4aw+poRtJE
	8e4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jyagGshVPeWSYrnpmfQCgMDD3nm75qUTykSwpeAtgIM=;
	b=R987BUi2kiOxifp8FBYOU0YnanAZGF+t2UBrmhJunSarrH/uYb0So9SQg2oLgguSBu
	l/7TN1fO4ezeJLgED7Jc758g/hQJJRq8FPI3pa9ff6CY0bPa6e7qIbXZceV2ie4J5HY7
	7rdT/kPyHPLxZ9+xdD4hmhoWoaex3SjFOZ8ZND4FwGjreKeaBlijz+Joai0x6qupiIo+
	HgCIdMTELZy5eZtJvFgN6zQRL/4KmPR3v9nFGKVO6jrvd/AliBifvey+NtnM6nJ30aUU
	ILB0DKtcOv5ZZexMSFS4lU9tLl5idARqUHS7XFGO1hGoPXLAcIvscA3sPYd/Bl5rYECy
	6/vA==
X-Gm-Message-State: AE9vXwPAOrUylsfzhsLhPsU94dAqPugic6f2iX0EEp1kG8AeNA89VVmt3XsPmADWFm28zQ==
X-Received: by 10.194.73.8 with SMTP id h8mr10230502wjv.96.1472672491659;
	Wed, 31 Aug 2016 12:41:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id jd4sm1400396wjb.6.2016.08.31.12.41.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Aug 2016 12:41:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2016 21:41:06 +0200
Message-Id: <20160831194106.14065-11-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160831194106.14065-1-Martin.Jansa@gmail.com>
References: <20160831194106.14065-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/11] smbnetfs: blacklist, depends on broken samba
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
X-List-Received-Date: Wed, 31 Aug 2016 19:41:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index f1420fb..84a78fe 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -24,3 +24,5 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no,libgnome-keyring"
 
 S = "${WORKDIR}/git"
+
+PNBLACKLIST[smbnetfs] ?= "Depends on broken samba"
-- 
2.9.2


