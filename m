Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oou3B-0004Sw-As
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 10:12:38 +0200
Received: by pzk2 with SMTP id 2so1019481pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=yiraE1jAYqrImLrQIKzl35KSiimS056P694A6kKzvCQ=;
	b=tEnaMp1KqaBXSf1WKxWVAnASegyYTegGr10q6EsTpsir1ZWx5DwEnM/l7GK7g7sx8L
	sW6Ur9FDlAm/YJ2P/gySKT8+/HILU3yPeHc9wCULwvFJpmuKiMf0yZDxYLW83W3BzzLt
	buTFPXXfIZa+wsx8Wye0ihBQjXDMPQ3isU/W8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=vZPYGzt4XivdafMdf1zanMmTMWh6Q4e54FJBgu6vXX6rKitkWFswKrIDWKpPFfGj7r
	B/JsL2Z6zEBItR2tkzdhkD7jYjeN7ugIjvfeIGwgN++3oI6YySKtekaUGFfaxwn37+Bu
	SdqYUjg6jy+8rZcWGZpE7oxbXZNaqtZFCPRzs=
Received: by 10.142.204.17 with SMTP id b17mr988947wfg.109.1282896724928;
	Fri, 27 Aug 2010 01:12:04 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y16sm4056848wff.14.2010.08.27.01.12.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 27 Aug 2010 01:12:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Aug 2010 01:11:52 -0700
Message-Id: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/2] Step forward in 'bitbake world'
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
X-List-Received-Date: Fri, 27 Aug 2010 08:12:38 -0000

These two patches enable the metadata to be parsed and a runqueue generated successfully
when doing bitbake world (~73000 tasks)

Its first step in the process. Next steps would be to fix the failing recipes now.
and prune more recipes into nonworking and obsolete dirs.

The changes in these patches should not cause any problems in general becuase they only
deal with already broken recipes.

if these patches look ok please ack

Thanks

-Khem



