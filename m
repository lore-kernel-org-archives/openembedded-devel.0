Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id CC8BF770C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 17:15:12 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so42090415wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2015 10:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=l7f3QsODKgxRXHCzUg1O2bdysrkeEykbLCBgo7gNK8g=;
	b=H1R6sn/c9IX5/uIxpIJcUPWvsNxC2UKu48y0KQsCzDlz1/pBr7a3RFKpPccv9S5jab
	vNQAKSW0EYtPWp+Xdmk7iKhJtg/W/mtFk8oKSUMx2cIE9lmGQ+OsT3l0hdsQAG2RCuBh
	q80/3S0zRP/Bv5pnS+gO7psYhzedcftlq8owcbGbEnYg7tl7i+zzGNH3N/x5JdmnXBjN
	lCu+S+He9hmIOQWSGXJKId5c/wKt7IPulQ7KV+XVSYGMVdi5DA/YmZlRjUxtRlw6Eo1Z
	as8KXYV6GbVa7g5lWcjkErmCZzId+Fw9KczL2/oJfioQ7jfMELwPK1RgHccDA1MIjTUo
	QIWw==
X-Received: by 10.180.37.199 with SMTP id a7mr71778wik.2.1443806112422;
	Fri, 02 Oct 2015 10:15:12 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id h8sm9339227wib.21.2015.10.02.10.15.11
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 02 Oct 2015 10:15:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAP9ODKo3wQZqorptjghXrjzTo3jkZj8zPn3-6BbvCvmWM2XuBw@mail.gmail.com>
Date: Fri, 2 Oct 2015 19:15:10 +0200
Message-Id: <4D9824F2-501A-4743-950D-DF67E59A4947@gmail.com>
References: <1440032144-18482-1-git-send-email-vinay.k.awasthi@intel.com>
	<B399646F8CA055479BEC55F6B065A04A370ABB95@FMSMSX108.amr.corp.intel.com>
	<CAP9ODKrVXpZ-ZhZ=1SjAdqtrOpD=XO1DJaruGef4OyhT-uDd1w@mail.gmail.com>
	<B399646F8CA055479BEC55F6B065A04A370ABF6A@FMSMSX108.amr.corp.intel.com>
	<D8A82570-8C75-4DA8-B884-13747427A3D4@gmail.com>
	<CAP9ODKo3wQZqorptjghXrjzTo3jkZj8zPn3-6BbvCvmWM2XuBw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	"mario@ossystems.com.br" <mario@ossystems.com.br>
Subject: Re: [meta-java][PATCH] OpenJDK-8: For x86 and ARM
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
X-List-Received-Date: Fri, 02 Oct 2015 17:15:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 02.10.2015 um 18:42 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>=20
> On Fri, Oct 2, 2015 at 12:50 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>> Am 01.10.2015 um 00:58 schrieb Awasthi, Vinay K =
<vinay.k.awasthi@intel.com>:
>>> I do see configure here .. =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790/configure but for some reason build just =
bails out..
>>=20
>> I told you in private mail yesterday evening, you have to apply =
https://github.com/rehsack/poky/commit/9aa003359f9d804544ba68fa812dd65915c=
4901b in poky before running openjdk's autoconf procedure. It's because =
of poky unlink's all "configure" files and expects running autoreconf =
brings the fine ones back.
>> OpenJDK has a weird perspective regarding "fine ones" ^^
>=20
> I agree the OE-Core change should be included indeed but I also think
> we could work on a temporary solution using a do_configure so it could
> be used with Fido, as well.

How about =
https://github.com/rehsack/poky/commit/e1421f802ead7ed46c675c0639a5eee9ef7=
fdd5a :)
With a bit fine-tuning (CONFIGURE_SCRIPT vs. AUTOTOOLS_SCRIPT_PATH) - =
easy going ;)

I did OpenJDK-8 on Fido and rebased to master as recommended by Otavio =
for submiting patches.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


