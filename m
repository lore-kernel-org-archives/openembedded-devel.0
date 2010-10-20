Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P8bVW-0004XD-Ru for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 18:29:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P8bUP-0003wk-CO for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 18:26:09 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 18:26:09 +0200
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 18:26:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 20 Oct 2010 18:26:01 +0200
Message-ID: <i9n56p$ppm$1@dough.gmane.org>
References: <4CBEB7E8.5020109@nedap.com>	<AANLkTikBiKGuQYXCdi_QMirA7_AjQn9b0A0CWtmkMu90@mail.gmail.com>	<29F88E4E-18CC-4CD2-8A76-5C78ED4EDAC7@nikom.net>	<20101020140543.GN3324@jama>
	<4CBF01C6.7030409@gravedo.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <4CBF01C6.7030409@gravedo.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building gcc-cross-initial for armv5te
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
X-List-Received-Date: Wed, 20 Oct 2010 16:33:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-10-10 16:50, Simon Busch wrote:
> On 20.10.2010 16:05, Martin Jansa wrote:
>> On Wed, Oct 20, 2010 at 09:26:32AM -0400, Nik wrote:
>>> What os are you compiling on?  Can you run the cross compile gcc from the command line and get the no input files message?
>>
>> Related log from #oe - as I'm lazy to type it again :)
>>
> 
> As I tried a little bit more I tracked it down to the commit
> f1148d26740e57cba4fe29fd78c234359868a50e ("binutils.inc: Filter out
> --with-sysroot for target binutils"). If you revert this one and do a
> fresh build (rm -rf tmp) everything compiles fine.

It would be nice if commits like that bumped PR so problems also show up
in incremental builds. And in this case, the fixed *packages* can end up
in the feeds.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMvxgZMkyGM64RGpERAnirAKCvfFOmzQTOqYTS5+PxFUFHzxHDrwCgonk2
PxM2Xi/EQa0uma+SY+F1LmI=
=B1wz
-----END PGP SIGNATURE-----



