Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JYlTE-0005Ay-Gn
	for openembedded-devel@openembedded.org; Mon, 10 Mar 2008 18:07:38 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JYlCM-0006QL-8A
	for openembedded-devel@openembedded.org; Mon, 10 Mar 2008 16:50:02 +0000
Received: from wlan143218.mobiel.utwente.nl ([130.89.143.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 10 Mar 2008 16:50:02 +0000
Received: from koen by wlan143218.mobiel.utwente.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 10 Mar 2008 16:50:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Mon, 10 Mar 2008 17:48:22 +0100
Message-ID: <fr3oom$clq$1@ger.gmane.org>
References: <c384c5ea0803091149g321e7086qec5b54499c7ecbc@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: wlan143218.mobiel.utwente.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <c384c5ea0803091149g321e7086qec5b54499c7ecbc@mail.gmail.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc-cross-initial.inc DEPENDS on libc-initial, but why conditionally on TARGET_ARCH?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Mar 2008 17:07:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
| Hello,
|
| OE toolchain question: any reason why the list below includes arm*,
| mips* but nothing else?
|
| gcc-cross-initial.inc:
|
| DEPENDS = "virtual/${TARGET_PREFIX}binutils"
| DEPENDS +=
"${@['virtual/${TARGET_PREFIX}libc-initial',''][bb.data.getVar('TARGET_ARCH',
| d, 1) in ['arm', 'armeb', 'mips', 'mipsel']]}"
| PROVIDES = "virtual/${TARGET_PREFIX}gcc-initial"
| PACKAGES = ""
|
| (I'm tracking down a parallel make issue, this seems to cause/trigger
| it as I build for powerpc).

I think that's because we only supported nptl for arm and mips when the
earth was still young and glibc even nastier than today. I asked this
before and never got a conclusive answer :(

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH1WZWMkyGM64RGpERAiclAKC86eWW8nzBnK7qXIsSnpRbdifdZQCeL2fV
LJmhpyxT15Hm854ErQYmJtg=
=9ahN
-----END PGP SIGNATURE-----



