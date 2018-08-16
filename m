Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1DEBA7926D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:28:06 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id v90-v6so1812606wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8Dcy2WAgGWFiNfU89tDlmeQGC/IumbC7RqF2L6dVnV4=;
	b=N6bPFmK962VnAmcHtwYAMVUIEEIE2CZKA/BpQTFkhhWwqYgw0vk4iSYiU5HvK2C7NZ
	hmhQU1/c4jWX+8JiJOwXyiJe4YbcNxmZemwNOzg2EwSPDyGtfeasHT0R8j3gOItEnss8
	LVOyar4LXMlIyvtyF+1iNI2VFwxl1dhqzjqjEe1b+wrR+PbD4M43vklPwcfwTPUY7tNU
	vzymZabx3yvXO4ulx7MUmutii72CEMr4Qzwuqn8GCOlUg/DZ1IxISJFSs58hvUK9kB++
	LgAdH57qzHdzKMBRZwKoDSDpDc/ZyuB20Ei2UU/PF+qEtUcmspIzzo3VyoefkShN7XB3
	HdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8Dcy2WAgGWFiNfU89tDlmeQGC/IumbC7RqF2L6dVnV4=;
	b=gjX9gq3J8ZHzJUYqEQLAAzdPzPkR9kJ0fGRapWp0fZVTPNUXuPqIvIX9V8hLvOZ5S/
	NNLjkm8p/hoUmTcc5twfBLobnzG8QlyIVvvYFsrWS8grO1f2ORXG0UL/lzze1Q+HgkZ4
	HuD5SUTL8Tu5SfChhvDsv0m3o1sBbFYXT33ZO0HvwIG/BDHPo0HcjOZ8W9zv2DPLi45P
	DqA+UsIF8TIm8jkrJBqU16yltRvGItroelP2soNTxLvqGFyTO7bjWup5wYpv8r2zC5j5
	shQ6Kfik2/mvaXguZiNmHZaee5J9RsAB22fH1tusGjNuquny3Cl8a2clYCAhJHoY8O/7
	UW/w==
X-Gm-Message-State: AOUpUlEbfhBtGy8uWFKtiCqKz+8W+eAnaq1FX1tEez+VpVMMrhsw3yrp
	CB+ETWBRUv+8BBJzMAkPm1XuuOW+
X-Google-Smtp-Source: AA+uWPy7HcUGJU9KNd3yrF+f6LuvRWBra5EddkBGg1NpCAVPt5QjzFuhbHdVFdch8AcR/mIWUza1pw==
X-Received: by 2002:a5d:6550:: with SMTP id
	z16-v6mr19210945wrv.194.1534444087515; 
	Thu, 16 Aug 2018 11:28:07 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.28.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:28:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:43 +0200
Message-Id: <20180816182748.2400-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/16] xfce4-session: upgrade 4.13.0 -> 4.13.1
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
X-List-Received-Date: Thu, 16 Aug 2018 18:28:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-session_4.13.0.bb => xfce4-session_4.13.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.13.0.bb => xfce4-session_4.13.1.bb} (86%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb
similarity index 86%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.0.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb
index 351b2a18a..b11aaa4fe 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb
@@ -12,8 +12,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += " \
     file://0001-configure.in-hard-code-path-to-iceauth.patch \
 "
-SRC_URI[md5sum] = "0de0afd0c8dfe66f846c6c1c5ff3164a"
-SRC_URI[sha256sum] = "3e02b124c6a282d9b1af0b30696d5256b1c2e56618992b49062314ed3ea5d3a1"
+SRC_URI[md5sum] = "a47988a2c871a411c19e3af1eefe591e"
+SRC_URI[sha256sum] = "c789f0f8234e06f5266f0c6ccdbdcc3c085e8d9eea06a0eafe8f7cfc4fe23af4"
 
 ALTERNATIVE_${PN} = "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
-- 
2.14.4


