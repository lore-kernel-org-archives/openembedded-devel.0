Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 357667C132
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 21:31:40 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id c25so7800704pgb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 13:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=E5knSliweMOeInF3E8RBsYd8lfTdmhW7idnTcJSMNzY=;
	b=bH0NZ92ZauyzxdCqN1T687uTlMdjU9VQqIqeF+AVtFn1XbLTCTJM79iywErBAFJRhp
	3IX6SoXVSbw/jbSs92fcmzAXxrQ00hdlW8qWZT4M1MTh6vKTKr84ReDUdsDYn3W3rvvY
	1BUbyhac5e8R8mVI9pDN48EPEKOgoSLXzoraFJycqbewc/xIlyU1MIgrOu7C0gk+Cr/Q
	JGMMYDGfP2jLTE4WFA9NGuZAmgkch07Y4A0sFt/BkSb1aXBB2AFKAnvLpF8vIQTi2ml7
	iLSL9XUmiXFsGnqM8iyxHp4cKinx5olirJt7euJln8se1jvkvK6WjadBgBKftb5eXg4+
	DuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=E5knSliweMOeInF3E8RBsYd8lfTdmhW7idnTcJSMNzY=;
	b=gbh7+SDtAh4/3GZ2OIc6G0J0Jk0luKlBWK2xsNZM1J3zrEYqvHLKGe6w39DEtZpWgT
	qQEPLJ5gqzbdXfX2hjzOk0aIPiIa9FmyV1aV3EkBr3kZlPxuh0dQNG/PMKAY61aBHstm
	CYG6vesy48kgkr7fLAesxD3s2eESPesDsoRzRBVHuILaFRRlCeMMDPy7oKA7hWRpo5iN
	ix7jKsTQHi+P3LpUazIldu2ueuRRoLYQBpoQdoxd7gZpr4aJ5l1ceWe3X5RS2qmYSHCL
	pujlUWFpZvSfo923JhHkp+5iWdhEAKd5V5Tq812ClCeY7tSVPnC17mTYgV5ZfXjOth25
	kH3w==
X-Gm-Message-State: AJcUukdQjIv8aG55z0pCai6kK+0DsWloGqT8FgW4wz7tE3hg/OYzWC2I
	0siagn1keQIuAxCB4UtpJTU=
X-Google-Smtp-Source: ALg8bN7/Xx5oLatJZ89t+LxVw/DW8tvlkf2gbxo5t1IDnkgEpYkt84dWIdFbEX1UJMOYvJ85z2oehA==
X-Received: by 2002:a62:5c1:: with SMTP id 184mr19608450pff.165.1547328701511; 
	Sat, 12 Jan 2019 13:31:41 -0800 (PST)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	4sm134935166pfq.10.2019.01.12.13.31.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 13:31:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 12 Jan 2019 13:31:32 -0800
Message-Id: <20190112213132.2501-9-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190112213132.2501-1-akuster808@gmail.com>
References: <20190112213132.2501-1-akuster808@gmail.com>
Subject: [PATCH 9/9] wireshark: update to 2.6.5
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
X-List-Received-Date: Sat, 12 Jan 2019 21:31:41 -0000

includes:

wnpa-sec-2019-01 The 6LoWPAN dissector could crash. Bug 15217. CVE-2019-5716.
wnpa-sec-2019-02 The P_MUL dissector could crash. Bug 15337. CVE-2019-5717.
wnpa-sec-2019-03 The RTSE dissector and other dissectors could crash. Bug 15373. CVE-2019-5718.
wnpa-sec-2019-04 The ISAKMP dissector could crash. Bug 15374. CVE-2019-5719.

For more info see: https://www.wireshark.org/docs/relnotes/wireshark-2.6.6.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.6.5.bb => wireshark_2.6.6.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.6.5.bb => wireshark_2.6.6.bb} (96%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.5.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
similarity index 96%
rename from meta-networking/recipes-support/wireshark/wireshark_2.6.5.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
index b3e0dd4d08..4699f67982 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.6.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
@@ -14,8 +14,8 @@ SRC_URI = "https://1.as.dl.wireshark.org/src/all-versions/${BP}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "e25257d5969705f2a18cae627ed42d80"
-SRC_URI[sha256sum] = "93155b798544b2f07693920f4ac1b531c952965ee4eb1d98419961240177438a"
+SRC_URI[md5sum] = "b30ba5b9b48ed2ff91c0ce357d33b46b"
+SRC_URI[sha256sum] = "487933ea075bdbb25d8df06017d9c4f49fc20eb7f6ec80af086718ed5550e863"
 
 PE = "1"
 
-- 
2.17.1


