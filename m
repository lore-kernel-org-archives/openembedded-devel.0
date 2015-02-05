Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4D36AC35
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 18:44:16 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id l15so12580548wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 10:44:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=T//PBcQ+XaW40kXBWsAt3SOxAsHYxFrU4ZPOfq/hBsw=;
	b=gGx75LfIlkCmBP3VCXtp2u2gkxQjHFThPrbBuw/CbINZAq3JQacbh8iT1UKR3ViXWv
	kiuAUB2ywkatIRCzimdke3966SIUvoX1Moiixtzj34rccvmHlq6+E5V4x7wB0SLA1PZ9
	dJD6FRtw1FCBzSXelwWNCXwG6dWWFlmlIDlGDkfTBAT2G6jjIu6Cf4qvloVvUvvd00i0
	xHgp+Ix4KUk053xKRZPrCFOt3Iv0hHOHPXNWq9y7xi0xY3dmcJ3u+os5DU8sG+oLPhW2
	5dzdqVH1DumqPqPmTxeJXMRGq6yO4MQdH9yiBRPE5mzu8Y5iIdWwyw08hV6JtbLT4Fnf
	9DoQ==
X-Gm-Message-State: ALoCoQld7CYR8R0enCZ4He789wFjUhdmox6CAET8nOuAJmNDY4q0rvtk7Sczn6tNTxJVV4BtTCfz
X-Received: by 10.194.23.39 with SMTP id j7mr10691673wjf.9.1423161857600;
	Thu, 05 Feb 2015 10:44:17 -0800 (PST)
Received: from iMac.local ([2001:610:612:0:7d07:684d:ded3:59d1])
	by mx.google.com with ESMTPSA id
	pp10sm8496769wjc.31.2015.02.05.10.44.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Feb 2015 10:44:16 -0800 (PST)
Message-ID: <54D3B9FF.4030405@dominion.thruhere.net>
Date: Thu, 05 Feb 2015 19:44:15 +0100
From: Koen Kooi <koen@dominion.thruhere.net>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mavrvk$83v$1@ger.gmane.org>
	<1423153742-11829-1-git-send-email-danismostlikely@gmail.com>
In-Reply-To: <1423153742-11829-1-git-send-email-danismostlikely@gmail.com>
Subject: Re: [meta-initramfs][PATCH v2 5/5] dracut: recipe cleanup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Feb 2015 18:44:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dan McGregor schreef op 05-02-15 om 17:29:
> From: Dan McGregor <dan.mcgregor@usask.ca>
> 
> Split out bash-completion data Update RDEPENDS: getopt is
> util-linux-getopt now

So the blanket 'util-linux' RDEPENDS can go away, right?

> Use distro_features_check to require systemd Recommend busybox
> 
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca> --- 
> .../recipes-devtools/dracut/dracut_git.bb          | 25
> ++++++++++++++++------ 1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb index
> ea55a4d..e425845 100644 ---
> a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb +++
> b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb @@ -13,8 +13,10 @@
> SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
> 
> S = "${WORKDIR}/git"
> 
> -do_configure() { -    ./configure --prefix=${prefix} \ +inherit
> distro_features_check +REQUIRED_DISTRO_FEATURES = "systemd" + 
> +EXTRA_OECONF = "--prefix=${prefix} \ --libdir=${libdir} \ 
> --datadir=${datadir} \ --sysconfdir=${sysconfdir} \ @@ -23,20 +25,31 @@
> do_configure() { --bindir=${bindir} \ --includedir=${includedir} \ 
> --localstatedir=${localstatedir} \ +
> --systemdsystemunitdir=${systemd_unitdir}/system" + +do_configure() { +
> ./configure ${EXTRA_OECONF} }
> 
> do_install() { oe_runmake install DESTDIR=${D} }
> 
> -FILES_${PN} += "${datadir}/bash-completion \ -
> ${libdir}/kernel \ +PACKAGES =+ "${PN}-bash-completion" + 
> +FILES_${PN}-bash-completion = "${datadir}/bash-completion" + 
> +FILES_${PN} += " ${libdir}/kernel \ +                ${systemd_unitdir}
> \ " +CONFFILES_${PN} += "${sysconfdir}/dracut.conf" + +RDEPENDS_${PN} =
> "systemd findutils cpio util-linux-blkid util-linux-getopt util-linux
> bash ldd" +RDEPENDS_${PN}-bash-completion = "bash-completion"
> 
> -# 'getopt' is in the util-linux main package -RDEPENDS_${PN} = "systemd
> findutils cpio util-linux-blkid util-linux bash ldd" # This could be
> optimized a bit, but let's avoid non-booting systems :) RRECOMMENDS_${PN}
> = " \ kernel-modules \ +                     busybox \ coreutils \ "
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFU07n/MkyGM64RGpERAuZ6AKCK1aT62H7XvOeZU2+9RCZnMeMSqACfc/Ej
8ubI00/FGsDFssxdkXURRY0=
=SpL4
-----END PGP SIGNATURE-----

