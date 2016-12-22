Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 94FFB77685
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 22:33:59 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u144so38551441wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WElJyvGG7kCK9E3q/9pvnr7Cj/5yCuQJxV1O89NyWzU=;
	b=kTzwAdQUCv7oyoKb0LKGl+6XBU9vtQHiITRNd5ZfqI7P3EgTeBOuwx7NNO5MZKYKfL
	BsgASVsC+LGYx/g+AE7kOTBAB1VQO8QxqwVT9JXTMyNCGwlrT8MBwvo2w94SX7chY8Qv
	Up6BSqeYZj0MAZyDjOJJPZCLqvnYcU9YLUCCb2zzjybfTwuc843ZysmGmwNI839+q8qe
	OS1J6XewuLrvt90FZc5T1XwVpsKBHVYZ3MwSfWbMIFE3M6WQHvtWL1nwjF0qXxuazJg/
	CQxa+vyRIm7/XDM9ILakaActmnS8rA4XrC0/gBrl8hQlhlmtt7BjyUAlKW7D4ajEz1oK
	i8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WElJyvGG7kCK9E3q/9pvnr7Cj/5yCuQJxV1O89NyWzU=;
	b=PFe0W+UAjS/0FczW7jDREkTgbCbx9/hZM8JAbg6IpeeY4MmM9FKzz2QnvyYEh0aylS
	jZ5IP4ErXiCzoZKV81OiCPfJW+jyPTjH8Oj+RHuYiyksY6kAfwTHeDUtdmn/k3ueS901
	1GpsXEK4eDi8bygm6lsKzu1VtSpRI+gx3sZr4/b7rleEy3cANUQVljPWRaJD+FQp3qOA
	+jG3gGbLwzqr+fyXFsOkb0ZldeuNoAFUdXwdjJ/rjo/EA6oxvd6c3+MSs96mC1rsULRn
	PEy2ih7w3X+tuOysaGAR6H+I/pVa/7ehnWnGZ8NlM6DWOcx7HYCqpJ2ZloaLKHcKsHKy
	7/nw==
X-Gm-Message-State: AIkVDXI62mIWOoZRZ9zlI03DnX76fH0vzUCJ4jaE1+57UgwMUhgdPAWXretDho+vziSUTw==
X-Received: by 10.28.25.135 with SMTP id 129mr13038977wmz.122.1482446039966;
	Thu, 22 Dec 2016 14:33:59 -0800 (PST)
Received: from localhost.localdomain (p579F7B0D.dip0.t-ipconnect.de.
	[87.159.123.13]) by smtp.googlemail.com with ESMTPSA id
	m145sm34179574wma.3.2016.12.22.14.33.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Dec 2016 14:33:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2016 23:33:33 +0100
Message-Id: <1482446018-17187-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1482446018-17187-1-git-send-email-schnitzeltony@googlemail.com>
References: <1482446018-17187-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] xfce4-whiskermenu-plugin: update to 2.0.3
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
X-List-Received-Date: Thu, 22 Dec 2016 22:33:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-whiskermenu-plugin_2.0.2.bb => xfce4-whiskermenu-plugin_2.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.0.2.bb => xfce4-whiskermenu-plugin_2.0.3.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.2.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.2.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb
index a8cecb7..9feb864 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.2.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "abaae8068fdcca9e72a41f4a6d28c685"
-SRC_URI[sha256sum] = "c8ba09b3cc0b2ec863af310752a9ca69560fc4c27cbd3174a9dceca1af79e412"
+SRC_URI[md5sum] = "3cbbe6f233089b6923113f47d311f875"
+SRC_URI[sha256sum] = "1b7afb233c74c33f0ee26de6514c4168497f4aa584dc2f6778dff15d8d47b165"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.5.5


