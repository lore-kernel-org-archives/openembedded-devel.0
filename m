Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1P7PJV-00005S-R4
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 11:14:03 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 733C61D36172; Sun, 17 Oct 2010 11:13:21 +0200 (CEST)
Date: Sun, 17 Oct 2010 11:13:21 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101017091321.GN28423@ibawizard.net>
References: <1287218988-3946-1-git-send-email-ynezz@true.cz>
	<AANLkTi=_3DKvm3bbHuvdvQYOS9M3WDKaBjg2aON=kYWS@mail.gmail.com>
	<AANLkTimu=q2VNcR=2fwNiRB0bojQQ70h1BVAEKa0pQUA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimu=q2VNcR=2fwNiRB0bojQQ70h1BVAEKa0pQUA@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] oestats-client.bbclass: send USERDISTRO value
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
X-List-Received-Date: Sun, 17 Oct 2010 09:14:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Chris Larson <clarson@kergoth.com> [2010-10-16 20:12:52]:

> Is USERDISTRO always guaranteed to be set, or should it fall back to DISTRO?
>  (haven't checked, I feel lazy, sue me :)

ynezz@ntbk:/media/data/devel/oe/ts72xx.git/openembedded/conf$ grep USERDISTRO . -R
./distro/include/kaeilos.inc:USERDISTRO := "${DISTRO}"
./distro/include/kaeilos-2010.inc:USERDISTRO := "${DISTRO}"
./distro/include/angstrom.inc:USERDISTRO := "${DISTRO}"
./bitbake.conf:# USERDISTRO should always contain original DISTRO value as set by user
./bitbake.conf:# overrides like it wants), USERDISTRO must be reassigned with := first
./bitbake.conf:USERDISTRO = "${DISTRO}"

-- ynezz


