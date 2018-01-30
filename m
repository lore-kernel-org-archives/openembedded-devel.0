Return-Path: <cshored@thecshore.com>
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id E101578889
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 11:37:21 +0000 (UTC)
Received: from workhobbyl.thecshore.com (135-23-247-100.cpe.pppoe.ca
	[135.23.247.100])
	by mail.thecshore.com (Postfix) with ESMTPSA id 243CF2657
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 06:37:22 -0500 (EST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com 243CF2657
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com 243CF2657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1517312242;
	bh=axTcwjqEbfcTnrCrIrQDzNMuFCrMdHAcesCnFa986n8=;
	h=From:To:Subject:Date:From;
	b=U8gRaTULT72GhogJeRnX7QgOddegW6vWFzJPkJeANCeZkNA+PJziahQNqnik67xi3
	/55uyXPbtB6iyYVzEyfLC0Ok/OEU0AzXjGZ0hnDu2AXQzP1PysMNTpeOavh95c71SX
	s/qvpq3L5L5McteDHT6VUiTpOxejhYxK8s67wrx0=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.2 at mail.thecshore.com
From: cshored@thecshore.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jan 2018 06:37:06 -0500
Message-Id: <20180130113708.14018-1-cshored@thecshore.com>
X-Mailer: git-send-email 2.11.0
Subject: [networking] [PATCH 0/2] Move openwrt-upstream packages to meta-openwrt
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
X-List-Received-Date: Tue, 30 Jan 2018 11:37:22 -0000


 ...01-rtnl_flush-Error-on-failed-write.patch | 34 ---------------
 .../relayd/relayd_git.bb                     | 17 --------
 .../libubox/0001-version-libraries.patch     | 28 ------------
 .../libubox/libubox/fix-libdir.patch         | 40 ------------------
 .../recipes-devtools/libubox/libubox_git.bb  | 30 -------------
 5 files changed, 149 deletions(-)

libubox is probably uncontroversial and in fact was suggested by
Khem Raj here: http://lists.openembedded.org/pipermail/openembedded-devel/2018-January/116565.html

relayd I'm not as sure about as it's in meta-networking and there is
the off chance it's actually in use.  I'm open to opinions.

In any event I'm updating meta-openwrt with the good things done in
meta-openembedded, as well as other work to meake meta-openwrt
more generally useful (for use as a hybrid with regular OE, 
as a more openwrt-built-with-OE distro, and as a pick the bits
that make sense to you repo).

Regards,

Daniel

