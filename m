Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1KnfJq-0000fA-Do
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 22:07:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id CECCF1416BA9;
	Wed,  8 Oct 2008 21:53:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ekse8gq4LCVg; Wed,  8 Oct 2008 21:53:45 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id 343D01416BA5;
	Wed,  8 Oct 2008 21:53:44 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: Sergey Lapin <slapinid@gmail.com>
In-Reply-To: <48239d390810081234t2b5ea5c4g5fcb6f1900a274da@mail.gmail.com>
References: <48239d390810080715l700d1ce4i46c1e1cc97279b3@mail.gmail.com>
	<1223480224.9336.12.camel@hammer.suse.cz>
	<48239d390810081234t2b5ea5c4g5fcb6f1900a274da@mail.gmail.com>
Date: Wed, 08 Oct 2008 22:03:02 +0200
Message-Id: <1223496182.3549.7.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Locale support.
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
X-List-Received-Date: Wed, 08 Oct 2008 20:07:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Sergey Lapin wrote:
> On Wed, Oct 8, 2008 at 7:37 PM, Stanislav Brabec <utx@penguin.cz> wrote=
:
> > For historical reasons, HTTP characters are converted to 7 bits.
> > If you see something like "%C5%BE%C5%99%C5%A1" after using wget, then=
 it
> > is not a bug, it is a feature.
> No, it tries to convert, but fails.
> So, as I see a problem is in wget itself.

Are you using busybox wget or GNU wget?

What exactly happens?

With GNU wget you can try --restrict-file-names=3Dnocontrol

I think that wget http:// should never produce files with names with
accents, at least for most servers. =EF=BB=BFwget ftp:// can create such =
files,
but as FTP provides no support for charset, wget saves them as they are
with no conversion and with no idea about charset.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



