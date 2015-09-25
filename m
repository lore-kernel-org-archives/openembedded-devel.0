Return-Path: <yugeraj.ramajayam@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3A49876FC9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2015 09:25:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 25 Sep 2015 02:25:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,586,1437462000"; 
	d="scan'208,217";a="812705033"
Received: from kmsmsx153.gar.corp.intel.com ([172.21.73.88])
	by fmsmga002.fm.intel.com with ESMTP; 25 Sep 2015 02:25:20 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.172]) by
	KMSMSX153.gar.corp.intel.com ([169.254.5.192]) with mapi id
	14.03.0248.002; Fri, 25 Sep 2015 17:25:19 +0800
From: "Ramajayam, Yugeraj" <yugeraj.ramajayam@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-java] openjdk: openjdk.tar.bz2 download time out due to
	sha256sum mismatch.
Thread-Index: AdD3c9wnx4yvlXkqSBK6sRsk2GSHJw==
Date: Fri, 25 Sep 2015 09:25:18 +0000
Message-ID: <D4F319EC2C6BBA46B2FB63E54D8E81C3C03392@PGSMSX101.gar.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-java] openjdk: openjdk.tar.bz2 download time out due to sha256sum mismatch.
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
X-List-Received-Date: Fri, 25 Sep 2015 09:25:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am trying to include java support for valleyisland-64 bsp.

I have followed all the Usage Instructions as mentioned in the meta-java Ab=
out page.
I have also created a ./meta-netcontiki/recipes-sato/images/core-image-sato=
-%.bbappend with the following content in it:

IMAGE_INSTALL +=3D "native-border-router libcoap"
IMAGE_INSTALL +=3D "radvd"


IMAGE_INSTALL =3D "busybox modutils-initscripts initscripts opkg udev sysvi=
nit netbase base-files base-passwd \
                 ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL} =
\
                openjdk-7-jre openjdk-7-vm-zero openjdk-7-vm-jamvm openjdk-=
7-vm-cacao \
                openjdk-6-jre openjdk-6-vm-zero openjdk-6-vm-jamvm openjdk-=
6-vm-cacao \
                strace dropbear binutils \
                classpath \
                classpath-common \
                classpath-examples \
                classpath-tools \
                jamvm \
                cacao \
                "

When I execute $ bitbake core-image-sato , I am having following error due =
to openjdk.tar.bz2 time out issue.
When I try to wget manually, the tar ball was downloaded fine and the md5su=
m and sha256sum matches accordingly.
The error message appears as below :

ln -sf /home/ilab/dev/build/poky/build/tmp/work/corei7-64-poky-linux/openjd=
k-7-jre/85b01-2.6.1-r6.1/39b2c4354d0a.tar.bz2 openjdk.tar.bz2

if ! echo "0168a0174ee47407139ee32458c4d2a298ba4f44260343b209250156e4da463f=
  openjdk.tar.bz2" \
          | /usr/bin/sha256sum --check ; \
        then \
          if test "xyes" =3D "xyes"; then \
            if [ -e openjdk.tar.bz2 ] ; then \
              mv openjdk.tar.bz2 openjdk.tar.bz2.old ; \
            fi ; \
            /usr/bin/wget http://icedtea.classpath.org/download/drops/icedt=
ea7/2.6.1/openjdk.tar.bz2; \
            if ! echo "0168a0174ee47407139ee32458c4d2a298ba4f44260343b20925=
0156e4da463f  openjdk.tar.bz2" \
              | /usr/bin/sha256sum --check ; then \
              echo "ERROR: Bad download of OpenJDK root zip"; false; \
            fi; \
          else \
            echo "ERROR: No up-to-date OpenJDK root zip available"; exit -1=
; \
          fi ; \
        fi ;

openjdk.tar.bz2: FAILED
/usr/bin/sha256sum: WARNING: 1 computed checksum did NOT match

--2015-09-25 17:00:34--  http://icedtea.classpath.org/download/drops/icedte=
a7/2.6.1/openjdk.tar.bz2

Resolving icedtea.classpath.org (icedtea.classpath.org)...
208.78.240.231

Connecting to icedtea.classpath.org (icedtea.classpath.org)|208.78.240.231|=
:80...
failed: Connection timed out.

Retrying.

The retrying process goes on and on.

Am I missing any settings or configurations? Please guide me.
Thanks in advance.

Regards,
RAJ


