Received: from [212.27.42.4] (helo=smtp4-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LpHne-0000sQ-2y
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 09:57:24 +0200
Received: from smtp4-g21.free.fr (localhost [127.0.0.1])
	by smtp4-g21.free.fr (Postfix) with ESMTP id D16E74C816E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 09:54:56 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp4-g21.free.fr (Postfix) with ESMTP id EAB6F4C8190
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 09:54:53 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 8303A1840D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 09:54:54 +0200 (CEST)
Message-ID: <49D46F4D.1010004@bolloretelecom.eu>
Date: Thu, 02 Apr 2009 09:54:53 +0200
From: =?ISO-8859-15?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49D33527.6050102@gmail.com>
In-Reply-To: <49D33527.6050102@gmail.com>
X-SA-Exim-Connect-IP: 212.27.42.4
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4-tools-native_4.4.3.bb failed
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
X-List-Received-Date: Thu, 02 Apr 2009 07:57:24 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Enrico,

I have managed to reproduce your problem in a chrooted environment which =
did not have the
zlib development files. I have just commited a patch which fixes the prob=
lem for me:

http://cgit.openembedded.org/cgit.cgi?url=3Dopenembedded/commit/&id=3D8f6=
1b0343b6c56644fdaa8fa3e84e1c29d3f47b9

Could you please try building qt4-tools-native again and let me know whet=
her it works?

Cheers,
--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris


