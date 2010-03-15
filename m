Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nr62J-0005ve-DA for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 09:52:31 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nr5zP-0003HI-KA for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 09:49:31 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 09:49:31 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 09:49:31 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 15 Mar 2010 09:49:21 +0100
Message-ID: <hnksah$k9i$1@dough.gmane.org>
References: <1268609353-31224-1-git-send-email-ulf.samuelsson@atmel.com>	<201003150733.48704.marcin@juszkiewicz.com.pl>
	<4B9DD9D9.90909@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <4B9DD9D9.90909@atmel.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/1] alsa-state: Add support for at91 boards
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
X-List-Received-Date: Mon, 15 Mar 2010 08:52:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-03-10 07:55, Ulf Samuelsson wrote:
> Marcin Juszkiewicz skrev:
>> Dnia poniedziałek, 15 marca 2010 o 00:29:13 Ulf Samuelsson napisał(a):
>>> Add ALSA configuration files for at91 boards
>>
>> Add bump PR of alsa-state and I will push such version.
>>
>> Regards, 
> OK.
> 
> Base on your comment on linux, I will change to have a common directory
> as well, but is there a smarter way?
> 
> What I'd often like to do is to have one directory
> for a group of machines.
> 
> So instead of:
> ++++++++++++++++++++++++++
> FILES_XXX = " <Something> "
> 
> SRC_URI_at91sam92620ek = ${FILES_XXX}
> SRC_URI_at91sam92621ek = ${FILES_XXX}
> SRC_URI_at91sam92623ek = ${FILES_XXX}
> ------------------------
> I'd like to do:
> -----------------------------
> SRC_URI_at91 = " <Something> "
> +++++++++++++++++++++++++++++

Add SOC_CLASS = "at91" to the common machine include file and then you
can do what you describe.

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLnfSRMkyGM64RGpERAuFAAJ4ntmOYBWYBRR7aW+UKHeKPBdLLFwCgvGzf
pKg3Xjoun2tOzPOD6M4tRbI=
=TSC1
-----END PGP SIGNATURE-----



