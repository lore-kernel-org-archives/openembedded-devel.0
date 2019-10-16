Return-Path: <prvs=185bab654=alistair.francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 89BE97F37E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571241815; x=1602777815;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=yqWriy/w7dvEUyuQysJgbh0iQbG6kWdhqmZtIFZaO2M=;
	b=UQ1Y8tByXWK8wK/RYt5N8VdxTdyYqSLELqovdqTa4TCWfSkCsXJEQgwu
	e9c3mr4uV7mnZ+i4APXGq6uSaLxGJqITmSU2qUFPcjEkr92gqvW/sJDfr
	Uk0WbIKgR1SrTw13KigVA3uInW5N4fEj6kL4m/3JB4FAPILNEAIq8wrdS
	+ITrbrbxZg/rqPcusRuulnhB+dMxottkJEHlOrGhrXlSLHF/B63OC6ego
	fIavcKZKwKszLyHdXcS6E6ZQssDSYzKvTcSzh86VIMYdrpoXn3S8dT8PF
	ycB09lVIwo7VVSQXtyk9ghy3n7JbTlOa7oOEK/9WavwvZK+pmW5SzWH7k A==;
IronPort-SDR: mMJoCKjM+cFokGm5PxGbFbN/cJ/5h6VlI1Ygv6nMmD6tj1m5nmRCMegCQV07T3cd3EBUL6TN6A
	jmRBN/vg8VmYZ3uqilI3jP48KXhIQz8zld0iSKRHsRUmcEuL0azy0rfdAtdFc5TuKYyOfPwQeY
	m2UuLp9dwhWwWQEWpkjHOWryoTbF8nLrcDnjKExI4xstmo7GxB02GqkuKpHrO7+FuUxgQil+Rx
	NYcDuiJyqykaw3zLH375bWXwj+mQGRsLqtvoiWNIzRjBKkaufT4iAw1hNLSGSjcLDRl82kOROM
	YwQ=
X-IronPort-AV: E=Sophos;i="5.67,304,1566835200"; d="scan'208";a="120680398"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2019 00:03:34 +0800
IronPort-SDR: ZR3EqbYPMU5zXMJ9u9izloHuMdYweF/4zZbhXdmC5CZ3XAKxpPdcp4hsBwTWQuLgUD+zYGj3Qk
	rFphwY8B8GOZejgKK5mSUSwqWvlFU63w3Rq355cyAoAXTXZoI3sO5AtxnhlDM+2ckpu8XGDXbG
	nKXAWooNFwhfF125aY3NXJ0a3H3TD6iFDVZJ0NuBvlYMiHF6vF+dUFed8JVo2POPcyf1ZTg5+3
	KZetqFvKD63nCEqZRd1qn7UrMav/DKzhS+45nTNG2cqJml3xrLrCKD4rF42cOsg6iY5b6/XsKj
	y0rq8zdo0avVLJsrfpWDZ5/T
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	16 Oct 2019 08:59:21 -0700
IronPort-SDR: 9oFE4dSCmbmklZl6hf+hpef502yrAXWCS6bqXyqvbdGmLrfyjHH0ysX3j39PQq68Cz3N6AmFZc
	Py9MfxkH2lbnCvDWoHjC1afP8hq6sgXtIYZoddTnSec0y7/4LyGXZUb1UNl8EPyt6dhOjvZuui
	LErQxsXQCOZdF6G4hUU7MF6XgAv1oVg5zADsha7jfVDPSe/+bhjGEyjLC7TzHHXQw2RZ4fcM8t
	xDXa11Xby12CcRwfcod3soxPCMF40eaWhnzukWQ76dqbrt1SplDJqVR9Uk7mT+ijQRfaDHMB9N
	L8s=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 16 Oct 2019 09:03:34 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Oct 2019 08:58:41 -0700
Message-Id: <20191016155844.20847-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016155844.20847-1-alistair.francis@wdc.com>
References: <20191016155844.20847-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH v2 2/5] python3-monotonic: Initial commit of version 1.5
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
X-List-Received-Date: Wed, 16 Oct 2019 16:03:33 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../recipes-devtools/python/python3-monotonic_1.5.bb     | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-monotonic_1.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-monotonic_1.5.bb b/meta-python/recipes-devtools/python/python3-monotonic_1.5.bb
new file mode 100644
index 000000000..94b90524b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-monotonic_1.5.bb
@@ -0,0 +1,9 @@
+SUMMARY = "This module provides a monotonic() function which returns the value (in fractional seconds) of a clock which never goes backwards."
+HOMEPAGE = "https://github.com/atdt/monotonic"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+SRC_URI[md5sum] = "9f81cb0e5966479754453dea2b6822f4"
+SRC_URI[sha256sum] = "23953d55076df038541e648a53676fb24980f7a1be290cdda21300b3bc21dfb0"
+
+inherit pypi setuptools3
-- 
2.23.0


