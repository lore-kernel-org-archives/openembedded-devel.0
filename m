Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MDyvr-0006Ej-5N
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jun 2009 12:51:55 +0200
Received: by bwz19 with SMTP id 19so3803232bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jun 2009 03:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=HH1/g3CmFL4r5sk1Z/hNjkB6iRJrzHqJdSrlyFTgQu0=;
	b=bx4OfsWZwtnFXKA2xhyL+oJisA+AyokXycSqE7CW0P+6PX1Ey3RD/N9anSkV0BFpV6
	T0gsBYKMCA067uYmg7a6Aja+BOZ2uMxXDuoKwcb2UlKDB4cfcGhig7QUORIH5ULgjXfC
	9z/7JOwqP1BL2LcoQhxWfK0GyCyRpvMyUBIFs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=g/v4YEg1kg/WOuigNCTwyR0V+V+Hgbk1YSW/OaGD8bTf3qkgoXn+CY9Y7VkEzcGn04
	py19zfVobJPJPTYXLRlJ+m1TjT1TlMeeKbXGquY9fqRjHLEioIhQNru1Z+A57CoMVlLB
	euqdT9nm6u9sSGfyBimD8kGVE2uu5Ju00Z40E=
MIME-Version: 1.0
Received: by 10.103.168.12 with SMTP id v12mr2865292muo.130.1244544138446; 
	Tue, 09 Jun 2009 03:42:18 -0700 (PDT)
Date: Tue, 9 Jun 2009 13:42:18 +0300
Message-ID: <fce2a370906090342xee12c47k4d6a2cccb6e3abb2@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: bitbake -c clean doesn't clean all stuff
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
X-List-Received-Date: Tue, 09 Jun 2009 10:51:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello!
'Bitbake -c clean' cleans all staging, work... files but not ipks.
What's the reason for such behaviour?
1) If I clean my recipe I want to be pretty sure build system won't
use any files from the old build process. But it's not. F.e. if I
built '1.1.2' recipe, then removed it and built '1.1.1' I want to be
sure my rootfs uses '1.1.1'. But old-new ipks are in deploy dir, and I
get 1.1.2 in my rootfs.
2) If I built recipe with 'PACKAGES = ${PN}', then cleaned it, edited
my recipe to have "PACKAGES += ${PN}-xxx", and my ${PN} is empty and
OE doesn't generate ipk for it, but old ipk is still there, ready to
be installed to my rootfs through obsolete deps of other recipes! I
don't see the problem until I rebuild my rootfs from scratch.
So my question is: why doesn't OE clean ipks when cleaning?


