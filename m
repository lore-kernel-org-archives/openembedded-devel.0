Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id ED2687C86D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2019 10:47:13 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gvgS9-0001N0-Kf; Mon, 18 Feb 2019 11:47:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1/N7Qcd8MG1hv1bQvtW9l+g3Vn/Y7N3RciNqunmExsE=;
	b=KVQh45cGx3alG07lhaNrpQbIyQ
	Syzzcf9MSi4PN640M23anG8xtWE0JP2WDK40ZSN20pKjGMG7dDhMJuKd3EaC9+FDuzFfDsILSNQm/
	w+9zRhwvvyED+wO5pPKYmSsJwBnaqumQAlkEq+HAoTHn6XFycpKqmjhP7s+iGgXaj96LTLKXKPaGt
	/nKCROzP91bwyhWNAzMtnVXicqrONyqqngByM5HyLp6NcAarLN5Pxt8+93RbOOeVJ1Lso5fkTc4L6
	3vmmuQkZYIhs9CbsjjfI4H8oC9Bl0DCOJ9W/cFTWp00nr1FgqrnvZNZjengCWx/lmHYwXWrULuqga
	chRhJxMw==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gvgS5-0004KZ-Ou; Mon, 18 Feb 2019 11:47:11 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Feb 2019 11:46:58 +0100
Message-Id: <20190218104704.14623-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190216170354.10645-1-zboszor@pr.hu>
References: <20190216170354.10645-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 5c27a7ee490ccbfea099474daaf9cbba
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190218104711Z
Subject: [meta-initramfs][PATCH 0/6 v2] Run dracut from rootfs
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
X-List-Received-Date: Mon, 18 Feb 2019 10:47:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset adds the necessary pieces to create the initramfs
with dracut during do_rootfs.

The 6th patch references a GitHub branch for which a pull request
was made against dracut. See https://github.com/dracutdevs/dracut/pull/535

Best regards,
Zoltán Böszörményi



