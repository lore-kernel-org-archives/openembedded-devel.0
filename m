Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web12.6515.1614778383258833381
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 05:33:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=fJTNj6ff;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id AAF8217C8;
	Wed,  3 Mar 2021 08:33:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 03 Mar 2021 08:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=jmo4H/kbCAU9I
	OUrdQuIDH/uwH8OhGgFqwS4sjl/68A=; b=fJTNj6ffJ0eEg/KOCASL+2zFljFv5
	5Jl/YGvg4C92/neKwlW7i3y0X97a1pbvbwKh1NPFtFt+QNIri2Ua4DLIbPoGxCje
	Jbh083Y8953fY08FyhkkrKDq9p+x1CkUCks22yfagSDcXsCZDTsV5FHCKFpwfZnE
	9nwnCanbi7CIQbLm9i1nAwqgmqH77DRlOwnMaYx+kbddOKlb+dovrs4jjONIVbR6
	EqwtSQMwqDQL5ZtRugdkJmmaqjei04oCygISNUp7CzXqhxylT/+bejKDV5AxC5Ro
	1ZLnzF3CXjNQbhiE89p1c9f2XbaEGON/WIa6+mqzQ45h64YJCxmBr0aoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=jmo4H/kbCAU9IOUrdQuIDH/uwH8OhGgFqwS4sjl/68A=; b=smGIvTRO
	40Rce64zJTkSKa3cdJkleKFCStF0k688Yb8DaLSekfn6MEta/1/dNmmhvDhcP4a4
	Msr0+6onzx2JW9NA3hq+qvIU9kSBevn+y/s8XBQWiGDoQ8yhaeNKHC1u1xVhoLtW
	hF0P24VvloOs/IrqQ4Ra7ePuDHTLzdRUNcz2yAO2rOeVKiyXoxFkUqjjZFQSJe4L
	lQNRUho4hUWraGLUXnawOeXCukTdEB13W3/Vhuax6wuKcXnNW589rmIc++3ZEd8W
	7dWG8RsXbQ+4IYRwxitkzpYL3sXsQGcy+641DM9FDWbupQE2rUvz62WW2F+JEMNp
	OrntuzfCmHpeVg==
X-ME-Sender: <xms:DZA_YAx3wuTe2w__7JAeVnaZX1-tBP9yEoyShRqWn7vCGne02DWUDQ>
    <xme:DZA_YEP5Rq2D6nNvTO1txvPxjmNc-GxuyUCJXb2_TGENKF30wH23xNddqpxAWdme-
    UfyLSbAGyRY8ZeIw0U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtvddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpefhfeejudefheeiffffheekue
    fgteeuueffkeefjeduudevueekuedvhfefleevheenucffohhmrghinhepphihphhirdho
    rhhgnecukfhppedutdelrddugeeirdefjedrudekvdenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtgho
    mh
X-ME-Proxy: <xmx:DZA_YPNIExDQECHXr_Xi0fsYo399LlPX3bDoJXv9yh4POPDcPqidxA>
    <xmx:DZA_YGROb-dPlUFNvJTZdqpoyJfNAQK6PGNOLG5fimw_KmQKUvolRQ>
    <xmx:DZA_YBBCAZa9LzfU7j-GmFH6R3yHrO8ES7Pd2qNzbVkXP2cGez4VcA>
    <xmx:DpA_YHbcSvDHB4YazyB-vENRfNcJkCNCwFzrBZ2v_4HKJ_hvIHy9yg>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 74D531080059;
	Wed,  3 Mar 2021 08:33:01 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python][PATCH v2 3/6] python3-aiohue: Integrate the hue control python module
Date: Wed,  3 Mar 2021 13:32:38 +0000
Message-Id: <20210303133241.29781-3-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303133241.29781-1-andrei@gherzan.com>
References: <20210303133241.29781-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-devtools/python/python3-aiohue_2.2.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-devtools/python/python3-aiohue_2.2.0.bb

diff --git a/recipes-devtools/python/python3-aiohue_2.2.0.bb b/recipes-devtools/python/python3-aiohue_2.2.0.bb
new file mode 100644
index 000000000..a2a7363f6
--- /dev/null
+++ b/recipes-devtools/python/python3-aiohue_2.2.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Asynchronous library to control Philips Hue"
+HOMEPAGE = "https://pypi.org/project/aiohue/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+# No license file available but the license is specified in PKG-INFO and setup.py.
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
+
+SRC_URI[sha256sum] = "35696d04d6eb0328b7031ea3c0a3cfe5d83dfcf62f920522e4767d165c6bc529"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-aiohttp"
-- 
2.30.1

