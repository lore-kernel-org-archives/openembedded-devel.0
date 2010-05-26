Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OHFfW-0003yS-Jj
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 14:25:10 +0200
Received: by fxm9 with SMTP id 9so2077946fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 05:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=INL3Di5yforfadMHbGTkFhn+HSLBiG972f6dxLb+yPA=;
	b=Ts8Vti1S7aon9OjhBX3/tt3cGFVuCcBYLX2zNNHIgDVmcWpOgAnvI+MibEjV6l5O1l
	gEgCphiCFvWSWFr7ZpaUjB0PIg3Up88IWPz0TiInGssTP/zpjiAJi0Y4MmB12Qs1RGTB
	8MkUlhZm5tBc1/W8tbJItb5BE630hGRuT1sPE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tHAfjoJ+3g2rOznsZMCRLAg0jM8wMJ1Y5eONPXq2awcI4RPszGFjGQ6vbjZVIrrOkE
	dj4yISi3p+d6Rla1GdMI5QLdvFRs7ctEY/gOBhu6vfrJlsQnWVJ8GGpU+ZgXXEQJ16T9
	GVMqyHLJ8YQnCPjcLF3dbuq8FBfxNPBDycVMw=
MIME-Version: 1.0
Received: by 10.223.24.133 with SMTP id v5mr7818787fab.46.1274876458922; Wed, 
	26 May 2010 05:20:58 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Wed, 26 May 2010 05:20:58 -0700 (PDT)
In-Reply-To: <20100525143757.GC26493@gmail.com>
References: <1274794225-16222-1-git-send-email-Martin.Jansa@gmail.com>
	<1274794225-16222-4-git-send-email-Martin.Jansa@gmail.com>
	<20100525143757.GC26493@gmail.com>
Date: Wed, 26 May 2010 14:20:58 +0200
Message-ID: <AANLkTinfaWrw1j2uVl6xE_xWYqGNO_Ub1RA3VRyRJTv1@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] linux-openmoko: rename recipes to common PN_PV scheme and adjust om-gta* machine configs
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
X-List-Received-Date: Wed, 26 May 2010 12:25:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2010 at 4:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On (25/05/10 15:30), Martin Jansa wrote:
>> * unify preferred provider and version for om-gta02
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>
>
>> ---
>> =A0conf/distro/openmoko.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A08 -
>> =A0conf/machine/om-3d7k.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A03 +-
>> =A0conf/machine/om-gta01.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 12 +--
>> =A0conf/machine/om-gta02.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 10 +-
>> =A0recipes/linux/linux-openmoko-2.6.24_git.bb =A0 =A0 =A0 =A0 | =A0 28 -=
---
>> =A0recipes/linux/linux-openmoko-2.6.28_git.bb =A0 =A0 =A0 =A0 | =A0 28 -=
---
>> =A0.../0007-Enable-UBI-UBIFS.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0149 ++++++++++++++++++++
>> =A0.../linux/linux-openmoko-2.6.29/fix-install.patch =A0| =A0 23 +++
>> =A0recipes/linux/linux-openmoko-2.6.32_git.bb =A0 =A0 =A0 =A0 | =A0 46 -=
-----
>> =A0recipes/linux/linux-openmoko-2.6.34_git.bb =A0 =A0 =A0 =A0 | =A0 39 -=
----
>> =A0.../0007-Enable-UBI-UBIFS.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0149 --------------------
>> =A0.../linux-openmoko-shr-devel/fix-install.patch =A0 =A0 | =A0 23 ---
>> =A0recipes/linux/linux-openmoko-shr-devel_git.bb =A0 =A0 =A0| =A0 26 ---=
-
>> =A0recipes/linux/linux-openmoko_2.6.24.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
28 ++++
>> =A0recipes/linux/linux-openmoko_2.6.28.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
28 ++++
>> =A0recipes/linux/linux-openmoko_2.6.29.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
26 ++++
>> =A0recipes/linux/linux-openmoko_2.6.32.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
46 ++++++
>> =A0recipes/linux/linux-openmoko_2.6.34_git =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
39 +++++
>> =A018 files changed, 347 insertions(+), 364 deletions(-)
>> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.24_git.bb
>> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.28_git.bb
>> =A0create mode 100644 recipes/linux/linux-openmoko-2.6.29/0007-Enable-UB=
I-UBIFS.patch
>> =A0create mode 100644 recipes/linux/linux-openmoko-2.6.29/fix-install.pa=
tch
>> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.32_git.bb
>> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.34_git.bb
>> =A0delete mode 100644 recipes/linux/linux-openmoko-shr-devel/0007-Enable=
-UBI-UBIFS.patch
>> =A0delete mode 100644 recipes/linux/linux-openmoko-shr-devel/fix-install=
.patch
>> =A0delete mode 100644 recipes/linux/linux-openmoko-shr-devel_git.bb
>> =A0create mode 100644 recipes/linux/linux-openmoko_2.6.24.bb
>> =A0create mode 100644 recipes/linux/linux-openmoko_2.6.28.bb
>> =A0create mode 100644 recipes/linux/linux-openmoko_2.6.29.bb
>> =A0create mode 100644 recipes/linux/linux-openmoko_2.6.32.bb
>> =A0create mode 100644 recipes/linux/linux-openmoko_2.6.34_git

