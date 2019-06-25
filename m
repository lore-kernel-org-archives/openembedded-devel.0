Return-Path: <prvs=072d76755=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id B1A337E508
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 11:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1561463662; x=1592999662;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=vCMntmBDqsFY3T+LlFO8NJN2Fyzdw/7CvhIoPpjQHAA=;
	b=A/Fl6gZMqaU8kh0zOK/wPErTThOcWNHiDHsA+C/FPo8UrBS7g1NLxnZN
	Nz6mMPIjINb2JGI4cHRKR/++DbjQDUqdO2iF5Xy2JJAfB7c1o1ygqspCT
	3DvcpYbuds5OpJ6bj4qxDA/hH+R+y3Qkxx4GaOphhAbYnmAvIltcDajpQ
	J83XV6yWF0BmontPx9CClRcdHXnkFH+jyqEaAP7FXbgjhWhEFYTKOHMaN
	7TkslYZIVPPDmkYYRooEeeV1Xdah8U0NHxMQvAz2s66Fvk06mBnKyGna3
	s8xOsfLhE2IDm/OWotHDkAhRyTZnVR1FIynwC9draO9slJpxnb7rj7PLl w==;
IronPort-SDR: bilaFWx/vch3k4j0ukIR4HnnbBjuNXcaFP4FrHnXZKlJzEclaKspa5CWbI7oJ3tCAiy2DzQ8on
	M7RJLX0lh9QrNvpA8HmBqhn/grEqjCqQXMEeunJVF7xL/uqnSL4I4jabBglH1mviCE17Zo03MX
	PjR3OK8AN3oC4A8jScDYqlfYmWtZXzbc/JKj65HFWPxqyZCs82oJCUaanpNAwNbNUEkXYaQ+5S
	FW3NAIe+pDPo9TtoGBfM9ptL7bTkc+SJ8mHqwqbY8a60Tbvm4I8musJmCo9ZT5192m8Af2N6AU
	oII=
X-IronPort-AV: E=Sophos;i="5.63,415,1557180000"; d="scan'208";a="17958611"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Jun 2019 13:53:27 +0200
Message-ID: <20190625115327.9314-5-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625115327.9314-1-richard.leitner@skidata.com>
References: <20190625115327.9314-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 4/4] openjdk-8: disable stringop-overflow compiler errors
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
X-List-Received-Date: Tue, 25 Jun 2019 11:54:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As new compilers generate this error we disable it for now as a
WORKAROUND. This will be removed when openjdk-8 is updated to the latest
version

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-8-release-172b11-common.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
index a8d3ccb..d4e80f6 100644
--- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
@@ -95,6 +95,11 @@ ARM_INSTRUCTION_SET_armv4t = "ARM"
 BUILD_CFLAGS_append = " -Wno-error=deprecated-declarations"
 TARGET_CFLAGS_append = " -Wno-error=deprecated-declarations"
 
+# WORKAROUND: disable the "specified bound depends on the length of the source argument"
+# compiler error until we update openjdk8 to a fixed version
+BUILD_CFLAGS_append = " -Wno-error=stringop-overflow"
+TARGET_CFLAGS_append = " -Wno-error=stringop-overflow"
+
 # Enable zero mode for arm based builds, as normal hotspot fails to build
 PACKAGECONFIG_append_armv4 = " zero"
 PACKAGECONFIG_append_armv5 = " zero"
-- 
2.20.1


