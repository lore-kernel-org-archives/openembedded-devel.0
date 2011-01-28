Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Piuir-0005gM-7Z for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 21:15:09 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Piui5-0002io-9Z for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 21:14:21 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 21:14:20 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 21:14:20 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 28 Jan 2011 21:14:04 +0100
Message-ID: <ihv82c$oqa$1@dough.gmane.org>
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 0/5] Relocatable perl-native and use it always
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
X-List-Received-Date: Fri, 28 Jan 2011 20:15:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-01-11 19:52, Tom Rini wrote:
> Hey all,
> 
> As I've talked about before[1] there's build reproducibility issues
> depending on when perl-native is built.  After talking with Mark Hatle
> a little bit I started thinking about relocation in perl again and it
> turns out that starting in 5.10, upstream perl supports relocation.
> 
> This in turn makes it less painful to make perl-native be what we use
> when we want perl runtime, nearly everywhere (since you can use pstaging
> to avoid it the time next time).
> 
> This patch set drops perl 5.8.8 and bumps all of the perl stuffs PR,
> switches to relocatable perl-native, and then the big switch to using it
> early.
> 
> Build tested on {minimal+qemuarm,angstrom-2008.1+beagleboard}+all perl
> libs and run tested on minimal+qemuarm+native-sdk-image.
> 
> [1]: http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg08445.html
> 

For the whole series:

Acked-by: Koen Kooi <koen@openembedded.org>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNQyOLMkyGM64RGpERAltCAJ9vQdJgCWD/2XHjOazvg+h3H/FZTwCfTCuh
K6C18dk2vTBigsLz0yuG+0g=
=9jnw
-----END PGP SIGNATURE-----



