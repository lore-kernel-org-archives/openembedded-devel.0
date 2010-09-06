Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OslV9-0000KF-9o
	for Openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 01:53:28 +0200
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id C6038215
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  6 Sep 2010 19:52:48 -0400 (EDT)
Received: from frontend2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Mon, 06 Sep 2010 19:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:subject:date:message-id; s=smtpout;
	bh=GWzjxY7d9cfO6d/xs9fDf2IC3dE=;
	b=Pbf2CpoF8b+SXdGqQ8bfaZ93b+UwlvHtY1mEc/xpNuNBM3gPG5ZX9ibZ9PmZmjG1KfkgBlkvxb8a+wIeOIMfZ7Yb9CVhQqPCDY0zR+iBaXCdxZxFjK5UDB7UvFwh6kUBSy1bOm47CvC5C71xQ/tslCyHqhFS+JBnK1zBbMj3ByI=
X-Sasl-enc: JtD8SsW0GpskhijtpG6y1UCdOrMThjtgwS9ck2ikGCAu 1283817164
Received: from asterix.crazy-teaparty.dyndns.org
	(hnvr-4d07a3d2.pool.mediaWays.net [77.7.163.210])
	by mail.messagingengine.com (Postfix) with ESMTPA id A63F25E735C
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  6 Sep 2010 19:52:39 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Tue,  7 Sep 2010 01:54:00 +0200
Message-Id: <1283817243-7436-1-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: htmldoc: remove -native recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Sep 2010 23:53:28 -0000

The following patches switch htmldoc to BBCLASSEXTEND = "native".

1.8.27 is the same revision as ever.  For 1.9.x I wanted to update to the latest
snapshot revision at the same time but failed because gcc 4.4.3 reported far
too many errors in the -native compile.  So the recipe of 1.9.x is ready for
updates (just select SVN revision) but it's still the same old rev 1571.



