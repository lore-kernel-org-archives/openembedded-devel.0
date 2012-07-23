Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1StK8L-0005CU-KE
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 17:01:17 +0200
Received: by weyr6 with SMTP id r6so4070938wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2012 07:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=RamLHWPQI10uo2gkiJQ7Aumy0Zu4iH5KDhfqKXnqNmE=;
	b=ed4/mFgZhmBYus5ImVdwoeWH8BeFiTAadDLhrxMo6tpPJeOxUQ8QKCt3dVYf5zE0aR
	l7rgEVTbwb3RMhQVvjbyM/xRD9YnIsoZ06xBdiQceUBhMaeaJRAHo/lashP9x5/0vBGO
	RkU+mtrIWn6kY39Eok3pl4k9GlrBd1/OsT41R4PyGIo2ULxE20PspUbMY5TaMlMyQgQV
	ORVnDv7lIgOQrP/5KUg0CN6WoIf8BVP2GiikActgCCQaJtXp0s1QY4APZ0ds+X7osYqC
	atZy7r5M/IOk3i0y+3TnkSdgB7RBoEHhrffLXh6eQo1NV4bu5N1U86xYBZF2ZPsT7C+2
	BTlA==
Received: by 10.216.50.17 with SMTP id y17mr4155116web.154.1343054990290;
	Mon, 23 Jul 2012 07:49:50 -0700 (PDT)
Received: from [172.20.3.201] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id cu1sm17265536wib.6.2012.07.23.07.49.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 07:49:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAEsOVNcuNkxvbtKmwD=YsBNZ4Lf_A-GMv2rB1dKZzSkA8fkCQQ@mail.gmail.com>
Date: Mon, 23 Jul 2012 16:49:36 +0200
Message-Id: <DB1E56E3-5B43-4283-B11F-9612CDC667A3@dominion.thruhere.net>
References: <1342802112-9917-1-git-send-email-msm@freescale.com>
	<CAEsOVNcuNkxvbtKmwD=YsBNZ4Lf_A-GMv2rB1dKZzSkA8fkCQQ@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmuqUJnLPGMGUXI8Myt7b2QUX/SCoZ7w3EytvBbGRSfr6MqvhTGF5pSIGd9hItB/waIhvQK
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] cramfs_cvs.bb: fix compile step so it can be rerun without failing
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
X-List-Received-Date: Mon, 23 Jul 2012 15:01:17 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 23 jul. 2012, om 16:48 heeft McClintock Matthew-B29882 het volgende =
geschreven:

> Koen,
>=20
> To get the applied against the denzil branch do I need to submit again
> with a for-denzil or should I just request a cherry-pick?

Cherry-pick it into the denzil branch, then git-send-email that with the =
for-denzil tag.

regards,

Koen

>=20
> -M
>=20
> On Fri, Jul 20, 2012 at 11:35 AM, Matthew McClintock =
<msm@freescale.com> wrote:
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>> meta-oe/recipes-support/cramfs/cramfs_cvs.bb |    3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb =
b/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
>> index 667097c..d9b6c06 100644
>> --- a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
>> +++ b/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
>> @@ -4,6 +4,7 @@ LIC_FILES_CHKSUM =3D =
"file://${WORKDIR}/linux/COPYING;md5=3D9579385572eb40eded61dcb0
>> DEPENDS =3D "zlib"
>> SRCDATE =3D "20110110"
>> PV =3D "1.1+cvs${SRCDATE}"
>> +PR =3D "r1"
>>=20
>> SRC_URI =3D =
"cvs://anonymous@cramfs.cvs.sourceforge.net/cvsroot/cramfs;module=3Dlinux"=

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
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



