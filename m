Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1OCVKK-0003zR-4Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 12:07:36 +0200
Received: by fxm11 with SMTP id 11so1031214fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=rm80DQiEJyEezCXsheFKWeMmV67vJ5o24Q9LgoA7r4c=;
	b=LSiqpwvc42DpVvhHBKQ9VHwfUVVHelumv2dUJ3Ae3iabOzOv1Pqs0mq2QlntHXY5jl
	kRtNxYv6QyiLfQ8NIeSFS5rt0/O7hh7BvgJqJ7hmREfWPuntazUUhinqsRl+HyhuPkUd
	2236JeSZA06g853wybkXKMB2H3GXbruBHe26E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Es5LlMCZNYePknNpMlz/m8es1Irri9Ce8blrW77gbbiuQ9a5slYsBV3hmYfR4w1Xhj
	eDitA1INP/Jx+8l9e8UO0PlDDZgUpFMtHpgJdkv4Ke09Wsiom2fkBf5lFuUDeiWsxYXg
	CxITDw73bLujGrW6NDiJpc0Dy48I8EXCqVC5A=
MIME-Version: 1.0
Received: by 10.239.131.78 with SMTP id 14mr882475hbm.7.1273745020423; Thu, 13 
	May 2010 03:03:40 -0700 (PDT)
Received: by 10.239.169.17 with HTTP; Thu, 13 May 2010 03:03:40 -0700 (PDT)
Date: Thu, 13 May 2010 12:03:40 +0200
Message-ID: <AANLkTinbdSQqop_YbzlaGsWGQllBIrq5w-l4WPqUReW6@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: udev static
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
X-List-Received-Date: Thu, 13 May 2010 10:07:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Using udev 141 in nfs I had frequently a very long delay after the message
"Starting udev".
If I do a ctrl-c the system goes on.
But sometimes there are some devices lacking, obviously.

So I look inside udev and I saw many udev rules in /etc/udev/rules.d
directory.

I know that Angstrom is focused for a general purpose usage, but in my
embedded case I don't need it and I prefer a quick boot with fix devices
create.
What I'll need is to trigger automount of usb serial, SD card, usb pen, and
similar things.
So I have modified udev to populate, similarly to udev-static-devices.bb,
the /dev directory mounted.
I also notice the DEVCACHE functionality, that it seems a little bit
dangerouse in my case.
My idea is to create a new recipe, named udev-static, in which I'll use
udev-static-device and than I'll put only some rule as example using RUN
udev function.

It is a good idea?
Thanks.
Raffaele

