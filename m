Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1Iz9X2-0003Uo-Sp
	for openembedded-devel@openembedded.org; Mon, 03 Dec 2007 12:32:12 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 8091828C013; Mon,  3 Dec 2007 12:22:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=AWL,BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180172164.adsl.alicedsl.de [85.180.172.164])
	by srv043.dedi23.de (Postfix) with ESMTP id AC65328C012;
	Mon,  3 Dec 2007 12:22:00 +0100 (CET)
Date: Mon, 3 Dec 2007 12:28:49 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <17395220.20071203122849@vanille-media.de>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1196641802.6648.31.camel@localhost.localdomain>
References: <1196641802.6648.31.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] Angstrom builds with prebuilt meta-toolchain output
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
X-List-Received-Date: Mon, 03 Dec 2007 11:32:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> This is something I experimented a bit with and wondered if anyone else
> was interested in it. I just added external-toolchain.bb to OE which
> allows a meta-toolchain generated toolchain to be used by OE instead of
> building its own.

Woot! This is very helful, thanks.

> The attached patch adds the notion of different toolchains to angstrom,
> by default it uses the one specified by the DISTRO_VERSION_MAJOR
> variable I added but with ANGSTROM_TOOLCHAIN = "external" use a
> pre-supplied toolchain.

> I don't know if Angstrom want to support this or not but this should at
> least show its possible and document how to do it. The patch shouldn't
> be committed in its current form as it needs a 2008-1 version file
> adding. Some of the PREFRERRED_VERSION statements related to the
> toolchain might also move to the toolchain definition files too but I
> have no strong opinions on that.

> I was able to generate an external toolchain and then use that to make a
> minimal-image, I haven't tested further.

> It is also I admit slightly glibc specific. We have to start somewhere
> though :).

Absolutely.

Mickey.



