Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 77C5B65CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 21:14:18 +0000 (UTC)
Received: by iods203 with SMTP id s203so61223119iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 14:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Xv4O+xm5scAFBwYNSXcDZnt6wsUGXaHYa3GiJokDiwg=;
	b=bVEZnf1HzBa9sNP9jDEgjaGHBhB4glSNa9XqSggfKPN/bpiIiyCO108PnnokK6LYWR
	qTLharyvKAL37M7ZiWrimR8obBWE+KKNjRjltwke56pgTaJVpRGuXY5vaM+D+u/gIz0U
	Z1778jraQR/vuRMgrqPIv60kBegXuQzOKK4cOC7apexMHetyI9gqKQRDiX0UA6WtFlvC
	UUOuwlGGe9DEcj3I/CAjPJKvEnC7V60IzT3EU9QlheatzYAwKuqXGP1jjctKHl+7n7ig
	yleFwtoZHcFw4a+jMEWwJIWfgDwaocq4WcmGjWqNlz2qZZ5f05zAlUD2ShtqhqbTgdEf
	6q5g==
MIME-Version: 1.0
X-Received: by 10.107.6.166 with SMTP id f38mr4277963ioi.148.1440105258893;
	Thu, 20 Aug 2015 14:14:18 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Thu, 20 Aug 2015 14:14:18 -0700 (PDT)
In-Reply-To: <20150820150413.GI2446@jama>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
	<1432588449-31413-2-git-send-email-schnitzeltony@googlemail.com>
	<20150820150413.GI2446@jama>
Date: Thu, 20 Aug 2015 23:14:18 +0200
Message-ID: <CALbNGRSqGDTHWxYJxkBH_CpEiN_LGpsi-OdeA38gNLKufpdTeg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 01/12] fontforge: add 20141126
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
X-List-Received-Date: Thu, 20 Aug 2015 21:14:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2015 at 5:04 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Mon, May 25, 2015 at 11:13:58PM +0200, Andreas M=C3=BCller wrote:
>> Have this recipe in my meta-qt5-extra but would be happy to get it under=
 the
>> hood of Martin's world.
>>
>> It started with the native part to build kde's oxygen-fonts but maybe so=
mebody
>> likes to have it on target.
>>
>> Tested native part by gazillions of builds / target part in xfce environ=
ment.
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  .../fontforge/fontforge_20141126.bb                | 41 +++++++++++++++=
+++++++
>>  1 file changed, 41 insertions(+)
>>  create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge_2014112=
6.bb
>>
>> diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb b/=
meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
>> new file mode 100644
>> index 0000000..72020db
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
>> @@ -0,0 +1,41 @@
>> +SUMMARY =3D "A font editor"
>> +HOMEPAGE =3D "http://fontforge.github.io/en-US/"
>> +LICENSE =3D "GPLv3"
>> +LIC_FILES_CHKSUM =3D " \
>> +    file://COPYING.gplv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
>> +    file://LICENSE;md5=3D71d636ba7678baa1573e1b531041386e \
>> +"
>> +
>> +inherit autotools pkgconfig pythonnative
>> +
>> +DEPENDS =3D "glib-2.0 pango giflib tiff libxml2 jpeg python libtool"
>> +DEPENDS_append_class-target =3D " libxi"
>> +
>> +SRC_URI =3D "https://github.com/${BPN}/${BPN}/archive/${PV}.tar.gz"
>
> Don't use github archives, they are regenerated from time to time with
> different checksums and they have stupid filenames (prone to collision
> with other recipes).
>
> can you send follow-up patch?
>
This is some information I did not have yet. Follow up is in queue.

Andreas

