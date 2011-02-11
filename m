Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pnq3X-0003YE-Ij for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 11:16:51 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pnq2S-0006c1-Ad for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 11:15:44 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 11:15:44 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 11:15:44 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 11 Feb 2011 11:15:32 +0100
Message-ID: <ij3284$ugp$1@dough.gmane.org>
References: <20110203093253.GG4580@excalibur.local>	<201102031054.08764.ml@vdm-design.de>
	<20110203101242.GF3265@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110203101242.GF3265@jama>
X-Enigmail-Version: 1.0.1
Subject: Re: libnl vs. libnl2 madness
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
X-List-Received-Date: Fri, 11 Feb 2011 10:16:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-02-11 11:12, Martin Jansa wrote:
> On Thu, Feb 03, 2011 at 10:54:08AM +0100, Thomas Zimmermann wrote:
>> On Thursday 03 February 2011 10:32:53 Stefan Schmidt wrote:
>>> Hello.
>>>
>>> The last hours I was trying to compile wpa_supplicant with nl80211 support.
>>> That needs netlink support through libnl or libnl2.
>>>
>>> Enabling the option to use libnl2, not that easy to find, still breaks with
>>> missing header files. Checking the libnl2 source shows that they are
>>> provided. After some head on the table banging I found:
>>>
>>> commit 880e00d3b7ccf66d9421a06bc28e553e07842b59
>>> Author: Michael 'Mickey' Lauer <mickey@vanille-media.de>
>>> Date:   Tue Nov 24 16:33:06 2009 +0000
>>>
>>>     libnl2: change includedir to not step over libnl1; also convert to new
>>> staging
>>
>> At that time there was just one recipe depending on libnl2 and that was FSO2.
>> I think one month ago JaMa has build the first SHR image without libnl(1), 
> 
> yes after couple of changes
> http://git.openembedded.org/cgit.cgi/openembedded/log/?h=org.openembedded.dev&qt=grep&q=libnl
> 
>> until then it was impossible because of some important parts. I'm not sure but 
>> i think the main blocker was bluez4 (Can't check now).
> 
> Yes older bluez4 with nl plugin (which was removed later).
> 
> and:
> http://gitorious.org/~jama/angstrom/jama-shr-experimental/commit/70b13d30b335b8fd67116d3bc0834382a77bc319

> 85	ANGSTROM_BLACKLIST_pn-iw = "iw depends on libnl we want libnl2"

That one was fixed

> 90	ANGSTROM_BLACKLIST_pn-rfkill = "rfkill depends on libnl we want libnl2"

That one was fixed as well

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNVQxEMkyGM64RGpERAtyqAJ9RH01ASiC4/BebDfkW4Vj/BdQiHACePQBQ
chy6qKs4vwoz7joQk0u/x9E=
=H06U
-----END PGP SIGNATURE-----



