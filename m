Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUXFH-0007zD-1s
	for Openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 05:48:56 +0200
Received: by iwn34 with SMTP id 34so2824588iwn.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 20:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=PRRsf2PIOUrDHwtYSCwZbI0jbglkBak7I5wV+1dm8Us=;
	b=tZHi/zybCT4BkXfmeaDD5v/MhC+cAoPN8jPhWnX8BwepWKwiM7YV//zdC9kinBZ+th
	gR9ulj80GM9na6BxssO44132CMmVqF8Gh+S7FBnbqAqh+NH621EsbzTtWWpt6LsuluJT
	yhVjSIsscLJaNOSZp7ImTRUfqRuAqHn355Hz0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=Ow8rpawJSSdH9Z4DUVy4WklKqpXuhVC+UXkFyCTgHjwa7HkwpY4+CMpXuFye8XENbR
	hmA/t5S+vhSYYdaGN7W6gcVZ4Q4HrqeTsK6mt2nAVCUqKHRS9JCRz5qFjpSOYE1nwFUt
	jG/XscZZ7Nrqh5dC4mBiqoq7zEtDF1ciodYM8=
Received: by 10.231.15.70 with SMTP id j6mr161564iba.12.1278042251123; Thu, 01 
	Jul 2010 20:44:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 1 Jul 2010 20:43:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Jul 2010 20:43:51 -0700
Message-ID: <AANLkTilY3E4WT0Mg7bEckA9jzzeDWlMSBe0G8OxAlMGb@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: using new syntax for patches in SRC_URI
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
X-List-Received-Date: Fri, 02 Jul 2010 03:48:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Folks

I have seen that some commits still used file://a.patch;patch=1
please resort to using more convenient form of file:/a.patch
and as long as its .patch or .diff it will know its a patch
and if you need to use different strip level then use
file://a.patch;striplevel=n
and not pnum=n

I have fixed the current set of recipes which had the old usage
Please take due consideration.

Thanks for your help

-Khem


