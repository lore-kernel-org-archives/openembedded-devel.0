Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1RGxiM-0003EK-7B
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Oct 2011 20:51:38 +0200
Received: from server ([unknown] [173.74.34.213]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTD009TKLB9IDC0@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	20 Oct 2011 12:45:15 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 30F862; Thu, 20 Oct 2011 12:45:06 -0500
Received: from [192.168.254.252] by rkmorris.us with HTTP; Thu,
	20 Oct 2011 12:45:05 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Thu, 20 Oct 2011 12:45:05 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1319132705374102500@rkmorris.us>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 1
Subject: Machine Configuration
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
X-List-Received-Date: Thu, 20 Oct 2011 18:51:38 -0000
Content-type: text/plain
Content-transfer-encoding: quoted-printable
Content-disposition: inline

Hi,

I am trying to do some builds for an am3517-evm ... but the machine configu=
ration doesn't seem to be working (or I'm doing it wrong, more likely ... :=
-().

I have successfully built console-image for qemuarm, and then use oebb.sh t=
o set the machine (to am3517-evm, followed bu ./oebb.sh update) - but then =
when I try to build for this machine I see the following ...

OE Build Configuration:
BB_VERSION        =3D "1.13.3"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "qemuarm"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v2011.10-core"
TUNE_FEATURES     =3D "armv5 dsp thumb arm926ejs"
TARGET_FPU        =3D "soft"

So it's still building for qemuarm, not am3517-evm ... :-(. Is anyone else =
having this issue? Any suggestions of how to fix this?

Thanks!

... Russell



