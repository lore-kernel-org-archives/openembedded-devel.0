Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RH0VV-0001RT-KX for openembedded-devel@lists.openembedded.org;
	Thu, 20 Oct 2011 23:50:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RH0Pp-00052T-Bd for openembedded-devel@lists.openembedded.org;
	Thu, 20 Oct 2011 23:44:41 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2011 23:44:41 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2011 23:44:41 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 20 Oct 2011 23:44:21 +0200
Message-ID: <j7q4nl$akr$1@dough.gmane.org>
References: <1319132705374102500@rkmorris.us> <4EA073C0.7000502@mlbassoc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <4EA073C0.7000502@mlbassoc.com>
X-Enigmail-Version: 1.3.2
Subject: Re: Machine Configuration
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
X-List-Received-Date: Thu, 20 Oct 2011 21:50:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-10-11 21:17, Gary Thomas schreef:
> On 2011-10-20 11:45, Russell Morris wrote:
>> Hi,
>> 
>> I am trying to do some builds for an am3517-evm ... but the machine 
>> configuration doesn't seem to be working (or I'm doing it wrong, more
>> likely ... :-().
>> 
>> I have successfully built console-image for qemuarm, and then use
>> oebb.sh to set the machine (to am3517-evm, followed bu ./oebb.sh
>> update) - but then when I try to build for this machine I see the
>> following ...
>> 
>> OE Build Configuration: BB_VERSION        = "1.13.3" TARGET_ARCH
>> = "arm" TARGET_OS         = "linux-gnueabi" MACHINE           =
>> "qemuarm" DISTRO            = "angstrom" DISTRO_VERSION    =
>> "v2011.10-core" TUNE_FEATURES     = "armv5 dsp thumb arm926ejs" 
>> TARGET_FPU        = "soft"
>> 
>> So it's still building for qemuarm, not am3517-evm ... :-(. Is anyone
>> else having this issue? Any suggestions of how to fix this?
> 
> You need to always specify MACHINE="am3517-evm" on your command line,
> e.g. % MACHINE="am3517-evm" bitbake systemd-image
> 
> Alternatively, you can add just a single line to conf/local.conf and then
> it will be "sticky"

not local.conf, auto.conf


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOoJY1MkyGM64RGpERAliKAKCfu0E2K3Qn+lsTx5YzNRgkxrA+QwCgqJjT
0ZsSMZCZArrGVc54VNa4dDA=
=zm3i
-----END PGP SIGNATURE-----



