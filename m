Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LjMJX-00085T-4n
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 00:33:49 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGM009FZHEMJVSC@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	16 Mar 2009 18:32:46 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7EEFF6B83A8; Mon,
	16 Mar 2009 19:32:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2009 19:32:41 -0400
Message-id: <1237246365-32076-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_50, FM_FAKE_HELO_VERIZON,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/3] rename packages/ to recipes/ per earlier agreement
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
X-List-Received-Date: Mon, 16 Mar 2009 23:33:49 -0000

Renaming packages/ directory to recipes/, as one of the several structural
changes, was proposed by Koen[1] and agreed/approved by many. Since Koen
currently doesn't have time/ability to do the change, and some people are
too eager to wait any longer, he asked me to do it. Please ack/nack.

[1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/21326

Denys Dmytriyenko (3):
  rename packages/ to recipes/ per earlier agreement
  recipes: fix hardcoded instances of packages/
  base.bbclass: fix base_get_scmbasepath() to look for recipes/ and
    fall back to packages/ while parsing BBFILES

-- 
Denys


