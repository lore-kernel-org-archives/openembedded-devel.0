Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1OUZWq-0005TD-PD
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 08:15:13 +0200
Received: by bwz10 with SMTP id 10so793825bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 23:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9fHlGkc4Uw+Q6gX7Q4RNgw624fm54yEeQtu6vbVgjVM=;
	b=bl+vOkf7r4edPv8WqjjCexiLDesYnvMLAbHA2WVthxphTMfEwYdHwRWUAPDf/xJXcU
	CRC+bCndN5f0JZCGnq24rdaLg+1gfdUUjL8vOvq8tKHxHJCPmKSTPLCaI+WFYP5tOHom
	PnT+9S9rgRYCAJufyuf6w5U0hX31vz64i6BG8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wpK5J4UqRbBYx1wDgnmGb7kYvsW6X5chG+zh0uNP0g8C32gPyC39PasbIGc5gxgXTC
	CNpBB0iYzV7fTItKFSQVwCMe1x/80retMbBpoMUfgTJAK9JeSKfp/+LzfVNlBFrZZtaP
	NAPQseK7Zqs8tzsr4J9O8nFl/GDt1/7pZntGs=
MIME-Version: 1.0
Received: by 10.204.66.79 with SMTP id m15mr216610bki.18.1278051029135; Thu, 
	01 Jul 2010 23:10:29 -0700 (PDT)
Received: by 10.204.118.203 with HTTP; Thu, 1 Jul 2010 23:10:29 -0700 (PDT)
In-Reply-To: <4C2D153E.1040608@mentor.com>
References: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk>
	<4C2D153E.1040608@mentor.com>
Date: Fri, 2 Jul 2010 08:10:29 +0200
Message-ID: <AANLkTilQbdgbNyhS8CGvY4vLjikFet2Mo9LFF9GOlWIK@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: USE flags mumbling
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
X-List-Received-Date: Fri, 02 Jul 2010 06:15:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/2 Tom Rini <tom_rini@mentor.com>:
> ...
> I wonder, and I have to admit to having no real gentoo background here, h=
ow
> do they solve this problem? =A0Did they invent their own package format a=
nd
> add another field that consists of use flags? =A0That'd make some stuff a=
 lot
> easier, but making deb/rpm get that mapping somehow seems hard at first.

On Gentoo you don't pull any binary packages but you load the ebuild (<=3D>
recipe) from a feed. Thus you can build what you need AT your machine, whic=
h
I don't think is possible here. Dependency management is done through this
ebuilds. Package A has useflags B? and C? and pulls other packages in
depending on if these flags are enabled.

Regards,
Michael


