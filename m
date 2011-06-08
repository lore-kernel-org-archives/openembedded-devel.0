Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QULEv-0001FI-7M for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 18:04:17 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QULBk-0001Fh-JT for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 18:01:00 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2011 18:01:00 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2011 18:01:00 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 08 Jun 2011 18:00:47 +0200
Message-ID: <iso6bf$lu8$1@dough.gmane.org>
References: <0C757E680E33864AB113392C7E83F910BE5183@GSX300A.mxchg.m.corp><1307534514.2529.4780.camel@phil-desktop><0C757E680E33864AB113392C7E83F910BE5185@GSX300A.mxchg.m.corp>	<1307535707.2529.4783.camel@phil-desktop>
	<0C757E680E33864AB113392C7E83F910BE5186@GSX300A.mxchg.m.corp>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE5186@GSX300A.mxchg.m.corp>
X-Enigmail-Version: 1.0.1
Subject: Re: Amend recipes which do not contain a (new) target machine in COMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 08 Jun 2011 16:04:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-06-11 17:46, Hauser, Wolfgang (external) wrote:
>> I guess you might not be able to append to COMPATIBLE_MACHINE from
>> amend.inc since amend.bbclass probably doesn't get run early enough.
>> But you should be able to use COMPATIBLE_MACHINE_append_pn-... in your
>> layer.conf, or COMPATIBLE_MACHINE += in a .bbappend file.  Are those
> not
>> working for you?
> 
> The .bbappend files don't work with bitbake version 1.10.2 which is
> required by OE release 2011.03.

Really? A default angstrom install will use bitbake 1.12.x and
2011.03-maintenances and that has been building perfectly for a while now.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN75yvMkyGM64RGpERAgudAJ0S7vkYWN+8ry/hH0Gmdkapt/jWSwCguypj
OJU3p2slcGv6ovKUtNDJhms=
=uD84
-----END PGP SIGNATURE-----



