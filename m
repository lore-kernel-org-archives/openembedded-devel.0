Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web12.3951.1628130560371986422
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 19:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm3 header.b=J4tU46WX;
 spf=pass (domain: aj.id.au, ip: 66.111.4.26, mailfrom: andrew@aj.id.au)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id AD06C5C00B1
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Aug 2021 22:29:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 04 Aug 2021 22:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
	:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=fm3; bh=W5i2e4ZDSTs6Ed3gF4dv9PHl5g
	e7147gLagjclq2Nw0=; b=J4tU46WXkTcQnb1p2b6k7u70hCCFoxUFDNKqhfWbuU
	HKYaXTkg1LGbU0DFAFzOFZmoHpfr6lU56K0IfFrYGEvflv42hEk0iL4FzmyZvWlO
	EnrfsNNSlHLMVvkaG9qw+vIsgX5uf4k4S3gCfNpz2MGQ9DfLbmOnBE2UL4DcO2pH
	JZhAiNaFWGDmgaDwA9li/T2NxBvqwzZyeA8Hn7LDo5aCr9R5ypWSaWl4E4yYZd9/
	8lPVaIhGtkK/pgH9VbtOfCfkKGdFB+iUq2p+73NTFk2BalRts3HP4VjDMyB9hJp6
	WmfnjRO5g70AMQKAHd+JLt5B6xPYpH6KdLF2udER05PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; bh=W5i2e4ZDSTs6Ed3gF4dv9PHl5ge7147gLagjclq2Nw0=; b=dwsxLAHm
	bu1b/uu7E9DcKOZViBpMM1ah9VeR28mGNV/MMeaEgdtQE4o7zxK36SlLN43F3lxp
	313NinAcxcuZA/sH1I/IZJYocRNGLdYEFAWcfKo2REQ/Zrv87OvZVy2TFondkUPR
	n+GQb6+S/LdO2ATBqTjQNvQAs3ASkTyNfgr1SUc/sKz6KVTD5bShTp9SHz4BS37n
	iUe5aIQXOf5/tqGxpa8G8uJnqnpt5+X7X7a1tn1WdTBZuqbJBrRvE7d0nfRoJ/Tu
	j8xq6mHyVv/JaEUYj0rTz+1rSEE6P8Sm9XnuFf7geXP8A1IH8JtxKl+YCxHTAjww
	IF72GVBsskNI3Q==
X-ME-Sender: <xms:_0wLYcA45CEA9loOJRKVlRvP8z6BNo9bvlqSeRqSFrHedE37pl0Plw>
    <xme:_0wLYejFHpJZrmwVzm4r2VeduAW4HuRmTCe5z_07kl4wSBoFXXO5KotjVl6aDxHQ4
    Nbcm5GzEYemvOLyFA>
X-ME-Received: <xmr:_0wLYfkLKXY2jq-ny3xBpaUo9lq6jsyXhMQk5nX-qDFim3vtWMzQQKeThAASix4N21wbIUM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieekgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedunecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:_0wLYSw7q2ycDSNxn_jSXWMzY-l722P872XwfgMr0PIMcEbO9Csvhg>
    <xmx:_0wLYRR-5QwmkFdaJ_zTVOlS9_DI3b7ufct6m7E6_B3TbKe2A0pDQw>
    <xmx:_0wLYdZCU8Dh9azgL1vSndumPm8uFCmrXXYKptteXnGi--6isfJBVQ>
    <xmx:_0wLYcPNLhXZCCWk97v_txsIBKaWZI9g1e40EJtKscijdX0RrH38_Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Wed,
 4 Aug 2021 22:29:18 -0400 (EDT)
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] meta-oe: python3-ecdsa: Add native support
Date: Thu,  5 Aug 2021 11:59:06 +0930
Message-Id: <20210805022906.1023804-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210805022906.1023804-1-andrew@aj.id.au>
References: <20210805022906.1023804-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

python3-ecdsa is a dependency of meta-aspeed's socsec package. socsec is
a set of tools for signing bootloaders and forming a hardware root
of trust for ASPEED BMC SoCs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb
index a217ecd22416..177019ccc21c 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb
@@ -8,6 +8,8 @@ DEPENDS += "python3-pip python3-pbr"
 PYPI_PACKAGE = "ecdsa"
 SRC_URI[sha256sum] = "b9f500bb439e4153d0330610f5d26baaf18d17b8ced1bc54410d189385ea68aa"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 python3native
 
 RDEPENDS:${PN} += "python3-six python3-gmpy2 python3-pbr"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2

