Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@Vanille.de>) id 1I1dep-0001On-MY
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2007 09:34:15 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 2633228C013; Fri, 22 Jun 2007 09:29:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	SPF_HELO_PASS autolearn=ham version=3.1.7-deb
Received: from mail.vanille.de (localhost [127.0.0.1])
	by srv043.dedi23.de (Postfix) with ESMTP id 114D128C012;
	Fri, 22 Jun 2007 09:29:44 +0200 (CEST)
Received: from 59.124.92.123 (SquirrelMail authenticated user mickey)
	by mail.vanille.de with HTTP; Fri, 22 Jun 2007 09:29:44 +0200 (CEST)
Message-ID: <51901.59.124.92.123.1182497384.squirrel@mail.vanille.de>
In-Reply-To: <467B6CFB.6050600@dominion.kabel.utwente.nl>
References: <E1I1arL-0003eT-FM@linuxtogo.org>
	<467B6CFB.6050600@dominion.kabel.utwente.nl>
Date: Fri, 22 Jun 2007 09:29:44 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@Vanille.de>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.9a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-Mailman-Approved-At: Fri, 22 Jun 2007 09:40:26 +0200
Subject: U-Boot (was: org.oe.dev uboot-gta01:)
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
X-List-Received-Date: Fri, 22 Jun 2007 07:34:16 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> Could you please add this one back? It's a static version that has all
> needed patches in
> OE *and* is needed by various non-openmoko recipes. The linux_*.bb reci=
pes
> now don't build
> anymore because they are depending in u-boot-mkimage-gta01-native_oe.bb=
.
> u-boot-mkimage-gta01-native_oe.bb is the only recipe that can reliably
> create a
> uboot-mkimage since uboot-utils is broken beyond repair....

Wow. Ok, sorry, overloooked that in my furious attempt to start cleaning
up the U-Boot situation.

Guys, this is getting very messy. Would anyone who knows more about u-boo=
t
please start cleaning up our u-boot directory?

Me as being an u-boot-analphabet took me 6 hours to fix uboot-gta01
building w/ an eabi toolchain... and the besides that the result seems to
work it's not something I'm proud of (see uboot-eabi-fix-HACK.patch).

--=20
Best Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.vanille-media.de



