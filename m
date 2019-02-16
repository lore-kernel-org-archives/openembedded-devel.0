Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2647C7F0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2019 17:31:38 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gv3Nk-0005d4-CF; Sat, 16 Feb 2019 18:04:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1/N7Qcd8MG1hv1bQvtW9l+g3Vn/Y7N3RciNqunmExsE=;
	b=daO2yIF1bjLnX/ngIOGF5L+dNB
	B/ncyU12Eeu6gJEzrhBilJx2WStkhibI3JsXOPvlih7dOUuwvXvb5tnh6kgOEBs/tafb/LZ3jnY1N
	Xlrk8QtHhu/jhwOhHpzMSqflS2gry0yqJR9J/F2UA7ZxVjtEXa+Q0XiNp4snvjyDYWgSFdjoax2rW
	46fUKDUV99YS4dJM1OcH74ix4xlX6jJsVr/bIopzcCJkySJxMdnXDkRzCN+A3PErt4UzJIf1viW86
	o7Rijo3czogHDSJNQ7vtkDE9Pv79afC+mAayeePrJM9Gp212vYbO3qlN+HSB2X1O1bEflIxUChh4h
	2yEfeb5Q==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gv3Ng-0006ng-F7; Sat, 16 Feb 2019 18:04:02 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Feb 2019 18:03:48 +0100
Message-Id: <20190216170354.10645-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -1.7 (-)
X-Scan-Signature: 5c27a7ee490ccbfea099474daaf9cbba
X-Spam-Tracer: backend.mail.pr.hu -1.7 20190216170402Z
Subject: [meta-initramfs][PATCH 0/6] Run dracut from do_rootfs
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
X-List-Received-Date: Sat, 16 Feb 2019 17:31:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset adds the necessary pieces to create the initramfs
with dracut during do_rootfs.

The 6th patch references a GitHub branch for which a pull request
was made against dracut. See https://github.com/dracutdevs/dracut/pull/535

Best regards,
Zoltán Böszörményi



