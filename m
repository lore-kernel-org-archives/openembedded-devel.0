Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZLuX-0007GA-TK
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 09:02:10 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JZLsY-0000TV-KA
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 08:00:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 08:00:02 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 08:00:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Wed, 12 Mar 2008 08:59:47 +0100
Message-ID: <fr82hj$l2n$2@ger.gmane.org>
References: <200803120827.29003.zecke@selfish.org> <fr828g$l2n$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <fr828g$l2n$1@ger.gmane.org>
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
Subject: Re: staging ABI changes and broken idium
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
X-List-Received-Date: Wed, 12 Mar 2008 08:02:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
| Holger Freyther schreef:
| | Hey,
| | I was a bit stupid and fought with this issue:
| |
| | do_compile_prepend() {
| | 	sed -i s,/usr/include,${STAGING_INCDIR},g Makefile
| | }
| |
| |
| | What is wrong with this? STAGING_INCDIR is now ending with
| /usr/include. I
| | have grepped through our bb files and searched for this and found
| quite some
| | files doing this.
| |
| | How to tackle this issue:
| | 	a) Fix the autotools/Makefile.am to not have $(includedir) there
|
| If that was the case, the sed would have been:
|
| (from gimp.inc)
| do_configure_append() {
| ~    find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
| }

Switching on my brain, the above isn't needed anymore, right?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH141zMkyGM64RGpERAsJyAJoCeDv9wn+e+CEEfDS/IluJeebXiACgvGac
Y7d//G8OIotQHTTcfTmVBSU=
=U397
-----END PGP SIGNATURE-----



