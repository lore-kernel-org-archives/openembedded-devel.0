Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id E2BD66A945
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 09:07:20 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so4477059pad.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 02:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=eVf95n1dg00oMZ0MiyPkKQ6Zs4rGh3AmgGBQRZpcOkE=;
	b=nF0bJxHF2YiNZQfESVBLDYk65p2ny7gVPLqWkYCQNoInJv/jmjlx7/+bfWEDMhZ7gv
	H+DNDjqHdJFttbpfx5zmLB75FYhThMwe0dUiE7jnJZZb/I4P0r3S9Q3z+2dXs7eSvJtS
	b9Lz84BLyOrQXpMy5JATbnyW6mGT/TuefVqzJZFOzzVdgiyZgM3XYlWO/xQtcKqQc+Oo
	PgysD36xDUUPUMF5L+aK1TnMiyqLnpjlUgV/fu1YiUpso1IdnfTClgZWgYZbMWhFfx8S
	1IsAH4VtW33HFL9by7LZKbtljlEOKekMFTHfL2CXQUjP4jGYJioTy3UBzIvruqCdHE2Z
	woEQ==
X-Received: by 10.66.240.41 with SMTP id vx9mr17690484pac.93.1370941642047;
	Tue, 11 Jun 2013 02:07:22 -0700 (PDT)
Received: from sa-nc-common3-188.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	ov2sm13857330pbc.34.2013.06.11.02.07.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 02:07:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51B6E5AF.4080808@juszkiewicz.com.pl>
Date: Tue, 11 Jun 2013 02:07:21 -0700
Message-Id: <B614F44C-717C-420C-B6C3-69CA11A87E28@gmail.com>
References: <1370165592-15697-1-git-send-email-net147@gmail.com>
	<51AB1684.1080500@juszkiewicz.com.pl>
	<CAMKF1soSa-S9kUC1PH9pJYbnJsvRiubNxbgNvYEx8zs4XiwmLw@mail.gmail.com>
	<51B6D7DA.1060609@juszkiewicz.com.pl>
	<CAMKF1sokFKxLAWEmSOMN15UODnWswpKRZbs79X=ggWvUW2Yepg@mail.gmail.com>
	<51B6E5AF.4080808@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1508)
Subject: Re: [meta-oe][PATCH] llvm3.2: new recipe
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
X-List-Received-Date: Tue, 11 Jun 2013 09:07:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 11, 2013, at 1:54 AM, Marcin Juszkiewicz =
<marcin@juszkiewicz.com.pl> wrote:

>> in this case arch does not map to what OE's target arch is so you =
have
>> to do it twice if you want to use COMPATIBLE_HOST
>=20
> It has 7 OE architectures: i.86, x86_64, arm, mips(el), powerpc(64)
> which are then mapped into 5 llvm ones. Can be gathered into one
> COMPATIBLE_HOST (copied from kexec-tools):
>=20
> COMPATIBLE_HOST =3D '(x86_64.*|i.86.*|arm.*|powerpc.*|mips.*)-(linux)'
>=20
> "mips.*" probably needs to be changed to "mips(el)?" to not cover =
mips64.

and how will you fold it into -DLLVM_TARGETS_TO_BUILD=3D<arch>

where arch is not same as OE's target arch so you need the mapping =
function
anyway was my point.=

