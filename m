Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8A65878369
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 08:54:00 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id x125so22302147ywa.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 01:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zcNapsHE9O8XPcClN9lTNfrz3dJqQfrzHYrfB0QkeOU=;
	b=iy9RcI1M0ELEBsSZCcqCIgZVtWeeDGqJJBMfT2+K0quA37UHvcFGOjklwY8vkadFsb
	7opRJ2/2BOhJ4pc8rR73kDzxUYqx1tm8WcAZMQNEEBU2MsaZaHcDDVpdyf65KmUFKf0y
	rozCL0zhV+uzsaivfbCeOGpdp7oPlmVzus3XsS+RMoKXWmitOraxVc+pE3Te/JcYuzqS
	4ZlFqM402sGSK50R08QZTEyBI6DAABmPNEtU4tLU0r1wR6DXyTCi0L+yXmPBu3QUsDsF
	6CD+vkqxWe5oxu6CAKlFjgaslnDCmOMpTf5KTB5BmYT69QiNMOAKj2IXdnaIGOsBRUs1
	srJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zcNapsHE9O8XPcClN9lTNfrz3dJqQfrzHYrfB0QkeOU=;
	b=l14jDbgGjzWXk2YC4rl4LCcOIxrAqBDu6nJx2SYrl/xhBdQprQ1juHHN8P6eXXXgmB
	Vbk86YaMgbY3XxwQ4K3yntkP3vFj7fqC7lSiInWwnGyio18FIlHCONcm10XHk4wD65mR
	ZbQutDKMssg8Ml7qhOtZRxIq7mDnonC4gqvMKkMgnaGBrfrt9qlLIusZv6EJ8RrAVyF7
	G/tdZHtUu8nnAew5cjaw2Doh4MFfYmHYtbH4M5bXWZWHYNOsUDyDu0h0wZY4ZFONVE75
	lCVR9taLx1dAD3KREZ6JGfN98FdxvJU9g2OgKjSw1PS1PqQpDMByxCadU5uCMqkK5ivW
	uIpQ==
X-Gm-Message-State: AIVw112REpLAmuGkCcnePSWR3UU3MdpYWTfMxY4liWnN8vJA/MbLVgsa
	d+oikTy7Xac2GE8ycCLoiY1Akt3xDw==
X-Received: by 10.13.207.67 with SMTP id r64mr6057239ywd.244.1500627241504;
	Fri, 21 Jul 2017 01:54:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Fri, 21 Jul 2017 01:54:01 -0700 (PDT)
In-Reply-To: <cover.1500621886.git.hongxu.jia@windriver.com>
References: <cover.1500621886.git.hongxu.jia@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 21 Jul 2017 10:54:01 +0200
Message-ID: <CA+chaQcQYv4xtjOLvowSTsGA3rTn8Y92Xz-zX5ixqD2Kvm7ukQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH V2 00/10] add 9 recipes & upgrade 1 recipe
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
X-List-Received-Date: Fri, 21 Jul 2017 08:54:00 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for changes, next time please update status on patchwork when
sending such mostly duplicated set of patches.

