Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O3s6r-0005Us-2d
	for Openembedded-devel@lists.openembedded.org;
	Mon, 19 Apr 2010 16:38:02 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id CF4D1EB935
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 10:34:29 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Mon, 19 Apr 2010 10:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=f0Y4eai/jTEeLPv3w84uIZmH7zI=;
	b=R6iB3PZUss980kgBrgn/wusbyg1OrSdO+UnG5Reh+3ffERZ73nJJ9t6/Aj1CzWLy/dekx6xBRlubmn4kxyYk2LqVrrc3ruH9NwyAalLoUbG6hl9rqFT1RQF13pMAZeiKm+NjR8YtQMTI+K6gpv3cSEWmahSf75mp1cGCRuXAbnU=
X-Sasl-enc: kWg7CtZmw3xQr3w7HKXLBM9DC/lo9iH8LDNlvddHvPVS 1271687669
Received: from localhost.localdomain (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4D8794C5067
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 10:34:29 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Mon, 19 Apr 2010 16:34:24 +0200
Message-Id: <1271687665-23003-1-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <alpine.DEB.1.10.1004161912440.13411@vitus.devnet.local>
References: <alpine.DEB.1.10.1004161912440.13411@vitus.devnet.local>
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: canutils
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
X-List-Received-Date: Mon, 19 Apr 2010 14:38:02 -0000

Because the CAN stack changed, current linux-libc-headers are needed.
Angstrom does a hard select of the version, the following patch changes it to a weak assignment which can be overridden by a machine description (as done for tb5200l).


