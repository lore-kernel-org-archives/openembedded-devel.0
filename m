Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4D9EB6C182
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2018 16:49:01 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id s5-v6so8038598plq.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2018 08:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=i8xGKS7I6jbSVpTO9MIGetvcRyIC1lLqXoVo0ZYjuNo=;
	b=Vm68jKj77OnM/QLwWZG497ozQfhXuHSJRGSnDAuUOqgDt/6njZSU2LAnuX3Ndj5dPR
	ayxyt63xMGiz+lyW34zxp3qGbIJKJhdYFD7Y1qsLOhi611Kj6Wq8sb6/fPaMDjXU7WBi
	5Hr6s+FZ8fLIC1K/WlbiMQBtRT1FMxbg5AHuAfz15FkTQpcPQ9V9/5q7T5Wnh21SCiOd
	/H+Di8UE9+Cim7hU+ghT5VhShv31MIRK+KQb+aGgeSdJ6KB2T9vHjSpVQJlC46N1+XmU
	ojQsnoprG4jgLjBiK/I5QtUXPDFw0TOOVrb/CPYK+meMuvhHb1PuXsBaFwSBrQ3E3+H/
	3ltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=i8xGKS7I6jbSVpTO9MIGetvcRyIC1lLqXoVo0ZYjuNo=;
	b=SvnrBKJ0zhnAJdg7/zTTKICPkp74ZCkNTTc/T7zggI2f6EiNJs+D5m0KNtXWssgBQM
	K50j1hlOdELcrzIbT44BAGzvOhoDbH/3qCHS7io+X8kJjgAWlMyortbUXA4BVUWeKahD
	ZGagCo/oBo1E2XRujGTV6b4Khjo4KkwJCMFc0Nu2IGo70ke4VZymLTzRakvHp/tiZFUh
	7OYT5+pIOY40gdQ3XAT0qxM/fdWfKxSv75f7TyIudSyOSCo2eSFEnACSo2fQdQnpJXEI
	tF+Zn20Gm+B6qKk8NjIYI7jQuF3xNPb7TtIpP4YEZ5V7N43AWnzOMyVvvYzSmK/oCgJt
	ve1g==
X-Gm-Message-State: AGRZ1gInsirLGZ/GgI/sTHz56N2jwM5JpCIICzrbnK2t6FtiO0gTn8gH
	LSDdtuDR5FGuXtd18lv0aY+Ru0Xn
X-Google-Smtp-Source: AJdET5ct5q5u1fHKjRvW8N2qHiiMXn/Vfm24LPJdpVlpRIlS8M6HbqUd5wrx0ckF2uZsD/0J0hgtlw==
X-Received: by 2002:a17:902:a5ca:: with SMTP id
	t10mr2608553plq.139.1542214141897; 
	Wed, 14 Nov 2018 08:49:01 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:7db3:34a2:3c95:1c57?
	([2601:202:4180:c33:7db3:34a2:3c95:1c57])
	by smtp.gmail.com with ESMTPSA id
	i189-v6sm44768274pfc.16.2018.11.14.08.49.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Nov 2018 08:49:01 -0800 (PST)
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <8ff23977-e4c4-e84a-4e88-e26a1de272f9@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <0e1002c7-bc0b-6d50-246f-4aeb90c4871a@gmail.com>
Date: Wed, 14 Nov 2018 08:48:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <8ff23977-e4c4-e84a-4e88-e26a1de272f9@windriver.com>
Subject: Re: thud: 19 cherry-picks from master
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
X-List-Received-Date: Wed, 14 Nov 2018 16:49:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Randy,

On 11/13/18 5:30 PM, Randy MacLeod wrote:
> Armin,
>
> Please consider each of the following commits to be
> cherry-picked back to thud. I believe that they are all
> defect fixes except in one or two case as noted.
>
Thanks for this list.

Khem talked to me about Thud last week and we decided to sync master to
Thud. We did not say which one of us was doing that so I will start this
work shortly.

kind regards,

Armin

> 3cb226393 uftrace: Support x86 <-- optional I suppose.
>
> 4d53ab222 netcat-openbsd: update SRC_URI
> 32e5f3506 netkit-telnet: update SRC_URI
> 5cf604e13 vlan: update SRC_URI
> 57bcd4df9 lvm2: update SRC_URI
> 2aa70599d geoip: update md5sum and sha256sum
>
> 17a4e8269 uriparser: Allow native build <-- optional but easy
>
> bcbbace22 netkit-telnet: fix qa warnings of alternative target
>
> e9e214875 apache2: Fix CVE-2018-11763
>
> 40a43f59d network-manager-applet: change default buildclass
>
> e15f5c08a pcsc-lite: fix SRC_URI
> 15141ab55 lvm2.inc: Correct the license (LGPL-2.0 -> LGPL-2.1)
>
>
> 030c3ce91 network-manager-applet: move GNOMEBASEBUILDCLASS to
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 correct position=

