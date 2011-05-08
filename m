Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIzRb-0006iV-LI for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 10:34:27 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIzOy-0007PI-WC for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 10:31:45 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 10:31:44 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 10:31:44 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 08 May 2011 10:31:32 +0200
Message-ID: <iq5kd4$gie$1@dough.gmane.org>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>	<1304806316-9716-1-git-send-email-otavio@ossystems.com.br>	<1304806316-9716-2-git-send-email-otavio@ossystems.com.br>	<1304806316-9716-3-git-send-email-otavio@ossystems.com.br>	<1304806316-9716-4-git-send-email-otavio@ossystems.com.br>	<1304806316-9716-5-git-send-email-otavio@ossystems.com.br>	<1304806316-9716-6-git-send-email-otavio@ossystems.com.br>	<iq4q32$e40$3@dough.gmane.org>
	<1304837421.4124.11.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1304837421.4124.11.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 6/8] p910nd: add 0.95 version
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
X-List-Received-Date: Sun, 08 May 2011 08:34:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-05-11 08:50, Paul Menzel wrote:
> Am Sonntag, den 08.05.2011, 03:02 +0200 schrieb Koen Kooi:
> 
> […]
> 
>>> +DESCRIPTION = "A small network printer daemon for embedded situations that passes the job directly to the printer."
>>> +SECTION = "console/utils"
> 
> This should be dropped, since it is redundant.
> 
>>> +HOMEPAGE = "http://p910nd.sourceforge.net/"
>>> +SECTION = "console/utils"
> 
> This is the correct location according to the style guide [1].
> 
>>> +RDEPENDS_${PN}-avahi = "avahi"
>>
>> Again, RDEPENDS go below do_install
> 
> When was this agreed on? The style guide says differently.

They go in the recipe the order they are used, so:

info (HOMEPAGE, DESCRIPTION, etc)
configure
compile
install
package

RDEPENDS/RRECOMMENDS/FILES/PACKAGES are all for packaging, so they are
grouped.

Have a look at the p910nd recipe, then you see why grouping them is best.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNxlTkMkyGM64RGpERArwnAKCS7EAMDfaLEUF+ucnrDx2skvQVrQCeOzUh
gJn1V8apsWuW68YCpECbaRA=
=H8n/
-----END PGP SIGNATURE-----



