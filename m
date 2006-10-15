Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GZEaW-0007yo-BD
	for openembedded-devel@openembedded.org; Mon, 16 Oct 2006 00:36:08 +0200
Received: from lieve.dominion.void (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9FMTMJG009613 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2006 00:29:24 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
To: openembedded-devel@openembedded.org
In-Reply-To: <161534574.20061016010222@gmail.com>
References: <1156715171.5536.60.camel@localhost.localdomain>
	<200610151544.28474.openembedded@hrw.one.pl>
	<161534574.20061016010222@gmail.com>
Date: Mon, 16 Oct 2006 00:29:20 +0200
Message-Id: <1160951360.8144.2.camel@lieve>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: What is task-base?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Oct 2006 22:36:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Op ma, 16-10-2006 te 01:02 +0300, schreef Paul Sokolovsky:

>    If it can be made so clean, why do we have so tangled configs for
> many machines, at least for PocketPC-based?

Historical reason, and we'd welcome a cleanup

>  Do we need more strict
> policy of what goes into machine configs and about the order of
> variables? 

Yes :)

> For example, I doubt it's good idea to have IMAGE_FSTYPES
> in machine configs - how that can be machine's property? 

Some bootloaders can be quite demanding, like the one for the spitz
machine only likes tar.gz, not tar.bz2. It should be overridable,
though.

regards,

Koen



