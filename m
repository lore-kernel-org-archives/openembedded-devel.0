Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SiqFP-0000Tg-Ls
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jun 2012 19:05:16 +0200
Received: by dalh21 with SMTP id h21so4136510dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2012 09:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to:x-mailer;
	bh=T4i5zbE8w/+OV5BWPmbKwbbyeI9QNsqu6prEnVYtwak=;
	b=PZNrYtGSme2v6jxOC3SMPqMlfsrn+yMgS+6HFA1gqsFMysQabkDfsFIOrylYEsKlHB
	zRfcHpkjO7Y+DrP/QRllu1FhDjlJq9AcfjWqvBaw1vcHUD/oWDoD1oYJSA5nzQUwYNYA
	zU2ybC4h4jqn2Mkpq9MFQOhNZiXwliLRiDh1y7P3K7jRLDYt4WNTyDpBUCI//4wcJEso
	OpjB980FvtUjUfyoaxwFRNQsL9/A4V+HDHI4V90xonJI8lUGmSszMMxgNE0mcno6oAiT
	v/oCSGgstocPPi/CZZ6Y4uG0trIO3CpTtg7PFqb4+fgPVhwkmy37Qbxex2kN4aydco3I
	ieZQ==
Received: by 10.68.232.170 with SMTP id tp10mr32027294pbc.59.1340556864632;
	Sun, 24 Jun 2012 09:54:24 -0700 (PDT)
Received: from [192.168.1.102] ([94.205.109.242])
	by mx.google.com with ESMTPS id vp4sm5758891pbc.61.2012.06.24.09.54.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Jun 2012 09:54:23 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAMKF1spMQ0qQsQv3hqQ6nTa5GwkfFqje2HdtkFNL6OhPS7XJeA@mail.gmail.com>
Date: Sun, 24 Jun 2012 20:54:17 +0400
Message-Id: <55557CED-9C89-4D6A-8265-416E1FDB897D@gmail.com>
References: <1340554704-46207-1-git-send-email-elvis.dowson@gmail.com>
	<CAMKF1spMQ0qQsQv3hqQ6nTa5GwkfFqje2HdtkFNL6OhPS7XJeA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1278)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xilinx 1/2] xilinx-boot: Refactor recipe to add support for Xilinx ISE 14.1.
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
X-List-Received-Date: Sun, 24 Jun 2012 17:05:16 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Jun 24, 2012, at 8:32 PM, Khem Raj wrote:

>> Ensure that you reconfigure your shell to use bash instead of dash =
while
>> building with Ubuntu 12.04 LTS.
>=20
> why is this needed? may be you can fix the scripts to not have bashism

I tired to use a . (dot) instead of the source keyword, but ran into =
some errors, perhaps because of the xilinx settings64.sh script. I =
posted the errors in an earlier email, I'll reproduce that mail below, =
along with the xilinx settings64.sh script

Error message

For the following code snippet:

	if   [ "${XILINX_VER}" \> "14" ]; then
		bbnote "XILINX_VER ${XILINX_VER}, script location =
${XILINX_LOC}/${EDK_SCRIPT}"
		source ${XILINX_LOC}/${EDK_SCRIPT} ${XILINX_LOC}
	fi

I get the following error:

DEBUG: Executing python function sstate_task_prefunc
DEBUG: Python function sstate_task_prefunc finished
DEBUG: Executing shell function do_deploy
ERROR: Function failed: do_deploy (see =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/u-boot-xilinx-v2012.04.0=
1-r16/temp/log.do_deploy.15616 for further information)
NOTE: Deploying uboot elf image to /project/xilinx-ml507
NOTE: Xilinx design tools installed in /tool/xilinx/14.1/ISE_DS
NOTE: Generate system ace image
NOTE: EDK_SCRIPT settings64.sh
NOTE: XILINX_VER 14.1, script location =
/tool/xilinx/14.1/ISE_DS/settings64.sh
=
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/u-boot-xilinx-v2012.04.0=
1-r16/temp/run.do_deploy.15616: 129: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/u-boot-xilinx-v2012.04.0=
1-r16/temp/run.do_deploy.15616: source: not found

if I replace the source keyword with a . (dot)=20

	if   [ "${XILINX_VER}" \> "14" ]; then
		bbnote "XILINX_VER ${XILINX_VER}, script location =
