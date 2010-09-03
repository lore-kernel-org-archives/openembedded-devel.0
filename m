Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1OrX1Y-0004ZO-PR
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 16:13:51 +0200
Received: by bwz12 with SMTP id 12so1769485bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Sep 2010 07:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=IM4KGwZcRc4WjuuRTyex+ejCPnBqzLtbGNJWur78Zh0=;
	b=Oy6yVWQtCjS4L1ptV6Hj4QyuRjtircFQI0cMzBpIBjM6GKDq89yLlDLsCvRuR3mMZq
	ljYbxkQeZGdWHLzy8AS+Bqo3reuMTQM/chlmdpJUr5OyV55uPW0yzdk9vgMjMbt6S++R
	x03c32V9i31mKy3yHLbFdkahaWk/vut47yFAI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=sYk6rV+ePAkwMk3bUZtTpXskw3nHzVNLxl6HEQZok8XXZO20hCY1TioggZ87+/nrBl
	i76cEW6hfWn6Q3PsRiEFgPk1zsQ3cMrnAICUPcWDgT+Es2cUas/S6fFJUwnSSCaIwfTQ
	5WqK7HK9rNNaobxIRKAPYEuWnSaaziJUwZTJo=
Received: by 10.204.47.38 with SMTP id l38mr514585bkf.154.1283523193825;
	Fri, 03 Sep 2010 07:13:13 -0700 (PDT)
Received: from localhost.localdomain (85-127-150-21.dynamic.xdsl-line.inode.at
	[85.127.150.21])
	by mx.google.com with ESMTPS id 11sm1500207bkj.23.2010.09.03.07.13.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 03 Sep 2010 07:13:10 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Sep 2010 16:14:44 +0200
Message-Id: <1283523286-30999-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCHES] Unbreak igep0020
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
X-List-Received-Date: Fri, 03 Sep 2010 14:13:54 -0000

These patches should unbreak the igep0020 (igepv2) machine.

* x-load is required since e2b9225af36b2979b255634f79ceecea482601a7.
* u-boot-2009.08 has been unbuildable with recent gcc.

Since I am not the maintainer of the machine/x-load/u-boot, ACKs or 
comments are needed.



