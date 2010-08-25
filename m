Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oo8zL-0000TK-WD
	for Openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 07:57:34 +0200
Received: by iwn2 with SMTP id 2so282757iwn.6
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 22:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=aZr/oMqIMVaMWY7m2+QAA6AxWAUO+abytaRTTu8WHvI=;
	b=WpCHU4IcPojYD4gtncSw0RuZbv+aO7zg4yLYeDFRBeKfy1Sno0F1/fja/KsBBPS3iE
	pJtGIKPQm2SjRm6qLG7iSQ0zBdr2Xu2xNr7jdZ3Y1aupxi+9p+JUz4X1jyw6H1aEJmql
	5UkwS58ZGEyGNyon3tTlwPb4qdB1gc3BZXM40=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=RRx1I/Q3Cz/aWQqg5b6wV/rjOExd4rASUO0jaKI30iDIB8ZHdjm485li2lo/yS6y2c
	rA7F05coax0ImVykJEcJ9AowqRdJWUP9x2B+ylZy7LY69FaTxDq4MOn2OPIVqLuPUaT5
	MMWSMBSw2b2IRi0bPKIXKufR4C/w1OB/WkLjI=
Received: by 10.231.13.130 with SMTP id c2mr9158921iba.24.1282715817330; Tue,
	24 Aug 2010 22:56:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Tue, 24 Aug 2010 22:56:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Aug 2010 22:56:37 -0700
Message-ID: <AANLkTi=aRz_1tiE51NVYH3v67R0uD8WNtn4vzH+WnYNY@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: commit fc3233b3a21ac14127bdd4931687ef39482cb0ec would need partial revert
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
X-List-Received-Date: Wed, 25 Aug 2010 05:57:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Frans and all

commit fc3233b3a21ac14127bdd4931687ef39482cb0ec
Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Date:   Tue Aug 10 19:49:56 2010 +0200

    autoconf: remove a few old unused versions

    Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>



This commit removed autoconf213-native_2.13.bb which is a named
differently for a reason
because there were some packages which needed it one of the packages is fennec.
I am trying to see if we can get fennec upgraded to latest and remove
the dependency
on 2.13 if I succeed then no changes will be needed but if it happens
that 2.13 is
required then we might have to let autoconf213 live.

Thanks

-Khem


