Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pn9eX-0007QE-Gf
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 14:00:13 +0100
Received: by qwi2 with SMTP id 2so81590qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 04:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=MCEDoKPuS7CDusFAUVnQ8eOU+LO2e+P8fjPOaia88ZI=;
	b=bqCFjgOquKaGPvY6zK/apHm9G4YG26SpJR7ad3/9puOmbrOk+4Og9oFh49z0U1Z7f8
	o+wVLmdxz1xJH07eqjdhR9ahGzade9CsuFyaCJu9x7E1F7ZE1z0sBe+JhWI4sMo8PjBT
	i9vNKNSjWdy0LvTDca3bmaRQClWhk0qtHkTlE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=njvnQTuAN6TqETCxS+oxdpAeCnZAygs2VYIGrP1biPy0JMZrmA2pDRLbtGL2WLVsmY
	LcVTSw3dzF72uXATttT0+BC5d8C5yBYv9pxlAJAtcjE03rharSLYZTAXoLxQ+/qNO5Sq
	dKzACdmI+cUbbDtTNvkG5LXhXEFbZGInW/J7M=
MIME-Version: 1.0
Received: by 10.229.241.194 with SMTP id lf2mr14867791qcb.222.1297256349759;
	Wed, 09 Feb 2011 04:59:09 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Wed, 9 Feb 2011 04:59:09 -0800 (PST)
In-Reply-To: <201102091039.27832.marcin@juszkiewicz.com.pl>
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>
	<201102091039.27832.marcin@juszkiewicz.com.pl>
Date: Wed, 9 Feb 2011 13:59:09 +0100
Message-ID: <AANLkTikDHBWTnf2S3j-P9_rpscdRQ7GZHVxrNLbLCXZW@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 09 Feb 2011 13:00:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/9/11, Marcin Juszkiewicz <marcin@juszkiewicz.com.pl> wrote:

> This change is bogus. You just remove building of BT/Wifi support for
> "bitbake
> bootstrap-image" for your machine not distro. Use DISTRO_FEATURES instead
> and
> then remove "bluetooth wifi" from DISTRO_FEATURES in your distribution
> config
> file.

The whole point of this patch is to make task-base honour features.
Without this change bluez (and in consequence avahi, gstreamer, gtk, x
libs) gets built regardless of features setting.

> task-base was created several years ago as attempt to get something better
> then task-bootstrap which we used before. BT/Wifi part was done to have
> support for cf/usb/pci connected dongles/cards. And it worked fine but was
> not
> perfect.

Sure, but why not build it only when the distro/machine has bluetooth
in features?

bye,
Filip Zyzniewski


