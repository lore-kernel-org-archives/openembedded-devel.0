Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TNizh-0006qk-0o for openembedded-devel@lists.openembedded.org;
	Mon, 15 Oct 2012 13:38:01 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TNimy-0002n6-MI for openembedded-devel@lists.openembedded.org;
	Mon, 15 Oct 2012 13:24:52 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2012 13:24:52 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2012 13:24:52 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 15 Oct 2012 13:24:29 +0200
Message-ID: <k5grp9$6j5$1@ger.gmane.org>
References: <cover.1350062247.git.paul.eggleton@linux.intel.com>
	<3713695.RcKMCbUqi3@helios> <507BEAD5.8020302@linaro.org>
	<1973903.D9SRCPrtLZ@helios>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1973903.D9SRCPrtLZ@helios>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-webserver][PATCH 0/2] modphp fixes
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
X-List-Received-Date: Mon, 15 Oct 2012 11:38:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-10-12 12:59, Paul Eggleton schreef:
> On Monday 15 October 2012 12:52:05 Marcin Juszkiewicz wrote:
>> W dniu 12.10.2012 19:58, Paul Eggleton pisze:
>>> Looks like it thinks it's supposed to be producing static libraries
>>> for some reason - when I build here (for qemuarm at the moment) I
>>> have these files:
>>> 
>>> Not sure what would cause that specifically, but it's a clue at
>>> least.
>> 
>> Your do_configure did that. config.{sub,guess} were too old for
>> AArch64.
> 
> If you can make the build succeed without overriding do_configure, then
> please send patches. I didn't have any success with that the last time I
> tried it.

adding a gnu-confiigize --force should be same enough, right?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQe/JtMkyGM64RGpERAntLAJ9VramIDLwLDfdTd7XZLS0+45l0WgCfRdJl
wvR2aaU6t4/22x7kFLbaOs4=
=3Ftz
-----END PGP SIGNATURE-----



