Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web12.8414.1614691284153821756
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 05:21:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=XFf9G4e6;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 6ACE0F9A;
	Tue,  2 Mar 2021 08:21:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 02 Mar 2021 08:21:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=Wimp27rwYs6hU
	hiCkDMLNMDuSumiOdPIs8YWF0YM4Y0=; b=XFf9G4e6XjmCsnlHwtSe1LPOfcZ1m
	L68vLRxdDIXtMbDhSh16fhcT6j8+NlwB7ZM8d/qiczE5jel52F91HsTF3kDPaVrg
	MF+GQGEIhSIvYsXw+nzMvBS5xCKoZBF6SewdAnPoX0WWCPN281hRW5nVChPPkUMn
	sLi+yZ+Ec8dLGDnTgf/tTcyE2lDfgKKltA8GDk7+c0uFmaBrItYCYuml5Q9ElNV/
	egK1z8kcnS4+OnE9MstQZHnMyfWom+PtfFjytvOfTqyIdpGmfwRMbgOsM873Lbwa
	p8Tfa0Rkesmea1TQUMq85YG1oNtkA45UEMiU1ymhqySZvZpbDtgNz4JxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=Wimp27rwYs6hUhiCkDMLNMDuSumiOdPIs8YWF0YM4Y0=; b=jg9M7LoN
	3BGshXrpj0HwI78cHnLbY9drASDNm29BG6ryaCjfLC8+DdG+IZgJd23aGk5AxwLl
	qnZqpbac9fN6D7jzzGd5ooUZ/kjhRB5TW42myRQckKflTq9ViSIQvVQvsIJZ7njy
	VaZoGOCUYU8rV/GjEcXTS+f6JjvklV3V9F/++LzDelb0PUSHtrOU7H93tbT75U/M
	FcCTY2lRCrmDT5SZ71VUJx3IY1NrGjlRtnodl0xKVpJFmKqy2HI2a5WNcmQvXMeH
	zdqZLz5trc2ke1Q/S6+sV5WEh21dQvTDnoAThB7NwQX/FiIegD7j7/wh48+BKeH3
	QN66IWs/6jmD+g==
X-ME-Sender: <xms:0js-YCLS9n0gnUCMmkg8LZ_xAsusmuMS-CHx6IQPqKNXplsyE-H2qw>
    <xme:0js-YKIgMN7Oud-UHU78AJqQWbCO_Tv1ZTIyrYMVsIo2pj4M3ujZqdp-kgIplL560
    ntHJ4GRd4suRpwDrUI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeelleeihfevvddvjefgueeuke
    egffeivefhgfeludfhudeggeffuddtleefueegueenucffohhmrghinhepghhithhhuhgs
    rdgtohhmnecukfhppedutdelrddugeeirdefjedrudekvdenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdr
    tghomh
X-ME-Proxy: <xmx:0js-YCvJh2ATusSgPmxl4LTzCvFiHG1g75uzuIZUIHsubptbEt7qBQ>
    <xmx:0js-YHa1FBs--jiTueSFj2p1h9vZ57-hTLolgguZ4u3cB3qP2bEuUg>
    <xmx:0js-YJYL5ftc3tyB1gLTyDhDuTjjEhJMMnTuVmvOFPzBkVc0LXi8aw>
    <xmx:0zs-YL0Fp00su-ktQUTajQtEROfFtsyM93Fp_KjlxHCvrBwZs2Zf-A>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 70F67108006A;
	Tue,  2 Mar 2021 08:21:22 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei@gherzan.com>
Subject: [meta-python][PATCH 2/2] python3-pep8: Fix HOMEPAGE
Date: Tue,  2 Mar 2021 13:21:11 +0000
Message-Id: <20210302132111.1644601-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302132111.1644601-1-andrei@gherzan.com>
References: <20210302132111.1644601-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrei Gherzan <andrei@gherzan.com>
---
 meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
index 8291281ca..e8587c832 100644
--- a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Python style guide checker"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
+HOMEPAGE = "https://github.com/PyCQA/pycodestyle"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e"
-- 
2.30.1

