Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E4CDC7F2D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 10:55:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45yYP53PX0z1n;
	Tue, 30 Jul 2019 12:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564484122;
	bh=ygJMxMLi/UZm3xms65/6hFT6CjDEFayhm2oGB0w42RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pPxDyva4K1lt6jKh1mhPNSI8+Hz69jfWmObwBk1R/FzXwEqKndO/DkzdNKLZKRel4
	Rnj0vvjcl7yVzQ4F1tKNAGy2w8agGJ44DzjSNIoO0BLdS4q3o7nwnxWFB1fsXEU9D2
	7KpoVGaSabj4xp4xQsXDaGNr1XUogPJwn6DdvEldiANkOzcVDPucQEJ20XE7qKSbqj
	r4byn+o3V78Gr6dy3NYf1kFItyVPjDqVxvQTHZ2PHXNYvgjtCKz3T5pW2SBanR0qaw
	SHAiwH0wqQC11vi328VCl/CFDp9XwZytXuXu5xrTw1uNX00Y0fwrZEZ04FLCnnK+GF
	gwMTzhCSDJuCJ8Czlo0GXdWPgJcmHGwOztFck/c4+PJqWlK9o5vaNBIQetKVHC/N/M
	AJkmI7HLPHZywOuQsSf6ocnTqXYXzWSdAhSkHTQQvb9TdxFty7LYT/132jrVyMTdhb
	bzM/qK/Z5tltYR/+5FWJ4ufHEQINyfOYbFPxQy45hwBgGtTVEvDSk2D2bGvcB/23Yu
	dLICb9GIxCtyuVVNkA3zoyP+Yr8Xyw5xACR2i7szSlJgtnEmVhVAUSEGTEfvlm0h5e
	AxebEYN3ksWmPoIKPr/QP2m0CezxGQje4vlatcZ2yY5p4Fj/U2fsj6AzavblWAiMEq
	orc2R+qGWTQuxlNDogA5hHE0=
Date: Tue, 30 Jul 2019 13:55:17 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190730105517.GC11235@localhost>
References: <20190729080432.20866-1-ayoub.zaki@embexus.com>
	<CAMKF1sqUeboVgvtsuo5GR+VrvtPfO_Z9xS2cSzkgYT813LbG2g@mail.gmail.com>
	<CAMKF1so-GUvD7pJ9Btq3Pge1Eoe6EaLvFEEz5DL4D0vQfM+SHg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so-GUvD7pJ9Btq3Pge1Eoe6EaLvFEEz5DL4D0vQfM+SHg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4] usbguard: Initial recipe
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
X-List-Received-Date: Tue, 30 Jul 2019 10:55:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jul 29, 2019 at 07:40:43AM -0700, Khem Raj wrote:
> there are build failures still
> 
> https://errors.yoctoproject.org/Errors/Details/255457/

+DEPENDS = "protobuf-native libxml2-native libxslt-native xmlto-native glib-2.0-native \
+       dbus dbus-glib libqb libcap-ng libgcrypt libsodium protobuf pegtl"
...
+PACKAGECONFIG ??= "libsodium \
+       ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+       ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
+
+PACKAGECONFIG[systemd]   = "--enable-systemd,--disable-systemd"
+PACKAGECONFIG[libsodium] = "--with-crypto-library=sodium"
+PACKAGECONFIG[libgcrypt] = "--with-crypto-library=gcrypt"
+PACKAGECONFIG[polkit]    = "--with-polkit,--without-polkit"
+PACKAGECONFIG[dbus]      = "--with-dbus,--without-dbus"

The problem is that dependencies should be added as third parameter to 
PACKAGECONFIG, which is missing here for polkit.

Note that there is also the (less harmful) opposite problem here:
The libsodium, libgcrypt and dbus/dbus-glib dependencies are likely only 
required when the corresponding functionality is enabled via PACKAGECONFIG.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


