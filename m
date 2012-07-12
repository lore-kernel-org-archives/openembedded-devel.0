Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SpQ67-0006jE-Q1
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jul 2012 22:34:51 +0200
Received: by weyr6 with SMTP id r6so1717164wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2012 13:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=jMw21V/IEDKXMJxaQMp5mlKz45u+ub+VB+g6JmJu7cI=;
	b=ffi3OBrTkRTX51XnWOqulzJw2n783BcMBlpkxw5hA0xyItSmjBjNOyh5xspdEb5xbF
	r7vhR15im1QIMXforUFEmHRxHqtW9H2H55NLtT+17QQ2DPjyUS1VfW69b7t5SkFqcQFf
	EIBwMAaNV0T2+aMWJzVIohqf1J2IU8u6XJZEUf/+zmRvcyShv+2eGIc0Pvo6VzNYrRTN
	3nbo3eUUIKvyiodwfAY+5bLhG7/SUQ4LoCCAjmcwUpEem2WuYQreta3lauqbTmskQ9Q/
	DR26OrwmFaNTcm9N5ZosFlYJTiNt+g16XnuZmO0pRqWzMDrmRCm/m/Sn4DyhS+OODj+w
	mF2g==
Received: by 10.180.88.229 with SMTP id bj5mr38276571wib.19.1342124618419;
	Thu, 12 Jul 2012 13:23:38 -0700 (PDT)
Received: from [192.168.2.13] ([188.207.89.201])
	by mx.google.com with ESMTPS id el6sm686636wib.8.2012.07.12.13.23.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 13:23:37 -0700 (PDT)
References: <CAEsOVNdKQOA1bHMfptKGm7aAabpAxb7+uR7zYxp_W8T9Pf7Tdw@mail.gmail.com>
	<1341590515-9567-1-git-send-email-msm@freescale.com>
	<CAEsOVNd+w9zgA7SdEDHF24M9fNb+W2pH5rGCX0eyHdwRsFsctA@mail.gmail.com>
In-Reply-To: <CAEsOVNd+w9zgA7SdEDHF24M9fNb+W2pH5rGCX0eyHdwRsFsctA@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <E727CCC8-CDEC-45FD-A894-70EE269EA8B3@dominion.thruhere.net>
X-Mailer: iPad Mail (9B206)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 12 Jul 2012 22:23:32 +0200
To: McClintock Matthew-B29882 <B29882@freescale.com>
X-Gm-Message-State: ALoCoQkuXYCmEznhvjVg4L0bdnCRA35fTNjBIeyFg0BXTaJLLiRR09DD+1bKMw49NYsABLH4Yxqe
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded v2] cramfs_cvs.bb: fix compile step so it can be rerun without failing
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
X-List-Received-Date: Thu, 12 Jul 2012 20:34:51 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

I missed it in patchwork because it lacked the 'meta-oe' tag in the subject.=
 I suck at keeping up with the mailinglist :(

Op 12 jul. 2012 om 22:06 heeft McClintock Matthew-B29882 <B29882@freescale.c=
om> het volgende geschreven:

> Koen,
>=20
> Did I miss something for this patch?
>=20
> -M
>=20
> On Fri, Jul 6, 2012 at 11:01 AM, Matthew McClintock <msm@freescale.com> wr=
ote:
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>> v2: - use ln -sf instead of separate unlink command
>>=20
>> meta-oe/recipes-support/cramfs/cramfs_cvs.bb |    3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb b/meta-oe/recip=
es-support/cramfs/cramfs_cvs.bb
>> index 667097c..d9b6c06 100644
>> --- a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
>> +++ b/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
>> @@ -4,6 +4,7 @@ LIC_FILES_CHKSUM =3D "file://${WORKDIR}/linux/COPYING;md5=
=3D9579385572eb40eded61dcb0
>> DEPENDS =3D "zlib"
>> SRCDATE =3D "20110110"
>> PV =3D "1.1+cvs${SRCDATE}"
>> +PR =3D "r1"
>>=20
>> SRC_URI =3D "cvs://anonymous@cramfs.cvs.sourceforge.net/cvsroot/cramfs;mo=
dule=3Dlinux"
>> S =3D "${WORKDIR}/linux/scripts/cramfs"
>> @@ -16,7 +17,7 @@ EXTRA_OEMAKE =3D "\
>>=20
>>=20
>> do_compile_prepend() {
>> -        ln -s GNUmakefile Makefile
>> +        ln -sf GNUmakefile Makefile
>> }
>>=20
>> do_install() {
>> --
>> 1.7.10
>>=20
>>=20
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


