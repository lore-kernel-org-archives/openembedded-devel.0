Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8B18476F58
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 10:25:58 +0000 (UTC)
Received: by wmll128 with SMTP id l128so82816946wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 02:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=4p/p0T+u5wU7c0mhzMfKTqPRiQSnExmKNGMQ73cz48w=;
	b=0TRXzp3thmvxohC+RnGwC2IdUG2SD2zPqwddFhGEMvTWXzxNHdCRin4+6dS2Qze2fl
	9aLA0mzxKwc21nikvnEBbfAbn7qnizdTazkWv3qH7sbJAfta5KhlNv+gjqR6fUcZ3RoT
	z7tUS6nyupWBRkIhSkPIQhC3WqzywNSjwv9TxR/KsnoBkWvmyCH/ad0xxNWzdt2C5lkf
	jbLogZe44adAstlzK9CA4subXPxJqumjLhUSyYbOJAZl7xEVZqtrZy7EfG5PHCbT3lne
	vlWNnpEK6RPsqBdFD75m91QOsQG5lk9YZoVYpPT/JCctCqGBV+/XfAdcKZOaUtBMJEWZ
	BStw==
X-Received: by 10.28.93.145 with SMTP id r139mr17737089wmb.20.1446546358650;
	Tue, 03 Nov 2015 02:25:58 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	t126sm22545221wmd.18.2015.11.03.02.25.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Nov 2015 02:25:58 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAP9ODKogmLTnhkbcexo58JtSAbq74xta7OfVJ_szSYbxA2nfqg@mail.gmail.com>
Date: Tue, 3 Nov 2015 11:25:56 +0100
Message-Id: <FD44C84C-9D37-41F1-89A6-1D6920728DD4@gmail.com>
References: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
	<5631CDAD.7030703@skidata.com>
	<A34BC9F8-F519-435B-B65A-26A533F78877@gmail.com>
	<CAP9ODKrh9kxCTf3es2Oypx3rPNiKp9Fb3Nk6xafgrc=R+JEkwg@mail.gmail.com>
	<9E01DDA7-C832-4E17-B17A-25850D0B27B5@gmail.com>
	<563208F3.1040900@skidata.com>
	<CAP9ODKoUv+-WXzXNEKdFWwFDbJnQGXZtiZzqXtBzS7MmwOXkYA@mail.gmail.com>
	<56324006.8040905@skidata.com>
	<CAP9ODKrnG2biyhwNESgA8DBQcaMgYZ39kdRTFU4Cv6PgvAjg4Q@mail.gmail.com>
	<56326A97.4040107@skidata.com>
	<CAP9ODKogmLTnhkbcexo58JtSAbq74xta7OfVJ_szSYbxA2nfqg@mail.gmail.com>
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
X-List-Received-Date: Tue, 03 Nov 2015 10:25:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 29.10.2015 um 19:59 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>=20
> On Thu, Oct 29, 2015 at 4:51 PM, Richard Leitner
> <richard.leitner@skidata.com> wrote:
>> On 10/29/2015 05:03 PM, Otavio Salvador wrote:
>>> On Thu, Oct 29, 2015 at 1:49 PM, Richard Leitner
>>> <richard.leitner@skidata.com> wrote:
>>>>=20
>>>> What indentation should be chosen? Tabs? Spaces (how much)?
>>>> Maybe I have also time to fix that in the recipes-core.
>>>=20
>>> I would prefer 4 spaces.
>>>=20
>>=20
>> Generally I prefer real tabs displayed with 8 spaces width (like the
>> linux kernel coding style). But of course I will stick to the =
formatting
>> rules if we have one in OE layers ;-)
>>=20
>> Is there a generally considered rule/advisory across all OE layers or
>> meta-java?
>> If yes, where do I find it?
>> If no, wouldn't that be a good idea? (and of course write it down!)
>=20
> http://www.openembedded.org/wiki/Styleguide

I reformatted the indent to 4 spaces and renamed the patch directory.

The include files can't be reduced in a sane way, because openjdk-8 =
patch
provides 3 recipes at once:

* openjdk-8-native - which is provided for Java7 with =
recipes-core/icedtea7 instead of embedding it into recipes-core/openjdk
* openjdk-8 - provides full JDK for target (compiled j2sdk image)
* openjre-8 - provides the plain JRE (compiled j2re image)

That's a huge difference to the existing icedtea7/openjdk-7 combo, which =
provides 2 recipes and a dedicated package for openjdk-7-jre which =
contains some jdk relicts.=20

So all 3 recipes includes the include file for the concrete HG URI's and =
checksums for the given release, then either the native or cross inc for =
building and they have shared code in common inc. Theoretically the =
URI's and checksums can be moved into common.inc - but this increases =
entropy in common.inc for decreasing entropy in directory, but mixing =
information that don't belong together.

Best regards
--=20
Jens Rehsack - rehsack@gmail.com


