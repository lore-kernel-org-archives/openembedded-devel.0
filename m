Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 86F227FC94
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:13 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id b6so25077197wrq.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hjbwGxE+1z4F/Z5/+xVRXmKVjiKMgTwmgwCd8Ufdyjk=;
	b=rn7QT209PzJqTspet+tQpMIPqRsw0h3GJ9D9vNmdnc7fB9rxlHCMl5IIXYa9jrQ1Vh
	dh+Ey2zqRSIHK5qDaQWd/i03VquEp64UEMaFpsxoOBKnVEUOWtHZb7l485A21DNjuGe0
	CoJUllyLEIv19Ffd0LoX6EVMIZSYe4iRwwQPnKbatbhu/znZW46TFnB9gmkhWL/ccz5K
	YUCTuZwdDIbcjDWj2euDQanpJB5Dvs4807xbIow+XAxcFTN0b47z+UoMilqI8AKQyVRH
	xp9vMkTn8FNyUfkVGQIRWWj2CL4qblWfFps39PWefYAy+EPQ1nthoFQdvga37T+5R6eC
	gjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hjbwGxE+1z4F/Z5/+xVRXmKVjiKMgTwmgwCd8Ufdyjk=;
	b=p00tKViSxK0MVMyvhl213YzEfXtQH0JWU45vnMpHFjUTGU8dTboz5yIHDBbNU+Klq+
	NNlgS804zgtF/lgz1q7J1hI2ri/Zc6PZsDmygTBk2rEZSKw4iznCKxDIt/qhlRC/HtmE
	P3AG5QdhnnEVuCGsnDV0mBheEVtF8vbt4jHkzjxVnvw2OQNdfAQHNIhQuLvpIIUgRCI0
	vrqR4SKBRCUcjLr6p0k3GAi5lb+0bP78D69CJcTDixUHywlQgf2pgCyCXZZ4g9YsujM1
	wBNYMaB3ntxQktkC81xM/dYhSeE0YpLuhIYGgPXsvBxbalV4XiBG96exF+aiDK5Vq/ik
	XEZQ==
X-Gm-Message-State: APjAAAWIoHz5zDo8UdktC9YgMKCMZB/Ty1HXz/4Xf7G+JJwp2O8JBybm
	3cYTnaQbTrwSRtVtKHabVRx+vBPZtCg=
X-Google-Smtp-Source: APXvYqy+zoAGhcW+aRMigA6gOUa6pvWa7ce8XZdBk9k3Myfef9iY+9L1QKoaSJYUytwNin1ZQMtsVA==
X-Received: by 2002:a05:6000:1142:: with SMTP id
	d2mr7971063wrx.253.1579346893986; 
	Sat, 18 Jan 2020 03:28:13 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:13 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:43 +0100
Message-Id: <20200118112757.5287-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/23] ristretto: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-apps/ristretto/ristretto_0.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.10.0.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.10.0.bb
index 9c5bb12e8..fbca96f60 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.10.0.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.10.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=35d145429ad3cbf5308d1dc93f66376b"
 
 DEPENDS = "exo libexif libxfce4ui libxfce4util xfconf cairo file"
 
-inherit xfce-app
+inherit xfce-app mime-xdg
 
 RRECOMMENDS_${PN} += "tumbler"
 
-- 
2.21.0


