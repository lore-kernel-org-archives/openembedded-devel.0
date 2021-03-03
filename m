Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web11.6524.1614778385098061142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 05:33:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=MUt4SYJE;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25, mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 862C617DC;
	Wed,  3 Mar 2021 08:33:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 03 Mar 2021 08:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=T2/HNGcD8IIaD
	CKalUhgk4IvJ+NGB+FPAr/gRjj+U6c=; b=MUt4SYJEm4XjOXA2kur4xOhokb7Rt
	T9JhTPC8LvDwO6V7AgOUfEMs97Fc9eab8RgHjlHME0Umf6pYKysTq62v/qbUSiR4
	9YmdtD7u3YmMTHk7U9hUZ4l2JvkJHezJ/EFC5wmpUBcGxfZ7Wlm1ysa5zpy0qq8p
	e+KsOWxPOIwMg7opndhMPMSJobS6yYtvXARuUP7IPG2zttwBnpbHDQDR5WvC49hk
	vYm5is/oeWJx/o3iWdM7HvWAosvqblabv1W2pvdjt3bTp10dPvp7r8dHqclLcm4F
	39fh7c0rpyufdgzcg+O0NBqbZYA1WTuOCxLyPksdvjJsUuIN3RjNaFLiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=T2/HNGcD8IIaDCKalUhgk4IvJ+NGB+FPAr/gRjj+U6c=; b=D/Sl1YbP
	y9CZQO/O4gjUNWzr7cpqvPWIOWdIDtLW6K15D1pKo3GatRlv7hIHlV4QVN3nE/K5
	sHLcTMVt9cKrkLfHHCyKkfpg5FEiSisHUYqLw0pBcRvnv9D4Op4wrTqX2J6bjBb7
	/6xRRIhzLyoRLHc7AE5/M5c2ui7gAHw4gKG7/kcRisWLqV8aRqJsp4rpbEAytlw1
	dspZz4ZySePWopYrAoOdq3anE0w4d5xM2xrOCrMIgqyeuE69isGSBUh++LH79lku
	kTQqrknaatNAo4NeL0JAQvXn/83t+Q+yW5zt5pHAUBgyQ9M+OTAkxPoFEToxeOBG
	9r8zFUwAtGq2uw==
X-ME-Sender: <xms:EJA_YPca3mUtLek-28vsfNoXfMJZvcLm8oMnNMarIbIki3aijcY8eQ>
    <xme:EJA_YPOCaG68Vo8LFd59I8GI34TOlWGVUpRGpmZKCZAIM2zzzFRIUsrfzVExbuq1D
    uHLkOGwVTCRJ6nlg34>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtvddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeettddvffefkeetveekteeive
    eggeevieeiudejfeeitedvkeelvdekheejlefffeenucfkphepuddtledrudegiedrfeej
    rddukedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:EJA_YPKhaIL1DobmDFtS8AnllfeUAdx2NsmoXhWK50GFQZHJcWmujA>
    <xmx:EJA_YPJd3I_ymrgiGyjRMtHFYDghypf0b2191pssKhLpwwxWXvZvHw>
    <xmx:EJA_YJ68FjeQkFyOZRNKqqp_7u8JbwQEIGMPJMj25sBHAGwXAsWZ9Q>
    <xmx:EJA_YF0inSU7G4wCYyuXeVE1_MpwLvbucqYNOsfuTextR50fQbYdTQ>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id A90B61080059;
	Wed,  3 Mar 2021 08:33:03 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei@gherzan.com>
Subject: [meta-python][PATCH v2 4/6] packagegroup-meta-python: Add new modules (aiohue, ifaddr, pysonos)
Date: Wed,  3 Mar 2021 13:32:39 +0000
Message-Id: <20210303133241.29781-4-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303133241.29781-1-andrei@gherzan.com>
References: <20210303133241.29781-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrei Gherzan <andrei@gherzan.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 635dee194..6323e17c6 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -21,6 +21,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-aiofiles \
     python3-aiohttp \
     python3-aiohttp-jinja2 \
+    python3-aiohue \
     python3-alembic \
     python3-ansi2html \
     python3-ansicolors \
@@ -167,6 +168,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-idna \
     python3-idna \
     python3-idna-ssl \
+    python3-ifaddr \
     python3-imageio \
     python3-incremental \
     python3-inflection \
@@ -320,6 +322,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pyscaffold \
     python3-pyserial \
     python3-pysocks \
+    python3-pysonos \
     python3-pystache \
     python3-pystemd \
     python3-pytest-asyncio \
-- 
2.30.1

