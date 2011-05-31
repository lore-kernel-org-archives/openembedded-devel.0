Received: from ns.awellconnected.net ([83.167.180.132]
	helo=edison.awellconnected.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas@htc-linux.org>) id 1QRXQX-0007Md-Vu
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 00:28:42 +0200
Received: from localhost.awellconnected.net ([127.0.0.1] helo=localhost)
	by edison.awellconnected.net with esmtpa (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>)
	id 1QRXNC-0005Yh-20; Tue, 31 May 2011 23:25:14 +0100
Received: from 172.17.29.222 ([172.17.29.222]) by webmail.htc-linux.org
	(Horde Framework) with HTTP; Tue, 31 May 2011 23:25:13 +0100
Message-ID: <20110531232513.19296umd0ei7gu0w@webmail.htc-linux.org>
Date: Tue, 31 May 2011 23:25:13 +0100
From: Lukas-David Gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org, shr-devel@lists.shr-project.org
References: <20110531114917.33186l97l89fv3oc@webmail.htc-linux.org>
	<20110531115612.15355h3xwavjtjyo@webmail.htc-linux.org>
In-Reply-To: <20110531115612.15355h3xwavjtjyo@webmail.htc-linux.org>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.9)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: oebb.sh oe-core with non-angstrom distro
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 May 2011 22:28:42 -0000
Content-Type: text/plain;
 charset=ISO-8859-1;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Quoting Lukas-David Gorris <lukas@htc-linux.org>:

> Quoting Lukas-David Gorris <lukas@htc-linux.org>:
>
>> Hi,
>>
>> Is it possible to use the =20
>> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/ set=
up =20
>> scripts for a non-angstrom distro?
>>
>> I tried to do this as explained in the following:
>>
>> git clone git://git.angstrom-distribution.org/setup-scripts
>> cd setup-scripts
>> git checkout -b oe-core remotes/origin/oe-core
>>
>> Now I replace =A8angstrom...=A8 with =A8shr=A8 in DISTRO=3D in oebb.sh a=
nd run
>>
>> ./oebb.sh config htcleo #I added htcleo machine in the meta-smartphone l=
ayer
>>
>> ./oebb.sh bitbake shr-image
>>
>> This will end up with bitbake trying to use some angstrom scripts =20
>> and then fail. It would be very nice to make the distro =20
>> configurable in oebb.sh. I suppose extra configurations for the =20
>> non-angstrom distro will be needed but I am uncertain how to go =20
>> about this. Maybe we can add a new branch for SHR specific oebb.sh ?
>>
>> Best regards
>>
>> Lukas
>>
>>
>
> Thanks to Heiner I just found the first problem.The meta-shr layer =20
> that provides everything specific to the shr distro must be included =20
> for this to work.
>

Patch for git://git.angstrom-distribution.org/setup-scripts,oe-core =20
for use with SHR distro:


diff --git a/conf/local.conf b/conf/local.conf
index a641121..69ac50e 100644
--- a/conf/local.conf
+++ b/conf/local.conf
@@ -19,7 +19,7 @@ IMAGE_FSTYPES +=3D "tar.bz2"
  PARALLEL_MAKE     =3D "-j2"
  BB_NUMBER_THREADS =3D "2"

-DISTRO   =3D "angstrom-2010.x"
+DISTRO   =3D "shr"

  # Set terminal types by default it expects gnome-terminal
  # but we chose xterm
diff --git a/oebb.sh b/oebb.sh
index 43697ab..49afaa8 100755
--- a/oebb.sh
+++ b/oebb.sh
@@ -66,7 +66,7 @@ else
      =20
#--------------------------------------------------------------------------
      # Specify distribution information
      =20
#--------------------------------------------------------------------------
-    DISTRO=3D"angstrom-2010.x"
+    DISTRO=3D"shr"
      DISTRO_DIRNAME=3D`echo $DISTRO | sed s#[.-]#_#g`

      echo "export SCRIPTS_BASE_VERSION=3D${BASE_VERSION}" > ${OE_ENV_FILE}
@@ -253,7 +253,6 @@ BBFILES =3D ""
  # Add your overlay location to BBLAYERS
  # Make sure to have a conf/layers.conf in there
  BBLAYERS =3D " \\
-  \${TOPDIR}/sources/meta-angstrom \\
    \${TOPDIR}/sources/meta-openembedded/meta-oe \\
    \${TOPDIR}/sources/meta-openembedded/meta-efl \\
    \${TOPDIR}/sources/meta-openembedded/meta-gpe \\
@@ -266,6 +265,8 @@ BBLAYERS =3D " \\
    \${TOPDIR}/sources/meta-smartphone/meta-openmoko \\
    \${TOPDIR}/sources/meta-smartphone/meta-palm \\
    \${TOPDIR}/sources/meta-smartphone/meta-zaurus \\
+  \${TOPDIR}/sources/meta-smartphone/meta-shr \\
+  \${TOPDIR}/sources/meta-smartphone/meta-fso \\
    \${TOPDIR}/sources/meta-intel/meta-sugarbay \\
    \${TOPDIR}/sources/meta-intel/meta-crownbay \\
    \${TOPDIR}/sources/meta-intel/meta-emenlow \\
diff --git a/sources/layers.txt b/sources/layers.txt
index 45c68d2..0d96a70 100644
--- a/sources/layers.txt
+++ b/sources/layers.txt
@@ -1,11 +1,10 @@
  # Name,repo-uri,branch,rev
  bitbake,git://git.openembedded.net/bitbake,master,HEAD
-meta-angstrom,git://git.angstrom-distribution.org/meta-angstrom,master,HEA=
D
-meta-openembedded,git://git.openembedded.net/meta-openembedded,master,HEAD
+meta-openembedded,git://git.openembedded.net/meta-openembedded-contrib,shr=
,HEAD
  =20
meta-texasinstruments,git://git.angstrom-distribution.org/meta-texasinstrum=
ents,master,HEAD
  meta-efikamx,git://github.com/kraj/meta-efikamx.git,master,HEAD
  meta-nslu2,git://github.com/kraj/meta-nslu2.git,master,HEAD
  =20
meta-smartphone,http://git.shr-project.org/repo/meta-smartphone.git,master,=
HEAD
  meta-intel,git://git.yoctoproject.org/meta-intel,master,HEAD
  meta-xilinx,git://git.yoctoproject.org/meta-xilinx,master,HEAD
-openembedded-core,https://github.com/openembedded/oe-core.git,master,HEAD
+openembedded-core,git://git.openembedded.net/openembedded-core-contrib,shr=
,HEAD



