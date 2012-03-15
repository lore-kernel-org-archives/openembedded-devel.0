Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S88Lb-0000Xn-Bx
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 11:55:55 +0100
Received: by ghbz2 with SMTP id z2so2843748ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=FNQkhxfAjUtD/3HTFaw69UXKNcZas6hAyjg5SmsnuVg=;
	b=K3S44TflteW0cGkWnoEiOaN5lCgFONZX9/kXv9KDmj4kSozQP3M1rmJMqdvD8S1Dc6
	MjRTkjN6CFvOtW8zjQOvuWWvl2fAn7mqfJawJwNUhZowwY92gpRR8MjbSPxYini8zcSK
	PCruvJJl+ESBz6LuCRUgLN5oHFFUkZq4eEPcZv/YgJYfO95Gt6M65dp/YzyqLVR+EuoR
	ET+ktK7aD6253liyyCOFIrBJpPVKNPY6y9OBexGadVC07d4F7K4uSxfnZvjJPmiTN7aU
	SYGaZl3r8AYqWlU1kbr/FSG+6pKz4Ugf7Xz/SxvSGt2vrbbGfXlLqWSiaRwQm0+9DP+j
	RshQ==
MIME-Version: 1.0
Received: by 10.224.200.8 with SMTP id eu8mr6805315qab.95.1331808428633; Thu,
	15 Mar 2012 03:47:08 -0700 (PDT)
Received: by 10.229.230.67 with HTTP; Thu, 15 Mar 2012 03:47:08 -0700 (PDT)
In-Reply-To: <CALbNGRSPmMZ2MGutnXuJtwerv=y8BDGiQnBUK-Lh6nk+5y9a1A@mail.gmail.com>
References: <cover.1331754944.git.Martin.Jansa@gmail.com>
	<7ab914b2620b85f3d8363fed900c056ff1f5650a.1331754944.git.Martin.Jansa@gmail.com>
	<CALbNGRSPmMZ2MGutnXuJtwerv=y8BDGiQnBUK-Lh6nk+5y9a1A@mail.gmail.com>
Date: Thu, 15 Mar 2012 11:47:08 +0100
Message-ID: <CALbNGRTG+FrLjeNWhJn3Cz_qQT=e7tZRx4kKEgGrxM9QvdywCA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-efl][PATCH 1/5] midori: upgrade to 0.4.4
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
X-List-Received-Date: Thu, 15 Mar 2012 10:55:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 15, 2012 at 11:21 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Mar 14, 2012 at 8:59 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> * custom waf to fix dirty vala version was dropped
>> * I've fixed our vala to stop reporting dirty even for valid released ta=
rballs
>> =A0so you can still get dirty version but it's not so common to keep thi=
s ugly binary here.
>> * disable PARALLEL_MAKE to improve our chances agains build hangs
>> =A0(btw fedora is doing the same
>> =A0 http://osdir.com/ml/scm-fedora-commits/2011-11/msg04672.html)
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>> =A0meta-oe/recipes-connectivity/midori/midori/waf =A0 =A0 | =A0Bin 92569=
 -> 0 bytes
>> =A0.../recipes-connectivity/midori/midori_0.4.3.bb =A0 =A0| =A0 13 -----=
--------
>> =A0.../recipes-connectivity/midori/midori_0.4.4.bb =A0 =A0| =A0 =A08 +++=
+++++
>> =A03 files changed, 8 insertions(+), 13 deletions(-)
>> =A0delete mode 100755 meta-oe/recipes-connectivity/midori/midori/waf
>> =A0delete mode 100644 meta-oe/recipes-connectivity/midori/midori_0.4.3.b=
b
>> =A0create mode 100644 meta-oe/recipes-connectivity/midori/midori_0.4.4.b=
b
>>
> I wanted to test this but task do_compile seems to run forever (now
> for 1,5h) and I have an empty log.do_compile. Any pointers where to
> look after?
>
I did cleansstate and rebuild midori with success now. I had similar
from time to time but with task do_configure.

Andreas


