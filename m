Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web08.3981.1628130557492673318
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 19:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm3 header.b=jFMOCWbG;
 spf=pass (domain: aj.id.au, ip: 66.111.4.26, mailfrom: andrew@aj.id.au)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id AEFDA5C0114
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Aug 2021 22:29:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 04 Aug 2021 22:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
	:to:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=DTV0L4+8+o0YCvx8m99hqN3WIn
	A0FRhWwFliyvghhC8=; b=jFMOCWbG5/Bj6z9KLWDY/gzPXKLS0UMslDG/kjrReF
	55HeAzmL9VeGRVjaexqlFKmfNrCsmsNu2wOrAF02fiO43dB26tCqJkxek/ZXpoJr
	xbgwj6GkfKAONCuzntNMcAUttkVOFvggsCHPHp+PtGqifQvIRHgyQej1fqUauYxT
	PoPap+oxJLpm3EPvkrHd7CB4l2pP5RnKjun7eazrzWgCYDWolaZBEq8V9m0WATUw
	5P4cmanHUWn6rtU46iwixTEBydF6k6HR2ozmtieVQWqJSvVCJRzpAEwhpOICNy7V
	KFm6FZTQfnk8QfJjq/dFxk6MmkFXLvB1+L7DUr8KfyPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=DTV0L4+8+o0YCvx8m
	99hqN3WInA0FRhWwFliyvghhC8=; b=gx4TKKoup0RDKrgoxJq16FHYQNLSSBh4p
	xF0qZ8U7w39nUSVwu1eeVBIINjqeVFY1NdaWkpwqwLdYhyaxrAGaC3qZekQEnQpp
	8wc+q1V1fNi6kwjXtSlz0r+gIBfyMACVirXWkgX4k8ig40UPkWx7JFH+UpbeFlEt
	/ZIlKrJf8iDUqstjNWnJrQthxEZ3joG2KDl8Y1u7S2LWVQ+HHS+5U6irSh1wxGmS
	GO1Hhe4ku1+p+r92ROZSoem4XEItW6W9rBLp0BH93cQmoJBNVARVX27pwCWrXaLA
	PYS/bpDby+QnAnCYWJGMYhoBEU+9vZv8G1Jol4YN/y7WPPF4p+dNg==
X-ME-Sender: <xms:_EwLYT_eQaFSCwtQEE3tat03WHHOBE0r5IqS3yONf3SuXrI829t2Hw>
    <xme:_EwLYftWwqIhVuY6xVPyTiQu2Sjrs1X56ZC0OkMSjhP9dh2hxQnN56vY4Lw3sDzRF
    tpwxEByuvpXoO3FbQ>
X-ME-Received: <xmr:_EwLYRDjqLfAjjgvWvcWl5FUjV1nCSMg17b8l8t0qQOdS2vEXJir1apXo4MZLwYjMfN7poM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieekgdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
    ugdrrghuqeenucggtffrrghtthgvrhhnpeduieellefhueegkeehkedtleekfeekueehff
    efheduvdejudfghfeuledvleevudenucffohhmrghinhepghhithhhuhgsrdgtohhmnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
    ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:_EwLYfd5jGakRpE2QOvLzarX1YA4tp_shSIVB33fXlgZbPqSE5rvpA>
    <xmx:_EwLYYOcW70LdVkhGmZD9T5Q3VqMM3_mApMGR9rKwYz1qUhFjBvm8w>
    <xmx:_EwLYRnySVI1hgrkSoJcRAp-P5ZQnq3QJ2EFKwGdrraksQO2y5LTIQ>
    <xmx:_EwLYTZOHpYYQqErw74hV_2ILqemLQHCAWYYrmlVsh3R-TmdZklEzg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Wed,
 4 Aug 2021 22:29:15 -0400 (EDT)
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 0/2] Add native support for socsec dependencies
Date: Thu,  5 Aug 2021 11:59:04 +0930
Message-Id: <20210805022906.1023804-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series is two patches adding native support for dependencies of ASPEED's
`socsec` package from OpenBMC's meta-aspeed layer:

https://github.com/openbmc/openbmc/blob/04fa7fa906a548beb1012f3583a194a6b9798244/meta-aspeed/recipes-aspeed/python/socsec_git.bb

socsec is a set of tools used to sign bootloaders and form a hardware root of
trust in ASPEED BMC SoCs. The socsec tools are integrated into the meta-aspeed
u-boot recipe to sign the bootloader at build-time:

https://github.com/openbmc/openbmc/blob/04fa7fa906a548beb1012f3583a194a6b9798244/meta-aspeed/recipes-bsp/u-boot/u-boot-aspeed-sdk_2019.04.bb#L6

https://github.com/openbmc/openbmc/blob/04fa7fa906a548beb1012f3583a194a6b9798244/meta-aspeed/classes/socsec-sign.bbclass

Please review!

Andrew

Andrew Jeffery (2):
  meta-oe: python3-gmpy: Add native support
  meta-oe: python3-ecdsa: Add native support

 meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb | 4 +++-
 meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb  | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.30.2

