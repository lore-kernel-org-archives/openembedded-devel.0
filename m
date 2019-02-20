Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id AD3B27C9C7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 04:52:03 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gwJrX-0007um-VV; Wed, 20 Feb 2019 05:52:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=txs4hY6XVAgn45sOiZd2rgINzP3O8cxlx5hBeOWsCC8=;
	b=WIisKZ0ZI5NKixem5HGF3+9/rR
	FzFJ2jpi/G9KLKRrRwUyEY/1gq9GZJGUKm5R+vqQDjtg7S/2Q1TEKKpwL/GkhsRY+hagN5bZbUV1V
	IH8osIXgRf5JYCU0snzACgPRuRWvH0ckF/k54Bsg8XjSgkDXeN1KV1B8b4JUicAjn5BdqOCRpiKSp
	a5J/BT6ETsa+/XzwzlLuOz4K2OjLUgZMlyEM/wvYrvK7DzRVNyPxVf/d/VzyzNUbrZcpA2uxDCmMt
	rqW4JA2UQ+/3CzUeYnCDYyBiJR3ag1xsyZSY4t6/UUuDOG1Vdm1fCfbs5Wn4ERPaAj7i6zlaUovaQ
	18UvBWlQ==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gwJrU-0001Ai-4X; Wed, 20 Feb 2019 05:52:01 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2019 05:51:52 +0100
Message-Id: <20190220045156.28372-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220043740.27952-1-zboszor@pr.hu>
References: <20190220043740.27952-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 8ce66f0b6cecf52b0a08a841cc58d236
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190220045201Z
Subject: Addendum to dracut in rootfs v2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2019 04:52:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

According to build testing for different architectures.

v2: dracut.bbclass needs to conditionally depend on systemd DISTRO_FEATURE



