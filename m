Received: from [209.85.219.219] (helo=mail-ew0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sinestado@gmail.com>) id 1MipSv-0005oi-G4
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Sep 2009 15:01:34 +0200
Received: by ewy19 with SMTP id 19so812668ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2009 05:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=Kgv0qTMyEj7O7XY68yt72h6Xc4DkIdCEz7cQol/e/+Y=;
	b=rySmGMlPu2Jz0A1Vd/7h7PG/rTQRlFEpix/u2T9AZRdwwFSSr+gEYh0ovl+tOAUvu1
	iD/Uf6XIcB01Ax4znCFwSkX0N7kUMLPP+WOOsTRyQaPXDK/zlxlA/U/pM9aVEKcRMGZv
	g+GAq1Ash7TzoJGUhsCFYNmHwY1AbMxgAoYxo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=b5WXstiJp4qbSUobKPmWn2HO2xLwuhNFIGvVU51RWCnrGWFx23hF8pIj7fzj8MQUDJ
	bA4ekOcJmfYCA2jTKK4tej1GlYQWO972ljoipi8KPlJy/uXJZz46LjLkJ80d7MFZ2sFr
	cAyO3FhozO+vzcvBZCPmrG/ReEY70OUmroOyE=
MIME-Version: 1.0
Received: by 10.216.11.211 with SMTP id 61mr170340wex.68.1251895368042; Wed, 
	02 Sep 2009 05:42:48 -0700 (PDT)
Date: Wed, 2 Sep 2009 09:42:47 -0300
Message-ID: <a63ecaf0909020542u62f8b8d7i5a0419d99424c2a0@mail.gmail.com>
From: Sushi Sensei <sinestado@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: xf86Version.h and others in xserver-xorg 1.6.1
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
X-List-Received-Date: Wed, 02 Sep 2009 13:01:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm compiled xserver-xorg 1.6.1 and some drivers compiles
(xf86-video-cirrus, xf86-video-fbdev, xf86-video-sis, xf86-video-vmware) but
some other no.

xf86-video-s3 breaks with:
| s3_driver.c:46:25: error: xf86Version.h: No such file or directory

xf86-video-intel breaks with:
vi830.h:73:20: error: xf86mm.h: No such file or directory

xf86-video-trident breaks with:
| trident_driver.c:177: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'TRIDENTISAchipsets'
| trident_driver.c: In function 'TRIDENTProbe':
| trident_driver.c:980: error: 'TRIDENTISAchipsets' undeclared (first use in
this function)
| trident_driver.c:980: error: (Each undeclared identifier is reported only
once
| trident_driver.c:980: error: for each function it appears in.)
| trident_driver.c:990: warning: assignment makes pointer from integer
without a cast


I have this files in:

tmp/work/i586-kaeilos-linux/xserver-xorg-2_1.5.3-r12.0/xorg-server-1.5.3/hw/xfree86/common/xf86Version.h

but in:

tmp/work/i586-kaeilos-linux/xserver-xorg-2_1.6.1-r12.0/

I don't have any directory called common (and any xf86Version.h inside!)

For the others errors I don't have notice
-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------

