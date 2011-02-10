Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PnZeq-0000Me-NK for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 17:46:16 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PnZdn-00024o-E7 for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 17:45:11 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 17:45:11 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 17:45:11 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 10 Feb 2011 17:44:44 +0100
Message-ID: <ij14m0$o7u$1@dough.gmane.org>
References: <4D540F81.3030205@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D540F81.3030205@mentor.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [RFC] postgresql updates
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
X-List-Received-Date: Thu, 10 Feb 2011 16:46:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-02-11 17:17, Tom Rini wrote:
> Hey all,
> 
> I'll post patches later but I'd like to do some upgrading / fixing to
> postgresql.
> 
> First, from
> http://wiki.postgresql.org/wiki/PostgreSQL_Release_Support_Policy
> postgresql 8.1.x (our default) is EOL.  8.2.x will EOL this year and
> 8.4.x has some good life left to it.
> 
> Second, after reading the various release notes (starting on
> http://www.postgresql.org/docs/8.2/static/release-8-2-20.html), I would
> like to:
> 
> - Drop 8.1.x
> - Drop 8.2.x (since it's D_P = -1 and unpinned)
> - Make 8.4.7 the default which means
>   - Un-pin SHR (8.4.4 to 8.4.7 is a safe and no changes needed upgrade,
> see http://www.postgresql.org/docs/8.4/static/release-8-4-7.html)

Sounds good to me!

> What got me going here is that 8.1.x and 8.2.x both use ld directly for
> linking rather than CCLD which causes problems on mips64 which means
> qt4*demo-image was failing (well, outside of SHR ;)).
> 
> But the question is, do we want to in any way try and prompt the user to
> get them to upgrade their 8.1.x DB?  Or just assume anyone using
> postgresql will be smart enough to figure out they need to dump and
> restore (if I read things right).

We could at least dump something to stdout in the postinst like mysql does.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNVBX8MkyGM64RGpERAgcpAJ9Q8y64mMEtkJFdU598ruH5FJmTkgCgkC5M
rtBaT2CyD4zLXSJpWzrzPNw=
=i/t6
-----END PGP SIGNATURE-----



