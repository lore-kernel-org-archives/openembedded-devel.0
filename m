Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web11.14128.1614960188869386616
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 08:03:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=MArK3D5Z;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 413A32819;
	Fri,  5 Mar 2021 11:03:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 Mar 2021 11:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=Vjn0NXDZoFFmD
	zCDUyHQIA4EJYlAJDKm2KJhmNDtH7E=; b=MArK3D5Zb6CE/CjRFyFiadzvB86fF
	8DeSIo8D76N+10OzC04NoUAXq9XBvuHceCS0QEEHOzHncAqSFzxWSrRojV+SQas3
	nhDA1Y+VNSTuMZPBegd3T+YVrER26Orym79k8jQCEsHIZgFGD5kao+5AVHuT8Eod
	Fpvd+EO3PfVLuISJVbkkkq5cMMPNPvUVLxJHriKq/es1WTjk+FjMJTg4rsaAvgTD
	FT1/fAKXVwWaB1EQJnlCAdU2lBgVtHNDt3uhRoN0umjzHcENEC2maD1EkF1FZTMI
	d94nIhPt3uEPq10mz2Y50VN+t5BOfvDQo7wAUcsfDUS9FgSIV/r+yV64w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=Vjn0NXDZoFFmDzCDUyHQIA4EJYlAJDKm2KJhmNDtH7E=; b=D+tndqhG
	beeVE9tFV6jKDrs3DIESeQZw06ZYZHeZRN2uiAsBtxY9oBwF5U+oQqLRvmWLyU7t
	wIuPx5xGJfvCII8PaaQPpEdlbG+kGSPeAYVkLGluJJBuMXUWWMZOoitVsWMulRta
	gSiP+BSijAMmZ2P2iDA37Sy+2HguyNjFucS8X14iag12n3uDh3fk3Vy0vOxYlBXO
	UxG/IS2MXLkzZ5v2dKisI1kky4Ld4VVcio/BjvM8XKg+3PD7FfLs1CC69Nt1Y9ug
	i4G9sdSafZVVEip0uPfxTjpa/+5GSt0sIJpsT/YqmwPW2oIrWift0xne9QN5QYzD
	rRFnbNs/PMfh7w==
X-ME-Sender: <xms:O1ZCYHjZSVG1aOv2cxDe9IWkfnMmEJgkYPD-Gm2HL46TAPKshpYa-w>
    <xme:O1ZCYDODPlB2FcZMFgAyf64fmE7UyuUVtTjS8yfWtD8kSpUxTZezAJ46iPIxgZ3Fe
    zDBbcKfcxzt-LkD6nk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpefhfeejudefheeiffffheekue
    fgteeuueffkeefjeduudevueekuedvhfefleevheenucffohhmrghinhepphihphhirdho
    rhhgnecukfhppedutdelrddugeeirdefjedrudekvdenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtgho
    mh
X-ME-Proxy: <xmx:O1ZCYJwZsz7F7T1IWbG6NSdkSWryDFaCZ6uRxoY26azbvK9HWE8vgA>
    <xmx:O1ZCYNpIZUe1azqU5O4zybWFblhwYpYv4-WPtxmmDuBz-mjKYac3-Q>
    <xmx:O1ZCYBMeOs3g73bDKJ1zBmoS9loeClCO-PKlwWSgsohuwqSm7QrQUw>
    <xmx:O1ZCYOln5nTqxsbixArcxTjiMCI2jBTAmfZR2PbQT0YDD9HA5kaIsg>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id A898D24005B;
	Fri,  5 Mar 2021 11:03:06 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python][PATCH v3 2/6] python3-pysonos: Integrate the SONOS control HomeAssistant module
Date: Fri,  5 Mar 2021 16:02:52 +0000
Message-Id: <20210305160256.3333334-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305160256.3333334-1-andrei@gherzan.com>
References: <20210305160256.3333334-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../python/python3-pysonos_0.0.40.bb              | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb

diff --git a/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb b/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb
new file mode 100644
index 000000000..dbfa0dff5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb
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

