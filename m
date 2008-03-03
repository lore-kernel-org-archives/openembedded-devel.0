Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JWA5e-0001iu-4l
	for openembedded-devel@openembedded.org; Mon, 03 Mar 2008 13:48:24 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JWA4R-00047H-DT
	for openembedded-devel@openembedded.org; Mon, 03 Mar 2008 12:47:07 +0000
Received: from wlan138026.mobiel.utwente.nl ([130.89.138.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 03 Mar 2008 12:47:07 +0000
Received: from koen by wlan138026.mobiel.utwente.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 03 Mar 2008 12:47:07 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Mon, 03 Mar 2008 13:46:58 +0100
Message-ID: <fqgs03$f44$1@ger.gmane.org>
References: <1204303564.8126.38.camel@dax.rpnet.com>	<200803030207.40083.zecke@selfish.org>	<1204537079.8095.19.camel@dax.rpnet.com>
	<200803031312.15859.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: wlan138026.mobiel.utwente.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803031312.15859.zecke@selfish.org>
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
X-List-Received-Date: Mon, 03 Mar 2008 12:48:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
| On Monday 03 March 2008 10:37:59 Richard Purdie wrote:

|> Having looked at some old parts of the metadata when fixing up staging
|> references, we already have a ton of broken .bb files :(. I was really
|> disappointed with the quality in some areas and I honestly don't know
|> what to do about this.
|
| There is proposal to start with an empty repository and move things over,
| testing and compiling world, clean up weekends.... more review on
checking
| things in.

The previous consensus to that proposal was "we should be able to do
cleanups in-place". I still think we should start such a branch where we
can do the clean up while retaining the history. Those cleanups would
consist of:

a) basic janitorial stuff:

* running the recipe through oe-stylize.py and fix accordingly
* document patches (origin, upstream status, etc)
* restucrure FILESDIR to avoid duplicate files (e.g. files/foo.patch
bar-1.0/foo.patch, etc)

b) updating to OE standards

* Replace custom methods with standards ones where appropriate (e.g.
do_stage() -> autotools_stage_all
* document remaining custom methods (e.g. do_configure_append sed magic)
* sanitize PACKAGES and FILES
* sanitize overrides (e.g. fix all the CONFFILES_nylon stuff)

c) unit testing

* compile for different archs
* run through insane

Regardless if we create a branch for that or not, we should declare a
freeze for e.g. 3 months where only bugfixes and cleanups are allowed to
be checked in.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHy/NCMkyGM64RGpERAkjlAJ9GgDhax6XcSE0kQja3za3fxK8e6wCZAdba
6G2Uq14grE9WgmwjTfjqGMs=
=vD/7
-----END PGP SIGNATURE-----



