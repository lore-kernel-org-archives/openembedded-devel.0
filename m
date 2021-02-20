Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web09.8536.1613837630449280872
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Feb 2021 08:13:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm1 header.b=rQUrrdf+;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.21, mailfrom: patrick@stwcx.xyz)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id A1359DD5;
	Sat, 20 Feb 2021 11:13:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sat, 20 Feb 2021 11:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=gfKv4sh2STVjTMnuPgmVyE0Mnj
	qb+lak3OCh+Fk/Qn8=; b=rQUrrdf+rsZ/mMUGrwGsi27q7eL/KFAHthLdBL5TzI
	iyJaaPn70MrC3XW2JTPoFxMuSXkIwdlH677k1+74GlaG8yr1MN3/gIfcWseny7+w
	7/vvkDXZAkPwNhCBupPQL4igQ7V9I70Omho3fAyxTVjqmjKO2R40aopRLIO14GCw
	+b0aCyxlF87YcJFz5KKywPQlPcvaqVpybl7cPLb1L9YpVLVxjdgQ7hnzih6Ju25k
	KuAHDW2BIql2Kx04z15ESYFZNNZkvAVkkJyy3SDV2pvgT6nUSvwoidOikCqnw2G/
	fabIPw6whVs2kl7obWWOb66JccIJ8QYtar7sK5umqIBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gfKv4sh2STVjTMnuP
	gmVyE0Mnjqb+lak3OCh+Fk/Qn8=; b=tMBCMFFUcix8NSQdElterWs7QhurCcUz4
	YE29FXz/In0Wlquub+d1gZbZrsj9oaMQQ6lj7evclvDtPkNjGu2/LWTEYg2yx4Sm
	nYrmNv+Kk2kVaasfDHDzewSPcdYGusnFesHwFRooWCWogTTL2/WOPucFNqcyWsgB
	BshYh2cfbImVnRhU7GLqlvfHgDo5+RVlgYMFZGqrxXmU5+dy7l+/kjAZc6EvNIC7
	hul+m+rB3XqWfxF28Y7gKG0Syne3hf7gE8Qve/FtWfvs3RCXKFLURBkRhDJeTW7S
	uHN7kjQWwi6g00bDtm60Th2gagTc98FhuO9D7C+pp9jXgwxeaqJgw==
X-ME-Sender: <xms:PTUxYC5yWT1XnW21IKGgMVHhuz_X4oTbzluLMhsC-6yCkwDJqRks1w>
    <xme:PTUxYL4NCeoy5TK6ac_GRzumT1tOUzAH-8vAMoH2k90j_Lq6TjlbKHIj9JTfyp6Q2
    E_mi1X_uclUj3olJRI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeekgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdefhedmnegovehorghsthgrlhdqhfeguddvqddtvdculdduhedtmden
    ucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkh
    cuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgr
    thhtvghrnheptdeggeefteejjeeltdefvedttdfhieffvedvteefvdeljedvheeufeeggf
    etleffnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepjeeirddvhedtrdek
    gedrvdefieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:PTUxYBfmuy5cbs_hYXRAla7hVEYQFGnY-QQlk2WptTXCM64kJdGX3Q>
    <xmx:PTUxYPIN0Qp4TJOFCCGU-e9f9u3T82Mva28GRnMSlTJXmrZ0evRhNg>
    <xmx:PTUxYGIg5mBcVtR5D95tOQTbEyBEKcKVjCxyaCQxhPCexJO8vsrfDg>
    <xmx:PTUxYAwPwWzdVZVR_rLQmQe7QkNHHRvloINGI0jSnw2YHrm6TSTzVQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net [76.250.84.236])
	by mail.messagingengine.com (Postfix) with ESMTPA id E843D240057;
	Sat, 20 Feb 2021 11:13:48 -0500 (EST)
From: "Patrick Williams" <patrick@stwcx.xyz>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Ed Tanous <edtanous@google.com>
Subject: [meta-oe][PATCH] boost-url: update to latest
Date: Sat, 20 Feb 2021 10:13:45 -0600
Message-Id: <20210220161345.3872449-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Cc: Ed Tanous <edtanous@google.com>
---
 meta-oe/recipes-devtools/boost-url/boost-url_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb b/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
index 6d4635b666..107a4a8331 100644
--- a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
+++ b/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
@@ -4,9 +4,9 @@ SECTION = "libs"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/CPPAlliance/url.git"
+SRC_URI = "git://github.com/CPPAlliance/url.git;branch=develop"
 
-SRCREV = "a56ae0df6d3078319755fbaa67822b4fa7fd352b"
+SRCREV = "2c867fbe284ae532f1329b87a86ad3f8cd382867"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

