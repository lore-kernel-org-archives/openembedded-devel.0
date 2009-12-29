Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NPdot-0005vd-Gs
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 16:17:14 +0100
Received: by fxm4 with SMTP id 4so9582613fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2009 07:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=3AhdUcb/O0OtrgOriaDsxoFe+nEPgqgmebfFuJ/ctWQ=;
	b=UvVxAiqt2qG6aQG1DY72wKKtIfbKKSxSawoDNpqMVklLmTRO6DPohf9tVNnDZU5M7h
	0QSxWWbPjLNmBafIPHDRMgFsE2VAQ/YuuDQX3jm6xdy/CuT2NGHLuLSXNkYChYTfI642
	/rYQazmpEHt++rqmnY0Wm7mQds7BOzC9gMIUU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=FjURE9ph10uy/2FKoHF8cruyx4nlrGjAF9D8VTGZCMREzY5EgcuWySJJE7NRHKleun
	yF3jBoUiCFE4dczXuZOQ0gMW63U/8ulRYc0L+PtbsbIR2QE+BIPjU64gLSZvXnmB0xxX
	wtWUeQP05ncrJ9KJ645Arb6aOrssKVUGCJoe4=
MIME-Version: 1.0
Received: by 10.239.138.35 with SMTP id n35mr1866921hbn.30.1262099713845; Tue, 
	29 Dec 2009 07:15:13 -0800 (PST)
Date: Tue, 29 Dec 2009 16:15:13 +0100
Message-ID: <c384c5ea0912290715l24b705fat6700077741b1cc5b@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Move IMAGE_BOOT stuff into distro's?
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
X-List-Received-Date: Tue, 29 Dec 2009 15:17:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Why do we hardcode names of default packages in the "image.bbclass"?

Now every image recipe that doesn't want these has to know the
variables it has to override.

Shouldn't this be distro material instead?

#
# udev, devfsd, busybox-mdev (from busybox) or none
#
IMAGE_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES", "kernel26",
 "udev","",d)} "
#
# sysvinit, upstart
#
IMAGE_INIT_MANAGER ?= "sysvinit sysvinit-pidof"
IMAGE_INITSCRIPTS ?= "initscripts"
#
# tinylogin, getty
#
IMAGE_LOGIN_MANAGER ?= "tinylogin"

IMAGE_KEEPROOTFS ?= ""
IMAGE_KEEPROOTFS[doc] = "Set to non-empty to keep ${IMAGE_ROOTFS}
around after image creation."

IMAGE_BOOT ?= "${IMAGE_INITSCRIPTS} \
${IMAGE_DEV_MANAGER} \
${IMAGE_INIT_MANAGER} \
${IMAGE_LOGIN_MANAGER} "

Regards,
-- 
Leon


