Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qz2BT-0007oW-De for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 09:59:35 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qz26h-0004pv-Qa for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 09:54:39 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 09:54:39 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 09:54:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 01 Sep 2011 09:54:27 +0200
Message-ID: <j3ndnj$jgp$1@dough.gmane.org>
References: <201108310825.16407.schnitzeltony@gmx.de>
	<201109010055.14620.schnitzeltony@gmx.de>
	<alpine.DEB.2.00.1109010849170.15634@entw48>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <alpine.DEB.2.00.1109010849170.15634@entw48>
X-Enigmail-Version: 1.3.1
Subject: Re: meta-oe: midori build fails with linker error
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
X-List-Received-Date: Thu, 01 Sep 2011 07:59:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-09-11 08:50, Bernhard Guillon schreef:
> 
> 
> On Wed, 31 Aug 2011, Andreas Müller wrote:
> 
>> On Wednesday, August 31, 2011 08:25:16 AM Andreas Müller wrote: [...]
>>> angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/ld:
>>> note: 'JSContextGetGlobalObject' is defined in DSO
>>> /home/Superandy/tmp/oe-core- 
>>> eglibc/sysroots/overo/usr/lib/libjavascriptcoregtk-1.0.so.0 so try
>>> adding it to the linker command line
>>> 
>>> | /home/Superandy/tmp/oe-core-
>>> 
>>> eglibc/sysroots/overo/usr/lib/libjavascriptcoregtk-1.0.so.0: could
>>> not read symbols: Invalid operation
>>> 
>>> | collect2: ld returned 1 exit status
>> we are not alone [1]...
>> 
>> Andreas
>> 
>> [1] https://bugs.launchpad.net/midori/+bug/799196
>> 
> 
> Hi,
> 
> LDFLAGS_append = " -ljavascriptcoregtk-1.0 "
> 
> should do the work.

That leads to |
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/midori-0.3.6-r1/midori-0.3.6/_build_/../midori/midori-view.c:4503:
undefined reference to `webkit_web_view_get_selected_text'

Same with 0.4.0, so midori needs to get updated for a more recent webkit.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOXzozMkyGM64RGpERAhN3AJ4zqyuRWbHgbSMcXJ3zfIuee16JlgCfWH4x
Rjk2Pl1cSAM3NT5TeQkmsco=
=NtME
-----END PGP SIGNATURE-----



