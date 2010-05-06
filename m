Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OA1IV-0004a3-0P
	for openembedded-devel@openembedded.org; Thu, 06 May 2010 15:39:40 +0200
Received: by gya1 with SMTP id 1so2521897gya.6
	for <openembedded-devel@openembedded.org>;
	Thu, 06 May 2010 06:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=HX99I82cAECsPSlx8PthP7xkxsSFlh13W1rty7wtz/A=;
	b=F2c2gzLLvqCZjYg5JwK20/8o9rkTfp1KL6oBq15zYnxaFmdkSajmIjkStMtaH3ALbX
	s+r0QffwDPRXmgN/nNEWSiETv3KgrremohyHsr6tBcwqLAj83sdizf2G9T1zqwoaIAGS
	q8POFu96flUsPQdYOIqYU/tIYOZtQVyNy4+oo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=r/PjelsP8NikoZEn6Bs+43nWqL/iOKcguspceghbvCmARFtcacCPzfvra3oDE1QU8m
	bTDZfH37t2kaBFQG82CgO+EGwKDmZIn5KSZeMcOXDr1sIiHqG1IENeupzmkTveBCEcDB
	wpdqywdd/BYUxCQaQi7LhrnHgSXZ3A4FNWtyQ=
MIME-Version: 1.0
Received: by 10.91.119.8 with SMTP id w8mr201725agm.117.1273152929984; Thu, 06 
	May 2010 06:35:29 -0700 (PDT)
Received: by 10.90.71.4 with HTTP; Thu, 6 May 2010 06:35:29 -0700 (PDT)
Date: Thu, 6 May 2010 15:35:29 +0200
Message-ID: <m2pac9c93b11005060635j1abeb64er76c391d607e43993@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	raj.khem@gmail.com
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: commit 4134f55dc7d99516d750b24a60e5cec400ae5ef3: eglibc: Move away from legacy staging
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
X-List-Received-Date: Thu, 06 May 2010 13:39:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

I feel the above commit is not sound.
If I pull the head eglibc does not build for me because apparently
eglibc-initial does not stage limits.h any more.
If I revert to the commit before this one, eglibc and eglibc-initial
build, so this seems to break things.

It might be that this went unnoticed, because there is no PR bump in
this commit (which I would have expected, but technically if the new
and old staging result is identical is not necessary).

FM


