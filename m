Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUE3V-0001hr-8W
	for openembedded-devel@openembedded.org; Thu, 01 Jul 2010 09:19:30 +0200
Received: by iwn34 with SMTP id 34so1762677iwn.6
	for <openembedded-devel@openembedded.org>;
	Thu, 01 Jul 2010 00:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=Gdi+S1jVzGnjTyLzauskqymTM5if2ARFqajHEjSvffc=;
	b=AgkE/Id5dnh4X4N2nbsAJzcEt3krhOM5fFN0+pKn3Nj5q0rnhBHNijmomSI9d77xke
	0A2zu/Mshs/fXjQ44gSirurHgGq8zZDfzzDvUSg0VSczmEEcE9d2sz4oTWL2TGbW0q4g
	Lk2Oww2xUAl+ZewwqXon2oB6tARwbBwZ6op7g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=Hg6z3XcFoxAro8QiH4HDyx4Of2OOy7aMqCBnchFJruYyQRZuf5+SrZTtAtU1e5R2s4
	y5GqJ08ftPkIv/0poe7v32oPwFbptP0KZG0juYf5C+KkGdgH0HhuocG5TDEp777n6nsS
	Z1WHqXi34T0CtCgEi+gUMMdwCf6Jq1ZnCfttU=
Received: by 10.231.149.203 with SMTP id u11mr9408544ibv.6.1277968486100; Thu, 
	01 Jul 2010 00:14:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 1 Jul 2010 00:14:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Jul 2010 00:14:26 -0700
Message-ID: <AANLkTilva4t_1fBYfzHthbUInh43adY9VYbU9EjgZL7V@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC} Disable multilib in gcc recipes
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
X-List-Received-Date: Thu, 01 Jul 2010 07:19:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

I would like to propose to remove building multilib with gcc recipes.
It creates problems
and we do not package correct bits on some platforms. As we tend to
build toolchains keeping in mind the machine it is targetting I think
multilib is not that significant

Concerns ? comments?

Thx
-Khem


