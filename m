Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3A68178342
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 15:57:03 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id j12so17960023qtc.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 07:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EHxysUS79YHvtJNqis8IpRFJYspHuKEw3ozE8Apv5BI=;
	b=AbNzv8W/Ve8LEKniCSGJOQz7UySF73VmFGZmqXa82njXhjtZ4BgmLxTSs0h+zvxDyf
	Qj84anfcZTduNwP23mGo2SqBnLAIZ3hCT9Pe7vyIDslQw51yDVHe311x0R7I5U9DD8Iv
	UZdvO8pEJSHtwMQ2dzZFQYLOL9RPnoeHr9uR/dmQY+CYg+dy022MHVPBledta/7SSSDj
	PijMHhheuiU4CzyQIQBVWeeFS9+pxyQdj/cklob/59uj0E1A2BDs9J/DED7Aky/mvWFJ
	oqGNpdhK4DfHzRMeqbhzOrYI40wqDczcn3yx6gq5lel8rlOMeLmVWGom1OhppeTYflFR
	RZfA==
X-Gm-Message-State: AJaThX5ryywUgXUYR+3G5JITgpjlsGUay25AoxgR6YpZFRy7DXxjzqQ2
	/YDUPShXguTLvFcWksgev77LZix9
X-Google-Smtp-Source: AGs4zMYIBWRN6fnb7wBNSME2Naqe0MDfdTmN7Hh7XfQomcLmofTN0S6BWWQWhQNJFHzjsbfu+knCzQ==
X-Received: by 10.200.7.65 with SMTP id k1mr32354225qth.123.1511798224911;
	Mon, 27 Nov 2017 07:57:04 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	u43sm20270149qtj.54.2017.11.27.07.57.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Nov 2017 07:57:04 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Nov 2017 10:56:58 -0500
Message-Id: <1511798218-16124-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCHv2] python-grpcio: only modify the compiler arguments on the target build
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
X-List-Received-Date: Mon, 27 Nov 2017 15:57:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The modification of the compiler flags causes issues with the native builds of the package:

src/core/lib/surface/lame_client.cc: In function ‘grpc_channel* grpc_lame_client_channel_create(const char*, grpc_status_code, const char*)’:
src/core/lib/surface/lame_client.cc:178:3: warning: ‘auto’ changes meaning in C++11; please remove it [-Wc++0x-compat]
    auto chand = reinterpret_cast<grpc_core::ChannelData *>(elem->channel_data);
    ^
src/core/lib/surface/lame_client.cc:178:8: error: ‘chand’ does not name a type
    auto chand = reinterpret_cast<grpc_core::ChannelData *>(elem->channel_data);

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb b/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
index 3ca7d53..a7df0a2 100644
--- a/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 
 DEPENDS = "python-protobuf"
 
-SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
-           "
+SRC_URI_append_class-target = " file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch "
+
 RDEPENDS_${PN} = "python-enum34 \
                   python-futures \
                   python-protobuf \
-- 
2.7.4


