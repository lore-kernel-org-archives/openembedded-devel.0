Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web11.6521.1614778381522170678
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 05:33:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=DAZOTj1n;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25, mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id DB8CEB09;
	Wed,  3 Mar 2021 08:33:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 03 Mar 2021 08:33:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=AektYAnIA+NVy
	qCtoFF1psOA1aR6PbtvftqTDKGww7A=; b=DAZOTj1nC6pdC9s1vAACUkCvZdvgz
	YkOhs/rN/CD7qBHF7dkjqPEkHHH8PKYtwEUtbUye+fUsNwjfviRZlK/mUY5ghaZX
	92EiqT+LUIZxv0OFKM9x1bOzO/JuS/80cxzFGxombDE2XOSodQrFjVqwBeWwFHrD
	LoLJun5kkpX2Hn56awfiv0J+QX9q+dzJxM2gpuWoAMZpJJ0Th7XTBF2Jk8dZoU9Q
	2qZvv/CqntMlhVeCxwVFwqzSBhr4es8H38hDFIzU/dMWl+3zocMNhcMKj+z3Bz0w
	GsHjHFf1hJMRKQWVhFe+M3RGyRBsO8oenN4UX1jn0+XltuA57zhMcmwMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=AektYAnIA+NVyqCtoFF1psOA1aR6PbtvftqTDKGww7A=; b=XPX50M8m
	/tsPyPtiqfJwP231FKoPt+0sOe440o3k4neog99BJ2sKRMuvDxIrySJykFrLb6+o
	yyIw8BeqBM4Jfxvce4mNwZCRl7mnOcZdZ5wsVjXxus2VhUv8MdBWUEHknLmqsxjr
	STIO8R8eZ8Nhtl22q4QXySl3e/aKOMe7r/k1jomndYxR7WzOw5EKfmznJGNMdIK4
	esjCbGVBgMVaN3Av0kMQ+qfsf2zK8CaLAGhls9Gkju12R8P+u/TsG9qhHgfTUlMj
	fXRaKYVaYrZ8Pg215GcyfQ6wOhH8fmAMijL16QGm8F//vkA/nGEuXT4cIj7X7wNh
	IU8x+nX5bJfPpA==
X-ME-Sender: <xms:C5A_YPztaYwv4Hrr4s4x0cHYiqgzOcSRBAA0y6am5rJa-16lO0Y2GQ>
    <xme:C5A_YCsK0S8OHDSeTcCkQcGdMTlDjYxWdjsF9p4T3c3WcK5qSjFlHQShtkoOvyQ9g
    cCdQGQ0Zs0if5Uy8m8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtvddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpefhfeejudefheeiffffheekue
    fgteeuueffkeefjeduudevueekuedvhfefleevheenucffohhmrghinhepphihphhirdho
    rhhgnecukfhppedutdelrddugeeirdefjedrudekvdenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtgho
    mh
X-ME-Proxy: <xmx:C5A_YM0Js1zh_Ob35WUNE27hcoPo3ihMkm6zWmeaavE68i7jjlY24Q>
    <xmx:C5A_YN9AMj2wBdfC4WD2OFmlNXQnVxmrgYlLMGEJDNEyC1N_aKNr7g>
    <xmx:C5A_YNOLVAfX4DMKEQqzkk4JvSIwmAkCPL1KT8fqCs3vCHygDfe_9Q>
    <xmx:DJA_YLZMExq6NYx5dkbPbCTF7CVmWt9DBTa_PRm-cfY012pJMtAKLQ>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 65A601080059;
	Wed,  3 Mar 2021 08:32:59 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python][PATCH v2 2/6] python3-pysonos: Integrate the SONOS control HomeAssistant module
Date: Wed,  3 Mar 2021 13:32:37 +0000
Message-Id: <20210303133241.29781-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303133241.29781-1-andrei@gherzan.com>
References: <20210303133241.29781-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-devtools/python/python3-pysonos_0.0.40.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-devtools/python/python3-pysonos_0.0.40.bb

diff --git a/recipes-devtools/python/python3-pysonos_0.0.40.bb b/recipes-devtools/python/python3-pysonos_0.0.40.bb
new file mode 100644
index 000000000..dbfa0dff5
--- /dev/null
+++ b/recipes-devtools/python/python3-pysonos_0.0.40.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "A SoCo fork with fixes for Home Assistant "
+HOMEPAGE = "https://pypi.org/project/pysonos/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=07b0e2ca9ac77cd65cd4edf2e13367ea"
+
+SRC_URI[sha256sum] = "3fed94dffbca5807d39d000d1415fe8d7dfc1032ba92a33d0b577eb2e98a81f3"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+	${PYTHON_PN}-ifaddr \
+	${PYTHON_PN}-requests \
+	${PYTHON_PN}-xmltodict \
+	"
-- 
2.30.1

