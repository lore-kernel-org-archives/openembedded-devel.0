Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RWXEa-0000ag-El
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 18:49:16 +0100
Received: by bkbzv15 with SMTP id zv15so3346992bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 09:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type;
	bh=qcEk8rtm/enymj11IHhemFy3g0ZwjCInSDsxueepZQQ=;
	b=qdXroHdR1SdP6C2QzEsZZbRGex38PTgqA7pQw4HdxKPLzgjd8Zdmxu1BKbSQIEYhWA
	zWpiKsoMNJUq2SjIZpHhvaVLzpSyJlngE+G7zQl6NFFIHjCo4Av3eYRetro/egFhJhJq
	XHdpBbrwlH5C+sjaihee8DCoknpT34q4kltjE=
Received: by 10.205.127.135 with SMTP id ha7mr11734775bkc.3.1322847753856;
	Fri, 02 Dec 2011 09:42:33 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id jf4sm18321028bkc.5.2011.12.02.09.42.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 09:42:33 -0800 (PST)
Message-ID: <4ED90E03.5000907@googlemail.com>
Date: Fri, 02 Dec 2011 17:42:27 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4ED8307F.2060306@googlemail.com>
	<4ED8DBC7.6080708@googlemail.com>	<20111202145256.GD3770@jama.jama.net>
	<201112021827.55821.GNUtoo@no-log.org>
In-Reply-To: <201112021827.55821.GNUtoo@no-log.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: fso-console-image problems
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
X-List-Received-Date: Fri, 02 Dec 2011 17:49:16 -0000
Content-Type: multipart/mixed; boundary="------------020305030000010307010709"

--------------020305030000010307010709
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> The framebuffer console was disabled in the kernel because it could make the 
> phone freeze when Xorg stopped...
>   
Should I refrain from attempting what JaMa suggested then?

On a separate note, I just checked my "fso-consol-image" inittab file 
and the last statement there is indeed as JaMa suggested: 
"1:2345:respawn:/sbin/getty 38400 tty1"

I am attaching the complete inittab file (hope the mailing list daemon 
won't mind!). I tried running at level 3 (changed the 5 in 
id:5:initdefault: to 3), but no luck there either - the same 
black-and-white stripes screen and that is it...

# /etc/inittab: init(8) configuration.
# $Id: inittab,v 1.91 2002/01/25 13:35:21 miquels Exp $

# The default runlevel.
id:5:initdefault:

# Boot-time system configuration/initialization script.
# This is run first except when booting in emergency (-b) mode.
si::sysinit:/etc/init.d/rcS

# What to do in single-user mode.
~~:S:wait:/sbin/sulogin

# /etc/init.d executes the S and K scripts upon change
# of runlevel.
#
# Runlevel 0 is halt.
# Runlevel 1 is single-user.
# Runlevels 2-5 are multi-user.
# Runlevel 6 is reboot.

l0:0:wait:/etc/init.d/rc 0
l1:1:wait:/etc/init.d/rc 1
l2:2:wait:/etc/init.d/rc 2
l3:3:wait:/etc/init.d/rc 3
l4:4:wait:/etc/init.d/rc 4
l5:5:wait:/etc/init.d/rc 5
l6:6:wait:/etc/init.d/rc 6
# Normally not reached, but fallthrough in case of emergency.
z6:6:respawn:/sbin/sulogin
# /sbin/getty invocations for the runlevels.
#
# The "id" field MUST be the same as the last
# characters of the device (after "tty").
#
# Format:
#  <id>:<runlevels>:<action>:<process>
#

1:2345:respawn:/sbin/getty 38400 tty1


--------------020305030000010307010709--
