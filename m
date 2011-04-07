Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gumstix.com>) id 1Q7u9M-00067S-Ic
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 20:41:49 +0200
Received: from homiemail-a12.g.dreamhost.com (caiajhbdcbbj.dreamhost.com
	[208.97.132.119])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 2B44217BBD1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2011 11:39:41 -0700 (PDT)
Received: from homiemail-a12.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a12.g.dreamhost.com (Postfix) with ESMTP id 525FF714070
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2011 11:39:38 -0700 (PDT)
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gumstix.com; h=message-id:date
	:from:mime-version:to:subject:content-type:
	content-transfer-encoding; q=dns; s=gumstix.com; b=nTpxIn7wEmfZY
	kHBZpP62FVHIDbEpMCEcCzuUg2FOfsvOPFwsPhu+BnNN6VMlGhzEYMBcPdnh+aA+
	aBP290ALFZRsmsckDjx2/eZNfxvlcwbijlJm8i3Jjzt9AcAwEFtJ8smWpsqKPIYQ
	o4eZNRKY9FrBoYjgLCGtg/b2+2eu7Q=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gumstix.com; h=message-id
	:date:from:mime-version:to:subject:content-type:
	content-transfer-encoding; s=gumstix.com; bh=QcgbRv5cS2srFUt1HyF
	DpIGS5VY=; b=BwaXImDma5Y6qgcS8OhYESPz7Gim3+pYUEbIpd5uVYCgfioTNE1
	RElfo8zIwdTSqylkC/3GDy4AzLRyM7IpXrA2mixG0f11RtXhqKiF3sVh7ve2Pemb
	HKsAxbG/g0dE1seYrOFICbzdceS3lFnkfqy2VnT+17MeYd6Aznlg6Aj0=
Received: from [10.0.1.35] (s64-180-61-141.bc.hsia.telus.net [64.180.61.141])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: neil@gumstix.com)
	by homiemail-a12.g.dreamhost.com (Postfix) with ESMTPSA id 32385714060
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2011 11:39:38 -0700 (PDT)
Message-ID: <4D9E04ED.4000102@gumstix.com>
Date: Thu, 07 Apr 2011 11:39:41 -0700
From: Neil MacMunn <neil@gumstix.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Portmap Install Permissions
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
X-List-Received-Date: Thu, 07 Apr 2011 18:41:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I recently switched to angstrom-2010.x and now I'm running into what 
appears to be a permissions issue.

> neil@cumulus:~/overo-oe/org.openembedded.dev$ bitbake omap3-desktop-image
> <snip>
> | ERROR: Function 'do_install' failed (see /home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/portmap-6.0-r5/temp/log.do_install.10931 for further information)
> | + cd /home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/portmap-6.0-r5/portmap_6.0/
> | + do_install
> | + install -d /home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/portmap-6.0-r5/image/usr/share/man/man8/ /home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/portmap-6.0-r5/image/sbin /home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/portmap-6.0-r5/image/etc/init.d
> | + install -m 0755 /home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/portmap-6.0-r5/portmap.init /home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/portmap-6.0-r5/image/etc/init.d/portmap
> | + oe_runmake install DESTDIR=/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/portmap-6.0-r5/image
> | + oenote make -e MAKEFLAGS= install DESTDIR=/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/portmap-6.0-r5/image
> | + echo NOTE: 'make -e MAKEFLAGS= install DESTDIR=/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/portmap-6.0-r5/image'
> | NOTE: make -e MAKEFLAGS= install DESTDIR=/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/portmap-6.0-r5/image
> | + make -e MAKEFLAGS= install DESTDIR=/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/portmap-6.0-r5/image
> | install -o root -g root -m 0755 portmap /home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/portmap-6.0-r5/image/sbin
> | install: cannot change ownership of `/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/portmap-6.0-r5/image/sbin/portmap': Operation not permitted
> | make: *** [install] Error 1
> | + die 'oe_runmake failed'
> | + oefatal 'oe_runmake failed'
> | + echo FATAL: 'oe_runmake failed'
> | FATAL: oe_runmake failed
> | + exit 1
> <snip>

ls -la in the destination directory gives
> -rw------- 1 neil neil 90441 2011-04-07 08:38 portmap

The portmap recipe doesn't appear to have changed. I tried changing the 
permissions and owner manually and it demanded credentials. How 
does(did) it get away with changing the file owner and group? Does the 
install step use chown?

Thanks.
--
Neil




