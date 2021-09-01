Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web10.2692.1630532879776812306
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 14:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=lmHzPxEQ;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.19, mailfrom: patrick@stwcx.xyz)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 69B383200979;
	Wed,  1 Sep 2021 17:47:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 01 Sep 2021 17:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=5Lz9QhncOrAOEnPgOs4QYx5Wvn
	uxdF2YcBYmSTPrG1M=; b=lmHzPxEQMUspCzxEyJGUDRQBO35UoGgLHZKhmvg4JC
	LTfmSZf6RgQPFXXkyreK0tkO+n0YkOfmvrDkahqrfiT1kIeXicTB0zQSsVAjlpcf
	egMdEqtRDSMYE11jyVTqG/vHj5rkCjuYfprJapQwNxBb3zZYOflZZr9JSDVMJ8jw
	/1BVonhFw5xK/9KDXn6CIi0PPO4Uknnew+Boeezb7gIW7bzrJ6R0m/FIZ4CeOzrm
	SMoSQjXoUSlujJzkyzgHI8YSSysGzDc12OGXvP93gwemQPLBNE0ymo/Az3NgbooF
	YuryXWJu6qGG6nQ/WpT7IcmdMbCgYtHYMSBq6oJF0NJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5Lz9QhncOrAOEnPgO
	s4QYx5WvnuxdF2YcBYmSTPrG1M=; b=wX4G1DNzQr/S0nac/7r7FVNBlTpsSA5f8
	Cx/xP1NYvjco5tUkHw8YAbKdw0XEgzYOsl2i90lhBE+UQ6ZHNDZnldvDfkUeD11U
	Ue9YLKBc6+Q+DUBq9LBmjpur9Xo1OL1kJMK9VGs/VB9Mc27kigc5rox52CDuE50b
	1cUcKCUZxszuOVz63LvQfwys6LwnYHYBVbBvQgI9Ck85ZkwJ6SiJeyUL7geSzORh
	gy+fwwt9KXmizMmkOwVfOvgYMPPmJAaJYSoMjIKrEqFxIHGP2SDp4eSZXKsn7C+w
	zM3f5BkMc4igVjeZyE+Z6IA4WUPjAeijNabSWZ2RfHiMvXjHmSJ9A==
X-ME-Sender: <xms:DPUvYc8ChNZajeoPlT1JreG2dGTLOnWA2VYmGdZpvKxntaF-0NMGew>
    <xme:DPUvYUtIhVGZJvue4UCBAblWIcZ0-vUAm36MCF-IZxK4kmyFRXdfVto50deuAYLma
    4pp8IaLHLxYLLOdeuc>
X-ME-Received: <xmr:DPUvYSCCNxtqSippYyQimqUjwzNfgmNVjyNmEqMh9uhQjxNFrQGHUyTgRoBe5NnJDMbWDer9mYZ3kQDyoTxNMCSGe7o6LTzD2LNPmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvgedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
    fufffkofgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgr
    mhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptd
    eludegheejteelheduudegkeehleetfeekiedtfefgleeifeelhefgveejhfffnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkh
    esshhtfigtgidrgiihii
X-ME-Proxy: <xmx:DPUvYceT7m_9DBpxxkCNv5KPWCPWN_Y-SxQndcWCsoJEYuibAdTRMQ>
    <xmx:DPUvYRN6EQubOyddj_RmAyX49_8nhEGwt5PKNBTLbVfG9MT8gwifeA>
    <xmx:DPUvYWmoiO7RAlNVYzB0NJUk9pH2gtZhP41WE40KBqNL8YNmkobbOg>
    <xmx:DfUvYTXD5tJKtWu5vWdvewPgpu4tr18mxP2EU32Trodx3FfQCaAUpg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 17:47:56 -0400 (EDT)
From: "Patrick Williams" <patrick@stwcx.xyz>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [meta-networking][PATCH] ndisc6: fix typo in DESCRIPTION variable name
Date: Wed,  1 Sep 2021 16:47:53 -0500
Message-Id: <20210901214753.3331060-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 recipes-support/ndisc6/ndisc6_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-support/ndisc6/ndisc6_git.bb b/recipes-support/ndisc6/ndisc6_git.bb
index e9af2c43f..d1e006c08 100644
--- a/recipes-support/ndisc6/ndisc6_git.bb
+++ b/recipes-support/ndisc6/ndisc6_git.bb
@@ -60,11 +60,11 @@ IPv4 world."
 DESCRIPTION:${PN}-rdisc6    = "ICMPv6 Router Discovery tool. \
 Queries IPv6 routers on the network for advertised prefixes. Can be used \
 to detect rogue IPv6 routers, monitor legitimate IPv6 routers."
-DESCRITPION_${PN}-tcpspray6    = "Performs bandwidth measurements of TCP \
+DESCRIPTION:${PN}-tcpspray6    = "Performs bandwidth measurements of TCP \
 sessions between the local system and a remote echo server in either IPv6 \
 or IPv4."
 
-DESCRITPION_${PN}-rdnssd       = "Daemon to autoconfigure the list of DNS \
+DESCRIPTION:${PN}-rdnssd       = "Daemon to autoconfigure the list of DNS \
 servers through slateless IPv6 autoconfiguration."
 
 # The tcptraceroute6 and tracert6 commands depend on rltraceroute6 to
-- 
2.31.1

