Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RWwSC-0006WD-VP
	for Openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 21:45:01 +0100
Received: by lagj5 with SMTP id j5so1706072lag.6
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 03 Dec 2011 12:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=YBakXZJlx8lCd+7DogPoTfVRXkratLyim3SnsWEiCzM=;
	b=lhjS5+TB/BLAJ4IGQqxsnKgaUKROYUmUhBtFAbCAVVtOOQasDTbopcF4ws8J9OUlrM
	bJ6yWUydrSap4+7dv9NledH3zSWnKbbTF+CevOw5+qTenqZz8n7y6ISRNqDZS3yO4CV4
	nfBXnxVQ/CMDc2UuAi3xqFpzO/bNs74hSIfD8=
Received: by 10.152.106.115 with SMTP id gt19mr2215498lab.27.1322944695408;
	Sat, 03 Dec 2011 12:38:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sat, 3 Dec 2011 12:37:44 -0800 (PST)
In-Reply-To: <CAMKF1srGAsF2OSgL4qPMCDFxUTusFy-Mk=swJ3bvgLZ8ZQVP0w@mail.gmail.com>
References: <CAMKF1srGAsF2OSgL4qPMCDFxUTusFy-Mk=swJ3bvgLZ8ZQVP0w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Dec 2011 12:37:44 -0800
Message-ID: <CAMKF1spmfAHe-DxbpPUXcD8B2-_XH0zyr8auSgnxWBYzV_FAww@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: Failure expanding variable PRINC[:=], expression was ${@int(PRINC) + 1} which triggered exception NameError: name 'PRINC' is not defined
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
X-List-Received-Date: Sat, 03 Dec 2011 20:45:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 3, 2011 at 12:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> I am seeing =C2=A0this
>
>
> Pseudo is not present but is required, building this first before the mai=
n build
> NOTE: angstrom DOES NOT support libiconv because the eglibc provided
> iconv library is used =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA: =C2=A000:0=
0:22
> NOTE: angstrom DOES NOT support libiconv because the eglibc provided
> iconv library is used =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA: =C2=A000:0=
0:22
> ERROR: Failure expanding variable PRINC[:=3D], expression was
> ${@int(PRINC) + 1} which triggered exception NameError: name 'PRINC'
> is not defined
> ERROR: Command execution failed: Exited with 1
>
> when parsing angstrom-2010.x distro after deleting the builddir and
> doing clean slate build
>
> I see lot of those expressions are coming from
> meta-shr and other layers in meta-smartphone
>
> Does someone else encountered it ?

OK something like this in bitbake.conf helped

PRINC ?=3D "0"

however there are further parsing errors
ERROR: Unable to analyse format of PR variable: ${MACHINE_KERNEL_PR}a
ERROR: Unable to parse
/home/kraj/work/angstrom/sources/meta-ti/recipes-ti/dsplink/ti-dsplink_1.65=
.00.03.bb
00:00:01

however I think I will take it to meta-ti ml

>
> Thanks
> -Khem


