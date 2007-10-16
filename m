Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1IhpOd-00021W-Ut
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Oct 2007 18:35:55 +0200
Received: from cimmeria ([::ffff:78.86.130.156])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Tue, 16 Oct 2007 17:19:24 +0100
	id 00064AC6.4714E48C.00000E63
Date: Tue, 16 Oct 2007 17:19:22 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071016171922.2ef1992d@cimmeria>
In-Reply-To: <4714C315.9000508@student.utwente.nl>
References: <4714C315.9000508@student.utwente.nl>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.10.11; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: no-distro goal and SRCREV=1 in bitbake.conf
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
X-List-Received-Date: Tue, 16 Oct 2007 16:35:56 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Oct 2007 15:56:37 +0200
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> SRCREV=1 in bitbake.conf forces people to use a distro, which is
> bad(TM) according to the OEDEM minutes.
> 
> My short term solution:
> 
> * SRCREV = "${@bb.fetch.get_srcrev(d)}" in bitbake.conf
> * SRCREV ?= <foo> in recipes
> * SRCREV_pn-baz ?= <bar> in distro includes or local.conf
> 
> For the medium and long term we should consider adding snapshot
> recipes for 'proven' revisions next to the 'floating' ones, even if
> Richard thinks it's a waste of space. Having a host of 'unbreak me'
> includes is also against our 'sane defaults' goal we decided on at
> OEDEM.
> 
> Comments/ideas/flames?
> 

My opinion is with the goal to build with no DISTRO= set then no
software should be build with floating SVN versions by default.

So I would opt for the "snapshot" releases style that we have been doing
for a long time now anyway. For stuff that is needed for basic images
but has never had a working release.

Graeme


