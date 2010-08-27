Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OoxqH-0005TO-D4
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 14:15:33 +0200
Received: by gya6 with SMTP id 6so1159675gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 05:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=0z0ji2iYFpBAb5NKKcg9jm92CkDGOMTsfcDwvunGQPc=;
	b=Mr4QhzMivEZJ3TBVBH6xp/3jNIN6cpVLzpl3GMzZUhAIBgrNummb6tzZQS7L1EFTP6
	EsdnTi7So65LqEoHwz8YnHHp3M9ZbsD/Fk7Cs7lxTphdSvRsfD9WGCDSogEL2j1ZJiPL
	4naavmXHDDFpFKp+fW6B5G2vJ1WPwoHe6L3eU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=mr4s1pcf4BMqYhh2+uzxdlnyobql5p7uzJ3a7mT3I2Xo97rvo81Xm1GBJhbwPmPaDf
	YkpUrNdE2CZzmq63FjrCtGPY56FRHF34ThmxtrHBX2cuMMXD3Bz63Y0u2uzQTkXl1TGK
	uJ0HA03Z86eLVM+ockpTY9llKpOxiDfBwxF6U=
MIME-Version: 1.0
Received: by 10.101.75.17 with SMTP id c17mr741756anl.128.1282911302140; Fri,
	27 Aug 2010 05:15:02 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Fri, 27 Aug 2010 05:15:01 -0700 (PDT)
Date: Fri, 27 Aug 2010 14:15:01 +0200
Message-ID: <AANLkTin5LRCz6PU_x6Mw+V2Xf8W=i+n4RLqQjwON1R7+@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] review process
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
X-List-Received-Date: Fri, 27 Aug 2010 12:15:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

It is a good rule that important changes (toolchain, infrastructure)
are reviewed before being committed.
This is e.g. also specified in
http://wiki.openembedded.net/index.php/Commit_Policy

However, recently I've seen some issues that our review process does
not seem to work or is abused.

I see two things happening.
- patches are submitted for review but do not gain any feedback in a
reasonable time. I have several patches in the queue that did not get
any feedback.
- people are abusing their powers by rejecting changes without
motivation. See e.g [1] and [2]. I feel if you reject a patch you have
an obligation to explain why you rejected it.

Seems our review process is flawed.
I propose to introduce the following rules.

1. If a patch does not get any review feedback in X weeks time; it is
ok to apply it. People who need more time to review a patch can
mention that in a short reply. In that case they are granted Y more
weeks to review.
(suggestion: X = Y = 2)
2. If someone NAKs a patch it is obligatory to provide an explanation
why the patch is not good.
Rationale is that
a) people can fix the problem seen by the reviewer
b) people learn from it
c) if there is a disagreement it can be discussed (and if needed
raised to the TSC)
3) NAKs that are not motivated/explained can be ignored as not given.

Your feedback, suggestions, additions, amendments, whatever is appreciated.

Frans

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/023374.html
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/023270.html


