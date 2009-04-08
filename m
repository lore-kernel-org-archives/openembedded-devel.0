Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <brandhetlampje@gmail.com>) id 1LrTGN-0006O0-A2
	for Openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 10:36:06 +0200
Received: by fxm20 with SMTP id 20so5119fxm.12
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2009 01:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=yMQOIXSFDJ5RuHad9LUk04P+yhjuHM57hpw4riw0rRE=;
	b=jhb+lwZvqcVfUWCHdZCjfr0IEGkLLDDyiomDW/TsU0QXHDdr2RnBHDkxCPBUFMJGsW
	OfN3lX4s7od0gPr2wHRQI/hYXp/IaRcvddKL7NxdXSsGf7FkdrQgWRpu7oNUafuchj7Y
	CnLE5qmcfDgH3fddPMXV+ucM9qEJymwHr7FBA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=DPw2VOvjH2Lt5fg1RPDuwEZRxUOWxiBYX9ViHq+cLyMMQbxQZPPo/78KPnsWxxXd2+
	zLaS58OEq2H7Iq7y0RHkvnYUhcifulvIu39XOdjG9QxzciZjSjgfguDn9EwogFl8BXHi
	gxZUp9IK9H+dgHKDODzNZnOaVVVuhchv2Wm64=
MIME-Version: 1.0
Received: by 10.86.80.17 with SMTP id d17mr876098fgb.49.1239179579418; Wed, 08 
	Apr 2009 01:32:59 -0700 (PDT)
Date: Wed, 8 Apr 2009 10:32:59 +0200
Message-ID: <6978a1740904080132p2ad3149el52a598576982adad@mail.gmail.com>
From: s hakkesteegt <brandhetlampje@gmail.com>
To: Openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.172
X-SA-Exim-Mail-From: brandhetlampje@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RDNS_NONE,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Trying to add Compulab CM-X300 machine configuration files, don't work as expected.
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
X-List-Received-Date: Wed, 08 Apr 2009 08:36:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm currently trying to add the machine configuration files for the Compulab
CM-X300 and I'm experiencing some problems.
What I currently have can be found here: http://www.xAs Kernel I'm using
2.6.26, with patch provided bij Compulab, there they provide a working
example from this kernel with a rootfs, it seemed to me to be a good
starting point for
me.s4all.nl/~hakkest1/oe/cm-x300.conf<http://www.xs4all.nl/%7Ehakkest1/oe/cm-x300.conf>


problem 1)
When I create an Angstrom-console image (using oe dev branch), in a fresh
tmp directory, it creates a rootfs, only containing the following
directories: *bin, dev, etc, lib, sbin, usr. *
So it seems there is missing quite a lot, and the .jffs2 image is only 2.2
MB. Can this be because of a mistake in my machine .conf file or might it be
something different?


problem 2)
But when I first run *bitbake console-image* for the CM-X270 and then for
the CM-X300 then the rootfs seems to be normal, but I don't know if it is,
because I experience quite some problems using it. When I flash the machine
with the created kernel and rootfs, It gives me most of the time
segmentation faults and kernel oops, as you can see in the next file:
http://www.xs4all.nl/~hakkest1/oe/boot_1st_time_cm-x300.txt<http://www.xs4all.nl/%7Ehakkest1/oe/boot_1st_time_cm-x300.txt>

I don't think it is a hardware based problem, because the example kernel and
rootfs from Compulab work fine on the machine, without these errors.

As Kernel I'm using 2.6.26, with patch provided bij Compulab, there they
provide a working example from this kernel with a rootfs, it seemed to me to
be a good starting point for me.

When I use the example kernel provided by Compulab, with my, with OE
created, rootfs, it gives me the segmentation faults and kernel oops aswell
(and some errors about not found modules, wich seems logical there the
modules dir is in a different location in the example rootfs). So I suspect
there is something wrong with my own created rootfs / jffs2 images, but I
have no Idea what it can be.


Thanks in advance,


Siebren Hakkesteegt

