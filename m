Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HV7vc-0001vs-Fd
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Mar 2007 16:13:12 +0100
Received: by nf-out-0910.google.com with SMTP id q29so1623793nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2007 08:13:11 -0700 (PDT)
Received: by 10.82.154.2 with SMTP id b2mr9315333bue.1174749191633;
	Sat, 24 Mar 2007 08:13:11 -0700 (PDT)
Received: by 10.82.120.13 with HTTP; Sat, 24 Mar 2007 08:13:11 -0700 (PDT)
Message-ID: <c384c5ea0703240813w6e575805n2471bd1d6aa2614a@mail.gmail.com>
Date: Sat, 24 Mar 2007 16:13:11 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: False handling of image types (pls check assumptions of your distro)
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
X-List-Received-Date: Sat, 24 Mar 2007 15:13:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I noticed some regressions in building (multiple) image types:

I am building a "tar" and a "squashfs-lzma" image. There was a rm
wildcard so that my first-built image (link) got erased. I fixed that
in the repo.

classes/image.bbclass:96:               rm -f
${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*
classes/image.bbclass:97:               ln -s
${IMAGE_NAME}.rootfs.$type
${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type

The second regression seems that the IMAGE_CMD_tar now compresses into
.tar.bz2.

conf/bitbake.conf:201:IMAGE_CMD_tar

However, we have the seperate "tar.bz2" type for that.

I am not fixing this yet, as Koen warned me some
"people/images/distros rely on the (wrong) behaviour".

So if you are such a entity, please fix now. I'll hold off the simple
fix to IMAGE_CMD_tar for some time,

Regards,
-- 
Leon


