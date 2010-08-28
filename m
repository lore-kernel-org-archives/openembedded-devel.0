Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OpMjt-0004Qy-Oj for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 16:50:40 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OpMjO-0003Y1-DW for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 16:50:06 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 16:50:06 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 16:50:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 28 Aug 2010 16:49:58 +0200
Message-ID: <i5b7mm$iso$1@dough.gmane.org>
References: <AANLkTinFXpPdAkd79h94z70m_8MbamLd48pzR4sLQs34@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <AANLkTinFXpPdAkd79h94z70m_8MbamLd48pzR4sLQs34@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFD] increased dependency checking
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
X-List-Received-Date: Sat, 28 Aug 2010 14:50:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

As usual you're completely ignoring the impact of this when using
package management, which is probably why you still are clueless why
your openssl fiasco is so much work to fix for distro maintainers.

On 28-08-10 10:23, Frans Meulenbroeks wrote:
> Currently if a package in the DEPENDS list is modified, a package that
> depends on it does not get updated even if explicitly build
> E.g. when I just updated libexif and after that did a bitbake
> mythplugins (which has a DEPENDS on libexif) libexif got build but
> mythplugins did not get rebuild.
> 
> This is not really proper. E.g. if the lib changed a .h file the build
> of the using package could fail, but it could easily get unnoticed as
> one will only become aware of this when forcefully rebuilding that
> using package.
> 
> I think we can do better by better exploiting the timestamp.
> E.g. what about doing it this way:
> 
> If you build a package and the timestamp of e.g. do-install  (or
> do-stage or another pass) of one of your DEPENDS packages is newer
> than your do-install (or another task) then your dependency is most
> likely newer, so you need a rebuild. (preceded with a clean to get rid
> of the old stuff). This should be added to the task list.
> 
> Of course is is not as trivial as I sketch here.
> This whole game needs to be played recursively bottom up.
> So if A depends on B and B depends on C and C gets changed for
> whatever reason, then bitbake A should lead to rebuilding B first.
> 
> A similar thing might also be needed for RDEPENDS.
> If you run time depend on a package that is newer than you are, it
> might also be that there are inconsistencies.
> 
> How does this sound? I assume it will increase the workload of
> bitbake, but I feel this will lead to more stable packages.
> Your feedback is appreciated!
> 
> Frans.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMeSIVMkyGM64RGpERAk1lAKClt2Qr+fffyiGo7tRdRh99KCjLWACfbZDP
2TlBdc6DaXkJaKKT2ZZu+YY=
=2b/V
-----END PGP SIGNATURE-----



