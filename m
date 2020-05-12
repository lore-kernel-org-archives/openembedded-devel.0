Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.1038.1589316743744713872
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 13:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Noafs1C/;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M93V00Dpz5R
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 22:52:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589316742;
	bh=JuERgYSzbEwaBAML0vJWCk7WxSyB7fCj6FWhlBI0WzQ=;
	h=From:To:Subject:Date:From;
	b=Noafs1C/iy3gialLBULrxUfloTw6xop73fWZzg6PRO46IFNTv8JvZX/ENPp7UsZMW
	 XQFGhEgBw9bvPe707BoieKrQnKQfJlSFMDKoBqtLvTyR0e0KYMh1WUUBW7PQ09k6gn
	 PSj5V2EYGMlqaNsZdGNx3LCxT282WAxHG1LAK7c+/66CdfbthAQW5DXVYds/CoWUmA
	 LSq4OmR5Kf/SpISQoxAygxIMofwXqJOxxUIHQbpx6WkaHQgO+xiF5aZ5i69DZkX84m
	 geTUzlS3K2SRNqkhy9ypEhm9sLf7wypc8czoauP+vI803Lzsa9oBvYnvMPi1gtBASL
	 4+jIC+/c2pKyQ8IqxhPaSnM7PyqqXLynzhMW10t35oF6Q9V5Gq5hB8RrAniqFRqggD
	 3FulM24XJ33MMLgg4UDixU/XmYI9Ey+xpyr68G4V/pH/qyZCgYQTMoSB6VyH/f25ie
	 lsBQ3dSnmnBHK7NWMPhymwdRyJHLn7hv2Xm93CvGb34LeyUs1R9qrsiiws7dAJOO8E
	 GSugABR1of1BwRHKMkzc6wxM/9x63XZ+as1o7QsyG2l6rjaK5mVJ3m/BY64IfzVd5p
	 FJqkP6BHLAo/KJiqPp6V1hVek8dkyvl3PNocf8VN0QC92CRSnC1pYw4xzlUj+AJcoJ
	 hUztVYbae9Hwck4vIP1OCywk=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] flatbuffers: Remove workarounds for gcc < 6
Date: Tue, 12 May 2020 23:52:18 +0300
Message-Id: <20200512205219.21168-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
index c31cef63c..1abfc8819 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
@@ -14,9 +14,8 @@ SRCREV = "6df40a2471737b27271bdd9b900ab5f3aec746c7"
 
 SRC_URI = "git://github.com/google/flatbuffers.git"
 
-# Make sure C++11 is used, required for example for GCC 4.9
-CXXFLAGS += "-std=c++11 -fPIC"
-BUILD_CXXFLAGS += "-std=c++11 -fPIC"
+CXXFLAGS += "-fPIC"
+BUILD_CXXFLAGS += "-fPIC"
 
 # BUILD_TYPE=Release is required, otherwise flatc is not installed
 EXTRA_OECMAKE += "\
-- 
2.17.1

