Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 15ECF7EE19
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2019 21:16:20 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s12so92714pfe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2019 14:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tkJBffU9MP/oeILvtNMWLgpKQnhq9MeB/mO2ph0GzcE=;
	b=TNssCUspVLQK9yKEj1eL0aSkXqeWYPAf+UQD5kPifiTiXeNnN9zvfHgZD3hDQWnEzV
	kYZ/SM5Yfqo80kV4dlhHMzaqqBxF8lHY7MOXP15ly7PguT7TrKmCypAEN0d0h8qkykVh
	XQlaqnqU7yKNnYDxC9+jP7AaS2xlhV4CxKnMQ8n9/UwWtHpyachF16iBLV731fp4JPbK
	aEHfY1luCSkmIm0rJSd3sf7aw+yf1j2UbepKlzF9dieHLCv7R7bBXpP68lQutO9ozQfT
	0CQnMGesNKmhMvA2UIf6M5bbiTMGFplQKBsXvLWxm08HOgmNwtjssExnDdttWubcQHQ+
	HS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tkJBffU9MP/oeILvtNMWLgpKQnhq9MeB/mO2ph0GzcE=;
	b=Mu2phtipY5zkcGLaESTYRwe5Z74ublTeoBJotyOpNgMlg3IZFyibTx9WVXh3/9OmQC
	tDrdOmpv+9lP3moAYUZgKAT8OlBD34S2Vyd01mX9LKb8rLaXxJwi2gG1dDKUKWvd3jPJ
	Eyt0RrPi7K7kWneINSV8Ymjbxm7WtZChfEnuVRW9fwn3Y41SrUWDaCzWVXEUq7vnDtOR
	rfSKJZO+5aqUhHRsCyRZz/Xyw/y+segQL8/ekyNtJmYoM1DK0oWOXAl5znN0s6iCEnra
	yXfqs/cu5xnFB3EneVi3gBp+cHDIXDXb3KK7x0Z8qkIkUCXquaR1xnNrLAczhzeE4q4z
	UeDg==
X-Gm-Message-State: APjAAAWHPlgA7qKyj2SKzFhcZCIjTuZGoW7hGAqhgPYD01g1eIfSFDzM
	soddOqFiboM/8iy5cER/9YCk+Jmb
X-Google-Smtp-Source: APXvYqzYcUT8Pb4xjNClFjVl7OGWmTriDIctKkAImjtFBVQd/ZIQ5GUzNxvHSEHS4tw9dHrPDqucpg==
X-Received: by 2002:a17:90a:983:: with SMTP id 3mr265430pjo.57.1567631781792; 
	Wed, 04 Sep 2019 14:16:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(c-71-204-143-8.hsd1.ca.comcast.net. [71.204.143.8])
	by smtp.gmail.com with ESMTPSA id
	b3sm29913234pfp.65.2019.09.04.14.16.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Sep 2019 14:16:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Sep 2019 14:16:20 -0700
Message-Id: <1567631780-16114-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][thud][PATCH] wireshark: Update to 2.6.10 for security fixes.
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
X-List-Received-Date: Wed, 04 Sep 2019 21:16:21 -0000

Source: wireshark.org
MR: 99742, 99743, 99744, 99745, 99746 99747, 99742, 99748, 99062
Type: Security Fix
Disposition: Backport from wireshark.org
ChangeID: d9a2014ea6271a58633cea8899b63257b8b03cd3
Description:

Bug fix update only updates.

2.8.10:
wnpa-sec-2019-20 ASN.1 BER and related dissectors crash. Bug 15870. CVE-2019-13619.

2.8.9:
wnpa-sec-2019-19 Wireshark dissection engine crash. Bug 15778. CVE-2019-12295

2.6.8:
wnpa-sec-2019-09 NetScaler file parser crash. Bug 15497. CVE-2019-10895.
wnpa-sec-2019-10 SRVLOC dissector crash. Bug 15546. CVE-2019-10899.
wnpa-sec-2019-14 GSS-API dissector crash. Bug 15613. CVE-2019-10894.
wnpa-sec-2019-15 DOF dissector crash. Bug 15617. CVE-2019-10896.
wnpa-sec-2019-17 LDSS dissector crash. Bug 15620. CVE-2019-10901.
wnpa-sec-2019-18 DCERPC SPOOLSS dissector crash. Bug 15568. CVE-2019-10903.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../wireshark/{wireshark_2.6.6.bb => wireshark_2.6.10.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.6.6.bb => wireshark_2.6.10.bb} (96%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.10.bb
similarity index 96%
rename from meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.6.10.bb
index 4699f67..1bda9ed 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.10.bb
@@ -14,8 +14,8 @@ SRC_URI = "https://1.as.dl.wireshark.org/src/all-versions/${BP}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "b30ba5b9b48ed2ff91c0ce357d33b46b"
-SRC_URI[sha256sum] = "487933ea075bdbb25d8df06017d9c4f49fc20eb7f6ec80af086718ed5550e863"
+SRC_URI[md5sum] = "4fd0cd96d990eab0e708339a5e0dc207"
+SRC_URI[sha256sum] = "b8fc32244352437db727a4517371dddfa9ffbf0057cfb58265588876b42b6c7e"
 
 PE = "1"
 
-- 
2.7.4


