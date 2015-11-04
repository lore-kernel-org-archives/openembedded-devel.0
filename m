Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 692D875E2D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 17:57:37 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so117226769wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 09:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=B1/KXraOiUgdRerfl2Q3QasOx1D1csXHjc6tcbkMc9M=;
	b=yIQQ8H2yoSKvgdIggMERMslIgb5VN4oial2f3Ws90se0RkGVh6ZWI86LecnxXInrsw
	6uRS90CvVi8LJ8d2szjEf/1ZebFmCgaK6GS+064BlpYg1339G4W3CKGl3lJXCy4wRT6N
	ohzsdzqkK9K4wfvcnZlZ0AdlHVPiXWk32+zCCb1mEBSghN1Vip+nJzfLRgKdy4yfur2H
	UAeUGQvtYKwXwt8GjtBLcZqbn/UxKbE8/r+9fdkFeBJSxAeVfrPi41G1Z61RyS/MXVJd
	u6xXE/mXoGkT+kdIhG/4JOQZZUf3LWdQKDz41FzhUNLjT3TdJlut5cvwFOg088/q9poP
	o3lA==
X-Received: by 10.28.94.129 with SMTP id s123mr5046019wmb.78.1446659857384;
	Wed, 04 Nov 2015 09:57:37 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	d81sm4170250wma.16.2015.11.04.09.57.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Nov 2015 09:57:36 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <5639BBD0.2050201@skidata.com>
Date: Wed, 4 Nov 2015 18:57:35 +0100
Message-Id: <F46AA2E3-B76D-4B6D-ABC9-2423E80EA882@gmail.com>
References: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
	<5638C28E.7040505@skidata.com>
	<2BAA39D9-E6DA-403E-AFAB-1E59CFE61DF2@gmail.com>
	<5638D571.3090500@skidata.com>
	<7448BFE6-D551-4E46-A7B0-F568423C219A@gmail.com>
	<5639BBD0.2050201@skidata.com>
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
X-List-Received-Date: Wed, 04 Nov 2015 17:57:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 04.11.2015 um 09:03 schrieb Richard Leitner =
<richard.leitner@skidata.com>:
>=20
>=20
> On 11/03/2015 05:20 PM, Jens Rehsack wrote:
>>=20
>> Am 03.11.2015 um 16:40 schrieb Richard Leitner =
<richard.leitner@skidata.com>:
>>>=20
>>> On 11/03/2015 03:54 PM, Jens Rehsack wrote:
>>>> That's maybe because I copy the format-patch output manually into =
the mail.
>>>> Use this one: =
https://github.com/rehsack/meta-java/commit/57eba04b0f68a55b3250a692bc5834=
902709c903
>>>=20
>>> Same error :-(
>>> Do I need any previous patches applied which are not yet on master?
>>=20
>> Depends - this one comes first, because openjdk-8 supports building =
for distro's without x11:
>>=20
>> =
https://github.com/rehsack/meta-java/commit/566f95135c9f8b8bedd1e24b2b5872=
177b1fdbe4
>=20
> Thank you for the hint! Now it applies.
>=20
> But I get following error when running "bitbake openjdk-7":

Sure? Didn't you "bitbake openjdk-8"? Or is it because =
virtual/javac-native now points
to openjdk-8-native and there is no known way for me to let a user =
sanely pick the
beloved one on his/her own?

But openjdk-7 should not depend on virtual/javac-native -- so some =
enlightening is
required ...

> ERROR: Function failed: do_configure (log file is located at
> =
/build/myTarget/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/temp/log.d=
o_configure.31291)
> ERROR: Logfile of failure stored in:
> =
/build/myTarget/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/temp/log.d=
o_configure.31291
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> 'bit-64', 'x86_64-linux', 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_copy_aclocals
> | DEBUG: Python function autotools_copy_aclocals finished
> | DEBUG: Executing shell function do_configure
> | ERROR: no configure script found at
> =
/build/myTarget/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8be=
d1496ff2/configure
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> =
/build/myTarget/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/temp/log.d=
o_configure.31291)
> ERROR: Task 1074
> =
(/opt/yocto/poky/meta-java/recipes-core/openjdk/openjdk-8-native_72b05.bb,=

> do_configure) failed with exit code '1'
>=20
>=20
> Why is openjdk-8-native built at all here?
> Nonetheless the same error occurs when building openjdk-8!
>=20
> Furthermore following two warnings pop up:
>=20
>=20
> WARNING: Variable key ALTERNATIVE_${JDKPN} (java) replaces original =
key
> ALTERNATIVE_openjdk-8 (java).
> WARNING: Variable key ALTERNATIVE_${JDKPN} (java) replaces original =
key
> ALTERNATIVE_openjdk-8 (java).
>=20
>=20
> Currently I have no time digging deeper into the problem, sorry for =
that!
> But if you have a hint/solution I will test it again!

Otavio didn't apply the stuff, because poky has to commit =
https://github.com/rehsack/poky/commits/master-java-support first:

* =
https://github.com/rehsack/poky/commit/65cdad40f2717b85892e12c80749cd43c1e=
19a40 is universal,
  because configure of openjdk-8 will be deleted by original =
autotools.bbclass without any ability to recover
* =
https://github.com/rehsack/poky/commit/20ad5ff329a59b92b97ffad889e06b35cca=
d6e3f is needed for target's with ARMv5e (only
  the DSP versions, not all ARMv5!)

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


