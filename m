Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R61c1-0008BZ-Dh for openembedded-devel@lists.openembedded.org;
	Tue, 20 Sep 2011 16:47:53 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R61Wv-0003xp-Jm for openembedded-devel@lists.openembedded.org;
	Tue, 20 Sep 2011 16:42:37 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2011 16:42:37 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2011 16:42:37 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 20 Sep 2011 16:42:19 +0200
Message-ID: <j5a8ob$49g$1@dough.gmane.org>
References: <1316384457-23718-1-git-send-email-dbaryshkov@gmail.com>
	<1316384457-23718-2-git-send-email-dbaryshkov@gmail.com>
	<1316529245.3510.85.camel@phil-desktop>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <1316529245.3510.85.camel@phil-desktop>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-micro 2/2] sane-feed.inc: rework FEED_ARCH settings
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
X-List-Received-Date: Tue, 20 Sep 2011 14:47:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-09-11 16:34, Phil Blundell schreef:
> On Mon, 2011-09-19 at 02:20 +0400, Dmitry Eremin-Solenikov wrote:
>> Currently meta-micro's sane-feed.inc file is full of per-machine 
>> substitutions for FEED_ARCH. At best this is redundant (armv5te 
>> machines). Even worse, some settings are plain wrong (arm-oabi boxes 
>> come to mind). So instead of big per-machien table, use TUNE_PKGARCH
>> as it's done in meta-angstrom.
> 
> It's not actually obvious to me that this FEED_ARCH is serving any useful
> purpose here.  I'm inclined to just delete sane-feed.inc altogether
> unless you know a reason why it is useful to keep it.

sane-feed.inc was create by people copy/pasting from angstrom.conf without
knowing what they were doing. AFAIK, it is just dead weight nowadays,
especially in the oe-core universe.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOeKZLMkyGM64RGpERApbSAJ0WuXKxCTtLpOeO5dWFW8xN6sItAQCfbU1+
7j9hh6yodJCfcdgEcg0o8tM=
=VXDX
-----END PGP SIGNATURE-----