> d77cac3c5 vim-tiny: remove alternative for xxd
> 3be07aff4 modemmanager: set udev base dir to ${nonarch_base_libdir}/ude=
v
>
> 6646362e7 python-configparser.inc: Fix SUMMARY
>
> aea60d4cc curlpp: Fix packaging and reference to license
>
> 0e0104d62 libunique: fix installed-vs-shipped qa issue
> 993da5d96 hwloc: Update the SRC_URI
>
>
>
> I've selected the fixes from the list below.
> I looked at each commit but I haven't done any build testing yet.
> I can do that tomorrow if you like but it seems that they are working
> now and cherry-picked over without a problem so they should all
> build fine.
>
>
> You can get the full series cherry-picked to thud with:
> $ for i in \
> 3cb226393 4d53ab222 32e5f3506 5cf604e13 57bcd4df9 \
> 2aa70599d 17a4e8269 bcbbace22 e9e214875 40a43f59d \
> e15f5c08a 15141ab55 030c3ce91 d77cac3c5 3be07aff4 \
> 6646362e7 aea60d4cc 0e0104d62 993da5d96; \
> do \
> =C2=A0 echo $i; \
> =C2=A0 git cherry-pick $i; \
> done
>
> ../Randy
>
>
> $ git log --oneline=C2=A0 master=C2=A0 ^thud
> 3d0c2d028 stress-ng: Upgrade from 0.09.37 to 0.09.45
> 016b243f1 libgpiod: bump version to v1.2
> 993da5d96 hwloc: Update the SRC_URI
> 0e0104d62 libunique: fix installed-vs-shipped qa issue
> 97f56b745 sedutil: Add recipe
> aea60d4cc curlpp: Fix packaging and reference to license
> b534159b1 tk: extend to nativesdk
> 8a8808315 networkmanager: Fix build with musl
> 317412bd1 Adding support for xscreensaver-5.39
> b40cc1890 meta-xfce: xfconf: fixup installed-vs-shipped QA issue
> 6646362e7 python-configparser.inc: Fix SUMMARY
> 030c3ce91 network-manager-applet: move GNOMEBASEBUILDCLASS to
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 correct position=

> d77cac3c5 vim-tiny: remove alternative for xxd
> 3be07aff4 modemmanager: set udev base dir to ${nonarch_base_libdir}/ude=
v
> cabdfa287 cpprest: upgrade to version 2.10.7 and add support for
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 brotli library
> 80d37c453 brotli: add initial recipe, based on meta-webkit layer
> c90572b2f glog: updated libunwind look up function
> 15141ab55 lvm2.inc: Correct the license (LGPL-2.0 -> LGPL-2.1)
> e15f5c08a pcsc-lite: fix SRC_URI
> 40a43f59d network-manager-applet: change default buildclass
> 7163946b5 rapidjson: Allow empty package
> 60f3d467d mariadb: Upgrade to 5.5.62
> 334d73dc7 v4l-utils: update to 1.16.0
> fd23b9c95 dbus-broker: fetch submodules too
> 4be3dce46 networkmanager: upgrade 1.10.10 -> 1.14.4
> 1627aa060 xfce4-settings: upgrade 4.12.3 -> 4.12.4
> e9e214875 apache2: Fix CVE-2018-11763
> 5f94a97b0 adduser: 3.117 -> 3.118
> 57d261cad lcov: Fix perl module dependencies
> 6570a8d56 libio-socket-ssl-perl: 2.059 -> 2.060
> fae12cab3 gvfs: 1.36.2 -> 1.39.1
> 31d701261 libwnck3: 3.24.1 -> 3.30.0
> f27c15d94 thunar: 1.8.1 -> 1.8.2
> c1bc28f18 xfce4-notifyd: 0.4.2 -> 0.4.3
> 76bfed565 xfce4-clipman-plugin: 1.4.2 -> 1.4.3
> 4222cac97 xfconf: 4.13.5 -> 4.13.6
> bcbbace22 netkit-telnet: fix qa warnings of alternative target
> 8d7a7ad33 libyui-ncurses: fix ncurses find module
> 2417acf4f libyui: make resulting cmake config relocatable
> b5dd6804f civetweb: disable tests
> a21e2ae87 civetweb: remove redundant EXTRA_OECMAKE_class-native
> 12c394588 python-twisted: Add more python-twisted-* packages
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to the "meta" pa=
ckage
> 2731f210c python-pyiface: Upgrade to 0.0.11
> 17a4e8269 uriparser: Allow native build
> 4d53ab222 netcat-openbsd: update SRC_URI
> 32e5f3506 netkit-telnet: update SRC_URI
> 5cf604e13 vlan: update SRC_URI
> 57bcd4df9 lvm2: update SRC_URI
> 2aa70599d geoip: update md5sum and sha256sum
> 3cb226393 uftrace: Support x86
>


