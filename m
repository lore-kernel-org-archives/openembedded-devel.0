Received: from [141.89.48.7] (helo=mail.cs.uni-potsdam.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <akzare@cs.uni-potsdam.de>) id 1Mtoif-0001n4-9O
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 22:27:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.uni-potsdam.de (Postfix) with ESMTP id F06DF10DCC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2009 22:27:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at cs.uni-potsdam.de
Received: from mail.cs.uni-potsdam.de ([127.0.0.1])
	by localhost (mail.cs.uni-potsdam.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 7O8Y2zLOFySR
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2009 22:27:11 +0200 (CEST)
Received: from [141.89.52.43] (orest.ift.cs.uni-potsdam.de [141.89.52.43])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.cs.uni-potsdam.de (Postfix) with ESMTPSA id 6B81F10D96
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2009 22:27:11 +0200 (CEST)
From: Ali Akbar Zarezadeh <akzare@cs.uni-potsdam.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1254431796.21355.94.camel@orest.ift.cs.uni-potsdam.de>
References: <1254397289.21355.57.camel@orest.ift.cs.uni-potsdam.de>
	<ha2a3n$s6q$1@ger.gmane.org>
	<19c1b8a90910010936y644282b1xe943f99e49cf5f38@mail.gmail.com>
	<1254431796.21355.94.camel@orest.ift.cs.uni-potsdam.de>
Date: Fri, 02 Oct 2009 22:26:23 +0200
Message-Id: <1254515183.6700.7.camel@orest.ift.cs.uni-potsdam.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 141.89.48.7
X-SA-Exim-Mail-From: akzare@cs.uni-potsdam.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How to put generated shared lib into the final output	image of OE
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
X-List-Received-Date: Fri, 02 Oct 2009 20:27:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

To solve the problem, I have inserted some new lines to the
picsy-image.bb file as follows:

--------------------------------------------------------------------------------------------------------

picsy_rootfs_postprocess() {
    oe_libinstall -so libACE ${IMAGE_ROOTFS}/usr/lib
    oe_libinstall -so libcv ${IMAGE_ROOTFS}/usr/lib
    oe_libinstall -so libcvaux ${IMAGE_ROOTFS}/usr/lib
    oe_libinstall -so libcxcore ${IMAGE_ROOTFS}/usr/lib
    oe_libinstall -so libhighgui ${IMAGE_ROOTFS}/usr/lib
    oe_libinstall -so libml ${IMAGE_ROOTFS}/usr/lib
    oe_libinstall -so libjpeg ${IMAGE_ROOTFS}/usr/lib
    oe_libinstall -so libtiff ${IMAGE_ROOTFS}/usr/lib
    oe_libinstall -so libpng12 ${IMAGE_ROOTFS}/usr/lib
    oe_libinstall -so libstdc++ ${IMAGE_ROOTFS}/usr/lib
    rm -f ${IMAGE_ROOTFS}/usr/lib/*.la
    rm -f ${IMAGE_ROOTFS}/usr/lib/*.a
}

ROOTFS_POSTPROCESS_COMMAND += "picsy_rootfs_postprocess"

--------------------------------------------------------------------------------------------------------

Maybe this way is not nice, but now everything is cool and openCV is
functioning. Is there any other method to force OE to approach this
goal?

Regards
Ali





