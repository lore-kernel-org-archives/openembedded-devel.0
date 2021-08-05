Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web12.3950.1628130558868402063
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 19:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm3 header.b=bpt8mDfy;
 spf=pass (domain: aj.id.au, ip: 66.111.4.26, mailfrom: andrew@aj.id.au)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 3B0165C0112
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Aug 2021 22:29:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 04 Aug 2021 22:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
	:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=fm3; bh=1EXkHVJEI6IC7nz0WJpWgFzxG7
	ksQPYSS2qSonqmRiQ=; b=bpt8mDfyIL/nW0jFO0hAGV7VASArtMb32WLz8qps2n
	SFdEcRw9Mu+ItNwMnZuGGKHLLsjbDOpuQ937fcShm6m7Gll/Os9Y0MhL8q0/XBLu
	QQ44hnB4DZeq0mf0YG4cqY4905VDCjos/MJXoi806EcpLdnYXY6A6HVZSUxOmSCX
	Gcq0UyZc1An71h4FIstKIJ+mvG9bYC8QOrZVmHgS3FN0FScBnFNIB+u2H3I+lrNg
	L3i1B6fNhUX/+kcJH6PPcd/drsOZwYlgiF6RVBOHL9aym/xyx6JvriVu7BMFwrvh
	L7F9WCBm08+cY19zj0N30cr0zsG5GNHnQFkul429fx8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; bh=1EXkHVJEI6IC7nz0WJpWgFzxG7ksQPYSS2qSonqmRiQ=; b=oP8913wv
	w95SrbjYTrS8icFMYDJFY1VKUDXoGMPRjNZrITlrHrGPoksjPJ72BpwA/tI4Xdmb
	ce6TKF5lg0l2NyLx7ZGVvOsxc+eGnhpb2Z1J7D5YM+szWK1lmcZ6mPHNOwa4mNVL
	DtDADUJoZgLym9MObeafS5QqDFIeVocOq+OKB5m8Rvn+vj7/O8caXLvJD09dYlWu
	tXA9V0725+zBfd3It4RhXpokSYBrDT+zH6qPK+LT31nPVOhKLNc3zme8Yo2lIQd4
	Yr4ZNYCpXG2zSMY6gilLQMhf5+cpxefmew/DnKxSAfm37abdbIyys/0cvn62oVi6
	TsyA1h35RLieww==
X-ME-Sender: <xms:_kwLYYAZs6cjegogvQii3pWLH_nZhPWRwUf-XaHiH2AQsvbiCgQhMg>
    <xme:_kwLYaj3IBqHdIZZixvaujSAepPWK-BLezCA6UsjgDA-ymC6fVBWJQiRIJieBsIkO
    uI5_bUcio_MPNv_Sw>
X-ME-Received: <xmr:_kwLYbm6yrRCMbxj7jmRWvtA5naAAWhF9uceSWe7NTZdlVwWXLhwKVlb47AwONxJoB3E7S4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieekgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:_kwLYewig_OindNRNtcYZ85_m-LNKoInYKRcwRgBiC-98LObYgsHFA>
    <xmx:_kwLYdSqCZbhK5JjIe6bpr1eijkYeBKA6OvS9HK3RAxWv74ghKO7WA>
    <xmx:_kwLYZbQ7mVgQe23pq8tOl2K2k5hO-5755bJ37qaruEnWbWn9E21dA>
    <xmx:_kwLYYN3HWsIqP7ejafkXc-WYcPSw5QtYOry9EirvVJvopVDDYvorg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Wed,
 4 Aug 2021 22:29:16 -0400 (EDT)
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] meta-oe: python3-gmpy: Add native support
Date: Thu,  5 Aug 2021 11:59:05 +0930
Message-Id: <20210805022906.1023804-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210805022906.1023804-1-andrew@aj.id.au>
References: <20210805022906.1023804-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

python3-gmpy is a transitive dependency of meta-aspeed's socsec package,
via python3-ecdsa. socsec is a set of tools for signing bootloaders and
forming a hardware root of trust for ASPEED BMC SoCs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
index c6edcbb3207a..976f57ab26a6 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
@@ -10,4 +10,5 @@ PYPI_PACKAGE = "gmpy2"
 PYPI_PACKAGE_EXT = "zip"
 SRC_URI[sha256sum] = "dd233e3288b90f21b0bb384bcc7a7e73557bb112ccf0032ad52aa614eb373d3f"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 python3native
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2

