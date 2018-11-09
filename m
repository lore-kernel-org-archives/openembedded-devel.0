Return-Path: <cdgarren@indesign-llc.com>
Received: from mail02.indesign-llc.com (mail02.indesign-llc.com [207.67.30.40])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC546C1F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Nov 2018 12:59:37 +0000 (UTC)
Received: from VM-IND37.indesign.net (192.168.10.190) by VM-IND37.indesign.net
	(192.168.10.190) with Microsoft SMTP Server (TLS) id 15.1.225.42;
	Fri, 9 Nov 2018 07:59:38 -0500
Received: from VM-IND37.indesign.net ([fe80::e895:bfb4:ee53:4249]) by
	VM-IND37.indesign.net ([fe80::e895:bfb4:ee53:4249%12]) with mapi id
	15.01.0225.041; Fri, 9 Nov 2018 07:59:38 -0500
From: "Garren, Chris D." <cdgarren@indesign-llc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-browser] Chromium missing DEPENDS
Thread-Index: AdR4K3VweLiJ98e8TmSKUPnVTz7lBQ==
Date: Fri, 9 Nov 2018 12:59:38 +0000
Message-ID: <af5d8ef579cd4b05978c66c78d17e82e@indesign-llc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.40.114]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-browser] Chromium missing DEPENDS
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
X-List-Received-Date: Fri, 09 Nov 2018 12:59:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm working on building an image with chromium for a Variscite VAR-SOM-MX6-=
SOLO. I previously was able to build an image for the DART-6UL successfully=
 with chromium included. When I changed machines, I started getting an erro=
r during the do_configure step of chromium-x11:

ERROR: chromium-x11-69.0.3497.100-r0 do_configure: Function failed: do_conf=
igure (log file is located at /home/cdgarren/yocto/build/tmp/work/cortexa9h=
f-neon-mx6qdl-poky-linux-gnueabi/chromiu
m-x11/69.0.3497.100-r0/temp/log.do_configure.79809)
ERROR: Logfile of failure stored in: /home/cdgarren/yocto/build/tmp/work/co=
rtexa9hf-neon-mx6qdl-poky-linux-gnueabi/chromium-x11/69.0.3497.100-r0/temp/=
log.do_configure.79809
Log data follows:
| DEBUG: Executing shell function do_configure
| ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned non-=
zero exit code.
|     pkgresult =3D exec_script(pkg_config_script, args, "value")
|                 ^----------
| Current dir: /home/cdgarren/yocto/build/tmp/work/cortexa9hf-neon-mx6qdl-p=
oky-linux-gnueabi/chromium-x11/69.0.3497.100-r0/chromium-69.0.3497.100/out/=
Release/
| Command: python /home/cdgarren/yocto/build/tmp/work/cortexa9hf-neon-mx6qd=
l-poky-linux-gnueabi/chromium-x11/69.0.3497.100-r0/chromium-69.0.3497.100/b=
uild/config/linux/pkg-config.py atk atk-bridge-2.0
| Returned 1.
| stderr:
|
| Package atk-bridge-2.0 was not found in the pkg-config search path.
| Perhaps you should add the directory containing `atk-bridge-2.0.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'atk-bridge-2.0' found
| Could not run pkg-config.
|
| See //build/config/linux/atk/BUILD.gn:20:1: whence it was called.
| pkg_config("atk_base") {
| ^-----------------------
| See //ui/views/BUILD.gn:686:24: which caused the file to be included.
|           configs +=3D [ "//build/config/linux/atk" ]
|                        ^-------------------------
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/cdgarr=
en/yocto/build/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/chromium-=
x11/69.0.3497.100-r0/temp/log.do_configure.79809)
ERROR: Task (/home/cdgarren/yocto/sources/meta-browser/recipes-browser/chro=
mium/chromium-x11_69.0.3497.100.bb:do_configure) failed with exit code '1'

Any ideas what might be causing this?

Thanks,

Chris Garren


