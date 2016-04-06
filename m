Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id EBD9F73CF7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Apr 2016 21:46:55 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id zy2so5125091pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 14:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZmEKZwsrBuAvpzFS/fXXfsbQJOE9Cly6jJtr7jJIgzI=;
	b=u2FyGg3qUN20Fr246XnKyoGWNJl9smZRufO6UUsF7Dqna8MU1ZgOZTzX46RRYzyaXJ
	LZRiYoa7aXjum+SpSark4EK++KGtcYDaLfIQa5ULLuXiys+akSSHhTpa7KBh2MISSxvy
	KoFmvkb/VsIpY9TGt0qO9wZ3/bpQRGQxNMspTZEdc8qi0EaG9DevbkRGINsbf4fBdKD2
	SrAF1FMQcnSnrkBoj5TyR7Kh0PiWeUOb0rW/+TVeHHfXGWWTt/H6URcsAOqDfJOF0Rrk
	BS8lPmWAf9N+yel+f9k8xuX2ULUgDZ9REYnmRDELT7sYjE6LWvJ9PTHauwUpjdb5crnH
	RctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZmEKZwsrBuAvpzFS/fXXfsbQJOE9Cly6jJtr7jJIgzI=;
	b=jqnr/wbH6ADJCGV8C+51l1v4ZhIs/IAtKL/oDNjV0iqgu14yAuIFKPyamCYnoD6u9r
	mxKF49XlA3iprQyxQKLAUltz7EcgFL7bgP6bQID9RKBRoTxjg7FPsnNdkHUjjA/lvnmT
	E+a4YQHh0cZywhwwIrxhMBAgeOBvUQ4HLV7jF+JZFNGirYpKCRgozNFbrIHWO+/SC9MP
	8DjCejsgZImwJKEOv2OVQsNkodLuua129SvAv1Ah8PEHadFhKEeuWusrj2D5VHF7CNQo
	yQyYsx9r8g8c/4LMs7TZiZuNQ+qY7JR5C+64faNOe5s3Y0lPdiVo8dL0owd5tcFeIoZ2
	Bt2w==
X-Gm-Message-State: AD7BkJIKGu6RmUF0aaNmucVQqafUYFFaucEXypb0t4YwFM1iMfvzVVgLfcbHKVmEn962gw==
X-Received: by 10.66.152.231 with SMTP id vb7mr74331803pab.132.1459979216218; 
	Wed, 06 Apr 2016 14:46:56 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	l81sm7091069pfj.21.2016.04.06.14.46.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 14:46:54 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 14:46:50 -0700
Message-Id: <1459979212-16117-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 1/3] ctdb: drop duplicated DESCRIPTION
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
X-List-Received-Date: Wed, 06 Apr 2016 21:46:58 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
index d4c0f86..66c966d 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
@@ -2,10 +2,6 @@ DESCRIPTION = "CTDB is a cluster implementation of the TDB database \
 used by Samba and other projects to store temporary data. If an \
 application is already using TDB for temporary data it is very easy \
 to convert that application to be cluster aware and use CTDB instead."
-DESCRIPTION = "CTDB is a cluster implementation of the TDB database \
-used by Samba and other projects to store temporary data. If an \
-application is already using TDB for temporary data it is very easy \
-to convert that application to be cluster aware and use CTDB instead."
 HOMEPAGE = "https://ctdb.samba.org/"
 LICENSE = "GPL-2.0+ & LGPL-3.0+ & GPL-3.0+"
 
-- 
2.8.0


