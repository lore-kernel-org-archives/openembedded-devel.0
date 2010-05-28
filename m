Received: from mail-yw0-f187.google.com ([209.85.211.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OHtF6-00067G-DY
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 May 2010 08:40:29 +0200
Received: by ywh17 with SMTP id 17so294337ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 23:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=l9Cm6tTy4+XNuP550Dgc8fcZCRqk1uW6hgvS6d3lJmk=;
	b=JFB7MARksTo3dr9Ivm2+FYbn1TQ0vlyUjXGINzXGvKPTl23B6Er0KnzCacDejNZ8GP
	EBJy18qAbV+V/nUnPXaPVVe2SnykCA0iMRKqDm1lq/m7S4+N91utY6+sUCBdLjZ7exor
	CfS5r82hCBTVIz3vPKniEIhTUWchIqOUjfFRs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=TPMdje4Ujtw2ChD+xhoi737M6XyKnwzRSr9ji1qMRQbUo5WgpbLjxm6ZO/5URV5AD+
	5UawkMyg729KT99eAGZnJ8O0+dZ9rh2IhOoWLkk7RTuWNnyRKlzgQnkOTImuFU1kQrgp
	EPBtp3OlkiTg8ZT+okpykjc8QAvYrtHXlui34=
MIME-Version: 1.0
Received: by 10.91.18.28 with SMTP id v28mr518461agi.94.1275028578198; Thu, 27 
	May 2010 23:36:18 -0700 (PDT)
Received: by 10.90.71.4 with HTTP; Thu, 27 May 2010 23:36:18 -0700 (PDT)
Date: Fri, 28 May 2010 08:36:18 +0200
Message-ID: <AANLkTinA_A7Ja4Go6H7MlOxFM4uLsfiQCyJnRodHHCpo@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.187
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: additional bitbake test
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
X-List-Received-Date: Fri, 28 May 2010 06:40:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'd like to propose to add a test in bitbake to see if an overlay dir
exists when specifying overlays.

In the past I bumped into a problem where BBFILE_PATTERN_local =
"^${OE_TOPDIR}/myoverlay/recipes" was not processed properly because
OE_TOPDIR was not passed using BB_ENV_EXTRAWHITE, resulting in the
regexp match with the dir always returning false due to OE_TOPDIR not
being expanded.
A simple test could warn users against errors like this one.

Frans


