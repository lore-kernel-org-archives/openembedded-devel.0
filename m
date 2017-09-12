Return-Path: <athoik@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4457D784ED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 20:01:10 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id p37so6716668wrb.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 13:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sq0aKAmMuNxLWK2UjCJxbdX8TBUDtDQb7w6dvfwu7gQ=;
	b=WrggHvJp2cNLCrvszn76VJ9hR+ijmLbhK79ntMrPn6iDWH4txTVNcKD4JfUXPpfmLf
	ayuC/JZ9SqBy+VbsVbqSki4cxlSJEdCDLqDbk7E7N6VwaGDbM5P6bbO2Se/2Vyl14KcP
	8NCZMKDE0h4G9y7Slxqdl7VbTFbiRiU1T46hJmK5YSmIkraFmfPaJRBSvKydCY/oNOHW
	1nDjNpw4lWqga8loIZQIvGlQpOkyWncDsDIP0GLhmBqg8F32xjEh4uE0R1WGjLOBpNqE
	jHChzm45yYFSvKxO9SZjiWLmK7PGc4QJsLxzm+Oc2Rca7EG566ozpRBGelbuzjbC95RO
	9qOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sq0aKAmMuNxLWK2UjCJxbdX8TBUDtDQb7w6dvfwu7gQ=;
	b=LpUFzYP4SahG3OcstG2mZKQbV/DIuM8C13HCZhO7J+sTjpn5cHcjKVgAjFu5PoHVFx
	GgJkSEGK6oQnJjHKFN2yrGS/KQTKkNlsKZEOftWsJHwE06rTOfW8lsi1BG5BB9kJq9Qq
	RgmDE4OUe7La0Ebi4c9QCBFQ/wtgV76/YblDXWP1IpSgp+QIencUuLTQZtb3DbZqVMBR
	7KNLCPGLD3yH/ONQptHKrxBJJe4ysgKMBoWVn3DA96Hmek6bKVtgYtBZ3h+aVrXggixD
	dzVjwhhkZTN3LFD6zdLcNdC7m0ZlJYJqfY5OVwJ2FKS5R72fpubDz6VfN7rhz73M/TiJ
	iFhQ==
X-Gm-Message-State: AHPjjUirZWQqtcq+PL0h1JGdTP5kIyzCZ4vvXGqpw9963QqPr1v1Ds8X
	H+TuOCLOdzoHwnozcH4=
X-Google-Smtp-Source: ADKCNb6cyZGP3NdYGky/y7jvfcVmtFerUvbXG/bN4zIKjs9pZ1Vrg3Tvkmhy/69Un+BZ4AD9eq9dBw==
X-Received: by 10.223.131.99 with SMTP id 90mr13615624wrd.198.1505246471601;
	Tue, 12 Sep 2017 13:01:11 -0700 (PDT)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	o14sm10419725wra.54.2017.09.12.13.01.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Sep 2017 13:01:11 -0700 (PDT)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Sep 2017 23:06:00 +0300
Message-Id: <1505246760-31788-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [meta-oe][PATCH v2] v4l-utils: added missing dependency on udev
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
X-List-Received-Date: Tue, 12 Sep 2017 20:01:11 -0000

Upgrading to newer v4l-utils 1.12.3 on commit f84a551f2d419df88b85987855fec866d9e84b4a
Is causing issues because libdvbv5 now require libudev in order to work
(commit db42484881bf5e6a902de51fe42444ddf286d52a on v4l-utils).

First issue is missing dvb utils dvb-fe-tool, dvb-format-convert, dvbv5-daemon, dvbv5-scan, dvbv5-zap
because libdvbv5 requires now libudev.

Another issue was the failure of building dvb-apps (currently removed from master)
because the v4l-utils-native is missing dvb-format-convert.

This commit adds the missing udev dependency only on target and brings back the missing dvb utils.

Adding udev on native build is not possible because nothing provides udev-native.

Additionally add lib pthread to LDFLAGS in order to solve building with gold.

../../lib/libdvbv5/.libs/libdvbv5.so: error: undefined reference to 'pthread_cancel'
../../lib/libdvbv5/.libs/libdvbv5.so: error: undefined reference to 'pthread_create'

Issue with gold linking reported upstream and hopefully will be addressed soon.

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
index b408bb0..57cfb13 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
@@ -7,6 +7,8 @@ PROVIDES = "libv4l media-ctl"
 DEPENDS = "jpeg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
 DEPENDS_append_libc-musl = " argp-standalone"
+DEPENDS_append_class-target = " udev"
+LDFLAGS_append = " -pthread"
 
 inherit autotools gettext pkgconfig
 
-- 
2.1.4


