Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 546F9750DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:49:06 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id az12-v6so18738833plb.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1emZI6hF7hRrTeNzOitNMH+11t54NqvDGxhl+EBHD38=;
	b=cGTF7hlQz7dW3bq/iCwKPoKionT5BUlgO4Ace13TnJFjk+c/JGWKZ4GRA19MwnP7n/
	CiFD38C3hSSy1jA1RtGbYvEXGn21Yx1fYbvqlkQhQDvO5sYJ+ckhPDeJY9mWK4FJ5G8y
	sHzrgLLjzjbF74JonwuuUtV6oDKRaopfmvPim21ZXD2Xd5yVQSXYzqChTuMZbJrWkiph
	Gpd+VZrW1pzBQxBhQjdrh3LNzSzlxh2TTy4il7tXDV1sYI2H82xTvqXKnA13OGVmEZbp
	d2GuiIoVe7MyneW+GojFbvEI+gcS05br5nM6ogV5Ccg2imcyi2xQ5uhUnfDyW9Y5ccA/
	ll9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1emZI6hF7hRrTeNzOitNMH+11t54NqvDGxhl+EBHD38=;
	b=NW2ZhT74kHNmd54nJf7RLxYGt88cK9qeLatOFF6lbDQ6xZTsJgwA6FmU+eeCCbPPhu
	6WsZkDTU+Nv3ZoeYY4/iQcgn46YpQH4gTYrtSH34WffVjZYqUBMlZqSDqRFdq4yelk2A
	9+vtmoV0h4vItKIKmoacxALb7iBuS1G2kdPfd9LfPz9vaDSJxLUScge8PqBnzf1i53C7
	3LNUL/6ryMK4LwEIZ+D48HVGqLZUkpnjdg5yYpPL0P4/M81wADA8lKHTCOk2gKHDK+EL
	tyn9oq1k6johAb1iMx8DzOPaKrHOybYnAFkThHn03d6W5HHlOUMTHEB4FbWepj1ioMCt
	WvyQ==
X-Gm-Message-State: ALKqPwd5Ma1ZsskgkKWfjSKWu8kYgOAKd9ffJqmEGHl9eyE5urm2TBuw
	0Rvw3gl1aVaaz0JgE26EiQtdRQ==
X-Google-Smtp-Source: ADUXVKLfKmb+b7mcUaxSokJ97cobUnDjqpk5nQtuYh1X2HOTAtOv6C0HYqOvvx4Wc2KKI21zmzGujg==
X-Received: by 2002:a17:902:5597:: with SMTP id
	g23-v6mr19668625pli.99.1528080547508; 
	Sun, 03 Jun 2018 19:49:07 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.49.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:49:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:46 -0700
Message-Id: <59c7c0111c3d8dc17f2289849ad1bfa228cec113.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528080420.git.akuster808@gmail.com>
References: <cover.1528080420.git.akuster808@gmail.com>
Subject: [morty 12/15] wireshark: update to 2.2.10
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
X-List-Received-Date: Mon, 04 Jun 2018 02:49:06 -0000

The following vulnerabilities have been fixed:
     * [1]wnpa-sec-2017-42
       BT ATT dissector crash ([2]Bug 14049) [3]CVE-2017-15192
     * [4]wnpa-sec-2017-43
       MBIM dissector crash ([5]Bug 14056) [6]CVE-2017-15193
     * [7]wnpa-sec-2017-44
       DMP dissector crash ([8]Bug 14068) [9]CVE-2017-15191

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.9.bb => wireshark_2.2.10.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.9.bb => wireshark_2.2.10.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
index 82c25ff..5358ba0 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "7d5e65efd0714bd6248aa5b36c28320d"
-SRC_URI[sha256sum] = "c8b32c0e7d44a277e737c53d9d142ad3fe4265338f25a7fd8c891f58a7633fc2"
+SRC_URI[md5sum] = "ae3a1a43a6e3687f44a738fd15d78021"
+SRC_URI[sha256sum] = "8574a5e1fdec7affae640924bd46c1aed1bd866e02632fa5625e1450e4a50707"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


