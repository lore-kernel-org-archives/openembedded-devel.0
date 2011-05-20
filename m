Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QNRry-0001PR-CZ for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 17:44:06 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QNRp5-0002Qn-UQ for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 17:41:07 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 17:41:07 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 17:41:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 20 May 2011 17:40:55 +0200
Message-ID: <ir6227$4r6$1@dough.gmane.org>
References: <BANLkTi=sn5n-gdOOFgt6k=PswZHhCe0Mww@mail.gmail.com>	<BANLkTi=VUCzOWjZ8bnRHqrnLqsRZypRdxQ@mail.gmail.com>	<1305883809.15084.3.camel@phil-desktop>
	<BANLkTik5rGXsF6O59bweGS+okP8+92mAzA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTik5rGXsF6O59bweGS+okP8+92mAzA@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: vlc failed to build here ( palmpre2, SHR ) -fPIC thing
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
X-List-Received-Date: Fri, 20 May 2011 15:44:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-05-11 17:11, Sylvain Paré wrote:
> Ok here I don't get it...
> To be sure of what I would advance I did again some research/tests
> and went for first time to make it compli but as I was not sure of how/why I
> save my changes and
> did update my build host but then bitbake vlc worked perfectly! without any
> trouble!
> So I don't understand... I added some things like that in live555.inc and in
> vlc.inc
> CFLAGS_append_armv7a = " -fPIC "
> CFLAGS += " -fPIC "
> 
> or this in the do_configure of live555.inc
> CFLAGS+=" -fPIC "

I have a local change doing something similar, let me see if I can clean
it up and push.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN1ouHMkyGM64RGpERAtRMAKCmlXoWOWc3ohsbbeVIwXIVYl8cyQCcD8Z4
1lvovde/kC1g211BwXXtYqo=
=WWHC
-----END PGP SIGNATURE-----



