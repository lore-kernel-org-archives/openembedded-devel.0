Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.8168.1585061902399109234
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 07:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=omuqVMmN;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 0379F60303;
	Tue, 24 Mar 2020 15:58:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585061901;
	bh=wnoY4MGxH81kBa233oyY+LN3qKOri+RAgiUEszVSETE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=omuqVMmN8sF/tRN2sIxxPFAMR4WK3kOfsADbJ/t/RDEztH9nuwsLAgt3zcXHhiwOI
	 7SqTBpI8UCdzgtCp8invRAfDylBhyCQ4OUZdycS5B/eMWGlb5XGNIG8iMcBF7BDnSs
	 AIjWnljKUJpUbsYht/k6V1ccUqERuysUEcN2VqNcnrotK2pGcwbOcZxs6UoG37utHd
	 gzLEWhXdsfIlQBARVZjKZDkkGFk6gdrkZOJOegf+8EyoIbULq5hbH+Pe5UBqVjkt36
	 QCFozYsmltvctbRN0F4dqBsOVOtlURRfAdOLzhVQjErC6cUAf/4URa3eARepwcZFnG
	 Y9WUMOKF9fhgA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 2/2] openvpn: fix upstream check URL
Date: Tue, 24 Mar 2020 15:58:12 +0100
Message-Id: <1585061892-18458-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585061892-18458-1-git-send-email-pjtexier@koncepto.io>
References: <1585061892-18458-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status openvpn
<...>

INFO: openvpn                   2.4.8           UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-networking/recipes-support/openvpn/openvpn_2.4.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.8.bb b/meta-networking/recipes-support/openvpn/openvpn_2.4.8.bb
index 7cad0e4..09efa57 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.4.8.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.8.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://openvpn@.service \
            file://openvpn-volatile.conf"
 
+UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
+
 SRC_URI[md5sum] = "e9cb40542e17ce295d80860690710aab"
 SRC_URI[sha256sum] = "65e1da3f3a08e7e900c175e7fc30d834881fd2dea0eb39b25325a861a9da0bc5"
 
-- 
2.7.4

