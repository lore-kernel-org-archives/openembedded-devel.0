Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5F5036C10B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2019 01:12:52 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id s12so32141356wrt.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2019 17:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nZrBMisWZFWew9Bgn2pB8LVLeu7dmb7aNoXuyT/E+Jk=;
	b=GCAq5O4NYyJNDGoxmG9crbKK7U6JZ5Zp/mkt2WrddMjhiUBEH9nGOATYhsRnjUx4qr
	JwYAPPYK+f56TYMJAtjs6Uibps/QcbLyC8qslhr74OaxRwl6E0kPYlPFPtX8NMe6gDxC
	OQbmrUKEipKj0WBMTqBPxL7gQfMOyo8Cl5CbSv8iFaqVSKMvr2uiL59hADWmw2qNlRab
	ZJRiVxrX/4N7jpzpObYOkx9OlAtzlrKZX+8OWFZ8pmrZeQOz7mZ+WAMPVs1JgWgHGMVu
	h3QqABH07Do2GovmsXvkDjypm9cPb9ZeAGULFMiiF63CttllQ4JsCsam36wZJTkd/O3H
	dXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nZrBMisWZFWew9Bgn2pB8LVLeu7dmb7aNoXuyT/E+Jk=;
	b=ShqNaUPR1yYdQweq56HV1Vjvv7WhqtDORtDMUu9zWbF21a1ykgLFJoldR7T0ucM5KJ
	xP/nHCGydPoSyzVhMWnAEdd+EQI9wjvYVbbr7ZZALvkxMi8Cf0sxWVKyQGo1fqt8KmnJ
	8J0r8cAni4Qt48BFqLhPi6XoRrSPHzWul2kFEUSBLono8OUVAvlZToSi/hH+15fdcH90
	hA8m/L9WiA+uYf8yoXFuReRnooilF02JQSTilQQCbFpkqhBmfcVAEabug1n9wmOBlW5N
	wFebVPUhzUMCmyVjfRh/9JHtikmj/wY8BMq/a5kfJ2s9EoeP6VG1bri21xmqLdQ8yXkc
	vjLA==
X-Gm-Message-State: AJcUukes0IoHuIJhniyx+6TVXCpRoGvQJvU5jt5G7kBJzGgzS8ON5YjX
	/tzsF0DYco7gouOzMtmN0aLxdRb8
X-Google-Smtp-Source: ALg8bN4yNs2OdX8ypN/qDGs6x4sdkvBexBOt3Tci8S9T3OC7xtIb2VHxw/ujm6173dQnSVdgZqht9A==
X-Received: by 2002:adf:ec50:: with SMTP id w16mr40971336wrn.171.1546477972878;
	Wed, 02 Jan 2019 17:12:52 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BC022001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:2200:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	c12sm42400512wrs.82.2019.01.02.17.12.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Jan 2019 17:12:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2019 02:12:20 +0100
Message-Id: <20190103011222.7686-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190103011222.7686-1-schnitzeltony@gmail.com>
References: <20190103011222.7686-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] xfce4-systemload-plugin: upgrade 1.2.1 -> 1.2.2
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
X-List-Received-Date: Thu, 03 Jan 2019 01:12:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...mload-plugin_1.2.1.bb => xfce4-systemload-plugin_1.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.2.1.bb => xfce4-systemload-plugin_1.2.2.bb} (70%)

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.1.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.2.bb
similarity index 70%
rename from meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.1.bb
rename to meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.2.bb
index eeb451863..f9fb2cad7 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.1.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.2.bb
@@ -7,5 +7,5 @@ inherit xfce-panel-plugin
 
 DEPENDS += "upower"
 
-SRC_URI[md5sum] = "550277af9886c47005117110f6e7ec0d"
-SRC_URI[sha256sum] = "2bf7d0802534a1eb2e9f251af2bb97abc3f58608c1f01511d302c06111d34812"
+SRC_URI[md5sum] = "c7b9237ec4a421de5dac76449b4b5a78"
+SRC_URI[sha256sum] = "3c67dfeb042eaea5aca440de9c6b3ecf99be0fbaa1cf7fdf9e6528233b46c99e"
-- 
2.20.1


