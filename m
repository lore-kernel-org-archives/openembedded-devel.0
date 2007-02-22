Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HKCeK-0002Ev-PC
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 13:02:12 +0100
Received: (qmail 23774 invoked by uid 813007); 22 Feb 2007 12:02:11 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 22 Feb 2007 12:02:11 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Feb 2007 13:02:16 +0100
User-Agent: KMail/1.9.6
References: <erf8tc$c5d$1@sea.gmane.org>
In-Reply-To: <erf8tc$c5d$1@sea.gmane.org>
MIME-Version: 1.0
Message-Id: <200702221302.17384.openembedded@hrw.one.pl>
Subject: Re: Image problem.
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
X-List-Received-Date: Thu, 22 Feb 2007 12:02:13 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 20 lutego 2007, Rob Kramer napisa=B3:
> I'm converting my image to the new-style metadata (*_FEATURES, etc),
> and I'm having trouble figuring out where the error below originates.
> It can't find a -dbg install directory, or something. I have the
> feeling I've forgotten to convert something, or neglected to add a new
> variable.
>
> Can anyone tell me where to start looking? Clearing the cache and
> rebuilding doesn't help. Using Bitbake 1.6 svn head.

Change "inherit image_ipk" to "inherit image" in display-image recipe.=20
IIRC it should be all.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                        This tagline is umop apisdn




