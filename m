Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id D480F763F2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 16:20:59 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so88947285wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 08:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=Hf95KTaUQDps9+J/UUJyjNeulis9Tt4pSQl7a4SvBwM=;
	b=VhAK7c6XGoclpu/WGJMD8vCyVHYviQySJKMBs8+NlvSa512GG4NWCMmQLskQ7Il2Uo
	no2mvbqpZTI13oujCVuTnq6PIm8DjvzvvterFI7Izi3kQXdxVxq+X/LjW3b89HHpWoHc
	rrECkMNaKMLQ0gI+6pzX+j7x3yhSvK/gyMQvs89C/oaWOMhXXhY87rDZjme5JYmnuErz
	V5z7bWzOEA+broGhvLlxw4WmZDng0hOXRRD8sV/Bvlbv9+C1hrDv4Wv5QPS1DDwCYUiN
	yu6FLSOEh70yrCJUJcs6vSmthNd39KEJ04dn+THe+EmbIAmvo15FxoPQU42V7NaD0x94
	DiCg==
X-Received: by 10.28.7.133 with SMTP id 127mr19592999wmh.37.1446567659323;
	Tue, 03 Nov 2015 08:20:59 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	71sm24104121wmm.24.2015.11.03.08.20.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Nov 2015 08:20:58 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <5638D571.3090500@skidata.com>
Date: Tue, 3 Nov 2015 17:20:57 +0100
Message-Id: <7448BFE6-D551-4E46-A7B0-F568423C219A@gmail.com>
References: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
	<5638C28E.7040505@skidata.com>
	<2BAA39D9-E6DA-403E-AFAB-1E59CFE61DF2@gmail.com>
	<5638D571.3090500@skidata.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Tue, 03 Nov 2015 16:21:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 03.11.2015 um 16:40 schrieb Richard Leitner =
<richard.leitner@skidata.com>:
>=20
> On 11/03/2015 03:54 PM, Jens Rehsack wrote:
>>=20
>>> Am 03.11.2015 um 15:19 schrieb Richard Leitner =
<richard.leitner@skidata.com>:
>>>=20
>>> On 11/03/2015 10:36 AM, Jens Rehsack wrote:
>>>> This adds openjdk-8 for native and target builds and allows a =
stripped
>>>> openjre-8 being built as well instead of trying to cherry-pick jre
>>>> components from jdk-image.
>>>>=20
>>>> The recipes allow building openjdk-8 with or without:
>>>> * x11
>>>> * cups
>>>> * alsa/pulseaudio
>>>> and let packager enable unlimited-crypto, if desired.
>>>>=20
>>>> Since there can be only one PROVIDES for virtual/java-native and =
virtual/javac-native,
>>>> move the provides to openjdk-8-native (I think everyone agrees it's =
a better
>>>> choice than ecj-bootstrap-native).
>>>>=20
>>>> Plus: Applying a fix from openjdk-9 repository which fixes build =
issues using gcc5
>>>=20
>>> For me the patch fails to apply on current master:
>>>=20
>>> git am patches-from-emails/openjdk-8_and_openjre-8.eml
>>> Applying: openjdk-8: add recipes for openjdk-8 and openjre-8
>>> /home/leri/git/meta-java/.git/rebase-apply/patch:515: trailing =
whitespace.
>>>     xargs -0 -n1
>>> ${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/bin/pack200 --repack
>>> --effort=3D9 --segment-limit=3D-1 --modification-time=3Dlatest =
--strip-debug
>>> /home/leri/git/meta-java/.git/rebase-apply/patch:1232: trailing =
whitespace.
>>> #
>>> /home/leri/git/meta-java/.git/rebase-apply/patch:1265: trailing =
whitespace.
>>>=20
>>> /home/leri/git/meta-java/.git/rebase-apply/patch:1270: trailing =
whitespace.
>>>=20
>>> /home/leri/git/meta-java/.git/rebase-apply/patch:1289: trailing =
whitespace.
>>>=20
>>> fatal: corrupt patch at line 4592
>>> Patch failed at 0001 openjdk-8: add recipes for openjdk-8 and =
openjre-8
>>=20
>> That's maybe because I copy the format-patch output manually into the =
mail.
>> Use this one: =
https://github.com/rehsack/meta-java/commit/57eba04b0f68a55b3250a692bc5834=
902709c903
>>=20
>=20
> Same error :-(
> Do I need any previous patches applied which are not yet on master?

Depends - this one comes first, because openjdk-8 supports building for =
distro's without x11:

=
https://github.com/rehsack/meta-java/commit/566f95135c9f8b8bedd1e24b2b5872=
177b1fdbe4

You had trouble testing it because of cacao-native re-configure ... =
which should now be fixed.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


