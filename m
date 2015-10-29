Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id B37E5759B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 09:22:43 +0000 (UTC)
Received: by wmff134 with SMTP id f134so20680633wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=Xqyc4dmE8Anx5i2ewGfQRwxx6fo6HM4Fcwy3BF6DQdo=;
	b=cr29H6fvbBlJhpDP23clYay9F/GaRUXtNo6x9j7mSSYWSXD5nkMvk7qtucXrOccvEo
	3XN8lCuqHXJVWMRtzvndn+qOasXYL39bCNZVgDI2oLPR5rIANUnDpthdQJwqPdrAIW+o
	B5NJI/2TgyTzZTuEV/tH0ZslarQxgXkDu/BW0b7R3uew31/NHH+fLSYJ699w+GcmU7cg
	IOqOFZowUoOEl5/VjEDmC9FO7EevotmUccIgfYQSJaLVbdlu3dfjofwkcVymaL4c/3Xh
	3BTiWD/CzB5GoSMigR68SVHbraPBkV1iLlKO/ShFBR2EPmERXwRLAAejKOiMbXbORxBq
	vIhw==
X-Received: by 10.28.144.10 with SMTP id s10mr2452999wmd.23.1446110562841;
	Thu, 29 Oct 2015 02:22:42 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id bh5sm732282wjb.42.2015.10.29.02.22.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Oct 2015 02:22:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <5631CDAD.7030703@skidata.com>
Date: Thu, 29 Oct 2015 10:22:40 +0100
Message-Id: <A34BC9F8-F519-435B-B65A-26A533F78877@gmail.com>
References: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
	<5631CDAD.7030703@skidata.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Oct 2015 09:22:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 29.10.2015 um 08:41 schrieb Richard Leitner =
<richard.leitner@skidata.com>:
>=20
> On 10/28/2015 07:01 PM, Jens Rehsack wrote:
>> This adds openjdk-8 for native and target builds and allows a =
stripped
>> openjre-8 being built as well instead of trying to cherry-pick jre
>> components from jdk-image.
>>=20
>> The recipes allow building openjdk-8 with or without:
>> * x11
>> * cups
>> * alsa/pulseaudio
>> and let packager enable unlimited-crypto, if desired.
>>=20
>> Since there can be only one PROVIDES for virtual/java-native and =
virtual/javac-native,
>> move the provides to openjdk-8-native (I think everyone agrees it's a =
better
>> choice than ecj-bootstrap-native).
>>=20
>> Plus: Applying a fix from openjdk-9 repository which fixes build =
issues using gcc5
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> README                                             |   13 +-
>> recipes-core/cacao/cacao_1.6.1.bb                  |    2 +-
>> recipes-core/ecj/ecj-bootstrap-native.bb           |    2 -
>> recipes-core/openjdk/openjdk-8-72b00/LICENSE       |  347 +++
>> .../dont-expect-fqpn-for-make.patch                |   18 +
>> .../openjdk-8-72b00/filter-aclocal-copy-too.patch  |   11 +
>> recipes-core/openjdk/openjdk-8-72b00/jvm.cfg       |   41 +
>> .../openjdk8-find-compiler-fix-env-respect.patch   |  140 +
>> .../openjdk-8-72b00/openjdk8-fix-shark-build.patch |  453 ++++
>> .../openjdk8-fix-shark-stdc++11.patch              | 2730 =
++++++++++++++++++++
>> .../openjdk8-no-genx11-in-headless.patch           |   17 +
>> .../openjdk-8-72b00/openjdk8-no-unused-deps.patch  |   94 +
>> ...o-in-favour-of-openembedded-package-split.patch |  120 +
>> .../openjdk8-restrict-to-staging-dir.patch         |   11 +
>> ..._than_returning_address_of_local_variable.patch |   23 +
>> .../remove-shell-variables-from-autoheader.patch   |   31 +
>> recipes-core/openjdk/openjdk-8-common.inc          |  229 ++
>> recipes-core/openjdk/openjdk-8-cross.inc           |  202 ++
>> recipes-core/openjdk/openjdk-8-native.inc          |   63 +
>> recipes-core/openjdk/openjdk-8-native_72b00.bb     |   16 +
>> recipes-core/openjdk/openjdk-8-release-72b00.inc   |   89 +
>> recipes-core/openjdk/openjdk-8_72b00.bb            |   36 +
>> recipes-core/openjdk/openjre-8_72b00.bb            |   30 +
>> 23 files changed, 4706 insertions(+), 12 deletions(-)
>> create mode 100644 recipes-core/openjdk/openjdk-8-72b00/LICENSE
>> create mode 100644 =
recipes-core/openjdk/openjdk-8-72b00/dont-expect-fqpn-for-make.patch
>> create mode 100644 =
recipes-core/openjdk/openjdk-8-72b00/filter-aclocal-copy-too.patch
>> create mode 100644 recipes-core/openjdk/openjdk-8-72b00/jvm.cfg
>> create mode 100644 =
recipes-core/openjdk/openjdk-8-72b00/openjdk8-find-compiler-fix-env-respec=
t.patch
>> create mode 100644 =
recipes-core/openjdk/openjdk-8-72b00/openjdk8-fix-shark-build.patch
>> create mode 100644 =
recipes-core/openjdk/openjdk-8-72b00/openjdk8-fix-shark-stdc++11.patch
>> create mode 100644 =
recipes-core/openjdk/openjdk-8-72b00/openjdk8-no-genx11-in-headless.patch
>> create mode 100644 =
recipes-core/openjdk/openjdk-8-72b00/openjdk8-no-unused-deps.patch
>> create mode 100644 =
recipes-core/openjdk/openjdk-8-72b00/openjdk8-prevent-debuginfo-in-favour-=
of-openembedded-package-split.patch
>> create mode 100644 =
recipes-core/openjdk/openjdk-8-72b00/openjdk8-restrict-to-staging-dir.patc=
h
>> create mode 100644 =
recipes-core/openjdk/openjdk-8-72b00/openjdk8-use_builtin_frame_address_0_=
rather_than_returning_address_of_local_variable.patch
>> create mode 100644 =
recipes-core/openjdk/openjdk-8-72b00/remove-shell-variables-from-autoheade=
r.patch
>=20
> IMHO a version independent patches directory like for openjdk-7 would
> also be good here.
>=20
> To cite Otavio:
> We could rename the patches directory for openjdk-7 and avoid the
> version number on it. This would make easier for upgrades and to see
> the diff between the patches.

So git diff -M doesn't work for you? I don't understand the reasoning.

>> create mode 100644 recipes-core/openjdk/openjdk-8-common.inc
>> create mode 100644 recipes-core/openjdk/openjdk-8-cross.inc
>> create mode 100644 recipes-core/openjdk/openjdk-8-native.inc
>> create mode 100644 recipes-core/openjdk/openjdk-8-native_72b00.bb
>> create mode 100644 recipes-core/openjdk/openjdk-8-release-72b00.inc
>> create mode 100644 recipes-core/openjdk/openjdk-8_72b00.bb
>> create mode 100644 recipes-core/openjdk/openjre-8_72b00.bb
>=20
> Furthermore I had problems building OpenJDK-7 with this patch applied.
> But I will verify that again and come back to you!

Yes, please :)

I'm sorry that I cannot verify on own, because OpenJDK-7 still requires =
X11
and I have no X11 available in my distro and not enough resources to =
create
a playground for such things :(

But with sane errors I'm happy to dig and fix.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


