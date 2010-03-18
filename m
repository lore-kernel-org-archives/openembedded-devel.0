Received: from wbm1.pair.net ([209.68.3.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1NsByY-0004bI-6u
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 10:25:12 +0100
Received: by wbm1.pair.net (Postfix, from userid 65534)
	id 3D85C26C1D; Thu, 18 Mar 2010 04:50:52 -0400 (EDT)
Received: from 193.195.44.178 ([193.195.44.178])
	(SquirrelMail authenticated user blueligh@bluelightning.org)
	by webmail1.pair.com with HTTP; Thu, 18 Mar 2010 08:50:52 -0000 (GMT)
Message-ID: <10074.193.195.44.178.1268902252.squirrel@webmail1.pair.com>
In-Reply-To: <1268885514.7079.1.camel@trini-m4400>
References: <E1Ns2kd-0004yU-TV@melo.openembedded.org>
	<1268885514.7079.1.camel@trini-m4400>
Date: Thu, 18 Mar 2010 08:50:52 -0000 (GMT)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.5
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-SA-Exim-Connect-IP: 209.68.3.41
X-SA-Exim-Mail-From: bluelightning@bluelightning.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Paul Eggleton : opkg: update to include upstream libopkg C++ header fixes
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
X-List-Received-Date: Thu, 18 Mar 2010 09:25:12 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Tom Rini wrote:
> Please, pretty please, can we change to:
> SRCREV_OPKG ?=3D "nnn"
> SRCREV_pn-opkg ?=3D "${SRCREV_OPKG}"
> SRCREV_pn-opkg-native ?=3D "${SRCREV_OPKG}"
> SRCREV_pn-opkg-sdk ?=3D "${SRCREV_OPKG}"
>
> All three really are just as important to not have broken because they
> weren't tested hard enough (iirc, the argument that was made last time)=
.

I don't mind personally; in this case I only changed one because the
particular revision I needed would not affect the other recipes. Your
proposal sounds sensible to me though.

Cheers,
Paul


