Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1Ie85z-00063N-QS
	for openembedded-devel@openembedded.org; Sat, 06 Oct 2007 13:45:23 +0200
Received: (qmail 15504 invoked by uid 813007); 6 Oct 2007 11:39:53 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO maluch.local)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 6 Oct 2007 11:39:53 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 6 Oct 2007 13:39:49 +0200
User-Agent: KMail/1.9.7
References: <1191494488.2516.34.camel@toontown> <4705D99D.6070209@miromico.ch>
	<f96d234e0710050657lbbf7391tb2437588f9c93d31@mail.gmail.com>
In-Reply-To: <f96d234e0710050657lbbf7391tb2437588f9c93d31@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200710061339.50324.openembedded@haerwu.biz>
Subject: Re: oe for two target boards at the same time
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
X-List-Received-Date: Sat, 06 Oct 2007 11:45:24 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=B1tek, 5 pa=BCdziernika 2007, Cliff Brake napisa=B3:
> On 10/5/07, Alex <mailinglist@miromico.ch> wrote:

> > How do I setup my directory structure to use oe for two target
> > boards.

> > I have an AVR32 board and an AT91 board and would like to use oe for
> > both of them with at less dublicated software as possible.

> As these are different architectures, I don't think you can use
> multimachine.

You can use multimachine even when TARGET_ARCH differ - only *-native=20
utils will be the same - all cross tools will be built for both targets.

> What I typically do is just set up a system where I share a common
> overlay (bbcollections), the openembedded directory,=20
> and downloads directory.

> I'd be interested in hearing how others set up their build directory.

http://blog.haerwu.biz/2006/11/22/my-openembedded-environment-ii/ is how I=
=20
have it configured.





