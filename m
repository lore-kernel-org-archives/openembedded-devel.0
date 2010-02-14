Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bernhard.guillon@opensimpad.org>) id 1NgiOM-0002YK-5B
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 18:36:25 +0100
Received: from dd20204.kasserver.com (kasmail3.kasserver.com [85.13.143.1])
	by dd20204.kasserver.com (Postfix) with SMTP id 2B1D61817E775
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 18:33:45 +0100 (CET)
In-Reply-To: <20100214170414.GG30265@mx.loc>
from: bernhard.guillon@opensimpad.org
to: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SenderIP: 95.90.75.53
Message-Id: <20100214173347.2B1D61817E775@dd20204.kasserver.com>
Date: Sun, 14 Feb 2010 18:33:45 +0100 (CET)
X-SA-Exim-Connect-IP: 85.13.140.93
X-SA-Exim-Mail-From: bernhard.guillon@opensimpad.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: = ? UTF-8 ? B ? Ww== ? =oe= ? UTF-8 ? B ? XQ== ? = How to sane replace a path in a pkgconfig file ?
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
X-List-Received-Date: Sun, 14 Feb 2010 17:36:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

> On Sun, Feb 14, 2010 at 03:23:09PM +0100, bernhard.guillon@opensimpad.o=
rg wrote:
> >Hi all,
> >currently I am working on fixing blackbox. I had to add a lot of inclu=
des to fix compiler errors.
>=20
> I have an import of the CVS tree here, fyi:
> http://git.busybox.net/~aldot/git/blackboxwm/
> http://git.busybox.net/~aldot/git/bbkeys/
>=20
> There were a couple of debian's patches applied (still by brad), i'd
> recommend to use all blackbox-0.70.1..master patches and base off that.
>=20

Hi,
thanks for the hint, the debian patch for the includes looks like mine so=
 I will use the debian patch for updating the recipe :)

But my problem is not the compiler errors but openembeddeds pkgconfig cla=
ss.
When will pkgconfig be called? Before or after do_stage()? What is the ri=
ght function to place the code of replacing  the wrong path of the pkgcon=
fig file? The original package does it in do_stage() but it seems at leas=
t on my build system that pkgconfig class is called after do_stage().=20
Also is it safe to just replace the path in pkgconfig files in do_install=
_prepend()? Because then there is no file with the build path.=20

So I need a function which gets called after pkgconfig class?

Best regards
Bernhard Guillon





