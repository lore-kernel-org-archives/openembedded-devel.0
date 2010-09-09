Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OtlsY-0007Wq-KW for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 20:29:47 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Otlrr-0000In-I6 for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 20:29:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 20:29:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 20:29:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 09 Sep 2010 20:28:50 +0200
Message-ID: <i6b912$snb$1@dough.gmane.org>
References: <1284034317-9428-1-git-send-email-eric@eukrea.com>	<i6atdj$5b0$1@dough.gmane.org>
	<4C88FA2F.1030206@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <4C88FA2F.1030206@eukrea.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] fix bitbake ERRORS for machine not having virtual/egl
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
X-List-Received-Date: Thu, 09 Sep 2010 18:29:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-09-10 17:15, Eric Bénard wrote:
> Hi Koen,
> 
> Le 09/09/2010 17:10, Koen Kooi a écrit :
> On 09-09-10 14:11, Eric Bénard wrote:
>>> * This patch creates a egl.inc which contains the compatible machines
>>> for
>>> recipes depending on virtual/egl and thus will workaround this error.
>>
>> The intent is good, but I have to NAK this for the time being.
>>
>> Could you change that to use:
>>
>> COMPATIBLE_MACHINE = "omap3"?
>>
> in egl.inc ?
> Should this also be changed in powervr-drivers/libgles-omap.inc ?
> 
> Then, how do you handle omap3 machines which don't have GLES engine (ex
> OMAP3503) ?

That's handled by the initscript:
http://gitorious.org/angstrom/openembedded/blobs/org.openembedded.dev/recipes/powervr-drivers/libgles-omap3/rc.pvr#line33

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMiSdiMkyGM64RGpERAgZ9AKCc8SaPq3w9pL5ZC/vMFgo9mdv05ACgn7CM
rBtN/3iHVSWLrI5nUy3Grm4=
=1czF
-----END PGP SIGNATURE-----



