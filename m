Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PQis5-00044T-Eo
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 16:57:30 +0100
Received: by yxd5 with SMTP id 5so1487607yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Dec 2010 07:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=q15zw2y2sGFG0+R4fU+DX4TRLMo6v2lSvicWtm55+yw=;
	b=BYHpck/EPh8sjH9jd1WBEouAYR432ub44Lr9+EJEsUxEEJsud+d/a5plzErE5LuIfg
	pS2bIuyhKbwZeahD/UQrOJ26XEwltETS2hJprW70kh0lpa0xs/WcFCqPUpe6ntdVEjdH
	lBi3pJQLI9h2u/KVSRtNskglhiFfYk6YTpZ7s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=T103kum9lHddFieX1xAgmBnkQnl102ClLaN12DiVwD7N7vMcu4aBtwZTV0NdQnQbEs
	vF/lKPA3Xtzs6fo5ewGmFC1dZoEAmz+GIQVqHbAJR7PeLKcLYV/wEukOizsTQ8TgdPFU
	S1DYpztbCAPlA+Hh6/Sep3oPdWgpjjkVHlB9Q=
Received: by 10.91.163.27 with SMTP id q27mr13543635ago.139.1291910154706;
	Thu, 09 Dec 2010 07:55:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 9 Dec 2010 07:55:34 -0800 (PST)
In-Reply-To: <20101209081207.GI3186@jama>
References: <1291864997-30025-1-git-send-email-raj.khem@gmail.com>
	<20101209081207.GI3186@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Dec 2010 07:55:34 -0800
Message-ID: <AANLkTi=LRYmMo7wrYJSg+1Psc+iC-t577re7s_02gGR3@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] minimal.conf: Prefer libtool 2.4 with sysroot support
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
X-List-Received-Date: Thu, 09 Dec 2010 15:57:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 9, 2010 at 12:12 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Dec 08, 2010 at 07:23:17PM -0800, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0conf/distro/minimal.conf | =C2=A0 =C2=A09 ++++++++-
>> =C2=A01 files changed, 8 insertions(+), 1 deletions(-)
>>
>> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
>> index 5b92a36..451d010 100644
>> --- a/conf/distro/minimal.conf
>> +++ b/conf/distro/minimal.conf
>> @@ -102,13 +102,20 @@ require conf/distro/include/preferred-xorg-version=
s-X11R7.5.inc
>>
>> =C2=A0PREFERRED_PROVIDER_opkg ?=3D "opkg"
>> =C2=A0PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg"
>> -PREFERRED_QT_VERSION ?=3D "4.7.1"
>> +PREFERRED_QT_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ?=3D "4.7.1"
>> +PREFERRED_LIBTOOL_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D=
 "2.4"
>> +LIBTOOL_HAS_SYSROOT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0?=3D "yes"
>
> what about setting this libtool version in sane-toolchain.inc?

Initially I thought of that but then kept the sope to minimal only.
But I am fine to put it
in sane-toolchain.inc if no one sees any issues with it

with more
> distros using it we'll get better test coverage and state of recipes
> built with it seems good enough to me (SHR is using it for a while).
>



> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


