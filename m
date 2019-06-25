Return-Path: <prvs=072d76755=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id AC4087E600
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1561463653; x=1592999653;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=UKsXxIfVOk6nt3eUJ77N5Hoe+8xx9laJtVNlC5sqF74=;
	b=hnFMwUBsOMKXUNFfJ253GxBZtyz8faSZaXNsCK5DGtcmImEAUN7f8gkK
	IIv3kTXM1GCMsl4QV7rem9nCAsPjs2vFSZ4kqrEXnhzMULL5Qeq7EIWGS
	uaE/LdXXO7Y3i8iTy+9rYGw1ISe7KmS1QBNaEQaXY8+yYGawkL+IMvLCz
	+qPIwziz6dTudfpGYLE5xEtvDUgatH6JdjNXd0Lg/8yaP3AlkdThoibBc
	LzqaCnK1TLq8RbpLyVszNX3yAApouAebdXN0cAHGXFsFOpdTh5NwN8c3b
	TGN525SDC0UelMv8Lqracx2/u2B4BqanoQE7yP7g/XFYZlDMHq3wMvomW w==;
IronPort-SDR: vdP3DrVVsIAu1iFmnSkMoBRP42kFDCVsLlKeQXH2bNad9NgfM/JYQkDOMGYf+cWXA+ZfPyric3
	XlzAdXssZAYwfRK7UqAyTt+q1DhyDRlnIJb0BRVpd0fGIe+QljI8S7bkLAYTjCTZwtZZ9BmkDE
	64OcK67S1PQS5No8DpeqrkH2uOe2sY765Xxbed7rIdQd9lYTfoXZ9zRrvVI3zwHad1dM4rd4Zn
	dVLOv5kveOk16ZK/H/8Bm6mrz6UPRm66cuHQUrlXqP6TgtKGSrKh5F3+6Hj/LbOXz9xG9UsglY
	V2o=
X-IronPort-AV: E=Sophos;i="5.63,415,1557180000"; 
   d="scan'208";a="2207512"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Jun 2019 13:53:26 +0200
Message-ID: <20190625115327.9314-4-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625115327.9314-1-richard.leitner@skidata.com>
References: <20190625115327.9314-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 3/4] icedtea7-native: disable new compiler warnings
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
X-List-Received-Date: Tue, 25 Jun 2019 11:54:12 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As new compilers throw new errors/warnings disable them for
icedtea7-native as a quick workaround until we updated it to the latest
version.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 69f5d25..70b935a 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -24,6 +24,9 @@ CFLAGS_append = " -fno-tree-dse"
 CXXFLAGS_append = " -fno-tree-dse"
 CXX_append = " -std=gnu++98"
 
+# WORKAROUND: ignore errors from new compilers
+CFLAGS_append = " -Wno-error=stringop-overflow -Wno-error=return-type"
+
 inherit native java autotools pkgconfig
 inherit openjdk-build-helper
 
-- 
2.20.1


