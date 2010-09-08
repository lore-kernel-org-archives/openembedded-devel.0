Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtKKh-0007AU-2e
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 15:05:03 +0200
Received: by gwb1 with SMTP id 1so4623gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 06:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=BdGcNL0J3w/+V9AHld3GwUZ1liLDx0mkosNVPJ/J2OE=;
	b=Jq/BvVoOSjnwulPrXJRqbGUBpiPn4Hm1PCkGrNJWPWSRxwljNDSa/xqc1prriZFuwz
	fN+OvPvY2aATWeDzHHstv08qSWbgkrrVn1XuwEuUD4J1XH9Qh0sJQYfPYvKQsdB5AUhI
	8aAiFQH1ru1duV0JNipvHYpE7WbpcCZ/mB6ws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=uZJ2LGmPlZ+xmUcqDMxzB6regU2i53GMoHEQwgoytaIHU+u248ic1vVPW9pzawosWR
	Z9gDNfWGhikDW250TVoISyazIeISG3OFRXj8WZa21RUdfuHtv5bFIOdtfTO5MbTcfb/Z
	4DbwvZnCMeZYT1U5vFTc9fyLga6Pe5GLkN7Zw=
MIME-Version: 1.0
Received: by 10.90.104.10 with SMTP id b10mr724929agc.10.1283951046147; Wed,
	08 Sep 2010 06:04:06 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Wed, 8 Sep 2010 06:04:05 -0700 (PDT)
Date: Wed, 8 Sep 2010 15:04:05 +0200
Message-ID: <AANLkTimVjyq7CA2CqyaR_D-AJ-8Aawhoknzs1Xs1R2fc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OBSOLETE in base.bbclass
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
X-List-Received-Date: Wed, 08 Sep 2010 13:05:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Bumped upon this while peeking in base.bbclass:

    # OBSOLETE in bitbake 1.7.4
    srcdate = bb.data.getVar('SRCDATE_%s' % pn, d, 1)
    if srcdate != None:
        bb.data.setVar('SRCDATE', srcdate, d)

    use_nls = bb.data.getVar('USE_NLS_%s' % pn, d, 1)
    if use_nls != None:
        bb.data.setVar('USE_NLS', use_nls, d)

    setup_checksum_deps(d)

Not sure what part exactly is OBSOLETE, but I don't think we support
1.7.4 any more, so I feel it is better to clean this and remove the
obsolete section.

Any bitbake wiz care to comment on this?

Frans


