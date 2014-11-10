Return-Path: <californialsullivan@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2F33265D3A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 23:19:56 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id g201so6192336oib.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 15:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=/ohNeecJqiaQwiJPzeskNE9oWO+f/yWtX5UPG8VDIL0=;
	b=A4orK8hnAMSjqDllXpPHvZfE8xutkw8S5hYKwa56FjZFff78+9jBKOudqYaPOktTG2
	hlCCdZ0RgRXMEzq2Tet/4wq9NyfJCtDqgGR0LheNZ1fapsEOFz4whGICyPxp1J9o67tE
	9VokcHRqc0fwM00Z9HAMvkSDAJItJ5WMA/++jZO0xbMgmble7bOkm9HYOROLmzdAo1a1
	qKBBXaUWS9nZXL3Ch2LdT/Wpkqe2eVXZfsLdCWFgoOs0lpsgJBE4JptLe9uZGkaY4IZk
	wO2wkbPgzMH/Ga2rxSz9a7XAGN0+dYTNX5GzyCTogOe50eWrpGDZWAMTVrHNSf9JPJUN
	+/Xg==
MIME-Version: 1.0
X-Received: by 10.202.91.138 with SMTP id p132mr8653094oib.40.1415661596575;
	Mon, 10 Nov 2014 15:19:56 -0800 (PST)
Received: by 10.76.172.197 with HTTP; Mon, 10 Nov 2014 15:19:56 -0800 (PST)
Date: Mon, 10 Nov 2014 18:19:56 -0500
Message-ID: <CAMP9K88K4LhgYLoL9mM9iv_GdNHq_17GuzLfxAzQeGZNzLNWRQ@mail.gmail.com>
From: California Sullivan <californialsullivan@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Problem with php package
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
X-List-Received-Date: Mon, 10 Nov 2014 23:20:04 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

I am having an issue with the php package in the dizzy branch of
meta-openembedded(/meta-oe/recipes-devtools).

Php's build succeeds:

NOTE: recipe php-5.4.33-r0: task do_fetch: Started
NOTE: recipe php-5.4.33-r0: task do_fetch: Succeeded
NOTE: recipe php-5.4.33-r0: task do_unpack: Started
NOTE: recipe php-5.4.33-r0: task do_unpack: Succeeded
NOTE: recipe php-5.4.33-r0: task do_patch: Started
NOTE: recipe php-5.4.33-r0: task do_patch: Succeeded
NOTE: recipe php-5.4.33-r0: task do_configure: Started
NOTE: recipe php-5.4.33-r0: task do_populate_lic: Started
NOTE: recipe php-5.4.33-r0: task do_populate_lic: Succeeded
NOTE: recipe php-5.4.33-r0: task do_configure: Succeeded
NOTE: recipe php-5.4.33-r0: task do_compile: Started
NOTE: recipe php-5.4.33-r0: task do_compile: Succeeded
NOTE: recipe php-5.4.33-r0: task do_install: Started
NOTE: recipe php-5.4.33-r0: task do_install: Succeeded
NOTE: recipe php-5.4.33-r0: task do_package: Started
NOTE: recipe php-5.4.33-r0: task do_populate_sysroot: Started
NOTE: recipe php-5.4.33-r0: task do_populate_sysroot: Succeeded
NOTE: recipe php-5.4.33-r0: task do_package: Succeeded
NOTE: recipe php-5.4.33-r0: task do_packagedata: Started
NOTE: recipe php-5.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe php-5.4.33-r0: task do_package_qa: Started
NOTE: recipe php-5.4.33-r0: task do_package_write_rpm: Started
NOTE: recipe php-5.4.33-r0: task do_package_qa: Succeeded
NOTE: recipe php-5.4.33-r0: task do_package_write_rpm: Succeeded

But when it comes to to do the rootfs process the following error occurs:

ERROR: Unable to install packages. Command
'/home/clsulliv/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/smart
--quiet
--data-dir=/home/clsulliv/yocto/poky/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0-r0/rootfs/var/lib/smart
install -y packagegroup-core-ssh-dropbear@all
packagegroup-core-x11-sato-games@genericx86_64
packagegroup-base-extended@genericx86_64 packagegroup-core-x11-base@all
smartpm@core2_64 psplash@core2_64 packagegroup-core-boot@genericx86_64
php@core2_64 rpm@core2_64 packagegroup-core-x11-sato@genericx86_64
locale-base-en-us@core2_64 locale-base-en-gb@core2_64' returned 1:
error: Can't install php-5.4.33-r0@core2_64: no package provides
/home/clsulliv/yocto/poky/build/tmp/work/core2-64-poky-linux/php/5.4.33-r0/image/usr/bin/php


The file /home/clsulliv/yocto/poky/build/tmp/work/core2-64-poky-linux/php/5.4.33-r0/image/usr/bin/php
does exist, and the php bitbake recipe has PACKAGES = " ... ${PN}" as well,
so the php package should be provided.

For reference, I am hitting this while building core-image-sato with php
added in, with both the poky repo and meta-openembedded repo on the latest
dizzy branch head.

Any help figuring out this issue would be appreciated.

Thank you,
Cal Sullivan

