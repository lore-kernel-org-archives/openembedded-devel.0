Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S00Nv-0008JI-Be
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 01:48:44 +0100
Received: by daln34 with SMTP id n34so6242014dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 16:40:23 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.197.166 as permitted sender) client-ip=10.68.197.166; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.197.166 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.197.166])
	by 10.68.197.166 with SMTP id iv6mr4239084pbc.128.1329871223105
	(num_hops = 1); Tue, 21 Feb 2012 16:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=NAX+8Gaw+oEhSlBOhmWzUwXb3yB5a4vb2xPI+wqO9f0=;
	b=PVkvNeOTTnL4ZRGneqMBk7Zg12VtBQC81FX+L41I8f3izqRNJDungmyrwLQ5zTpWwC
	r6zZVadnQ9eq/NMUhCmxIocXeJL79bw5WB5qilfZa8UB1oxm+QzsxaNaxMALN1xezKrI
	Q+7wisn6U4xrbVBgznqVsOifpy7zPrEnr0+ZI=
MIME-Version: 1.0
Received: by 10.68.197.166 with SMTP id iv6mr3354541pbc.128.1329871222554;
	Tue, 21 Feb 2012 16:40:22 -0800 (PST)
Received: by 10.143.147.17 with HTTP; Tue, 21 Feb 2012 16:40:22 -0800 (PST)
In-Reply-To: <20120222002601.GE3769@jama.jama.net>
References: <1329870032-4952-1-git-send-email-andrea.adami@gmail.com>
	<1329870032-4952-2-git-send-email-andrea.adami@gmail.com>
	<20120222002601.GE3769@jama.jama.net>
Date: Wed, 22 Feb 2012 01:40:22 +0100
Message-ID: <CAAQYJAv5NW331mFMZT8N-MBFOWD_Qs61r4UWm=VggfbFD5SWVw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/1] meta-initramfs: import linux-kexecboot_3.2 and _git from meta-handheld
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
X-List-Received-Date: Wed, 22 Feb 2012 00:48:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 1:26 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Feb 22, 2012 at 01:20:32AM +0100, Andrea Adami wrote:
>> * bump PR
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>> =A0meta-initramfs/recipes-kernel/linux/linux-git.inc =A0| =A0 23 +++++++=
+++++++++++++
>
> is this ^^ intentional?
>
No, it's cruft, Thanks for spotting it!
Patch v2 follows

Andrea

>> =A0.../recipes-kernel/linux/linux-kexecboot_3.2.bb =A0 =A0| =A0 13 +++++=
++++++
>> =A0.../recipes-kernel/linux/linux-kexecboot_git.bb =A0 =A0| =A0 23 +++++=
+++++++++++++++
>> =A03 files changed, 59 insertions(+), 0 deletions(-)
>> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/linux-git.inc
>> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboo=
t_3.2.bb
>> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboo=
t_git.bb
>>
>> diff --git a/meta-initramfs/recipes-kernel/linux/linux-git.inc b/meta-in=
itramfs/recipes-kernel/linux/linux-git.inc
>> new file mode 100644
>> index 0000000..32a6d47
>> --- /dev/null
>> +++ b/meta-initramfs/recipes-kernel/linux/linux-git.inc
>> @@ -0,0 +1,23 @@
>> +KERNEL_RELEASE =3D "3.2.0-rc7"
>> +OLD_KERNEL_RELEASE =3D "3.1.99"
>> +PV =3D "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"
>> +
>> +SRCREV =3D "371de6e4e0042adf4f9b54c414154f57414ddd37"
>> +
>> +CMDLINE_DEBUG =3D "debug"
>> +
>> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux-2.6.git;protocol=3Dgit;branch=3Dmaster \
>> + =A0 =A0 =A0 =A0 =A0 file://defconfig"
>> +S =3D "${WORKDIR}/git"
>> +
>> +do_configure_prepend() {
>> +#otherwise it gets extra '+' "2.6.37+"
>> +#because:
>> +#$ scripts/setlocalversion . =3D> +
>> +#$ make kernelversion =3D> 2.6.37
>> +#$ make kernelrelease =3D> 2.6.37+
>> + =A0rm -rf ${S}/.git
>> +}
>> +
>> +# Mark archs/machines that this kernel supports
>> +DEFAULT_PREFERENCE =3D "-2"
>> diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb =
b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
>> new file mode 100644
>> index 0000000..3207429
>> --- /dev/null
>> +++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
>> @@ -0,0 +1,13 @@
>> +require linux-kexecboot.inc
>> +
>> +PR =3D "${INC_PR}.1"
>> +S =3D "${WORKDIR}/linux-${PV}"
>> +
>> +SRC_URI +=3D "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2=
;name=3Dkernel \
>> + =A0 =A0 =A0 =A0 =A0 ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.=
1.bz2;apply=3Dyes;name=3Dstablepatch \
>> + =A0 =A0 =A0 =A0 =A0 "
>> +
>> +SRC_URI[kernel.md5sum] =3D "7ceb61f87c097fc17509844b71268935"
>> +SRC_URI[kernel.sha256sum] =3D "c881fc2b53cf0da7ca4538aa44623a7de043a41f=
76fd5d0f51a31f6ed699d463"
>> +SRC_URI[stablepatch.md5sum] =3D "31fc34340f11118873463a1d59d47b7f"
>> +SRC_URI[stablepatch.sha256sum] =3D "e9a26dc5faa309ae5172e3c65081fa98b60=
befab160fb14d9a75816bbde15626"
>> diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_git.bb =
b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_git.bb
>> new file mode 100644
>> index 0000000..b1fc75b
>> --- /dev/null
>> +++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_git.bb
>> @@ -0,0 +1,23 @@
>> +require linux-kexecboot.inc
>> +
>> +PR =3D "${INC_PR}.1"
>> +
>> +KERNEL_RELEASE =3D "3.2.0-rc7"
>> +OLD_KERNEL_RELEASE =3D "3.1.99"
>> +PV =3D "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"
>> +
>> +SRCREV =3D "371de6e4e0042adf4f9b54c414154f57414ddd37"
>> +
>> +CMDLINE_DEBUG =3D "debug"
>> +
>> +S =3D "${WORKDIR}/git"
>> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux-2.6.git;protocol=3Dgit;branch=3Dmaster"
>> +
>> +do_configure_prepend() {
>> +#otherwise it gets extra '+' "2.6.37+"
>> +#because:
>> +#$ scripts/setlocalversion . =3D> +
>> +#$ make kernelversion =3D> 2.6.37
>> +#$ make kernelrelease =3D> 2.6.37+
>> + =A0rm -rf ${S}/.git
>> +}
>> --
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


