Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PQCfX-00048M-Fn
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 06:34:25 +0100
Received: by fxm11 with SMTP id 11so622655fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 21:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=uCm6aBAM1kw09j7xrSY4eKlQRqo5B0KwmEpD95HW7zQ=;
	b=oOMyd1BLTayIAkiIX9fuDS5evjtCeqx8xhBH5chs3hwc+c3Vwn8bDaVxQtXUySOXqJ
	Rev0nsoE/vIpMYS9Y9C6WB5SqS5DHDNuxHtH2sM1QMLSAHEx/B+MKN9g4AKFL7vrizB1
	SursH1E1pL0/cgbivnf9BYzVT7C4D44rUuCjU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=Oy99uEEDBTnw+3r0evwS9YKGVfNmS/UUYwW9PBH+WtTDuuc7lrY8T0XaocEbL8DlXI
	cegRPJ7Vo6dOupLksfmX5lWwLpk93/8yl2+CL5QMZgikCzSI28y/5hn0YmnxoTScznYA
	C0xBxEV5W/1phx8mvZlCqUk9O/ek0KLSeWEwo=
Received: by 10.223.74.11 with SMTP id s11mr8067380faj.2.1291786369606;
	Tue, 07 Dec 2010 21:32:49 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c11sm39289fav.26.2010.12.07.21.32.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Dec 2010 21:32:48 -0800 (PST)
Date: Wed, 8 Dec 2010 06:32:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101208053240.GD3186@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.42
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: glib-2.0_2.26.1 missing dependency on dbus
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
X-List-Received-Date: Wed, 08 Dec 2010 05:34:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

simply adding it to depends create circular dependency

bitbake@jama ~/dev/recipes $ grep glib dbus/dbus.inc 
DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"

dbus needs glib it only for dbus-viewer and builds ok without glib, so
I've removed glib-2.0 in dbus and added dbus to glib-2.0_2.26.1 and 
tried again...

These are usually caused by circular dependencies and any circular 
dependency chains found will be printed below. Increase the debug 
level to see a list of unbuildable tasks.

It didn't detect it.. so I had to find it manually:
bitbake@jama ~/dev/recipes $ grep glib dbus/dbus.inc
DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"

bitbake@jama ~/dev/recipes $ grep util-linux-ng xorg-lib/libsm_1.2.0.bb
DEPENDS += "libice xproto xtrans util-linux-ng"
bitbake@jama ~/dev/recipes $ grep udev util-linux-ng/util-linux-ng.inc
DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} udev  zlib ncurses virtual/libintl"
bitbake@jama ~/dev/recipes $ grep glib udev/udev_151.bb
# Needed for udev-extras
DEPENDS = "gperf-native usbutils acl glib-2.0"

util-linux-ng seems to build fine without udev but is there better place
to break this curcular dependency?

Regards,


