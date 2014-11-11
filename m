Return-Path: <ubik3000@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7579F65CED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 20:31:00 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id bs8so2848012wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 12:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NNfJQqo3t1yq5uECYkHHF8rE9yVPZleFePXZAHFjjVg=;
	b=g0cnA5WT9fzDtZvvFfsvltEDlLJRT8j/WZXxxMt/fU1MQi9coyxrKvynEORHiAwQqe
	rMTS+kU9O2gRCzbTl7fslnqyjLCIRxmarLwVWRswWIX3B1Lzd+SRkfyMNfVdQDxvIkzk
	Pcw0rXj1to5BIUvxvNjg11hiMYhG8a0chsLU6LS6chX5n7Iy7hDodlAOCVfLwANaufCQ
	nyHTVOGtP2KVEKlzms7EIwawDpJqtJMTWypUqaD2rLQ9XJFo22aeTQOUyh6nYhE8xEBQ
	Dx02e1lyB/Ufge95TSlTxZ87glHGca7Et+oR8A0qBeS4f42CUS5oWLkRCvxDO5jZVoZ6
	Fe2Q==
X-Received: by 10.180.96.106 with SMTP id dr10mr44152624wib.58.1415737861145; 
	Tue, 11 Nov 2014 12:31:01 -0800 (PST)
Received: from localhost.localdomain ([188.241.77.101])
	by mx.google.com with ESMTPSA id wm6sm28711524wjb.5.2014.11.11.12.30.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Nov 2014 12:31:00 -0800 (PST)
From: Cristian Iorga <ubik3000@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Nov 2014 22:30:32 +0200
Message-Id: <1415737832-12176-1-git-send-email-ubik3000@gmail.com>
X-Mailer: git-send-email 2.1.0
Cc: Cristian Iorga <ubik3000@gmail.com>
Subject: [PATCH] mpd: upgrade to 0.19.3
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
X-List-Received-Date: Tue, 11 Nov 2014 20:31:07 -0000

Bug fixes.

Signed-off-by: Cristian Iorga <ubik3000@gmail.com>
---
 .../recipes-multimedia/musicpd/{mpd_0.19.1.bb => mpd_0.19.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.19.1.bb => mpd_0.19.3.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.3.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.3.bb
index 04eed0a..23e81a6 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.3.bb
@@ -9,8 +9,8 @@ SRC_URI = " \
     http://www.musicpd.org/download/${BPN}/0.19/${BP}.tar.xz \
     file://mpd.conf.in \
 "
-SRC_URI[md5sum] = "d235f6e53e5442b6926c49946a303f8d"
-SRC_URI[sha256sum] = "8b3afcd440181c9bd18b229b5974e529d59648344dd371370d6f7d62ec2847c5"
+SRC_URI[md5sum] = "f539bc9e60367d5084ed14b078140ef7"
+SRC_URI[sha256sum] = "fee3f3c59b5806767f23f7962621be7a62d4fcb852fff6b9ed6bbb5598a556d3"
 
 inherit autotools useradd systemd
 
-- 
2.1.0


