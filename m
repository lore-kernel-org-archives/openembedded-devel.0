Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 783F374E86
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:49:05 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id a22-v6so2009908pfo.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xDUtyxUKI2eobHEwLimSGCD3izOIttUOIYhcKkSrbBE=;
	b=lHWzzJmEYUU+fTqoY4C1aI8xtXIeiDnhp0SkN/J9rzy7z4FzA40n0kEHBZlvhe1tW0
	7yC6bEXvj3XHiF7Kg26FGUCPKgxKnOx2UJTPzyfOwvE6da+I9zbpoGEkrXogWTataCnt
	pKHhIfISPT4qIl18AbzUVTTxTHnFIBDp1ae6gG2hnT0EU8QgyTI9i6D5EzaW4LdjaNM9
	QryZyQaeQlw6/Ikox/C4v0o6KeHsgDCIKitnbS8FtbIAE9lM50XZcBAVY8hesCN0tXJv
	3qg08I52ORcPaX2X8QPpgMY8YcTslAvq3qm/ExshSPwwMSzSuFiACD/NFbYD3fra28T5
	7kYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xDUtyxUKI2eobHEwLimSGCD3izOIttUOIYhcKkSrbBE=;
	b=nxY3ZBC56xUcnnxV3ITf6jLs8JbWSQJ20/cmweRwDBSuZKvubPQwOMnR/nqC/uADL9
	evZrQfku1X7hUYWuZiCuS14sDVm3pqjTuAMH3aFWbd6BlbSiJrF+fYpgv2xHw+XiaM+5
	HvKpdjsv/mSyOMLtL/bwYt6shGiTcnqdstPAiSvR7fLKyFQyMZQXRtrJob29GNF5XUc8
	ckEXiqpiPntTbQbLZZ6LLaTOdNLl4h0uidecYWGE+qAYs09vALDM3qzZAkkxCcf8NGD1
	FZni5zQ+sxdNW1a7oQaMV0P56kXpJwmpkiDNf/BXk4pErq4kuv947PtNvbKRbKJ2aOXH
	8m5w==
X-Gm-Message-State: ALKqPwc7H1ou5iE/UqeI4pBe5r6bk0JX+oRSjoRKs+sLl+Fvko5/HT9O
	ooJvCIcV1o50xfqbQjXOlUKVzQ==
X-Google-Smtp-Source: ADUXVKKSliygzph4+hdzKYXRCEfLKStMM9QAoxMIGT5Y14ndwExVOfWuMUhpvydZBI7/PIX2myaQgg==
X-Received: by 2002:a63:7543:: with SMTP id
	f3-v6mr15977294pgn.256.1528080546546; 
	Sun, 03 Jun 2018 19:49:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.49.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:49:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:45 -0700
Message-Id: <d9461528840cfafd04b10af28d73879deb0b9b09.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528080420.git.akuster808@gmail.com>
References: <cover.1528080420.git.akuster808@gmail.com>
Subject: [morty 11/15] wireshark: update to 2.2.9
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

Change LIC_FILES_CHKSUM from README.linux to COPYING as COPYING contains the license info

2.2.9 security fixes:
    wnpa-sec-2017-38
    MSDP dissector infinite loop (Bug 13933) CVE-2017-13767

    wnpa-sec-2017-39
    Profinet I/O buffer overrun (Bug 13847) CVE-2017-13766

    wnpa-sec-2017-41
    IrCOMM dissector buffer overrun (Bug 13929) CVE-2017-13765

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.8.bb => wireshark_2.2.9.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.8.bb => wireshark_2.2.9.bb} (93%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.8.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb
similarity index 93%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.8.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb
index f94324e..82c25ff 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.8.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "wireshark - a popular network protocol analyzer"
 HOMEPAGE = "http://www.wireshark.org"
 SECTION = "net"
 LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
 
 DEPENDS = "pcre expat glib-2.0 glib-2.0-native"
 
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "bb81d0ecf3a8ed46bedfaeae6fd318a8"
-SRC_URI[sha256sum] = "ecf02c148c9ab6e809026ad5743fe9be1739a9840ef6fece6837a7ddfbdf7edc"
+SRC_URI[md5sum] = "7d5e65efd0714bd6248aa5b36c28320d"
+SRC_URI[sha256sum] = "c8b32c0e7d44a277e737c53d9d142ad3fe4265338f25a7fd8c891f58a7633fc2"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