Too late I found flaw of this (or in how SRCPV works) :/.

As long as those were recipes from same GIT repo but with different PN
it was ok, because in persistent cache they got different keys:

sqlite> select * from BB_URI_LOCALCOUNT where key like '%linux-openmoko%';
git:git.openmoko.org.git.kernel.git-linux-openmoko-shr-devel_rev|973a41fce6=
0e5f6edfcf0eaf94056a57eee65e16
git:git.openmoko.org.git.kernel.git-linux-openmoko-shr-devel_count|1
git:git.openmoko.org.git.kernel.git-linux-openmoko-2.6.32_rev|a9254be10ac22=
94ea20165a87c09ea6afcf66d94
git:git.openmoko.org.git.kernel.git-linux-openmoko-2.6.32_count|0
git:git.openmoko.org.git.kernel.git-linux-openmoko-2.6.31_rev|dd32737aa524e=
09c1d141a0e735dd58674552244
git:git.openmoko.org.git.kernel.git-linux-openmoko-2.6.31_count|0
git:git.openmoko.org.git.kernel.git-linux-openmoko-2.6.28_rev|8c65792a5c83c=
76d662a617a7c4e1ae8104bb6a5
git:git.openmoko.org.git.kernel.git-linux-openmoko-2.6.28_count|0
git:git.openmoko.org.git.kernel.git-linux-openmoko-shr-drm-devel_rev|e62a4a=
e1c6783f41b41a9ac3d258786586b65a40
git:git.openmoko.org.git.kernel.git-linux-openmoko-shr-drm-devel_count|0
git:git.openmoko.org.git.kernel.git-linux-openmoko-devel_rev|a15608f241a40b=
41fed5bffe511355c2067c4e88
git:git.openmoko.org.git.kernel.git-linux-openmoko-devel_count|0
git:git.openmoko.org.git.kernel.git-linux-openmoko-2.6.24_rev|fb42ce6724576=
fc173faf8abfb04aa2c36d213b7
git:git.openmoko.org.git.kernel.git-linux-openmoko-2.6.24_count|0
git:git.openmoko.org.git.kernel.git-linux-openmoko-2.6.34_rev|dd1225cc08c33=
75bf80289ac1965c724881b149a
git:git.openmoko.org.git.kernel.git-linux-openmoko-2.6.34_count|1

now they all use
'git:git.openmoko.org.git.kernel.git-linux-openmoko_rev' and each
recipe parsing seems to increase _count by number of
linux-openmoko*.bb recipes (because _rev is changed between each
recipe) :/.

git:git.openmoko.org.git.kernel.git-linux-openmoko_rev|dd1225cc08c3375bf802=
89ac1965c724881b149a
git:git.openmoko.org.git.kernel.git-linux-openmoko_count|78

Please advise what should be best fix for this. I'm OK with reverting
my last 2 commits and keeping unique PN for them, but maybe the same
issue can be found in other recipes too.

Using recipe name for persistent cache could be easy solution but
needs updated bitbake :/.

Regards,


