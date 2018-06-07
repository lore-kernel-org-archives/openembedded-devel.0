Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f47.google.com (mail-pl0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6980E787CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 13:52:27 +0000 (UTC)
Received: by mail-pl0-f47.google.com with SMTP id g20-v6so6203296plq.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2018 06:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CkjNCFYzmRvXaJdAUqA8ZGwM2YFdEFQ/GxCuaqixxOw=;
	b=MjwWSvXc1GKEu0zvKNvFgrFuaQSi7LU4HdWYfY5ZqS0qlSqi9GMrkJfNRDubs2mY4Z
	aTnEwWV3X0nl8dRPFmxJIGGqfSnOLmGg1g81clUZJ1V1qgpiy3F2yD14RKN19IQHzJxn
	j2BvYLNckJ9AqGqUzAfULQLhRyv52CIsTNUH55krdHXhQ++P44fitPFpeaWMm8fGsAmX
	0DVHvzPsXvjgiOQmkeUGKMzdLxRLEoAhThfeclqLoPYTeHieJZqu1ADjL7dOchYPKd7z
	u2F2lrr2t7Bg9AE6mtdqMdJHDpXUyHVBcLLGMdwQB8Z82roY3fz3edX79pK7JChHQ276
	FZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CkjNCFYzmRvXaJdAUqA8ZGwM2YFdEFQ/GxCuaqixxOw=;
	b=pI7CH66kGhl6UBfL8khspYTyfvYeXQIvWuHrq1s8TEIQKxGj4SGVYIhUlklc54QPHL
	M/PUzylO45QgoBEd07XO3+t0cMVInf9o0cfdJu4CLqdg1Q3hb7VgM3pM9kebQXk6qSu+
	NzsFlhT8B3dBEh7A9puKGchPY0tCLANoPnL2kEpzyeZ8TGUTnhy+tStVypxRzIBvEpdW
	Qt/seX8yuOKn5IuDssVmneaAFa8E9FsgYPrILxpWVcyFQklGKafNxGdaW4wi5LfKyh85
	St15T5eKwsHpjBrEw/wdQXL8HHneudb1AcfNA+5VX4KOBkeO5oAIRkmDYXS+KZwJAw08
	KDew==
X-Gm-Message-State: APt69E04eZhiHiY6oAh6eKv7SpjY/ayQWPOzvl6xnpZfxhr286jOimN3
	hYwpZmGsnh1U3/O4Xycz3hR8zQ==
X-Google-Smtp-Source: ADUXVKLHk9aA8RRqsWAIO1pF0/DfL/E+NrfyCt57mi7Zvs4xlc6TSxIgAMQql8wXp1kXJa3OzNeYXw==
X-Received: by 2002:a17:902:a581:: with SMTP id
	az1-v6mr2174997plb.61.1528379548659; 
	Thu, 07 Jun 2018 06:52:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:143:7168:4d6f:f251])
	by smtp.gmail.com with ESMTPSA id
	t21-v6sm18675481pfi.22.2018.06.07.06.52.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jun 2018 06:52:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gamil.com,
	openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jun 2018 06:52:16 -0700
Message-Id: <052828c9898e191daabe0deb166008e9f433464b.1528379391.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528379391.git.akuster808@gmail.com>
References: <cover.1528379391.git.akuster808@gmail.com>
Subject: [PATCH 1/4] wireshark: Update to 2.2.11
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
X-List-Received-Date: Thu, 07 Jun 2018 13:52:27 -0000

From: Armin Kuster <akuster@mvista.com>

changed --with-ssh to --with-libssh=DIR

includes:

wnpa-sec-2017-47 : CVE-2017-17084
    The IWARP_MPA dissector could crash. (Bug 14236)

wnpa-sec-2017-48 : CVE-2017-17083
    The NetBIOS dissector could crash. (Bug 14249)

wnpa-sec-2017-49 : CVE-2017-17085
    The CIP Safety dissector could crash. (Bug 14250)

release notes:
https://www.wireshark.org/docs/relnotes/wireshark-2.2.11.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.10.bb => wireshark_2.2.11.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.10.bb => wireshark_2.2.11.bb} (92%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
similarity index 92%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
index 5358ba0..5eb372e 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "ae3a1a43a6e3687f44a738fd15d78021"
-SRC_URI[sha256sum] = "8574a5e1fdec7affae640924bd46c1aed1bd866e02632fa5625e1450e4a50707"
+SRC_URI[md5sum] = "a79ba6cda83be2a91bde4110fe194788"
+SRC_URI[sha256sum] = "a9f11621e85d7e1d72259157edd94825e72af3fd72e184b8474459f92ad5fc40"
 
 inherit autotools pkgconfig perlnative
 
@@ -39,7 +39,7 @@ PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
 PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
 PACKAGECONFIG[sbc] = "--with-sbc=yes, --with-sbc=no, sbc"
 
-PACKAGECONFIG[libssh] = "--with-ssh=yes, --with-ssh=no, libssh2"
+PACKAGECONFIG[libssh] = "--with-libssh=${STAGING_LIBDIR}, --with-libssh=no, libssh2"
 
 
 # these next two options require addional layers
-- 
2.7.4


