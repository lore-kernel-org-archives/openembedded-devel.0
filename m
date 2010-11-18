Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PJC2w-0007KS-F4
	for Openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 22:29:35 +0100
Received: by gyf3 with SMTP id 3so2312993gyf.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 13:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=GVyiMIvDPHJhh2UA8JhyrFF2WFQ+bp+DeKkOWE8c2Yo=;
	b=rxYpsWNz/JCdlNmRfPv/GT2TBkuOk7ICwSycDekRmEkWCWNtZDogrwEOxwWajiziU+
	neBi/oZgr/yX+SZJMxDpacQf6V2gR1/jGy1O1MzI5k8sC2GFpZ9JthjIloMgXnWE8UYV
	ApZ0IlBM52WTcyjIF2fhorj8rsOU/rn8+iORU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=WJlb4vtw7at3gIOu+zvYnHUes/COY6Umh7GXyFcQiqtrqZ8VANEo+G19t0eIYEb50F
	ogi4hFSjPFc5zm+Z7GvYOZlN41+uvO4Toy6AfTWCB4xmdVpJtC9z+hmab5tzaCcEMYls
	xSQVtiKbXsSz+MIooc3w28t2qWBjeEbGqa61E=
Received: by 10.91.42.30 with SMTP id u30mr28140agj.102.1290115695863; Thu, 18
	Nov 2010 13:28:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Thu, 18 Nov 2010 13:27:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Nov 2010 13:27:55 -0800
Message-ID: <AANLkTinVj9oh0p9xp9ZUtBijB63Fy7O8LcXc5-tUF9v6@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: release-2010.12 branch ready for testing
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
X-List-Received-Date: Thu, 18 Nov 2010 21:29:35 -0000
Content-Type: text/plain; charset=UTF-8

Hello all,

The work branch for upcoming 2010.12 release has been created. Please
lend your hand in testing this branch and cherry-picking
fixes that we need to make the release a robust one. Testing as many
combinations of machine/distro/image as possible would be
nice. Please use the Testing matrix to report the results.

If you are not cloning then ignore the first step

$ git clone git://git.openembedded.org/openembedded
$ cd openembedded
$ git checkout -b release-2010.12 origin/release-2010.12

Cherry pick the patches that need to go into this branch and when you
are ready to push them then do

$ git push -v origin release-2010.12:release-2010.12

this will only push the commits meant for release branch and other
branches wont be pushed

Please send the patches that need to be cherry picked to mailing list
for review with subject line prefixed with [release-2010.12]
or discuss on IRC.

Thank you for help

Lets make this release a success

-Khem


