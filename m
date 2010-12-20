Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUVs2-0002oJ-7w
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 03:53:06 +0100
Received: by pvd12 with SMTP id 12so515297pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Dec 2010 18:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=jcd7NWdXokBHpcuPx1pLjPCrZCfjKSzOAZi4daF5AUE=;
	b=T1h4iCRENSNw6gUu5GJjyPoDWwYhk61Qj4uTG/dkfE35wnnosGO+Q4Mhc1J5YeEzy2
	eJ/AEJ/DHw5Vd8kkQxJ4CmeKN4tBzZU4QN/2gHHya5BmUY17W8JnQlC1S1JADYw+LRMe
	NnY5ApFYmrrtQTw9eSsuRcENp29eqDT5w34SA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=llriS+OKdlpH3LkGyr9PJ+eAV0jQDUo1e4Nc0m6WaGvIfiYcNzuoYUtYd6ep4Mo/Ti
	jmWVKecSlOko/fPG9ADRIlDnbAnj0ZaqN5w+2GL1lu2VIW0jpHDGmAlLLotx+iWAc7/g
	DFqvswIE7IIyfH2mCXqx4gUaQITLjbqnO1Y4Y=
Received: by 10.142.161.11 with SMTP id j11mr2956417wfe.133.1292813580384;
	Sun, 19 Dec 2010 18:53:00 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v19sm5099601wfh.0.2010.12.19.18.52.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 19 Dec 2010 18:52:59 -0800 (PST)
Date: Sun, 19 Dec 2010 18:53:09 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101220025309.GA26429@gmail.com>
References: <20101208053240.GD3186@jama>
MIME-Version: 1.0
In-Reply-To: <20101208053240.GD3186@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: glib-2.0_2.26.1 missing dependency on dbus
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
X-List-Received-Date: Mon, 20 Dec 2010 02:53:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (08/12/10 06:32), Martin Jansa wrote:
> Hi,
> 
> simply adding it to depends create circular dependency
> 
> bitbake@jama ~/dev/recipes $ grep glib dbus/dbus.inc 
> DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
> 
> dbus needs glib it only for dbus-viewer and builds ok without glib, so
> I've removed glib-2.0 in dbus and added dbus to glib-2.0_2.26.1 and 
> tried again...
> 
> These are usually caused by circular dependencies and any circular 
> dependency chains found will be printed below. Increase the debug 
> level to see a list of unbuildable tasks.
> 
> It didn't detect it.. so I had to find it manually:
> bitbake@jama ~/dev/recipes $ grep glib dbus/dbus.inc
> DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
> 
> bitbake@jama ~/dev/recipes $ grep util-linux-ng xorg-lib/libsm_1.2.0.bb
> DEPENDS += "libice xproto xtrans util-linux-ng"
> bitbake@jama ~/dev/recipes $ grep udev util-linux-ng/util-linux-ng.inc
> DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} udev  zlib ncurses virtual/libintl"
> bitbake@jama ~/dev/recipes $ grep glib udev/udev_151.bb
> # Needed for udev-extras
> DEPENDS = "gperf-native usbutils acl glib-2.0"
> 
> util-linux-ng seems to build fine without udev but is there better place
> to break this curcular dependency?

Yes I think util-linux-ng should not depend on udev.
It came with 

commit 27aaabfb1a64de15f9a8b6665997ac47a4de13ff
 
You might want to have a look on following commits 

commit 55845cdac649c66bb4ca72b81313e0a443ec40e1
commit 79459407397fc6a592e6e2fece252f793f9ca8db

-Khem


