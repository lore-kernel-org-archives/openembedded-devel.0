Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMQK6-0006iH-N6 for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 21:52:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HJo2dJ020282
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 20:50:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19951-06 for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 20:49:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HJnt3A020271
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 20:49:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110517092550.GG1544@ibawizard.net>
References: <1305545218.3424.29.camel@rex>
	<BANLkTimSNvdsc1BoCk4ofNh4-nFuO5bg2A@mail.gmail.com>
	<1305564582.2429.90.camel@phil-desktop>
	<BANLkTimtfuCEo253ye-96xeo1dsvJgRFBw@mail.gmail.com>
	<iqt55i$59d$1@dough.gmane.org>
	<BANLkTikg=j9+Y-o8CfXEpBbY51u+tBLa8A@mail.gmail.com>
	<20110517092550.GG1544@ibawizard.net>
Date: Tue, 17 May 2011 20:49:52 +0100
Message-ID: <1305661792.3424.285.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	p4HJo2dJ020282
Subject: Re: OpenEmbedded Core - Ready for extended users
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
X-List-Received-Date: Tue, 17 May 2011 19:52:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-05-17 at 11:25 +0200, Petr =C5=A0tetiar wrote:
> Anders Darander <anders.darander@gmail.com> [2011-05-17 09:04:35]:
>=20
> > Yes, from that point, Dbus was not the optimal example, I agree...
> >=20
> > Though, that was only one example of a package that has either runtim=
e
> > or only build-time dependencies on X in some form or another. Earlier=
,
> > in the 2011.03-releases, we had systemd depending on gtk+, which has
> > been removed in the lates updates. Thats just another example.
>=20
> Don't worry, you're not alone in that feeling, actually I think, that w=
e're
> quite a large group fighting with this :-) One day the image has 1700 t=
asks,
> after one rebase within a week timespan it grows almost to 3000, don't =
mention
> bluetooth and similar stuff etc. Well, I'm also looking forward to see,=
 how it
> will change with oe-core.

These are issues we need to address I think everyone agrees on that.
What we do need is some overall architectural way to handle it though
rather and doing it adhoc on a case by case basis. There has been some
discussion on the OE-Core list about it but I don't think we've reached
any conclusion.

Out of interesting are there any new proposals on how to handle this?
I'm interested in proposals that are thought through to details like how
distros handle differences and being able to identify which
configurations are used when presented with packages...

Cheers,

Richard





