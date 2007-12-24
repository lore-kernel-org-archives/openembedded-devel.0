Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J6cTb-0004aQ-5H
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Dec 2007 02:51:31 +0100
Received: by fg-out-1718.google.com with SMTP id 22so671303fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2007 17:46:03 -0800 (PST)
Received: by 10.86.30.9 with SMTP id d9mr3936433fgd.16.1198460763586;
	Sun, 23 Dec 2007 17:46:03 -0800 (PST)
Received: from widy.lan ( [194.79.8.36])
	by mx.google.com with ESMTPS id k29sm5323625fkk.5.2007.12.23.17.46.01
	(version=SSLv3 cipher=OTHER); Sun, 23 Dec 2007 17:46:02 -0800 (PST)
Date: Mon, 24 Dec 2007 03:48:12 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <193287436.20071224034812@gmail.com>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <476F02B0.7090405@whitby.id.au>
References: <476D5DCE.6080703@student.utwente.nl>
	<476F02B0.7090405@whitby.id.au>
MIME-Version: 1.0
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Base image dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Dec 2007 01:51:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rod,

Monday, December 24, 2007, 2:52:00 AM, you wrote:

> Koen Kooi wrote:
>> As part of the OE-testlab I wrote a .dot generator for image contents
>> and made a png of
>> Angstrom-base-image-glibc-ipk-2007.11RC2-ixp4xxbe.rootfs.tar.gz:
>> 
>> http://ewi546.ewi.utwente.nl/tmp/test-nolibc-noupdate-nq8.png
>> 
>> This shows the Depends: (solid lines) and Recommends: (dashed lines)
>> fields of the installed packages, but with 'libgcc', 'libc6' and
>> 'update_' filtered out for readability.

> As a result of this excellent analysis by Koen (thanks!), I'm trimming
> task-distro-base and task-machine-base out of base-image.  There are too
> many things that distros and machines add using DISTRO_EXTRA_* and
> MACHINE_EXTRA_* which are not strictly required to boot, get networking
> up, and run ipkg install.

> For example, the x86.conf file adds "kernel-modules" to
> MACHINE_EXTRA_RDEPENDS which would mean that a base-image for x86 has
> *all* kernel modules included in the rootfs.

  And this is apparently wrong. Worse, we have even some images which
pull entire kernel module set as if they really had a need for that.

$ grep kernel-modules *
x11-gpe-image.bb:    kernel-modules \
x11-office-image.bb:    kernel-modules \
x11-pimlico-image.bb:    kernel-modules \

  I'm really stumped on how to treat it - as a convenience for user
(please, please let's add mp3 to x11-image then - that will be real
convenience!) or case of older images not migrated to task-base yet.
Even if assume "convenience" case, x11-gpe-image shouldn't really
included them all - that image is on "small" size of images, and kernel
modules, most of which won't be ever used by common user.
office/pimlico images probably can go by with that, as they already
include way too much stuff.

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



