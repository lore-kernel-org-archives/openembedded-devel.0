Return-Path: <stefan@agner.ch>
X-Greylist: delayed 447 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 Mar 2016 03:23:15 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 08E6E731F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2016 03:23:15 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id B4D2D5C0310;
	Fri, 11 Mar 2016 04:15:14 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 10 Mar 2016 19:12:55 -0800
From: Stefan Agner <stefan@agner.ch>
To: anibal.limon@linux.intel.com
Message-ID: <1d5cc52037d090b4f12b24f85bc361f6@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.1.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1457666114; bh=YSoV4ZYcFb19LGsrUkQsifplSXX23EwL1lApjH8Swjk=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:Message-ID;
	b=qy5vlXJphAw9UuZ5yj6HP2BHKLvYUZPDP68uOmALTCk9yqg3v/qtLFiVvrBqFG/xGpHsev1IuuN3LrkkdVD2+AFM0/tNzI11aV0rSelN58LyPTF3sT/OMr+BeERo+2epUi/uWo31iV4yVv1nLcQTkOd73oKkgiysYTKd6/jZJBs=
Cc: openembedded-devel@lists.openembedded.org,
	Marcel Ziswiler <marcel@ziswiler.com>, angstrom-distro-devel@linuxtogo.org
Subject: license_create_manifest fails on jethro
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
X-List-Received-Date: Fri, 11 Mar 2016 03:23:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Anibal,

I think the patch a7976cbae3 ("license_class: Reimplemented manifest
creation in python") broke Ångstroms way of deploying license files.
With jethro I get the following error when building the _second_
machine:

ERROR: Error executing a python function in
/build/ags/oe-core_V2.6/build/../stuff/meta-toradex/recipes/images/console-trdx-image.bb:

The stack trace of python calls that resulted in this exception/failure
was:
File: 'license_create_manifest', lineno: 110, function: <module>
     0106:
     0107:                        os.link(pkg_license,
pkg_rootfs_license)
     0108:
     0109:
 *** 0110:license_create_manifest(d)
     0111:
File: 'license_create_manifest', lineno: 86, function:
license_create_manifest
     0082:                pkg_rootfs_license_dir =
os.path.join(rootfs_license_dir, pkg)
     0083:                os.makedirs(pkg_rootfs_license_dir)
     0084:                pkg_license_dir =
os.path.join(d.getVar('LICENSE_DIRECTORY', True),
     0085:                                           
pkg_dic[pkg]["PN"])
 *** 0086:                licenses = os.listdir(pkg_license_dir)
     0087:                for lic in licenses:
     0088:                    rootfs_license =
os.path.join(rootfs_license_dir, lic)
     0089:                    pkg_license =
os.path.join(pkg_license_dir, lic)
     0090:                    pkg_rootfs_license =
os.path.join(pkg_rootfs_license_dir, lic)
Exception: OSError: [Errno 2] No such file or directory:
'/build/ags/oe-core_V2.6/build/out-glibc/deploy/licenses/colibri_imx7/alsa-utils'

ERROR: Function failed: license_create_manifest
ERROR: Logfile of failure stored in:
/build/ags/oe-core_V2.6/build/out-glibc/work/colibri_imx7-angstrom-linux-gnueabi/console-trdx-image/V2.6-r0/temp/log.do_rootfs.29351
ERROR: Task 7
(/build/ags/oe-core_V2.6/build/../stuff/meta-toradex/recipes/images/console-trdx-image.bb,
do_rootfs) failed with exit code '1'

It might relate to how Ångström configures the LICENSE_DIRECTORY
variable (by including MACHINE_ARCH, see
https://github.com/Angstrom-distribution/meta-angstrom/blob/angstrom-v2015.12-yocto2.0/conf/distro/include/angstrom-core-tweaks.inc):
LICENSE_DIRECTORY = "${DEPLOY_DIR}/licenses/${MACHINE_ARCH}"

I am not sure what exactly causes the issue, but after reverting your
patch two consecutive builds of different machines succeeded...

However, I still get a lot of warnings such as:
WARNING: The license listed LGPLv2.1 was not in the licenses collected
for systemd

Any ideas?

--
Stefan

