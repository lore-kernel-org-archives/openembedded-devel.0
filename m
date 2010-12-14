Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1PSTg3-0006k4-MW
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 13:08:20 +0100
Received: from [192.168.1.10] (business-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by phalanx.drlauer-research.com (Postfix) with ESMTPSA id E25735841E7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 13:20:12 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1082)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <E1PR45K-0000jK-SU@melo.openembedded.org>
Date: Tue, 14 Dec 2010 13:06:42 +0100
Message-Id: <01EE9A12-BE87-4EF6-9F0B-EAA20A1DBAAE@vanille-media.de>
References: <E1PR45K-0000jK-SU@melo.openembedded.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1082)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Philip Balister : i2c-tools : Stage i2c-dev.h header as i2c-dev-user.h.
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
X-List-Received-Date: Tue, 14 Dec 2010 12:08:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Am 10.12.2010 um 15:36 schrieb git version control:

> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 48e6a063370a38a35f31a28efd8f6ce6ebf00840
> URL:    =
http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=3D48e6a0=
63370a38a35f31a28efd8f6ce6ebf00840
>=20
> Author: Philip Balister <philip@balister.org>
> Date:   Fri Dec 10 09:31:01 2010 -0500
>=20
> i2c-tools : Stage i2c-dev.h header as i2c-dev-user.h.
>=20
> Thanks to John Faith for suggesting this approach on the ML. The =
problem is
> i2c-tools overwrites the header staged by the kernel. This breaks =
programs
> that depend on the kernel header.

I don't think this a good solution. Now all programs break which expect
this very i2c-dev.h as being staged by i2c-tools. Interestingly, the
desktop distros don't bother about staging it differently, so why
can't we do the same? Besides, the i2c-dev.h as staged by i2c-tools
is supposed to be a superset. If it isn't we should complain with the
i2c-tools developers.

What can we do in the meantime?

:M:



