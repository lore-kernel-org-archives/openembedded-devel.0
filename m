Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Onglu-00067f-2p
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 01:49:50 +0200
Received: by wwi14 with SMTP id 14so825384wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 16:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=n9QIJNVEdHw+WXIMAZnpW+wZDbzIvqvKyur8gQwgtEk=;
	b=A4w5dBSq7hZucktAHfu4+PkTcE3MOJ2daIdjlyFfl5o99+e3Jxs+bTIA7Cu5wZIgvt
	W/o3KxB2KKWxInT4M45pJkNTUkVE56JnnkANXNKi5h0ySfSmHsnIcQGm3hPa1s/aei/l
	TXbozG2Z0ZHlDXdLaTpI253gNg4fC3Gb4hKac=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Ylz7WbT9X8Ds3rdnN3EXsBrhkJoFGAGsk34yrfN3OloopRMVmZccu4FiR2CFcI9Q+3
	zQFBXgvK+Ew0jcxFVdexEtN3pnaOScCFwqQaIcR3TbTNtDx3f+E3MoT4cz79JurQsfN3
	YtUNK1Yulo+7bQtJUYsyBBLdPtzeX/hz5ctIw=
MIME-Version: 1.0
Received: by 10.216.186.207 with SMTP id w57mr81241wem.19.1282607356442; Mon,
	23 Aug 2010 16:49:16 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Mon, 23 Aug 2010 16:49:16 -0700 (PDT)
Date: Mon, 23 Aug 2010 19:49:16 -0400
Message-ID: <AANLkTim6-d4krhcMuAZojQVNdy3W-m_ON-mOvK5y3tqn@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: testing branch 2010-08-23
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
X-List-Received-Date: Mon, 23 Aug 2010 23:49:52 -0000
X-List-Received-Date: Mon, 23 Aug 2010 23:49:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

As detailed in the following page, we are trying to get a testing
branch going where we try to verify OE builds for a number of
combinations of distro/machine/target/

http://wiki.openembedded.net/index.php/Testing

I have branched dev.oe.org to the testing-testing branch, and have
verified it builds the following.

beagleboard 	angstrom-2008.1 	beagleboard-linuxtag2010-demo-image
	Ubuntu 10.04 64-bit 	User:Cbrake
beagleboard 	angstrom-2008.1 	console-image 	Ubuntu 10.04 64-bit 	User:Cbrake 	

Next Monday, we will merge testing-testing to the testing branch, and
tag it with the testing_2010-08-23 tag, and note the combinations that
build in the above wiki page.

We are looking for people who are willing to test clean builds of
other combinations on a regular basis, or other ideas on how to make
this "testing" concept work.  My initial thought is to work on a
weekly cycle, but of course not every combination will be tested every
week.

If this gains enough traction, perhaps we will want to make the
testing branch the default OE meta-data branch so that new users by
default get something that will probably build.  I think its also very
useful to give users a known starting point.  With the myriad of
combinations available, its useful to know what is a good baseline.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


