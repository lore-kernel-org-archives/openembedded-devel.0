Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web11.730.1588567689099091851
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 May 2020 21:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@alistair23.me header.s=fm1 header.b=z0UnTWLN;
 spf=none, err=permanent DNS error (domain: alistair23.me, ip: 64.147.123.19, mailfrom: alistair@alistair23.me)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 942FC608;
	Mon,  4 May 2020 00:48:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 04 May 2020 00:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=1zquetYpM72j0
	sn5ZWN9eLNe5y3kFTLUPUnxgx3qmfs=; b=z0UnTWLNGimGvvEf9dnOF/f+IT8tv
	kf4IUvZXhA/Z3/VPbj9q1ereo9tNIJbKxRJZLvupJatzh2RJFUN2D4HAHCOymmnT
	u1Tn2LJ9ERf3yxXXyZuM+NuHS60p8Bbzn0IrbybN87yfSczCk4F0NqyrrmmzUaMP
	hvlAQUP8D/oV7nM3Kz6iYzML4h/ONjOzXWvL2Rc21MuCqtjvJOVIIa31FjxQ7wnj
	BMi8bKm5dU5RO2b/Xkjhy6YO0StgdCu6jPAr8XE5Z5w0EPfgvy19Sv/Frs/UlzU7
	2zeOhly3JfEnA95v/k0M8172PX+B9dKKdseoUWKLLTQd1MVFH8H9162IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=1zquetYpM72j0sn5ZWN9eLNe5y3kFTLUPUnxgx3qmfs=; b=xbZTdHez
	be8IFDzCAefRNeDqEU1PZJeN/xmGrJoXBxh6PjgbFYSfwaRu7iF1NvRkKgLdtFKP
	IjQsdExTlLs7p+NR49ks7jD/VbAtIpeRpQgr/1HD+q5gTePZgztfUWlMleKDlKfU
	h1kzms9TsRIhg0s8b6T1+vSyHQ5o6Ccd55Bomg03tLRWxnhrFe23mfV+M3RrLdhu
	uoWVdfsCrVOgOWi68dn6Ws19RxU1LQHg9aKPSJZHDZmfu6+MIz8zGd5McXCMY3La
	DtlES0eWJ8zJuvK4oafR6kqeW663ckV5EULxIbuf/E4chzlJ3xhVSPLvILnW0gLK
	JC/yjC6DvGRCJA==
X-ME-Sender: <xms:iJ6vXlrAfakHU3Mm_j73WhufxC0svdForCUytMbkeqJvt7XdjZgEbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeefgdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepffeikefguddtgf
    fhgfffjeehvdegudefjeeivdekhfdvtdekhfdvjeffvdeuvddunecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucfkphepjeefrdelfedrkeegrddvtdeknecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhi
    shhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:iJ6vXplwbd58WSgRRo-A00UVnwIBthM5ztjUkz--vvojQsNDbhLx0w>
    <xmx:iJ6vXslaVDKWQ6XMyc18r10aOnCt_NCglkJYazINHuA7mYDJCo3jRg>
    <xmx:iJ6vXuNjORpJmwmS15JYuJlkEcWgSRHEt3JyD231D7IN8w_lVZtTwQ>
    <xmx:iJ6vXnoFfx0s57dGadLbTt19fCRs3HNmSyhqD87CxabNnVZlPT4toA>
Received: from alistair-xps-14z.alistair23.me (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id B14C13280063;
	Mon,  4 May 2020 00:48:07 -0400 (EDT)
From: "Alistair" <alistair@alistair23.me>
To: openembedded-devel@lists.openembedded.org
Cc: Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 2/2] libgit2: Update to v1.0.0
Date: Sun,  3 May 2020 21:48:02 -0700
Message-Id: <20200504044802.1902288-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504044802.1902288-1-alistair@alistair23.me>
References: <20200504044802.1902288-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../libgit2/{libgit2_0.28.4.bb => libgit2_1.0.0.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libgit2/{libgit2_0.28.4.bb => libgit2_1.0.0.bb} (64%)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb b/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
similarity index 64%
rename from meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
rename to meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
index 9b9c19104..fd26a0fe9 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
 LICENSE = "GPL-2.0-with-GCC-exception & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3f2cd5d3cccd71d62066ba619614592b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.28"
-SRCREV = "106a5f27586504ea371528191f0ea3aac2ad432b"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.0"
+SRCREV = "7d3c7057f0e774aecd6fc4ef8333e69e5c4873e0"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

