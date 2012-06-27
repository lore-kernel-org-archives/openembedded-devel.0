Received: from mail-yw0-f50.google.com ([209.85.213.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1Sjhdw-0007l9-6b
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 04:06:08 +0200
Received: by yhjj63 with SMTP id j63so716009yhj.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2012 18:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=8h6gp+pVW6uZs54aKFsDdOzK28Ebuq8Rs3ySMy4hhGo=;
	b=TJk1s+ZSfgSzxplLpr+7/ab4rvbXdNO3G3S13QcEBq4xi/IO9y4M1iZqXpotVnxIXQ
	oaeadmrTRfGjgi1PpIyOnbzRfVcmM3YYxB34oiNwG3WzaaFoR2EPDXEkHLeCLuJAESL9
	4yzM9bFjNyHffF01D2iN+K3vG2Zu+LSAjH2AWTkneS2B5YUsTMmYxuVicLCKnhGjqcUQ
	Lc2/jPJzGySgoE47ugGgtVydxF5MOUP6O86pRnoYWANjgtd+QeDJ5BlPFL+xesPctQyM
	W9PJ/H/PfeEEwXzMx3VnEMkKLd5J22E948dQunq43p+y2hjk3/4RHY9YOxiE1ipelvEV
	W5nA==
MIME-Version: 1.0
Received: by 10.50.153.170 with SMTP id vh10mr128179igb.24.1340762114695; Tue,
	26 Jun 2012 18:55:14 -0700 (PDT)
Received: by 10.64.0.77 with HTTP; Tue, 26 Jun 2012 18:55:14 -0700 (PDT)
In-Reply-To: <55557CED-9C89-4D6A-8265-416E1FDB897D@gmail.com>
References: <1340554704-46207-1-git-send-email-elvis.dowson@gmail.com>
	<CAMKF1spMQ0qQsQv3hqQ6nTa5GwkfFqje2HdtkFNL6OhPS7XJeA@mail.gmail.com>
	<55557CED-9C89-4D6A-8265-416E1FDB897D@gmail.com>
Date: Tue, 26 Jun 2012 20:55:14 -0500
Message-ID: <CAAB-1yxSr9SnDSKQwqRLS-ndiKtCy2u2YWUX5teYVpuhEQkcpA@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 27 Jun 2012 02:06:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Applied.

Thanks

On Sun, Jun 24, 2012 at 11:54 AM, Elvis Dowson <elvis.dowson@gmail.com> wro=
te:
> Hi Khem,
>
> On Jun 24, 2012, at 8:32 PM, Khem Raj wrote:
>
>>> Ensure that you reconfigure your shell to use bash instead of dash whil=
e
>>> building with Ubuntu 12.04 LTS.
>>
>> why is this needed? may be you can fix the scripts to not have bashism
>
> I tired to use a . (dot) instead of the source keyword, but ran into some=
 errors, perhaps because of the xilinx settings64.sh script. I posted the e=
rrors in an earlier email, I'll reproduce that mail below, along with the x=
ilinx settings64.sh script
>
> Error message
>
> For the following code snippet:
>
> =A0 =A0 =A0 =A0if =A0 [ "${XILINX_VER}" \> "14" ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bbnote "XILINX_VER ${XILINX_VER}, script l=
ocation ${XILINX_LOC}/${EDK_SCRIPT}"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0source ${XILINX_LOC}/${EDK_SCRIPT} ${XILIN=
X_LOC}
> =A0 =A0 =A0 =A0fi
>
> I get the following error:
>
> DEBUG: Executing python function sstate_task_prefunc
> DEBUG: Python function sstate_task_prefunc finished
> DEBUG: Executing shell function do_deploy
> ERROR: Function failed: do_deploy (see /tool/yocto/poky/build/tmp/work/pp=
c440-poky-linux/u-boot-xilinx-v2012.04.01-r16/temp/log.do_deploy.15616 for =
further information)
> NOTE: Deploying uboot elf image to /project/xilinx-ml507
> NOTE: Xilinx design tools installed in /tool/xilinx/14.1/ISE_DS
> NOTE: Generate system ace image
> NOTE: EDK_SCRIPT settings64.sh
> NOTE: XILINX_VER 14.1, script location /tool/xilinx/14.1/ISE_DS/settings6=
4.sh
> /tool/yocto/poky/build/tmp/work/ppc440-poky-linux/u-boot-xilinx-v2012.04.=
01-r16/temp/run.do_deploy.15616: 129: /tool/yocto/poky/build/tmp/work/ppc44=
0-poky-linux/u-boot-xilinx-v2012.04.01-r16/temp/run.do_deploy.15616: source=
: not found
>
> if I replace the source keyword with a . (dot)
>
> =A0 =A0 =A0 =A0if =A0 [ "${XILINX_VER}" \> "14" ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bbnote "XILINX_VER ${XILINX_VER}, script l=
ocation ${XILINX_LOC}/${EDK_SCRIPT}"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0. ${XILINX_LOC}/${EDK_SCRIPT} ${XILINX_LOC=
}
> =A0 =A0 =A0 =A0fi
>
> it executes the scripts but gives the following error:
>
> NOTE: XILINX_VER 14.1, script location /tool/xilinx/14.1/ISE_DS/settings6=
4.sh
> /tool/yocto/poky/build/tmp/work/ppc440-poky-linux/u-boot-xilinx-v2012.04.=
01-r16/temp/run.do_deploy.7879: 12: [: /tool/yocto/poky/build/tmp/work/ppc4=
40-poky-linux/u-boot-xilinx-v2012.04.01-r16/temp/run.do_deploy.7879: unexpe=
cted operator
> . /tool/xilinx/14.1/ISE_DS/common/.settings64.sh /tool/xilinx/14.1/ISE_DS=
/common
> . /tool/xilinx/14.1/ISE_DS/EDK/.settings64.sh /tool/xilinx/14.1/ISE_DS/ED=
K
> . /tool/xilinx/14.1/ISE_DS/common/CodeSourcery/.settings64.sh /tool/xilin=
x/14.1/ISE_DS/common/CodeSourcery
> . /tool/xilinx/14.1/ISE_DS/PlanAhead/.settings64.sh /tool/xilinx/14.1/ISE=
_DS/PlanAhead
> . /tool/xilinx/14.1/ISE_DS/../../Vivado/2012.1/.settings64.sh /tool/xilin=
x/14.1/ISE_DS/../../Vivado/2012.1
> . /tool/xilinx/14.1/ISE_DS/ISE/.settings64.sh /tool/xilinx/14.1/ISE_DS/IS=
E
> . /tool/xilinx/14.1/ISE_DS/SysGen/.settings64.sh /tool/xilinx/14.1/ISE_DS=
/SysGen
>
> Xilinx settings64.sh script
>
> # Copyright (c) 1995-2012 Xilinx, Inc. =A0All rights reserved.
>
> XIL_ARG_=3D$_
> SETTINGS_FILE=3D.settings64.sh
> XIL_SCRIPT_LOC=3D"/tool/xilinx/14.1/ISE_DS"
> if [ $# !=3D 0 ]; then
> =A0 # The first argument is the location of Xilinx Installation.
> =A0 # Don't detect the installation location.
> =A0 XIL_SCRIPT_LOC=3D"$1"
> else
> =A0 # =A0XIL_SCRIPT_LOC should point to script location
> =A0 if [ "$0" =3D=3D "ksh" ]; then
> =A0 =A0 =A0XIL_SCRIPT_LOC_TMP_UNI=3D`readlink -f ${XIL_ARG_}`
> =A0 else
> =A0 =A0 =A0XIL_SCRIPT_LOC_TMP_UNI=3D$BASH_SOURCE
> =A0 fi
> =A0 XIL_SCRIPT_LOC_TMP_UNI=3D${XIL_SCRIPT_LOC_TMP_UNI%/*}
> =A0 if [ "$XIL_SCRIPT_LOC_TMP_UNI" !=3D "" ]; then
> =A0 =A0 =A0if [ "$XIL_SCRIPT_LOC_TMP_UNI" =3D=3D "settings64.sh" ]; then
> =A0 =A0 =A0 =A0 XIL_SCRIPT_LOC_TMP_UNI=3D"./"
> =A0 =A0 =A0fi
> =A0 =A0 =A0XIL_SCRIPT_LOC_TMP_UNI=3D`readlink -f ${XIL_SCRIPT_LOC_TMP_UNI=
}`
> =A0 =A0 =A0if [ $? =3D=3D 0 ]; then
> =A0 =A0 =A0 =A0 XIL_SCRIPT_LOC=3D${XIL_SCRIPT_LOC_TMP_UNI}
> =A0 =A0 =A0fi
> =A0 fi
> =A0 unset XIL_SCRIPT_LOC_TMP_UNI
> fi
>
>
> xlnxInstLocList=3D""
>
> xlnxInstLocList=3D"${xlnxInstLocList} common"
> xlnxInstLocList=3D"${xlnxInstLocList} EDK"
> xlnxInstLocList=3D"${xlnxInstLocList} common/CodeSourcery"
> xlnxInstLocList=3D"${xlnxInstLocList} PlanAhead"
> xlnxInstLocList=3D"${xlnxInstLocList} ../../Vivado/2012.1"
> xlnxInstLocList=3D"${xlnxInstLocList} ISE"
> xlnxInstLocList=3D"${xlnxInstLocList} SysGen"
> XIL_SCRIPT_LOC_TMP_UNI=3D${XIL_SCRIPT_LOC}
> for i in $xlnxInstLocList
> do
> =A0 =A0 =A0 =A0d=3D"${XIL_SCRIPT_LOC_TMP_UNI}/$i"
> =A0 =A0 =A0 =A0sfn=3D"$d/$SETTINGS_FILE"
> =A0 =A0 =A0 =A0if [ -e =A0"$sfn" ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo . "$sfn" "$d"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0. "$sfn" "$d"
> =A0 =A0 =A0 =A0fi
> done
>
> Best regards,
>
> Elvis Dowson
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--=20
Saludos
Adrian Alonso
http://aalonso.wordpress.com