On Fri, Jul 21, 2017 at 9:34 AM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> Changed in V2:
>
> - xmlrpc-c, satyr, usermode: fix compile failure against musl C library
>
> - add recipe keybinder and volume-key
>
> - Build on qemux86, qemux86-64, qemumips, qemuarm64,
>   qemux86 + musl, qemux86-64 + musl
>
> //Hongxu
>
> The following changes since commit 1cbd1bc195017312ba8cf670b340f6
> 1a2ac6207b:
>
>   unionfs-fuse: 0.26 -> 2.0 (2017-07-14 23:45:53 +0200)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib hongxu/add-recipe2
>   http://cgit.openembedded.org/openembedded-core-contrib/log/
> ?h=hongxu/add-recipe2
>
> Hongxu Jia (10):
>   keybinder: add recipe 3.0
>   volume-key: add recipe 0.3.9
>   libgnomekbd: 2.32 -> 3.22
>   python3-pykickstart: add recipe 2.35
>   python3-meh: add recipe 0.45
>   usermode: add recipe 1.111
>   isomd5sum: add recipe 1.2.1
>   satyr: add recipe 0.23
>   libtar: add recipe 1.2.20
>   xmlrpc-c: add recipe 1.31.0
>
>  .../gnome-settings-daemon_2.32.1.bb                |   3 -
>  .../recipes-gnome/libgnome/libgnomekbd_2.32.0.bb   |  20 ---
>  .../recipes-gnome/libgnome/libgnomekbd_3.22.0.bb   |  17 +++
>  .../recipes-support/keybinder/keybinder_3.0.bb     |  26 ++++
>  ...ix-compile-failure-against-musl-C-library.patch |  27 ++++
>  .../recipes-support/usermode/usermode_1.111.bb     |  27 ++++
>  meta-oe/licenses/X11                               |  23 ++++
>  ...ix-compile-failure-against-musl-C-library.patch |  52 +++++++
>  .../recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb   |  23 ++++
>  .../files/0001-tweak-install-prefix.patch          |  60 ++++++++
>  .../isomd5sum/files/0002-fix-parallel-error.patch  |  33 +++++
>  .../recipes-extended/isomd5sum/isomd5sum_1.2.1.bb  |  35 +++++
>  ...-explicitly-support-python3-by-pkg-config.patch |  56 ++++++++
>  .../volume_key/volume-key_0.3.9.bb                 |  34 +++++
>  .../libtar/files/0002-Do-not-strip-libtar.patch    |  25 ++++
>  .../libtar/files/fix_libtool_sysroot.patch         |  19 +++
>  meta-oe/recipes-support/libtar/libtar_1.2.20.bb    |  21 +++
>  .../satyr/files/0001-do-not-support-python2.patch  |  84 ++++++++++++
>  ...ix-compile-failure-against-musl-C-library.patch |  28 ++++
>  meta-oe/recipes-support/satyr/satyr_0.23.bb        |  33 +++++
>  .../files/tweak-native-language-support.patch      |  44 ++++++
>  .../python-meh/python3-meh_0.45.bb                 |  17 +++
>  ...0001-support-authentication-for-kickstart.patch | 151
> +++++++++++++++++++++
>  ...-parser.py-add-lock-for-readKickstart-and.patch |  76 +++++++++++
>  ...-sections-shutdown-and-environment-in-gen.patch |  48 +++++++
>  ...d.py-retry-to-invoke-request-with-timeout.patch |  82 +++++++++++
>  .../python-pykickstart/python3-pykickstart_2.35.bb |  26 ++++
>  27 files changed, 1067 insertions(+), 23 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/libgnome/
> libgnomekbd_2.32.0.bb
>  create mode 100644 meta-gnome/recipes-gnome/libgnome/
> libgnomekbd_3.22.0.bb
>  create mode 100644 meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
>  create mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-fix-
> compile-failure-against-musl-C-library.patch
>  create mode 100644 meta-gnome/recipes-support/usermode/usermode_1.111.bb
>  create mode 100644 meta-oe/licenses/X11
>  create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-
> compile-failure-against-musl-C-library.patch
>  create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
>  create mode 100644 meta-oe/recipes-extended/isomd5sum/files/0001-tweak-
> install-prefix.patch
>  create mode 100644 meta-oe/recipes-extended/isomd5sum/files/0002-fix-
> parallel-error.patch
>  create mode 100644 meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.1.bb
>  create mode 100644 meta-oe/recipes-extended/volume_key/files/0001-
> explicitly-support-python3-by-pkg-config.patch
>  create mode 100644 meta-oe/recipes-extended/volume_key/
> volume-key_0.3.9.bb
>  create mode 100644 meta-oe/recipes-support/libtar/files/0002-Do-not-
> strip-libtar.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/fix_libtool_
> sysroot.patch
>  create mode 100644 meta-oe/recipes-support/libtar/libtar_1.2.20.bb
>  create mode 100644 meta-oe/recipes-support/satyr/
> files/0001-do-not-support-python2.patch
>  create mode 100644 meta-oe/recipes-support/satyr/files/0002-fix-compile-
> failure-against-musl-C-library.patch
>  create mode 100644 meta-oe/recipes-support/satyr/satyr_0.23.bb
>  create mode 100644 meta-python/recipes-extended/
> python-meh/files/tweak-native-language-support.patch
>  create mode 100644 meta-python/recipes-extended/python-meh/
> python3-meh_0.45.bb
>  create mode 100644 meta-python/recipes-extended/
> python-pykickstart/files/0001-support-authentication-for-kickstart.patch
>  create mode 100644 meta-python/recipes-extended/
> python-pykickstart/files/0002-pykickstart-parser.py-add-
> lock-for-readKickstart-and.patch
>  create mode 100644 meta-python/recipes-extended/
> python-pykickstart/files/0003-comment-out-sections-shutdown-
> and-environment-in-gen.patch
>  create mode 100644 meta-python/recipes-extended/
> python-pykickstart/files/0004-load.py-retry-to-invoke-
> request-with-timeout.patch
>  create mode 100644 meta-python/recipes-extended/python-pykickstart/
> python3-pykickstart_2.35.bb
>
> --
> 2.8.1
>
>

