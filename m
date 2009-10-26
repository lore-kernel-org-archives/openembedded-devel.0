Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1N2XCZ-0006jw-Sp
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 22:34:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id D31E51422AAE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 22:29:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PnKi1pOSmcYG
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 22:29:36 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 8A1831416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 22:29:36 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <70c9a9110910260547q7c513336rc28555960bd4e5bd@mail.gmail.com>
References: <70c9a9110910260547q7c513336rc28555960bd4e5bd@mail.gmail.com>
Date: Mon, 26 Oct 2009 22:33:02 +0100
Message-Id: <1256592782.7623.3.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Connman and rootfs over NFS
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
X-List-Received-Date: Mon, 26 Oct 2009 21:34:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Enric Balletb=F2 i Serra wrote:
> Hi all,
>=20
> Running my Angstrom image and mounting the rootfs over NFS seems that
> the connman package reconfigures the network interface (nfs: server
> 192.168.2.6 not responding, still trying). There are any way to
> prevent this ?

I see very similar problem with Bluetooth networking (BNEP) and openvpn.
Connman steals the device when it goes up and mis-configures it.

I use a work-around - stopping or not starting the connman daemon.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



