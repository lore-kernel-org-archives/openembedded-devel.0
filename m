Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE517EA53
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 02:21:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5S2KkAq008351
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jun 2019 19:21:06 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 27 Jun 2019 19:20:38 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <fc78dc28-bc7c-2433-871f-3eb5047a0ee8@windriver.com>
Date: Fri, 28 Jun 2019 10:20:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
Subject: RFC: Add DISTRO_FEATURES(xfce) to control meta-xfce
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
X-List-Received-Date: Fri, 28 Jun 2019 02:21:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi all,

Currently, I am improving OE to follow Yocto Project Compatible,
One rule of Yocto Project Compatible is when a new layer is added,
it should not affect other layer, but unfortunately, bbappend in
meta-xfce broke the rule.

So I suggest to add DISTRO_FEATURES(xfce) as a switch to control,
in short term, we could use it to control bbappend in meta-xfce,
in long term, we could use it to control more xfce specific features

(As a alternative way, I also tried to remove bbappend directly,
but I found the existence of bbappend is indeed necessary)

Here is result of
yocto-check-layer-wrapper <build_path>/meta-openembedded/meta-xfce 
--dependency <layer_dep>
[snip]
INFO: test_signatures (common.CommonCheckLayer)
INFO:  ... FAIL

Stdout:
Loading cache...done.
Loaded 3455 entries from dependency cache.
INFO: Traceback (most recent call last):
   File 
"/buildarea1/hjia/community/poky/scripts/lib/checklayer/cases/common.py", 
line 55, in test_signatures
     self.fail('Adding layer %s changed signatures.\n%s' % 
(self.tc.layer['name'], msg))
AssertionError: Adding layer meta-xfce changed signatures.
26 signatures changed, initial differences (first hash before, second 
after):
    blueman:do_configure: 
8c2ddf90c8938d87279b65da1aa61f09c320772043065cfd715fdf17e3c438fe -> 
2494f27a9f561303f6bcffdcfc648518d0061ec25c0ef818c74a387a7c796392
       bitbake-diffsigs --task blueman do_configure --signature 
8c2ddf90c8938d87279b65da1aa61f09c320772043065cfd715fdf17e3c438fe 
2494f27a9f561303f6bcffdcfc648518d0061ec25c0ef818c74a387a7c796392
       NOTE: Starting bitbake server...
       basehash changed from 
cc10b6d09fc23a6932bc549ed1d5989c2bdd822de05aefbbeb1137d4b7cb2479 to 
757a8b62860f22c9620fcc20937c9291e1bee24434db57f37332529cc418dca9
       Variable PACKAGECONFIG_CONFARGS value changed:
       " [---disable-thunar-sendto-] {+--enable-thunar-sendto+}"
       Variable PACKAGECONFIG value changed from '' to ' thunar'

    lxdm:do_fetch: 
becb6b35029e6fe78cd71230062d064f5eb6e2812c04db1e2dd32c3a005a20de -> 
70ef73642eca8825964901efe753d882fc564697f2adf6171b21121a8721dd45
       bitbake-diffsigs --task lxdm do_fetch --signature 
becb6b35029e6fe78cd71230062d064f5eb6e2812c04db1e2dd32c3a005a20de 
70ef73642eca8825964901efe753d882fc564697f2adf6171b21121a8721dd45
       NOTE: Starting bitbake server...
       basehash changed from 
e07ec051ed015a41d2ee46cd0babe75445ebd66c9c0cb12180a3ce57b4247a39 to 
8889a6defcb5a285bbce0dbe6cc9458b4a4483287275390bedf6c5fb07d33641
       Variable SRC_URI value changed:
       @@ -1,3 +1,3 @@
-${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}%20${PV}/${BPN}-${PV}.tar.xz 
file://lxdm.conf ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 
'file://lxdm-pam file://lxdm-pam-debug', '', d)} 
${@bb.utils.contains("DISTRO_TYPE", "debug", "", 
"file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} 
file://0002-let-autotools-create-lxdm.conf.patch 
file://0003-check-for-libexecinfo-providing-backtrace-APIs.patch 
file://0004-fix-css-under-gtk-3.20.patch
+${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}%20${PV}/${BPN}-${PV}.tar.xz 
file://lxdm.conf ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 
'file://lxdm-pam file://lxdm-pam-debug', '', d)} 
${@bb.utils.contains("DISTRO_TYPE", "debug", "", 
"file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} 
file://0002-let-autotools-create-lxdm.conf.patch 
file://0003-check-for-libexecinfo-providing-backtrace-APIs.patch 
file://0004-fix-css-under-gtk-3.20.patch file://gdmflexiserver
        DISTRO_FEATURES{pam} = Unset
        DISTRO_TYPE{debug} = Set
       Dependency on checksum of file gdmflexiserver was added
[snip]

If add DISTRO_FEATURES(xfce) is OK, I will start to work on it
and update meta-xfce/README; if you have other better idea to
the improvement, any suggestion is welcome

//Hongxu


