Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id F1DC76612D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2016 18:45:56 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id E2FFD5C0DC0;
	Fri, 11 Mar 2016 19:45:21 +0100 (CET)
MIME-Version: 1.0
Date: Fri, 11 Mar 2016 10:43:03 -0800
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <56E2F9C3.2090403@linux.intel.com>
References: <1d5cc52037d090b4f12b24f85bc361f6@agner.ch>
	<56E2F8B7.3010606@linux.intel.com> <56E2F9C3.2090403@linux.intel.com>
Message-ID: <a6318d4129bc2cde6b96b2d4f0c26273@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.1.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1457721921; bh=ddY2cnheob7rGbSz37K58e3Rs3yg47N7MvHVeQg0AVg=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=J8WYaMTQVx8J/mboJUJHl8uqqPoVGuUbqAKJqz93vSggm28a6hn/Hvus9HpxWpkIiJpHtkHSlqNjix9r9MtITitoXYsHUww2Gd0P0FgMo+RlW7LVYR1wPbn+873RxKf9YUvKlt4aIveBfArPs9v5j0TKDNqHsvO7SOyF9Ke5C1I=
Cc: Marcel Ziswiler <marcel@ziswiler.com>, angstrom-distro-devel@linuxtogo.org
Subject: Re: license_create_manifest fails on jethro
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Mar 2016 18:45:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Alimon,

On 2016-03-11 09:00, Aníbal Limón wrote:
> Hi Stefan,
> 
> I tried to build angstrom v2015.12-yocto2.0 using qemux86-64 and
> systemd-image following [1] then the next errors appears:
> 
> ERROR: Nothing PROVIDES 'virtual/nativesdk-nativesdk-libx11' (but
> virtual:nativesdk:/home/alimon/repos/angstrom/sources/openembedded-core/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> DEPENDS on or otherwise requires it). Close matches:
>   virtual/nativesdk-libx11
>   virtual/nativesdk-libc
>   virtual/nativesdk-db
> 
> ERROR: Required build target 'systemd-image' has no buildable providers.
> Missing or unbuildable dependency chain was: ['systemd-image',
> 'nativesdk-packagegroup-sdk-host', 'nativesdk-qemu', 'nativesdk-libsdl',
> 'virtual/nativesdk-nativesdk-libx11']

Not sure what is going on, also had this error here with Poky. This
helped for core-image-minimal:
DISTRO_FEATURES_remove = "x11"

To quickly reproduce this, I now setup just the Freescale BSP with Poky:
http://freescale.github.io/#download

Along with this config in conf/local.conf (which basically emulates the
Ångström config):
LICENSE_DIRECTORY = "${DEPLOY_DIR}/licenses/${MACHINE_ARCH}"

And enable copying licenses to the target directory:
COPY_LIC_MANIFEST = "1"
COPY_LIC_DIRS = "1"

Then I built this two images:

MACHINE=colibri-vf bitbake core-image-minimal
MACHINE=colibri-imx6 bitbake core-image-minimal

Note that for instance
tmp/deploy/licenses/colibri_vf/base-files/
exits after the first bitbake build, but the second bitbake build tries
to copy the license from
tmp/deploy/licenses/colibri_imx6/base-files/

--
Stefan

