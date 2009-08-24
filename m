Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Mfbqj-0002L5-JC
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 17:52:49 +0200
Received: by ewy21 with SMTP id 21so3065979ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 08:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZFfqmbFPGFY1kt3TDC0en2XpKP4TTYZCHvDaKsB+i60=;
	b=XxweMq0m+++IeF+PToJ50IqOm+VsxKs7/xxKuB1+0lsCtWFUOTlqntiz8D5Grzg4bi
	ER1kXcT1JFibUTyeSVq0GENTV4pKxS3xvGDEw8x9XNb71EQcpDN38iOsTl1gbXvMl5D0
	C+1LKSiTr+HexjP/hExdabZF67rAzXeP0ViLQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PU1SY90BXnZ2o5pTVZHqiIBNl9viQ1vMV5pl1LELQoCewHdVDc9ewUlQzLmjpuBSvW
	ug/Cgx12erFuPeppxaYq91Q1qmeEo64MgkJ8hJNPUAlniRw2K0oIfZkEy59WkV9QDMwU
	ZRXYGrSyOL4muW1qTN4wF/fxo/2Tu8cfZvD6A=
MIME-Version: 1.0
Received: by 10.216.72.206 with SMTP id t56mr1020572wed.31.1251128102954; Mon, 
	24 Aug 2009 08:35:02 -0700 (PDT)
In-Reply-To: <4A92AECA.6070309@dresearch.de>
References: <4A92AECA.6070309@dresearch.de>
Date: Mon, 24 Aug 2009 17:35:02 +0200
Message-ID: <d1b08f940908240835o462431b5j13a983016675a0dc@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: IMAGE_FSTYPES for u-boot initrd images?
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
X-List-Received-Date: Mon, 24 Aug 2009 15:52:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Steffen,

for something similar, check in recipes/images, specifically the
initramfs-* and the bootcd images.
Another image using a cpio.gz and a custom init is initramfs-kexecboot-image.

Regards

Andrea


