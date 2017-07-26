Return-Path: <gizero@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6AF5977BE8;
	Wed, 26 Jul 2017 13:55:12 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id q25so99173116uah.1;
	Wed, 26 Jul 2017 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=1FzFw3vqN2GP1jflsQYPDBksEKN1YW/rGTTVN/NTOgk=;
	b=KfrYbvOr0b8vfkIDx/AcmAKBD2eBgPzC7S1lVc5WGgD/Nlbzh3oPXiPS7qRhD7Ii+5
	bucxhsQqEgfZorNPwl57TTeqTq+8M9k7XZmLHNbB1sZWwlWJd9I3Vsej/ZvaRXhTjvnG
	XNFGCcTianXeFHALuzGczuZF0ZtKUPKdc8srANQB9obNIGCdQgOrqFZ6PZCUboU5pp64
	SySMaoxh3iXVgJSRF7Og6soK0X9ssjpiB+x9dTxh3PO6OxzMW+MSjLyUEsW53Lm2amDb
	BVaJNJjQs1rjxg2ftmsDlYcl8YvRvbM44yrNcMWF5KEBD/nOZISakOyyaaMZ+YSiaq/q
	tZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=1FzFw3vqN2GP1jflsQYPDBksEKN1YW/rGTTVN/NTOgk=;
	b=T7NiZtZaynfrJ6G53mSACt4+FVqHOsFmOzcQ1KpQ5eHDP8+2sa2Tq13QpQXK3JKTLg
	SFwDP5Pjbm1GCivIoX8l3FHpMsezxfewO4w27j/2JTvZQTnpcTBE2KX/fxCIUc35PvXF
	gDJpXP3hgd5Ak0+il9EmTvG35N94TA8d42xVPURZZ5mAIuq8PZGCtvM7lh4IgOFvIYli
	pafN8g4kaYb8SgGjot8v4mWoM6SrUBSZssjw4UaQzbPh94Eadr1j0ce1IwVXMVD+cww+
	hjcIzJ/V0hXRGH/hag3BYCc7nMqAIMEkfzDMI9dgNtimDCke2EuK2EtHIsx1LTSJ4BwQ
	1tOw==
X-Gm-Message-State: AIVw111/f9bCGKhkHfh8yxcTU2Edd/oDynHV8L6+9fAODEbjj7iIwM/m
	CRfcBeMouFq3n+V+9W8+OeVavscn/am+
X-Received: by 10.159.51.231 with SMTP id y39mr685170uab.130.1501077313789;
	Wed, 26 Jul 2017 06:55:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.74.94 with HTTP; Wed, 26 Jul 2017 06:55:13 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
Date: Wed, 26 Jul 2017 15:55:13 +0200
Message-ID: <CAC+thW1Yk9DbCAqJqxprsZ1kOZ6RQBjVuSAkQTQqCZ=cNerf8A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: android-tools related warnings in (updated) eSDK
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
X-List-Received-Date: Wed, 26 Jul 2017 13:55:13 -0000
Content-Type: text/plain; charset="UTF-8"

When upgrading an eSDK (via devtool sdk-update) from a project that
includes meta-oe in the stack, some files listed in android-tools' SRC_URI,
most notably patches and systemd service file got removed from the eSDK
copy of metadata during the update, leading bitbake to start warning about
not being able to verify the checksum for those files (those files are
indeed missing as shown below).

Here is the log from bitbake:

WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools-native
SRC_URI entry remove-selinux-android.patch: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools-native
SRC_URI entry use-capability.patch: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools-native
SRC_URI entry use-local-socket.patch: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools-native
SRC_URI entry preserve-ownership.patch: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools-native
SRC_URI entry mkbootimg-Add-dt-parameter-to-specify-DT-image.patch: file
could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools-native
SRC_URI entry remove-bionic-android.patch: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools-native
SRC_URI entry define-shell-command.patch: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools-native
SRC_URI entry implicit-declaration-function-strlcat-strlcopy.patch: file
could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools-native
SRC_URI entry fix-big-endian-build.patch: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools-native
SRC_URI entry android-tools-adbd.service: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools
SRC_URI entry remove-selinux-android.patch: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools
SRC_URI entry use-capability.patch: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools
SRC_URI entry use-local-socket.patch: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools
SRC_URI entry preserve-ownership.patch: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools
SRC_URI entry mkbootimg-Add-dt-parameter-to-specify-DT-image.patch: file
could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools
SRC_URI entry remove-bionic-android.patch: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools
SRC_URI entry define-shell-command.patch: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools
SRC_URI entry implicit-declaration-function-strlcat-strlcopy.patch: file
could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools
SRC_URI entry fix-big-endian-build.patch: file could not be found
WARNING:
/home/vagrant/poky_sdk/layers/meta-oe/recipes-devtools/android-tools/
android-tools_5.1.1.r37.bb: Unable to get checksum for android-tools
SRC_URI entry android-tools-adbd.service: file could not be found

...and the metadata files:

$ find poky_sdk/layers/meta-oe/recipes-devtools/android-tools/android-tools
poky_sdk/layers/meta-oe/recipes-devtools/android-tools/android-tools
poky_sdk/layers/meta-oe/recipes-devtools/android-tools/android-tools/
fastboot.mk
poky_sdk/layers/meta-oe/recipes-devtools/android-tools/android-tools/
mkbootimg.mk
poky_sdk/layers/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
poky_sdk/layers/meta-oe/recipes-devtools/android-tools/android-tools/
ext4_utils.mk
poky_sdk/layers/meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
poky_sdk/layers/meta-oe/recipes-devtools/android-tools/android-tools/.gitignore

As you see, *.patch at al. are missing...

The root cause to me seems the existence of a .gitignore file in the
meta-oe metadata
(meta-oe/recipes-devtools/android-tools/android-tools/.gitignore): the
exact reason for this being there is not 100% clear to me but I suspects it
then gets in the way when oe-publish-sdk runs...

Any eSDK and friends guru with a clue here?

