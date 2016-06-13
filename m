Return-Path: <philip.balister@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 84FCF60132
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2016 20:46:24 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id l81so3430972qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2016 13:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=hDFIV1BGJ1mPA4lZDiHE102gyOhCeBsSw5e4Py578DE=;
	b=HfRqPNi82Vv8jZRSXC/7Tq1AC4hJQ715BapvpGZMnXcSmLt3xKdpcJTRppvOC+GX38
	AqQsi1UocSFl3Yqm7c50BKE+ksJgWGJ3p23rKO/y5Jxr+t6CvJgN97MjkPJAwSOxn+u6
	1OdIDnm9eCyWbO/EW3oFPZoOUb/qvT0H0XED7MPDWM+Fvh40USszuTADSxApT+WMn498
	z3vimIiud2WSxBaoJU3mU9uj5hnWH6Z0auWbvHm830UXT2sg8NBEmSmRv7H5FeKfO4BP
	TBKfdKUB8LES+TJgI0oYD2IOidErQ1UNIIEmJuVnhZHeF6AipfxEl9rTSxXSpL9rIuev
	skCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=hDFIV1BGJ1mPA4lZDiHE102gyOhCeBsSw5e4Py578DE=;
	b=SR3MDum+pv3At5uSEc4EqKpjdJ9SX7AKQWSR3t2mEtciI51XTrlH81BA6U/wYJRMdN
	p6WQhzzAd+8UeHn0p5Nf0lUKF8W0QWAPEq/YUTTeJz6csqo8Bl4XezfMBcmGuNHgGDA3
	4JZkIUY8pJTqYXjS+YKNBQWHpea3QDpwHQGw58S0Rls2w94YARW337odB1P6qRdcvrAW
	KVpk2TA3OXKDthSqD0EdQ+IknGs8yEzFLa8y0C9pWq6emhf1nXw/9IYGXa6Dtp6bQ4Cz
	JLRN0yw1PQ1GC/4QEiIutikxMdpHDctjIXlpDtaYqv428I1n2CotH9wGN+FFrjGaylVH
	Sncw==
X-Gm-Message-State: ALyK8tIY3K1aRl8hOpuNmU7AkLs9qBzqwGf7dgpXL4P5atcDx8CxT3RIHEu9xfTvmVNVlA==
X-Received: by 10.55.197.221 with SMTP id k90mr16500867qkl.89.1465850785273;
	Mon, 13 Jun 2016 13:46:25 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-10-138.ronkva.east.verizon.net.
	[71.171.10.138]) by smtp.gmail.com with ESMTPSA id
	c192sm6893396qke.2.2016.06.13.13.46.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Jun 2016 13:46:24 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jun 2016 16:46:18 -0400
Message-Id: <1465850778-7731-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.5
Subject: [meta-python][PATCH] python-pyephem_3.7.6.0.bb: Add new recipe.
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
X-List-Received-Date: Mon, 13 Jun 2016 20:46:27 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../python-pyephem/python-pyephem_3.7.6.0.bb               | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb

diff --git a/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb b/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb
new file mode 100644
index 0000000..b7af687
--- /dev/null
+++ b/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "PyEphem astronomical calculations"
+HOMEPAGE = "http://rhodesmill.org/pyephem/"
+
+LICENSE = "LGPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f288303760f6e5ceaafe3aaa32186ab1"
+
+SRC_URI = "https://pypi.python.org/packages/source/e/ephem/ephem-${PV}.tar.gz"
+SRC_URI[md5sum] = "405a109f3017251ecd8c2890d850f649"
+SRC_URI[sha256sum] = "7a4c82b1def2893e02aec0394f108d24adb17bd7b0ca6f4bc78eb7120c0212ac"
+
+S = "${WORKDIR}/ephem-${PV}"
+
+inherit setuptools
+
-- 
2.5.5


