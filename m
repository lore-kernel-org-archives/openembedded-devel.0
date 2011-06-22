Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QZVRq-00061w-U1
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 23:58:59 +0200
Received: by pwi1 with SMTP id 1so956610pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2011 14:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=wouUPXPPtFHmDGHFG2Eot2ImY9iyEvChxzA3v5J8g90=;
	b=I09WsVX08kcWIkkxDzFiuFgdZ3h/tNvlftRFdR6Gdv+GU+SlZAtIvsyuaSWeVoGZ+o
	fuhC/12YwxHPeJTtL1NIKOSyDMYJoji0f9c0UO8dVUb5QA7/bOparupb8A6yf1ewXXMy
	+2z9k9mX4eQv9LjOZDLpfcHZvdXIFGhewfeM0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=mM2VBn6bXBIsWS3WLim22lo1QPRkmT+zV1K/G3TozsheXa7HTTDeq8p3sUS7r2sQ49
	4onM+9mdI18P1EodeVXhY2rsMNtCuuOyvPwzxX6zg9mgyPFr2HBUX0TCkeYKSz7JnPwk
	srkL00gALGabfjYmyrVkjU9XWoAM40djz/xDw=
MIME-Version: 1.0
Received: by 10.143.21.27 with SMTP id y27mr293756wfi.127.1308779711863; Wed,
	22 Jun 2011 14:55:11 -0700 (PDT)
Received: by 10.142.174.6 with HTTP; Wed, 22 Jun 2011 14:55:11 -0700 (PDT)
In-Reply-To: <1308762019-12145-1-git-send-email-GNUtoo@no-log.org>
References: <1308758438.21613.101.camel@phil-desktop>
	<1308762019-12145-1-git-send-email-GNUtoo@no-log.org>
Date: Wed, 22 Jun 2011 23:55:11 +0200
Message-ID: <BANLkTi=WMRtCCpVf7fnS5B84PoVNxXoSyg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v3] conf/bitbake: improve compression image handling and adapt linux-kexecboot.inc
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
X-List-Received-Date: Wed, 22 Jun 2011 21:58:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

...
-IMAGE_CMD_cpio.lzma =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} &&
(find . | cpio -o -H newc | lzma -c ${LZMA_COMPRESSION_LEVEL}
>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma)
${EXTRA_IMAGECMD}"

+IMAGE_CMD_cpio.lzma =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} &&
(find . | cpio -o -H newc | xz --format=3Dlzma -c
${LZMA_COMPRESSION_LEVEL} --check=3D${XZ_INTEGRITY_CHECK}
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"


Hello, thx for refreshing the patch.

being that we have =A0two vars:
XZ_COMPRESSION_LEVEL ?=3D "-e -9"
LZMA_COMPRESSION_LEVEL ?=3D "-e -9"

wouldn't it better to use  =A0XZ_COMPRESSION_LEVEL?
Remember (man xz) that lzma-utils '-9' is equivalent to xz-utils '-8'
in terms of dictionary/ram needed for decompression.

Regards

Andrea


