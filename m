Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1ULeW5-0006gQ-7y
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 19:59:09 +0100
Received: by mail-pa0-f41.google.com with SMTP id kx1so457800pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 11:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:content-type:message-id:mime-version:subject:date
	:references:to:in-reply-to:x-mailer;
	bh=u0i5VWkpbIDfKBtrijUzUYl/FqXPW0Ex0V07OuG9cfw=;
	b=ScoWQtubLFkh+2YRsZtNOQFHHXDCN8rhdQYjNdTbJH/qrQ4CrhLukT7gQ5T4RxGLqP
	t+mVihcfJAC4sw5j57puvdtqawlQKaBfez1Q5CfI6sUjnky5aW8LaF05+zE5YnZWo2fL
	XlFT6xPf8zHnSj4Vb5r0GZQpsPkK+MHWGeeEH3XtGNQ4+kJGuOTTgauF/4pyTTHmSXzI
	KXZz5BVJvqvkLa9eJcbX0Mf9G8+Zhzgg+abFQQzBmJIr9D8MBXqPaWDpUHr7evyAfryz
	qkeCRfy8emG58YwqUAsakRlnoqHzquYO30ohw/3ln1wVtyyfUJD+gArBhd/Y32j4xp3e
	tidQ==
X-Received: by 10.68.143.167 with SMTP id sf7mr5230490pbb.21.1364582524221;
	Fri, 29 Mar 2013 11:42:04 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.105.6])
	by mx.google.com with ESMTPS id z1sm3696567pbw.19.2013.03.29.11.42.01
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 11:42:03 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Message-Id: <FD24D7F9-9932-4755-8F68-02626C575B49@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Date: Fri, 29 Mar 2013 22:41:58 +0400
References: <B50A14F0-C069-4F7A-94C5-4333819E775E@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <B50A14F0-C069-4F7A-94C5-4333819E775E@gmail.com>
X-Mailer: Apple Mail (2.1503)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: microblazeel-nf tune: ERROR: Unable to determine endianness for architecture
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
X-List-Received-Date: Fri, 29 Mar 2013 18:59:09 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

On Mar 29, 2013, at 10:20 PM, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:

> Hi,
>        I'm trying to update the tune files for MicroBlaze, =
specifically the microblazeel (little endian) with soft-float.
>=20
> I get the following error while trying to build:
>=20
> ERROR: Unable to determine endianness for architecture ''
> ERROR: Unable to determine endianness for architecture ''
> ERROR: Please add your architecture to siteinfo.bbclass
> ERROR: Please add your architecture to siteinfo.bbclass
> ERROR: Unable to parse =
/tool/yocto/meta-openembedded/toolchain-layer/recipes-devtools/gcc/libgcc_=
4.6.bb: Exited with "1"--:--
> ERROR: Unable to determine endianness for architecture ''
> ERROR: Please add your architecture to siteinfo.bbclass
> ERROR: Command execution failed: Exited with 1

The TUNE_ARCH variable wasn't set. Explicitly setting TUNE_ARCH =3D =
"microblazeel" allowed me to proceed ahead with the build.

However, I can't but help think that the tune files can be better =
written or organized.

It would be great if someone could critically comment on these =
microblaze tune files, to suggest how I can improve the structure and =
layout of the basic tune file definitions.

Contents of arch-microblaze.inc file:

# Microblaze ABI interface definition
# Four defined ABIs, all combinations of:
# *) Hard/Soft Floating Point
# *) Big Endian (PLB System) / Little Endian (AXI System)

DEFAULTTUNE ?=3D "microblaze"
TUNE_ARCH ?=3D "microblaze"

TUNE_PKGARCH =3D "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
ABIEXTENSION ?=3D ""

TUNEVALID[fpu-hard] =3D "Use hardware FPU."
TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", =
"-mhard-float", "", d)}"
#TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", =
"microblaze", "", d)}"

TUNEVALID[fpu-soft] =3D "Use software FPU."
TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", =
"-msoft-float", "", d)}"
TARGET_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", =
"soft", "", d)}"

TUNEVALID[big-endian] =3D "Microblaze Big Endian processor"
TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "big-endian", =
"-mbig-endian", "", d)}"

TUNEVALID[little-endian] =3D "Microblaze Little Endian processor"
TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "little-endian", =
"-mlittle-endian", "", d)}"

# Basic tune definitions
AVAILTUNES +=3D "microblaze"

TUNE_FEATURES_tune-microblaze ?=3D "big-endian fpu-hard"
BASE_LIB_tune-microblaze =3D "lib"
TUNE_PKGARCH_tune-microblaze =3D "microblaze"
PACKAGE_EXTRA_ARCHS_tune-microblaze =3D "microblaze"


Contents of tune-microblazeel-nf.inc file:

# Tune options for MicroBlaze little endian soft-float
DEFAULTTUNE ?=3D "microblazeel-nf"

TUNE_ARCH =3D "microblazeel"

require conf/machine/include/microblaze/arch-microblaze.inc

TUNEVALID[microblazeel-nf] =3D "Enable MicroBlaze little endian =
soft-float optimizations"
TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", =
"microblazeel-nf", "-mcpu=3Dv8.40b", "", d)}"
TUNE_PKGARCH =3D "${@bb.utils.contains("TUNE_FEATURES", =
"microblazeel-nf", "microblazeel-nf", "microblazeel-nf", d)}"

AVAILTUNES +=3D "microblazeel-nf"
TUNE_FEATURES_tune-microblazeel-nf ?=3D "little-endian fpu-soft"
BASE_LIB_tune-microblazeel-nf =3D "lib"
TUNE_PKGARCH_tune-microblazeel-nf =3D "microblazeel-nf"
PACKAGE_EXTRA_ARCHS_tune-microblazeel-nf =3D "microblazeel-nf"

Elvis Dowson


