Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OCVQy-0006ia-Rv for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 12:14:31 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OCVND-00028D-Qz for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 12:10:35 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 12:10:35 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 12:10:35 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 13 May 2010 12:10:18 +0200
Message-ID: <hsgj6b$4s5$1@dough.gmane.org>
References: <20100513084311.GH1136@hindley.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <20100513084311.GH1136@hindley.org.uk>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: h3900: Kernel 2.4/2.6 selector or build for Famliar
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
X-List-Received-Date: Thu, 13 May 2010 10:14:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-05-10 10:43, Mark Hindley wrote:
> Hi,
> 
> I have been trying to build some more recent GPE packages for my h3900
> which is running Familiar. I have managed it successfully by fixing and
> adding .bb files to the Familiar build tree, but as Familiar dev seems
> to have finished, I was wondering whether it was more sensible to use
> current OE.
> 
> Hardware support for 2.6 in Angstrom is not really complete enough for
> everyday use. 
> 
> I was thinking of adding a 2.4/2.6 kernel selector for h3900 (in the
> same way as collie etc) and then using distro/angstrom (with the
> necessary PREFERRED_VERSION overrides in local.conf) or recreating
> distro/familiar.
> 
> Does anybody have any thoughts/comments/suggestions/caveats on this approach?

http://cgit.openembedded.org/cgit.cgi/openembedded/tree/conf/distro/angstrom-2008.1-legacy.conf
was created just for a situation like this :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD4DBQFL69AKMkyGM64RGpERApU/AJitrZV3MNfMkLQF2vXH2j5IbaCWAJsG4cjI
xhiqy+KxaSqRnT/dXn+kZA==
=Kdlz
-----END PGP SIGNATURE-----



