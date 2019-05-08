Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0AD7D68F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 06:32:02 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id j187so1655064wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2019 23:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZJIWtUBB0eJhu7b47/QOgXbfKI+y8jC8aGVuV6FLSXY=;
	b=pASfcvCMz/mlVQ0uyLE+XafByA2ecwtfPM/gZkdlJUij65vwzU6VXbwsSuYOoIZR2L
	FaqCdmFklDFvQzIiFNGpanp7Zqqob2uf2FvHBQv3HFMeUTlmQgPrVQxzZIRwEwoc8Gan
	oNWYJ2TPQx4R250bphfQds18DH6VO3cK4XaJyqMQq5nixsEjIlN46ZzYIKElNCHYZ1F+
	mxI0arRCgbmv5hx2NoH9+rbC1IUblCcuqEsh4BRrgjNisAh9/cagjAahmiLxoTSJQ1WG
	BKjXf/G7BD4UYC3xK9tbwzMgbzgDSftSq/q1npddJD8wayN0C5ZEzXI0BcybaSgJOKYE
	KYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZJIWtUBB0eJhu7b47/QOgXbfKI+y8jC8aGVuV6FLSXY=;
	b=cES8ZmnglqVEaqLoRt9mMxt+5EyLsk7Szc8jbI7t54O/DtuppfV5I1uWCpGl15zE2M
	dB0BVPZEofI2yA1hrbCrdvHQv0/F2hqdXRw64JNhvyhviQeAf5NUMekvhF2o5eWiNxTS
	5yCGrsK5Fh46mXic1XDzWP1NfPgAxXwpOFYbKu1sLbjToE98nLfDzkRCEvBZCL7i8cUW
	a4pzszGG4cupXGt0Bh3KhxnrK1lLZdVlUBmgBIDlq5/VwrN35g6gbgHdzHTW0+zXuGoX
	U8hmvCuv6UUptWRWr8qlZeCP/MAGwc6C3hoywyLf6YMANHKoaqrX08w+deh6UfEkYCZK
	0FwQ==
X-Gm-Message-State: APjAAAWl84axgsTev9QX6I3MoCJOqQvATYl2+Kw2B2pPNLK4EjwChBDc
	96f8QFkxtAbOPn0/wpUenbehVRUBZK4=
X-Google-Smtp-Source: APXvYqy6XweKnqHYZYKBJ9ueDaBfuG2zKbbdf7wywxla4cjKZbUhXQpllq2RW4Kjcvcab85h1xuxJQ==
X-Received: by 2002:a1c:7005:: with SMTP id l5mr1608654wmc.149.1557297123427; 
	Tue, 07 May 2019 23:32:03 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0B31751CB5D2150A46C45C.dip0.t-ipconnect.de.
	[2003:f0:7f0b:3175:1cb5:d215:a46:c45c])
	by smtp.gmail.com with ESMTPSA id
	k206sm5637499wmk.16.2019.05.07.23.32.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 May 2019 23:32:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 08:31:52 +0200
Message-Id: <20190508063154.10299-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508063154.10299-1-schnitzeltony@gmail.com>
References: <20190508063154.10299-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] xfce4-session: remove strange entry in FILES_${PN}
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
X-List-Received-Date: Wed, 08 May 2019 06:32:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb
index f09af5b79..3b9525fff 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb
@@ -26,7 +26,3 @@ FILES_${PN} += " \
     ${datadir}/themes/Default/balou/* \
     ${datadir}/polkit-1 \
 "
-
-FILES_${PN} += " \
-    ${libdir}/xfce4/session/splash-engines/*.la \
-"
-- 
2.20.1


