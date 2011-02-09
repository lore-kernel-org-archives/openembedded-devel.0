Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PnA7Q-0007pq-M5 for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 14:30:04 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PnA6P-00030H-Cc for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 14:29:01 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 14:29:01 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 14:29:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 09 Feb 2011 14:28:43 +0100
Message-ID: <iiu4qb$8st$1@dough.gmane.org>
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>	<201102091039.27832.marcin@juszkiewicz.com.pl>
	<AANLkTikDHBWTnf2S3j-P9_rpscdRQ7GZHVxrNLbLCXZW@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <AANLkTikDHBWTnf2S3j-P9_rpscdRQ7GZHVxrNLbLCXZW@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in PACKAGES
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
X-List-Received-Date: Wed, 09 Feb 2011 13:30:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-02-11 13:59, Filip Zyzniewski wrote:
> On 2/9/11, Marcin Juszkiewicz <marcin@juszkiewicz.com.pl> wrote:
> 
>> This change is bogus. You just remove building of BT/Wifi support for
>> "bitbake
>> bootstrap-image" for your machine not distro. Use DISTRO_FEATURES instead
>> and
>> then remove "bluetooth wifi" from DISTRO_FEATURES in your distribution
>> config
>> file.
> 
> The whole point of this patch is to make task-base honour features.
> Without this change bluez (and in consequence avahi, gstreamer, gtk, x
> libs) gets built regardless of features setting.

That's the whole point of task-base, to get things built. You can then
use machine_features to install them by default or not.

Again, noone is forcing you to use task-base, so no need to break it for
everyone else like your patch is doing.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNUpaKMkyGM64RGpERAh8jAJ4koJrmIpHfs5Eklx/gPg7xE/gMAACfTfTo
kfLoxrXxxbVx4DU/u5P4TU4=
=fOfI
-----END PGP SIGNATURE-----



