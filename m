Received: from [83.151.25.170] (helo=vanille-media.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1J2MtH-00031t-32
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2007 09:24:27 +0100
Received: by vanille-media.de (Postfix, from userid 65534)
	id 4EEA828C013; Wed, 12 Dec 2007 09:13:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=5.0 tests=AWL,BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180141060.adsl.alicedsl.de [85.180.141.60])
	by vanille-media.de (Postfix) with ESMTP id 5272528C012;
	Wed, 12 Dec 2007 09:13:03 +0100 (CET)
Date: Wed, 12 Dec 2007 09:20:06 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <31294197.20071212092006@vanille-media.de>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <1617210780.20071212000416@gmail.com>
References: <1617210780.20071212000416@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] [RFC] Using ${PR} instead of ${DATETIME} in deployed kernel image filename
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2007 08:24:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> Hello openembedded-devel,

>   I already mentioned this in
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2007-December/003695.html , here's specific RFC:
> I'd like to propose using the following filename pattern for deployed
> kernel images: "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}", instead
> of "${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}". This will
> ensure that kernels built from the same recipe are named consistently,
> and thus will allow users and developers track kernels easier. Also,
> any change to build configuration should be accompanied by recipe PR
> bump, so new kernel file will be produces.

+1. Good thing is it forces you to update PR, bad thing is it forces
you to update PR, especially when you are trying out multiple
defconfigs. But I guess in that case you probably use devshell or an
out-of-OE-tree kernel.

>   So:

> 1. Does anybody see something grossly wrong with this scheme?
> 2. Otherwise, I'm going to change this for linux-handhelds-2.6, and
> would like to encourage maintainers of the other kernel recipes to do
> the same.

Isn't it already deployed in linux.inc? I remember I had to catch up
linux-openmoko.inc because of that change.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



