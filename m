Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web11.3480.1630537002538212159
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 15:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=liKsLNYE;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.19, mailfrom: patrick@stwcx.xyz)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id F210E320097F;
	Wed,  1 Sep 2021 18:56:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 01 Sep 2021 18:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=ZZFQ3vrBYy8DnNyHumewVrz3+t
	kYH3muGEDL4Njlt+U=; b=liKsLNYElhj/Hi7XCcSjKKrbD+sKEqy2GrgCFsYgyM
	W5apCTTU7c9HHUH8INpV/UYyNUPNiyFQFpLm7sa1JT9chii9LqTG7FJ4YW//Zwt3
	hv3Jtlin9h3ljTQ5+FSrKaz4sVnUw59y3pohO+KmnLZPp9+nVM1eDxuLpk4SFoA5
	wyYx9yuWx3EPkatCdATgcO0mng5hOWNO+GUHeWaUfFDA2UZiPMYrHnTViRR1u/RQ
	ZlkASHBfEzlebHUus1j+HZTaIpGIo6WtU4Hzd1VaiQ6n06tMyiHvW+xdY/Pvapho
	IKfvk/oQkLHZ0+44VzHdjtPR1vfVbgLreTu1scAVHWfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZZFQ3vrBYy8DnNyHu
	mewVrz3+tkYH3muGEDL4Njlt+U=; b=bn4NcIO6Rhb6z5Pq7O9HuY6PuYo4BmQ4J
	vKwGEJPxmjhhJxClfPvn4GHd3ku4E3JSP+2/bsO+nL7trZ5PVm8tlFVggjOqHOhT
	CnISVm6Mi7LjfZWnCvcO04taduEEtTuSCEDN/YcmCehECLlpvtpqAIMJ+EjoFB+E
	klbuJThMAFSMzqE6zh9W58VEMgI3U4x1qvGDFphaMPrVIaNy/f6nyZWTORh2514B
	1B1DVpCfkK8kkcQWD/tk4MgmwCvES9L1mj6nolfxvzxopKCRZQFPEXDZW6KVLOkr
	2Ic/QUiljni4tnrMFDa3iuk98LcQBNJ7EUrGsIH7jVacnz2ZDzMVQ==
X-ME-Sender: <xms:KQUwYQGD85gkcEGWcnkHZpE_3FGUo8v7l-Ohd2WCcxAN5KDxjzdVbA>
    <xme:KQUwYZXJQ9JlWtFVj2iqq3gM9DN6yvgPgamH_FTxOum4n8cDCvGB3j9d4nujSwEwL
    g2I_w2sZpu7VqszAok>
X-ME-Received: <xmr:KQUwYaIKtXB7bPVdxH0pevIwSNtgdP24p0nI7jIAYGsZD1-IpPA5Cgadz1tidMXJb1FWvtbZtOSaLJFzfRARJdy9SSd9BU3sfgWf4a3wyYmQCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvgedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
    fufffkofgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgr
    mhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptd
    eludegheejteelheduudegkeehleetfeekiedtfefgleeifeelhefgveejhfffnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkh
    esshhtfigtgidrgiihii
X-ME-Proxy: <xmx:KQUwYSF_3jJIhx2d-bDmrgd0Ch0QkKeo5ctlQ1XNPe6aZfWh5a4x2w>
    <xmx:KQUwYWWLo5tAQvSQvtKTMVKwciBIlLu6_m-nvfjZ8lcFr-n_DAhmlg>
    <xmx:KQUwYVO04ctKGeWBZpDMPAqGq3OiHIjMtWSyRTnlHXmE8ksFTPUYSQ>
    <xmx:KQUwYfcZqEhojYZuelrsBNpXydKdFo1IKHZlDG_ekdTBmdJQ5ATqzA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 18:56:41 -0400 (EDT)
From: "Patrick Williams" <patrick@stwcx.xyz>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [meta-networking][PATCH] ndisc6: fix typo in DESCRIPTION variable name
Date: Wed,  1 Sep 2021 17:56:38 -0500
Message-Id: <20210901225638.3335089-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta-networking/recipes-support/ndisc6/ndisc6_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
index e9af2c43f..d1e006c08 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
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

