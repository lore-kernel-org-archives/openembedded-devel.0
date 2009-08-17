Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Md7E9-0002qB-2h
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 20:46:43 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1Md6xf-0002uF-HH
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 22:29:39 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 22:29:32 +0400
User-Agent: KMail/1.12.0 (Linux/2.6.30-1-amd64; KDE/4.3.0; x86_64; ; )
References: <1250515743-10823-1-git-send-email-msmith@cbnco.com>
	<200908171612.13311.holger+oe@freyther.de>
	<4A8978CD.8060607@cbnco.com>
In-Reply-To: <4A8978CD.8060607@cbnco.com>
MIME-Version: 1.0
Message-Id: <200908172229.32840.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 9377 [Aug 17 2009]
X-SpamTest-Info: {UDS BL}
X-SpamTest-Info: {DNSBL Rate: low}
X-SpamTest-Method: none
X-SpamTest-Rate: 30
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: Re: [PATCH 3/3] syslinux: upgrade to 3.82 and split into a few packages
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
X-List-Received-Date: Mon, 17 Aug 2009 18:46:45 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA 17 =D0=
=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2009 19:35:41 =D0=B0=D0=B2=D1=82=D0=
=BE=D1=80 Michael Smith =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Sure, I can take a look at that later. I'm really only using extlinux
> for USB sticks; for everything else I still like GRUB best.

You can also do bootable USB drive images with GRUB (not GRUB2, unfortunate=
ly)
with something like this added to standard ext2 image for drive FS:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
HDDIMG =3D "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.img"
IMAGE_POSTPROCESS_COMMAND =3D " \
        dd if=3D/dev/zero of=3D${HDDIMG} bs=3D512 count=3D63; \
        dd if=3D"${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext2" of=3D${HDDIMG=
} bs=3D512 seek=3D63; \
        head -c 8388608 /dev/zero >> ${HDDIMG}; \
        cat ${WORKDIR}/sfdisk.one_partition | /sbin/sfdisk ${HDDIMG}; \
        echo -e "device (hd0) ${HDDIMG} \n root (hd0,0) \n setup (hd0)" | q=
emu-i386 ${IMAGE_ROOTFS}/usr/sbin/grub --device-map=3D/dev/null --batch ; \
        rm "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext2" "${DEPLOY_DIR_IMAG=
E}/${IMAGE_NAME}.rootfs.ext2"; \
        "
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

where "sfdisk.one_partition" is

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
# partition table of test
unit: sectors

    test1 : start=3D       63, size=3D         , Id=3D83
    test2 : start=3D        0, size=3D        0, Id=3D 0
    test3 : start=3D        0, size=3D        0, Id=3D 0
    test4 : start=3D        0, size=3D        0, Id=3D 0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

A bit hacky-whacky may be, but works good here for USB installer images.


