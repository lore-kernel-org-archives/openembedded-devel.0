Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1QUJ5r-0006If-PC
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 15:46:48 +0200
Received: from server ([unknown] [71.164.183.134]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LMH00D371ZQ4830@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	08 Jun 2011 07:43:05 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 05D086; Wed, 08 Jun 2011 07:42:56 -0500
Received: from [192.168.1.10] by rkmorris.us with HTTP; Wed,
	08 Jun 2011 07:42:54 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Wed, 08 Jun 2011 07:42:54 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-id: <1307536974385333500@rkmorris.us>
In-reply-to: <1349E329-09C7-4F49-8E9B-466687D453D9@gmail.com>
References: <1307481663432021500@rkmorris.us>
	<1349E329-09C7-4F49-8E9B-466687D453D9@gmail.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 2
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Builds Failing
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
X-List-Received-Date: Wed, 08 Jun 2011 13:46:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,
My host distro is OpenSUSE (11.4). Here is the patch info,
NOTE: Running task 3637 of 6177 (ID: 3040, /mnt/OpenEmbedded/openembedded/=
recipes/bash/bash_3.2.bb, do_patch)NOTE: package bash-3.2-r12: task do_patc=
h: StartedERROR: Execution of 'quilt --quiltrc=3D/mnt/OpenEmbedded/build/ou=
tput/angstrom-2010.x/sysroots/i686-linux/usr/bin/quiltrc push' failed with =
exit code 1:Applying patch bash32-001Ignoring potentially dangerous file na=
me ../bash-3.2/parse.ypatching file parse.yIgnoring potentially dangerous f=
ile name ../bash-3.2/patchlevel.hcan't find file to patch at input line 35P=
erhaps you used the wrong -p or --strip option?The text leading up to this =
was:--------------------------|*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:3=
1:04 2006|--- patchlevel.h	Mon Oct 16 14:22:54 2006------------------------=
--No file to patch.  Skipping patch.1 out of 1 hunk ignoredPatch bash32-001=
 does not apply (enforce with -f)
NOTE: package bash-3.2-r12: task patch_do_patch: FailedERROR: Function 'pa=
tch_do_patch' failedERROR: Task 3040 (/mnt/OpenEmbedded/openembedded/recipe=
s/bash/bash_3.2.bb, do_patch) failed with exit code '1'ERROR: '/mnt/OpenEmb=
edded/openembedded/recipes/bash/bash_3.2.bb' failed

Thoughts?
Thanks,... Russell


On Wed, 06/08/2011 02:33 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Jun 7, 2011, at 2:21 PM, Russell Morris <openembedded@rkmorris.us> wr=
ote:
>=20
> > Hi,
> >=20
> > I am trying to build OE with the latest source (i.e. from MASTER) - bu=
t images that used to work are now failing (x11-gpe-image, console-image). =
The failure seems to be in bash, as you can see in the attached log files.
> >=20
> > Is this a known issue?
> >=20
>=20
> What's the version of patch you are using ? Or your host distro
> > Thanks!
> >=20
> > ... Russell
> >=20
> > <x11-gpe-image.log>
> > <console-image.log>
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From matteo.facchinetti@sirius-es.it Wed Jun 08 15:59:56 2011
Received: from ns1.gatteins.it ([193.58.239.94])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <matteo.facchinetti@sirius-es.it>) id 1QUJIa-0006XL-H5
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 15:59:56 +0200
X-Virus-Scanned: amavisd-new at gattei.com
Received: from localhost.localdomain (78-134-96-148.dynamic.eolo.it
	[78.134.96.148])
	by ns1.gatteins.it (Postfix) with ESMTPA id 439DADEF1F;
	Wed,  8 Jun 2011 15:56:53 +0200 (MEST)
From: Matteo Facchinetti <matteo.facchinetti@sirius-es.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2011 15:56:29 +0200
Message-Id: <1307541389-2401-1-git-send-email-matteo.facchinetti@sirius-es=
.it>
X-Mailer: git-send-email 1.7.0.4
Cc: Matteo Facchinetti <engineering@sirius-es.it>
Subject: [oe] [PATCH v2] wxbase_2.8.9: fix includepath for SDL dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/open=
embedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject
