Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA8C7513F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:49:08 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id v24-v6so18742379plo.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PpIdnmViOYFiCIeIIWKnO/l5Y1NlM6cql9nLBBxWUbs=;
	b=UjkHXAiugy17BcH/QrM4J2y6jXpZQ6k+1zn0QBrQhVjWlgL1OhXrLVPuwpGfk/MFus
	NwLEQqPflQX6sWRU2Bed+6Olzm0ypRXOqbZGsVXUy90tCBSgyMj3eV7JBpn2TVkLWlPW
	2hcQWgDL6ZsHwcmL71tZLvL7LmCktfW9KbZepIHcip0CP+iQUjuvO+sQjTo6tp1ZLk01
	uVSmrHWRCKu6kQGwUUAqO8NxKP65hD7HdDAxjbhP124+4JTBLOjfTgrwz2+5gcl4EnFG
	pWtRJbg/y7Bhpaop3x/zvje8qNCUeGXOGBOda1R2WqOGyqBBiEsY+JVkDCfuhx4uTPOG
	0wMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PpIdnmViOYFiCIeIIWKnO/l5Y1NlM6cql9nLBBxWUbs=;
	b=m9P5DH3d57jMKN37bQeZDgOBcKcfuYqNORQ5ypUl2xiAu1DKe+oz2Vom4yYnCMM4do
	NdlEYB7pcRBLP8jhXKMvN2LN+ifsjVwFvqKpuTh+dNP3o3a5MFI8X/Jm1oR0eQsV8caE
	3T7F5vK/tHyf0OE5yoJFR9G5cxIJxe43Fds9vevChmEk2g3OWzSt/f+1UhIAEAatE94z
	0egfJaK4mPFFqmFtaUcVF0eU4FqUcv9mER2NhBvJ+JsdK8huuiBVJ8TPWPFPlTjyRlZB
	mF6Gn+bDeYQHuD0CZos97VpcR9KsmD5t+Z+PYYxxmpiAu3nG4OuCdMZnoTIsSpNxKFih
	Fryw==
X-Gm-Message-State: APt69E2+o4nl0BY1jVemBKAB+7+3IXPmwNhJIsoWcjskXBYEc6FvOBHM
	6l0j3QDNANMqwY5LOUG2BXiJqg==
X-Google-Smtp-Source: ADUXVKIUn7G1ah/CeEN3htgZpQonsqO/hvtD49GGPpmehZUsV92tJnWQd528L+Glcja0jaO0f06W0w==
X-Received: by 2002:a17:902:8648:: with SMTP id
	y8-v6mr643405plt.86.1528080549480; 
	Sun, 03 Jun 2018 19:49:09 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.49.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:49:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:48 -0700
Message-Id: <2628a2ccacc3bb0256df97ef4b0245f685485c78.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528080420.git.akuster808@gmail.com>
References: <cover.1528080420.git.akuster808@gmail.com>
Subject: [morty 14/15] wireshark: Update Package to 2.2.12
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
X-List-Received-Date: Mon, 04 Jun 2018 02:49:08 -0000

Includes:
	wnpa-sec-2018-01,  Multiple dissectors could crash. (Bug 14253) CVE-2018-5336

	wnpa-sec-2018-02, The MRDISC dissector could crash. (Bug 14299, Bug 13707) CVE-2017-17997

	wnpa-sec-2018-03, The IxVeriWave file parser could crash. (Bug 14297) CVE-2018-5334

	wnpa-sec-2018-04, The WCP dissector could crash. (Bug 14251) CVE-2018-5335

Full release notes: https://www.wireshark.org/docs/relnotes/wireshark-2.2.12.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.11.bb => wireshark_2.2.12.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.11.bb => wireshark_2.2.12.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb
index 5eb372e..6c0b644 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "a79ba6cda83be2a91bde4110fe194788"
-SRC_URI[sha256sum] = "a9f11621e85d7e1d72259157edd94825e72af3fd72e184b8474459f92ad5fc40"
+SRC_URI[md5sum] = "ebf3d4230d7a13408758cdf037c42d66"
+SRC_URI[sha256sum] = "3274458d1bb1658a5001465ecb07c7cbfc709571ef36bd062897570d4bab3ebc"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


