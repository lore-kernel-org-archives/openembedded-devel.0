Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OKWS3-0006QR-9x
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 14:56:57 +0200
Received: by gwb15 with SMTP id 15so835047gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 05:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=RdDpqUGtmOVwARx+EqcZpzcKG4Qir3bOc9q4G3wmNNM=;
	b=cNLRXo3u/Iuyy0dx8VEuZP7wXOdVvRoj90moNOB1JSp3PLEPHHgWsupVVEPQki0FL6
	9S3qH6CYNCeYQ9wd0AJ/pNYoy+GFXTT/xI5y/FSgMzOt5eEWC+8V//Qj54eWyfUTJ/XM
	iqgh1yREK4/eaIZyMP0xwnu5/VnYwD6hQ4940=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=tjWcIKMmsyzwaoR0qr0EVQikNGUa1ZyNTwwMubIEgYoZlKWxMjRgf/mAoe9sPD3qRP
	MJr4Hb0arSEfuGexU2ZVfxAo05hi/ENkF97AypHTkAyTOhZBp0HM7sO26N2P4qfTzMQe
	xYlzEt8SQyq0HVW/IpbTlhkR7f8pWqNzwlbE8=
MIME-Version: 1.0
Received: by 10.90.48.19 with SMTP id v19mr4635595agv.132.1275655943218; Fri, 
	04 Jun 2010 05:52:23 -0700 (PDT)
Received: by 10.90.88.14 with HTTP; Fri, 4 Jun 2010 05:52:23 -0700 (PDT)
Date: Fri, 4 Jun 2010 14:52:23 +0200
Message-ID: <AANLkTikyR0VhEu_Ex4JcaJ1bDHLK2Rh6NyVF801VtlVy@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] Rename url params patch=<ignored>/pnum=<n> to apply={yes, no}/striplevel=<n>
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
X-List-Received-Date: Fri, 04 Jun 2010 12:56:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Apologies for not replying to the original message, but that one is
already deleted.

Just bumped into this after doing a pull.

A few comments:

I would suggest if doing something like this that it is announced
somewhat more explictly so people are well aware of it. Since it was
brought as a patch it escaped my attention, and in fact it is not only
a patch but also a change of policy.

Also I'd like to suggest to complete the change by also updating the
manual, otherwise this could become confusing.

Most recipes are updated, but a few are apparently not.
This is a grep on a git pull of yesterday (or maybe 1.5 day ago):

frans@frans:~/workspace/nios2/openembedded.git$ grep -r ";patch" recipes
recipes/m4/m4_1.4.14.bb:SRC_URI += "file://f13-compile.patch;patch=1"
recipes/udev/udev_092.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
recipes/udev/udev_092.bb:	    file://flags.patch;patch=1 \
recipes/udev/udev_092.bb:	    file://udevsynthesize.patch;patch=1 \
recipes/udev/udev_092.bb:            file://arm_inotify_fix.patch;patch=1 \
recipes/udev/udev_092.bb:	    file://mtd-exclude-persistent.patch;patch=1 \
recipes/udev/udev_100.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
recipes/udev/udev_100.bb:	    file://flags.patch;patch=1 \
recipes/udev/udev_100.bb:	    file://mtd-exclude-persistent.patch;patch=1 \
recipes/udev/udev_097.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
recipes/udev/udev_097.bb:	    file://flags.patch;patch=1 \
recipes/ti/matrix-gui_svn.bb:
file://0001-Disable-cursor-override-for-X11.patch;patch=1 \
recipes/mplayer/mplayer_0.0+1.0rc2.bb:
file://w100-mplayer.patch;patch= \

Frans.


