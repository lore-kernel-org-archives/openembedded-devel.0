Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Nr6PF-0000z8-Lb
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 10:16:19 +0100
Received: from [192.168.1.4] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id A30B05846FB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 10:14:20 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1077)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <201003150846.33517.holger+oe@freyther.de>
Date: Mon, 15 Mar 2010 10:13:13 +0100
Message-Id: <F8AC6A62-ECD9-4143-83CA-80CA416FECD0@vanille-media.de>
References: <201003081300.19058.holger+oe@freyther.de>
	<201003150446.26284.holger+oe@freyther.de>
	<ac9c93b11003150030i69015e69t78a3b16e6c11d2e5@mail.gmail.com>
	<201003150846.33517.holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 15 Mar 2010 09:16:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Am 15.03.2010 um 08:46 schrieb Holger Hans Peter Freyther:

> On Monday 15 March 2010 08:30:09 Frans Meulenbroeks wrote:
>=20
>> Do we feel we have that responsibility?
>>=20
>> I didn't feel that sentiment when it came to removing other legacy
>> recipes (some of which definitely also will have security issues).
>> E.g. for openssl we have
>> openssl_0.9.7e.bb
>> openssl_0.9.7g.bb
>> openssl_0.9.7m.bb
>> openssl_0.9.8g.bb
>> openssl_0.9.8m.bb
>> I'm pretty certain the last one will fix some vulnerabilities present
>> in the first one.
>=20
> Well you are comparing two different things here. One is having the =
_default_=20
> of a recipe with known security issues, and one is keeping old non =
default=20
> recipes with security issues.
>=20
> If a distro maker decides to use an ancient version of OpenSSL it was =
his=20
> choice, if he just typed bitbake foo-image and he has a vulnerable =
daemon=20
> waiting to be owned in his default image... the story is a bit =
different.
>=20
> I think we have at least three options on how to deal with it:
>=20
> 1.) Put a big fat warning on Openembedded.org saying it should not be =
used for=20
> users that have network connectivity or might put a SDcard/Storage =
with=20
> content on a device as we don't care about fixing vulnerable software.

Gets my vote; however with less dramatic wording.

:M:



