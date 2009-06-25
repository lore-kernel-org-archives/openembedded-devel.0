Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MJizm-0002lj-8Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jun 2009 09:03:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id F3CD61409713
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2009 08:53:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7WEtiOhkxdbL
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2009 08:53:58 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id CAA3E1416BAB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2009 08:53:58 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <h1u7s2$b8l$1@ger.gmane.org>
References: <1245871136.5939.3.camel@utx.utx.cz> <h1u7s2$b8l$1@ger.gmane.org>
Date: Thu, 25 Jun 2009 08:52:26 +0200
Message-Id: <1245912746.4156.12.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: [PATCH] introduction of virtual/libusb0
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
X-List-Received-Date: Thu, 25 Jun 2009 07:03:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote:

> > libusb-compat and libusb provide exactly the same API and ABI using a
> > different back-end, and applications should work with both of them
> > without recompilation.
>=20
> Why not statically link in the old libusb0 to those broken apps? We do=20
> that for gnuradio (in a hacky way, but it can be made generic) and it=20
> works well.

=EF=BB=BFReverting to libusb-0 (even statically linked) is a quick
fix. =EF=BB=BFDebugging of libusb-compat, fixing it and sending patch ups=
tream
is a correct way.

=EF=BB=BFUp to now it worked in all cases except gnuradio, which uses int=
ernal
functions of libusb-0. All other applications should work with
libusb-compat and no static linking should be needed.

Maybe few years from now on we can drop libusb-0 recipes completely (and
keep gnuradio with statically linked old library maybe forever)
altogether with the virtual. Now it is useful for quick fixing and for
debugging of problems of libusb-compat.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



