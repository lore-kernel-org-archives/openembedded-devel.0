Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web08.14011.1614960191850661636
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 08:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=fsu0EHLN;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 47221209E;
	Fri,  5 Mar 2021 11:03:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 Mar 2021 11:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=T2/HNGcD8IIaD
	CKalUhgk4IvJ+NGB+FPAr/gRjj+U6c=; b=fsu0EHLNgAquiaNvvM/dt15VVSGxY
	wMSV/NPwt7kS7KmVPWBqSHw8XMu1iuvLL6dRd9ZdXywim4xbJk+JCS4WzpkFo0Y+
	Rs2SVeMIGCfQSMnfPpl263B/tFamTuEMF4P+V9Y7rkPYzEOo0tLFd7SS+bnkEiT3
	/i9h5A1lnhkZ73JuIcFV/hrk8YV/BDY95N1ntYkN9/LQuJwWMffnkK1owww5NcEa
	TB6b2DXm8LNHdvuuPoTgpn4Dxv6Xl8aalcConJn/3/3T86ewxQ+oeV7oWn4ZcDCJ
	BLI2UHayzUN30FIDpmXRckrjxfnzeAxmT+7524QKjYuE9yNpcXb+v0JkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=T2/HNGcD8IIaDCKalUhgk4IvJ+NGB+FPAr/gRjj+U6c=; b=wrq9HNrE
	5oRub/bPj7CRCPvTqD4UgAdpmVoa1TztO8fSJh4u9GBqYorwDqQqESS3ItCxv6At
	vMoZBGOfL+rRmujEShlOhSRilnDm9cziG+nNpHPF8W0jg3MF9Fmki1jqrrtW2Th0
	qY70TkIIWtXZ+M6/IkF+9OtEz2f+DwB9kCXGbsRiyg64btNQY3i/zG3vGjPWDkfr
	0K24PWPQPxX79vRzuxVLb57vHAp3Vee0qSXDWDZqViDyht5YzftnQn2tpo/5/xUN
	AdThnsPv0ayPqIXX8TJBb8wDdymNLifJT4AiSM2XLf/lDYK26iOl0i1zlQlvq3m6
	hg4/AYKT3CKEBQ==
X-ME-Sender: <xms:PlZCYFsTmg2UMbTOR3rF4Eoz7twEX64IFEhdsvZ0MlkElUNNuQuJVw>
    <xme:PlZCYOaAV2L81I1He7p_KsA6k-jl6sbUlN6dtrxPaUjAsiP_zdPb90taA6ZyJoarP
    uT7jriG2zYhooIQugg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeettddvffefkeetveekteeive
    eggeevieeiudejfeeitedvkeelvdekheejlefffeenucfkphepuddtledrudegiedrfeej
    rddukedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:PlZCYFp7PWag7wt5XP_dfoETZl-3fURiyE-xZzypTF7fGl8AKcZL1g>
    <xmx:PlZCYD9Oo0kdO-3pe9s2X1gbBOyqd1npV6dEAU2AbPcWRnjKBCnbWg>
    <xmx:PlZCYE_05-VETeCu3xEbOgW-beSMbIj4kiPZ4jVFlqPWWiugeqbXBQ>
    <xmx:PlZCYHmVOWMHS9B4neYgkb4f-sWROK9Mv7KOd7olDwrW8EIcZEgT_A>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id ACC4024005B;
	Fri,  5 Mar 2021 11:03:09 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com
Subject: [meta-python][PATCH v3 4/6] packagegroup-meta-python: Add new modules (aiohue, ifaddr, pysonos)
Date: Fri,  5 Mar 2021 16:02:54 +0000
Message-Id: <20210305160256.3333334-4-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305160256.3333334-1-andrei@gherzan.com>
References: <20210305160256.3333334-1-andrei@gherzan.com>
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

