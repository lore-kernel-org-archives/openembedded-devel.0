Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id E47317CC81
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 09:55:10 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gyZSB-0000Rr-86; Tue, 26 Feb 2019 10:55:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D8d52F5pjZRmTciyXM4PYnabbOW+XZzWP2PtAbRn1Rc=;
	b=FRuCuhZ3uGo6TSIH5j77MWn+wI
	TiXDHs49TUXToRaxuvmrNL1zuOeFvnfq73ecP7XcghXrVjYDxOGwMD8P9Fmw2ICkqTVOWqq9yeVJV
	sX8AKES8E2zNrXPed/ddQfeqBkgVTjrm0q1wubozxllBm6UtX1lsxY/mu46BJ9ZVTEf9pA0ULgrvj
	iKESd2JpF2FrHqkGF7Zsh/RbhpzFPpKwm0GYOae1+zbPhETZe2HpGN9iFrZ5I868cC+QzZumN+K+3
	qN4jPWusnpMWq2Fnk1A3oOcNuYKri75xBziMN7gLKQ5juTUAeOloR/s8yY+wT/1L8IXegyV9PBZHw
	CaYvGdAQ==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=localhost.localdomain.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gyZS7-0005Cn-2b; Tue, 26 Feb 2019 10:55:09 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 10:54:55 +0100
Message-Id: <20190226095502.5499-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220043740.27952-1-zboszor@pr.hu>
References: <20190220043740.27952-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 5c27a7ee490ccbfea099474daaf9cbba
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190226095509Z
Subject: [meta-initramfs][meta-oe][PATCH 0/7 v3] Run dracut from rootfs
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
X-List-Received-Date: Tue, 26 Feb 2019 09:55:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset adds the necessary pieces to create the initramfs
with dracut during do_rootfs.

The 7th patch references a GitHub branch for which a pull request
was made against dracut. See: https://github.com/dracutdevs/dracut/pull/535

Best regards,
Zoltán Böszörményi



