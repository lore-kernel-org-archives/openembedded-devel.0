Received: from [64.233.184.235] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1H52cg-0001DD-Ar
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jan 2007 17:17:50 +0100
Received: by wr-out-0506.google.com with SMTP id i22so340105wra
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jan 2007 08:15:53 -0800 (PST)
Received: by 10.78.180.16 with SMTP id c16mr544345huf.1168532152428;
	Thu, 11 Jan 2007 08:15:52 -0800 (PST)
Received: by 10.78.159.2 with HTTP; Thu, 11 Jan 2007 08:15:52 -0800 (PST)
Message-ID: <d46153c40701110815r63a6dcaal1d3162e202fe7ad6@mail.gmail.com>
Date: Thu, 11 Jan 2007 10:15:52 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: ext3 support
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
X-List-Received-Date: Thu, 11 Jan 2007 16:17:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I don't know if anyone else is interested, but ext3 seems to work if
you add journaling to an ext2 rootfs image.  Here is my attempt at
supporting this from OpenEmbedded:

EXTRA_IMAGECMD_ext3 ?= ""
IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
IMAGE_CMD_ext3 = "genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS}
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3; \
        tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3;
${EXTRA_IMAGECMD}"

It builds the depends and rootfs and the kernel recognizes it as an
ext3 file system.