${XILINX_LOC}/${EDK_SCRIPT}"
		. ${XILINX_LOC}/${EDK_SCRIPT} ${XILINX_LOC}
	fi

it executes the scripts but gives the following error:

NOTE: XILINX_VER 14.1, script location =
/tool/xilinx/14.1/ISE_DS/settings64.sh
=
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/u-boot-xilinx-v2012.04.0=
1-r16/temp/run.do_deploy.7879: 12: [: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/u-boot-xilinx-v2012.04.0=
1-r16/temp/run.do_deploy.7879: unexpected operator
. /tool/xilinx/14.1/ISE_DS/common/.settings64.sh =
/tool/xilinx/14.1/ISE_DS/common
. /tool/xilinx/14.1/ISE_DS/EDK/.settings64.sh =
/tool/xilinx/14.1/ISE_DS/EDK
. /tool/xilinx/14.1/ISE_DS/common/CodeSourcery/.settings64.sh =
/tool/xilinx/14.1/ISE_DS/common/CodeSourcery
. /tool/xilinx/14.1/ISE_DS/PlanAhead/.settings64.sh =
/tool/xilinx/14.1/ISE_DS/PlanAhead
. /tool/xilinx/14.1/ISE_DS/../../Vivado/2012.1/.settings64.sh =
/tool/xilinx/14.1/ISE_DS/../../Vivado/2012.1
. /tool/xilinx/14.1/ISE_DS/ISE/.settings64.sh =
/tool/xilinx/14.1/ISE_DS/ISE
. /tool/xilinx/14.1/ISE_DS/SysGen/.settings64.sh =
/tool/xilinx/14.1/ISE_DS/SysGen

Xilinx settings64.sh script

# Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.

XIL_ARG_=3D$_
SETTINGS_FILE=3D.settings64.sh
XIL_SCRIPT_LOC=3D"/tool/xilinx/14.1/ISE_DS"
if [ $# !=3D 0 ]; then
   # The first argument is the location of Xilinx Installation.
   # Don't detect the installation location.
   XIL_SCRIPT_LOC=3D"$1"
else
   #  XIL_SCRIPT_LOC should point to script location
   if [ "$0" =3D=3D "ksh" ]; then
      XIL_SCRIPT_LOC_TMP_UNI=3D`readlink -f ${XIL_ARG_}`
   else
      XIL_SCRIPT_LOC_TMP_UNI=3D$BASH_SOURCE
   fi
   XIL_SCRIPT_LOC_TMP_UNI=3D${XIL_SCRIPT_LOC_TMP_UNI%/*}
   if [ "$XIL_SCRIPT_LOC_TMP_UNI" !=3D "" ]; then
      if [ "$XIL_SCRIPT_LOC_TMP_UNI" =3D=3D "settings64.sh" ]; then
         XIL_SCRIPT_LOC_TMP_UNI=3D"./"
      fi
      XIL_SCRIPT_LOC_TMP_UNI=3D`readlink -f ${XIL_SCRIPT_LOC_TMP_UNI}`
      if [ $? =3D=3D 0 ]; then
         XIL_SCRIPT_LOC=3D${XIL_SCRIPT_LOC_TMP_UNI}
      fi
   fi
   unset XIL_SCRIPT_LOC_TMP_UNI
fi


xlnxInstLocList=3D""

xlnxInstLocList=3D"${xlnxInstLocList} common"
xlnxInstLocList=3D"${xlnxInstLocList} EDK"
xlnxInstLocList=3D"${xlnxInstLocList} common/CodeSourcery"
xlnxInstLocList=3D"${xlnxInstLocList} PlanAhead"
xlnxInstLocList=3D"${xlnxInstLocList} ../../Vivado/2012.1"
xlnxInstLocList=3D"${xlnxInstLocList} ISE"
xlnxInstLocList=3D"${xlnxInstLocList} SysGen"
XIL_SCRIPT_LOC_TMP_UNI=3D${XIL_SCRIPT_LOC}
for i in $xlnxInstLocList
do
	d=3D"${XIL_SCRIPT_LOC_TMP_UNI}/$i"
	sfn=3D"$d/$SETTINGS_FILE"
	if [ -e  "$sfn" ]; then
		echo . "$sfn" "$d"
		. "$sfn" "$d"
	fi
done

Best regards,

Elvis Dowson=

