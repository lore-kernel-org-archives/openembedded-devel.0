Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A3C36784A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 13:56:35 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 63so182206pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Sep 2017 06:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mrBJjGCXB0JToHEQc+EloidWnm0F9B5ECR/MWRkGjL4=;
	b=nDZ++xXhYprQqbWz4/AQ70igfw3cMq4BeDnxRgL4bpnYG7n5gYC3OQb0Rhyu4oFEDJ
	gDmsJdzFEzWbFimZhHLkJ/4N+E0SaqGlfpwqciVXQbcsKjAoAGeg/OKEZixMYjFqTv9a
	YsePldKyHa9i7Cw1B4cuOLJR2VI5pJ8R0nMT156Loo6BwgKQfJno/bOmmHbx31BNHpyy
	eknAPL9+DkUrhCVu1kUTJWsBrz54Hr9m7jGNvHakgmdsjS3tGMo5KSNQw/IrszDQNQzv
	sXQsBRxDKAE+yUl08kFPHl0aFIspzYXM/8xfAdwAvYR7pPouwVz1AdCbzbWapQP8RyPl
	R92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mrBJjGCXB0JToHEQc+EloidWnm0F9B5ECR/MWRkGjL4=;
	b=tHjz7QutahlSnI4Llpjabm5zf6YMA0rGdEr2BmvHcJZEeyj7bhmdwtVr0JSlnV/36/
	O89CD/ftOxOCQeiCyV2XQj7k5CWPKUkpFvGpI1ppaoLShGCsnpSSSuL641/Hf+BEzBc6
	XvMJsW1UGZVKBYwrh6g2eVXq4u0tEfZ5gvDLSWbmzQgeojywOlG02v7JMPnRACGAk4+L
	i4rDZqoXxBR8RsYetBR4n0fYTKOutJd4u+gjxgH+jr3nozVR/BGXIvPDHs+1IQu6011i
	VMbyxgQtEthtcxR9Z6gpCsyvIpuAnIJJDo9ddIu7SG158B4NnlsmjmiCxZR7Z+6X86QS
	uPhw==
X-Gm-Message-State: AHPjjUifjFgGWAuGb0qotproGBk6byPttA2p8lv8aWLXrV5aP0cnZbwh
	0V83NyAlls5DQg==
X-Google-Smtp-Source: ADKCNb4vVxZNTo/tZvCqgu+pwD59jeaUOc70lrgtrAhZ0be8GgOmHRmLhweGqLqI9NISXY2CKvqqyQ==
X-Received: by 10.98.99.70 with SMTP id x67mr2401862pfb.281.1504274197084;
	Fri, 01 Sep 2017 06:56:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:c400:6ad5:9d97:9621])
	by smtp.gmail.com with ESMTPSA id
	q66sm338652pfb.132.2017.09.01.06.56.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Sep 2017 06:56:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com, joe_macdonald@mentor.com,
	openembedded-devel@lists.openembedded.org
Date: Fri,  1 Sep 2017 06:56:34 -0700
Message-Id: <1504274194-21845-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504274194-21845-1-git-send-email-akuster808@gmail.com>
References: <1504274194-21845-1-git-send-email-akuster808@gmail.com>
Subject: [meta-networking][V2][PATCH] wireshark: update to 2.2.9
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
X-List-Received-Date: Fri, 01 Sep 2017 13:56:35 -0000

Change LIC_FILES_CHKSUM from README.linux to COPYING as COPYING contains the license info

2.2.9 security fixes:
    wnpa-sec-2017-38
    MSDP dissector infinite loop (Bug 13933) CVE-2017-13767

    wnpa-sec-2017-39
    Profinet I/O buffer overrun (Bug 13847) CVE-2017-13766

    wnpa-sec-2017-41
    IrCOMM dissector buffer overrun (Bug 13929) CVE-2017-13765

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


