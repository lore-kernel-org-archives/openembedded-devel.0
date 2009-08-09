Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Ma5ad-0007I8-Qm
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Aug 2009 12:25:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 0B48D14171A0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Aug 2009 12:00:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lfwTVI+EihyO
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Aug 2009 12:00:23 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id A85F51417181
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Aug 2009 12:00:23 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200908081606.16406.mickey@vanille-media.de>
References: <1249737204.8277.22.camel@utx.utx.cz>
	<200908081606.16406.mickey@vanille-media.de>
Date: Sun, 09 Aug 2009 12:09:17 +0200
Message-Id: <1249812557.4334.11.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: libgtkstylus: working on new version
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
X-List-Received-Date: Sun, 09 Aug 2009 10:25:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Michael 'Mickey' Lauer wrote:
> Wow, that's pretty good news.
>=20
> The thing that always put me off of using libgtkstylus was that it intr=
oduces=20
> additional delay for single (left) keypresses -- is that fixed with you=
r=20
> version?

=EF=BB=BFCould you tell me, which applications are affected by this probl=
em?

I am not aware of any delay of a single left keypress, even in version
0.3. Looking at the code, they are sent directly to the application
without any delay and start right press emulation timer.

The delays I experience (e. g. in multi-tab browsing in midori) seems to
have nothing with gtkstylus, but it is a simple consequence of slow CPU.

Well, rc4 still has problems in these situations - timer seems to have
highest priority, then midori callbacks, then next event processing.
Even if you release stylus after <500ms, release event is processed
later than 500ms after press, timer expires, right press is emulated.
Fix would need deeper study of the main loop priorities.

Another delays are I experienced are caused by motion hint processing
bug GTK+ and many applications:
http://bugzilla.gnome.org/show_bug.cgi?id=3D587714 (and dependent bugs)

As it needs to be re-implemented, I just prepared work-arounds in some
applications: gqview (committed), viking (in their tracker).


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



