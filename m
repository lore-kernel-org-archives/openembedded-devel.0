Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LRuRm-0005RW-Sz
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 21:22:14 +0100
Received: from andromeda.vanille.de (e180143136.adsl.alicedsl.de
	[85.180.143.136])
	by drlauer-research.com (Postfix) with ESMTP id 74655584712
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2009 21:36:17 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jan 2009 21:14:35 +0100
User-Agent: KMail/1.9.10
References: <8763k3czl7.fsf@news.piechotka.com.pl> <glj38s$615$1@ger.gmane.org>
	<8763k0adfh.fsf@news.piechotka.com.pl>
In-Reply-To: <8763k0adfh.fsf@news.piechotka.com.pl>
MIME-Version: 1.0
Message-Id: <200901272114.35748.mickey@vanille-media.de>
Subject: Re: Problem with building connman
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
X-List-Received-Date: Tue, 27 Jan 2009 20:22:18 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Tuesday 27 January 2009 18:04:02 schrieb Maciej Piechotka:
> >   Just recreate all the symlinks manually i.e. cd into the
> > connman-directory and into the directory which has all the wrong
> >
> > .-h-file symlinks (they should show up red) and enter the command:
> >> for f in *.h; do ln -fs ../$f $f; done
> >
> >   But only do that if all .h-file-symlinks are pointing to
> > non-existing files. Otherwise just fix them manually.
>
> That works. Why it is not written into bb file then?

Because it built for me without this hack.

Will add it when I have a chance.

Cheers,
-- 
:M:


