Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QVAUJ-0001W6-QJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Jun 2011 00:47:35 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QVAR5-0005N6-Gm from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jun 2011 15:44:15 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 10 Jun 2011 15:44:15 -0700
Received: from [172.30.36.148] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 10 Jun 2011 15:44:14 -0700
Message-ID: <4DF29E37.9020204@mentor.com>
Date: Fri, 10 Jun 2011 15:44:07 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1307713686-30844-1-git-send-email-gchiii@mtiemail.com>
In-Reply-To: <1307713686-30844-1-git-send-email-gchiii@mtiemail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 10 Jun 2011 22:44:15.0375 (UTC)
	FILETIME=[ECE7C1F0:01CC27BF]
Subject: Re: [2011.03-maintenance] fakeroot: Move from not fetchable 1.14.5	to 1.15.1
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
X-List-Received-Date: Fri, 10 Jun 2011 22:47:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06/10/2011 06:48 AM, George C. Huntington III wrote:
> From: Florian Boor <florian.boor@kernelconcepts.de>
> 
> Fakeroot 1.14.5 was not fetchable any more. Updating to 1.15.1.
> 
> Test environment:
>     BB_VERSION        = "1.10.2"
>     METADATA_BRANCH   = "org.openembedded.dev"
>     TARGET_ARCH       = "arm"
>     TARGET_OS         = "linux-gnueabi"
>     MACHINE           = "mainstone"
>     DISTRO            = "minimal"
>     DISTRO_VERSION    = "dev-snapshot-20110504"
>     TARGET_FPU        = "soft"
> 
> Signed-off-by: Florian Boor <florian.boor@kernelconcepts.de>

For 2011.03-maintenance I'm going to NAK this.  A mirror setup is
required as we aren't trying to keep up to date with the tzdata/tzcode
mess and these are available via the angstrom mirror (and if needed
could be put on the regular OE mirror).  Thanks for your interest in the
stable branch, all the same!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJN8p4uAAoJEI4NMjfc3nJxBFQH/3V2UzwjerwjMX2fWcRfAyBC
Gbm0uVhc81JmO1csGyXkVsm8iNURI0sNvq+bvOJ/ZKOgaFcITuTjWPhhM5rUYPC/
bt2X8w6s996FISA0BewfTg3c+znf3ybfH+s5aecEyT81FpbiBeKnhiQ+suQHagOR
f9Ev/DsWGko5PQYRXQNxcHXouw+tT+JSt6+0jSr2qZD1vEr8GC5iuwpjIAuC32ja
0mKvNBhrk5mE1RTC7LozRIqJQbGl3GqDnyvm5I4AUGRsR9r5M6M5D2+6sAGv1JJH
aamhmSXND5NfJgmrETQNXL5AAhDCfxy958s4SPRGmf+StAn8Sr15pqEaigJoGkY=
=mMob
-----END PGP SIGNATURE-----


