Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lffj2-0001mu-Bc
	for openembedded-devel@openembedded.org; Fri, 06 Mar 2009 20:28:52 +0100
Received: (qmail 18887 invoked by uid 813007); 6 Mar 2009 19:24:21 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 6 Mar 2009 19:24:21 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 6 Mar 2009 20:24:08 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc6-00216-g778ef1e; KDE/4.2.0; x86_64; ;
	)
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF686@hiob.intern.dresearch.de>
	<a7f8874a0903020942y65f55a90rec06b1bc87ac8702@mail.gmail.com>
	<432beae0903061047p33bb6052o28e3d9b73847f1bd@mail.gmail.com>
In-Reply-To: <432beae0903061047p33bb6052o28e3d9b73847f1bd@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200903062024.13519.marcin@juszkiewicz.com.pl>
Subject: Re: Ugly build problem with emacs/qemu
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
X-List-Received-Date: Fri, 06 Mar 2009 19:28:53 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 06 of March 2009 19:47:58 Justin Patrin wrote:
> > I don't kow about openSuse, but I remember that Fedora used to have
> > =A0some kernel patches that did not play well with QEMU. But that was
> > =A0back on Ferora 7, since then I switched to ubuntu. I don't even
> > =A0rmember exactly what patch caused the problems, but IIRC it was
> > =A0security related.
>
> Hmmm, good point it could be SELinux. Could you try disabling that,
> if you have it enabled?

It is not SELinux but one kernel patch - linux-2.6-execshield.patch to=20
be exact. Rebuild Fedora kernel without that one or use vanilla one.

Took me lot of kernel rebuilds to find that out.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




