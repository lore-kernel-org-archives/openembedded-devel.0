Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZLpi-00078O-N5
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 08:57:12 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZLnj-0000HK-ED
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 07:55:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 07:55:03 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 07:55:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Wed, 12 Mar 2008 08:54:56 +0100
Message-ID: <fr828g$l2n$1@ger.gmane.org>
References: <200803120827.29003.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803120827.29003.zecke@selfish.org>
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
X-List-Received-Date: Wed, 12 Mar 2008 07:57:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
| Hey,
| I was a bit stupid and fought with this issue:
|
| do_compile_prepend() {
| 	sed -i s,/usr/include,${STAGING_INCDIR},g Makefile
| }
|
|
| What is wrong with this? STAGING_INCDIR is now ending with
/usr/include. I
| have grepped through our bb files and searched for this and found
quite some
| files doing this.
|
| How to tackle this issue:
| 	a) Fix the autotools/Makefile.am to not have $(includedir) there

If that was the case, the sed would have been:

(from gimp.inc)
do_configure_append() {
~    find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
}

AFAIK s,/usr/include,${STAGING_INCDIR},g is used for recipe using
binconfig based stuff.

| 	b) change the sed to be 'absolute' -I/usr/include

sed -i s,/usr/include,/usr/include,g Makefile or sed -i
s,${STAGING_INCDIR},/usr/include,g ?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH14xQMkyGM64RGpERArQaAKC9MsEXrAe3YNXpcfgdnf0+BdRMQACeKv5G
AkGFBZ675yCmWLocZvG2tTE=
=KGYe
-----END PGP SIGNATURE-----



