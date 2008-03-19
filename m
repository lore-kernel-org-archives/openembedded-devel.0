Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jbvz1-00052j-0t
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 11:57:24 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jbvyu-0008Nx-Fb
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 10:57:16 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 10:57:16 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 10:57:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Wed, 19 Mar 2008 11:57:05 +0100
Message-ID: <frqri1$9l5$1@ger.gmane.org>
References: <200803182311.01445.zecke@selfish.org> <frpftj$p9s$1@ger.gmane.org>
	<200803191143.05167.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803191143.05167.zecke@selfish.org>
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
Subject: Re: The tzdata package and a bug with tzdata-dbg
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
X-List-Received-Date: Wed, 19 Mar 2008 10:57:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
| On Tuesday 18 March 2008 23:32:18 Koen Kooi wrote:
| Hey Koen,
| thanks for the fast answer
|
|
|> Yes: Change RPROVIDES = "foo" to RPROVIDES_<package> and bump PR.
| Yes, this part is obvious. Now to the hard part tzdata-dbg has no
content, now
| that the RPROVIDES are different the tzdata-dbg package will be gone.

It won't, unless you removed this from bitbake.conf:

ALLOW_EMPTY_${PN}-dbg = "1"

| The
| tricky question is:
|
| 	ipkg update
| 	ipkg upgrade

opkg ;)

|
|
| tzdata-dbg should be gone, tzdata should be installed. How to achieve
this? My
| attempt was to have an empty tzdata-dbg package that is not providing
tzdata
| anymore, so on update ipkg should try to install tzdata again....

That should work with opkg. But in your case (OM), bump PR on eds-dbus
to make sure tzdata gets pulled in.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH4PGBMkyGM64RGpERAgpUAJ9nDVIXVXSJnHr3iWJw4de8RrLVPwCgkAX1
scmEducy/7eUqpLJkCn7Zdo=
=Xw9a
-----END PGP SIGNATURE-----



