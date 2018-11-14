Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C61326C3F2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2018 01:31:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAE1UP9Z003816
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Nov 2018 17:31:02 -0800
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 13 Nov 2018 17:30:47 -0800
To: <openembedded-devel@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <8ff23977-e4c4-e84a-4e88-e26a1de272f9@windriver.com>
Date: Tue, 13 Nov 2018 20:30:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
X-Originating-IP: [172.25.44.4]
Subject: thud: 19 cherry-picks from master
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
X-List-Received-Date: Wed, 14 Nov 2018 01:31:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Armin,

Please consider each of the following commits to be
cherry-picked back to thud. I believe that they are all
defect fixes except in one or two case as noted.

3cb226393 uftrace: Support x86 <-- optional I suppose.

4d53ab222 netcat-openbsd: update SRC_URI
32e5f3506 netkit-telnet: update SRC_URI
5cf604e13 vlan: update SRC_URI
57bcd4df9 lvm2: update SRC_URI
2aa70599d geoip: update md5sum and sha256sum

17a4e8269 uriparser: Allow native build <-- optional but easy

bcbbace22 netkit-telnet: fix qa warnings of alternative target

e9e214875 apache2: Fix CVE-2018-11763

40a43f59d network-manager-applet: change default buildclass

e15f5c08a pcsc-lite: fix SRC_URI
15141ab55 lvm2.inc: Correct the license (LGPL-2.0 -> LGPL-2.1)


030c3ce91 network-manager-applet: move GNOMEBASEBUILDCLASS to
           correct position
d77cac3c5 vim-tiny: remove alternative for xxd
3be07aff4 modemmanager: set udev base dir to ${nonarch_base_libdir}/udev

6646362e7 python-configparser.inc: Fix SUMMARY

aea60d4cc curlpp: Fix packaging and reference to license

0e0104d62 libunique: fix installed-vs-shipped qa issue
993da5d96 hwloc: Update the SRC_URI



I've selected the fixes from the list below.
I looked at each commit but I haven't done any build testing yet.
I can do that tomorrow if you like but it seems that they are working
now and cherry-picked over without a problem so they should all
build fine.


You can get the full series cherry-picked to thud with:
$ for i in \
3cb226393 4d53ab222 32e5f3506 5cf604e13 57bcd4df9 \
2aa70599d 17a4e8269 bcbbace22 e9e214875 40a43f59d \
e15f5c08a 15141ab55 030c3ce91 d77cac3c5 3be07aff4 \
6646362e7 aea60d4cc 0e0104d62 993da5d96; \
do \
   echo $i; \
   git cherry-pick $i; \
done

../Randy


$ git log --oneline  master  ^thud
3d0c2d028 stress-ng: Upgrade from 0.09.37 to 0.09.45
016b243f1 libgpiod: bump version to v1.2
993da5d96 hwloc: Update the SRC_URI
0e0104d62 libunique: fix installed-vs-shipped qa issue
97f56b745 sedutil: Add recipe
aea60d4cc curlpp: Fix packaging and reference to license
b534159b1 tk: extend to nativesdk
8a8808315 networkmanager: Fix build with musl
317412bd1 Adding support for xscreensaver-5.39
b40cc1890 meta-xfce: xfconf: fixup installed-vs-shipped QA issue
6646362e7 python-configparser.inc: Fix SUMMARY
030c3ce91 network-manager-applet: move GNOMEBASEBUILDCLASS to
           correct position
d77cac3c5 vim-tiny: remove alternative for xxd
3be07aff4 modemmanager: set udev base dir to ${nonarch_base_libdir}/udev
cabdfa287 cpprest: upgrade to version 2.10.7 and add support for
           brotli library
80d37c453 brotli: add initial recipe, based on meta-webkit layer
c90572b2f glog: updated libunwind look up function
15141ab55 lvm2.inc: Correct the license (LGPL-2.0 -> LGPL-2.1)
e15f5c08a pcsc-lite: fix SRC_URI
40a43f59d network-manager-applet: change default buildclass
7163946b5 rapidjson: Allow empty package
60f3d467d mariadb: Upgrade to 5.5.62
334d73dc7 v4l-utils: update to 1.16.0
fd23b9c95 dbus-broker: fetch submodules too
4be3dce46 networkmanager: upgrade 1.10.10 -> 1.14.4
1627aa060 xfce4-settings: upgrade 4.12.3 -> 4.12.4
e9e214875 apache2: Fix CVE-2018-11763
5f94a97b0 adduser: 3.117 -> 3.118
57d261cad lcov: Fix perl module dependencies
6570a8d56 libio-socket-ssl-perl: 2.059 -> 2.060
fae12cab3 gvfs: 1.36.2 -> 1.39.1
31d701261 libwnck3: 3.24.1 -> 3.30.0
f27c15d94 thunar: 1.8.1 -> 1.8.2
c1bc28f18 xfce4-notifyd: 0.4.2 -> 0.4.3
76bfed565 xfce4-clipman-plugin: 1.4.2 -> 1.4.3
4222cac97 xfconf: 4.13.5 -> 4.13.6
bcbbace22 netkit-telnet: fix qa warnings of alternative target
8d7a7ad33 libyui-ncurses: fix ncurses find module
2417acf4f libyui: make resulting cmake config relocatable
b5dd6804f civetweb: disable tests
a21e2ae87 civetweb: remove redundant EXTRA_OECMAKE_class-native
12c394588 python-twisted: Add more python-twisted-* packages
           to the "meta" package
2731f210c python-pyiface: Upgrade to 0.0.11
17a4e8269 uriparser: Allow native build
4d53ab222 netcat-openbsd: update SRC_URI
32e5f3506 netkit-telnet: update SRC_URI
5cf604e13 vlan: update SRC_URI
57bcd4df9 lvm2: update SRC_URI
2aa70599d geoip: update md5sum and sha256sum
3cb226393 uftrace: Support x86

-- 
# Randy MacLeod
# Wind River Linux

