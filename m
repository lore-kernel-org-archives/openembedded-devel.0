Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JXFhi-0003AK-MC
	for openembedded-devel@openembedded.org; Thu, 06 Mar 2008 14:01:52 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JXFgG-0006rZ-Gg
	for openembedded-devel@openembedded.org; Thu, 06 Mar 2008 12:58:40 +0000
Received: from wlan140002.mobiel.utwente.nl ([130.89.140.2])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 06 Mar 2008 12:58:40 +0000
Received: from koen by wlan140002.mobiel.utwente.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 06 Mar 2008 12:58:40 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Thu, 06 Mar 2008 13:58:32 +0100
Message-ID: <fqoppp$2c9$1@ger.gmane.org>
References: <1204303564.8126.38.camel@dax.rpnet.com>	<47CD7E84.9010603@student.utwente.nl>
	<1204807332.8034.0.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: wlan140002.mobiel.utwente.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <1204807332.8034.0.camel@dax.rpnet.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Staging ABI Change Warning
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
X-List-Received-Date: Thu, 06 Mar 2008 13:02:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
| On Tue, 2008-03-04 at 17:53 +0100, Koen Kooi wrote:
|> Richard Purdie schreef:
|> | Hi,
|> |
|> | OE.dev is now just about ready to switch to using sysroot. The
compilers
|> | have been updated to activate sysroot and the fixes I/Poky have for
|> | various pkgconfig issues have been committed. The final change is to
|> | actually change the layout.
|> |
|> | I've attached the patch I have locally for doing this. Since it changes
|> | the layout of staging I've gone for changing the ABI and warning users
|> | using the newly added mechanism.
|> |
|> | insane.bbclass will warn about potentially problematic .pc files and I
|> | suspect a few people will hit that since there are a lot of broken ones
|> | around. I'll give a summary of the problem and the way to solve it:
|>
|> When are we going to make insane halt on .la files referring to
|> ${WORKDIR}? Right now those are the biggest problem for packaged-staging
|> and rm_work.
|
| I don't remember seeing too many warnings about these? Are there many
| problematic packages?

Almost every native package suffers from it, which is why the efl stuff
fails, since that is needing the native evas, edje, etc tools.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHz+p4MkyGM64RGpERAqA+AKCIBCY03/myptRoMYuB5S1/KOoNrwCginMe
gD2gozgUxlmFAPcrPJEY/z0=
=uG24
-----END PGP SIGNATURE-----



