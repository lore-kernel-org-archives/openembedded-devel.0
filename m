Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id CBE386F35A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 19:05:59 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id jw12so948107veb.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 11:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=xVXLbmkf6SJrqCLUQIhH114y+dQ9UBSb20hE6XltP3w=;
	b=BVCN85pGgH1jCKOa20L2F+Qllal5BBRsbuJK7xUIB8fcEGl0k9LHJOJzqOeMjctjKQ
	wn5KFVmAEyAxfR+zn36VSVXuCHvbvgShRrbB6PNAi5RRCyVe8ukugpKeZ3SDe2+aCoyJ
	0SzEk4LMfaMiiWtRnpdODfDwIHImoquYaJfazIklnuZ080udo7AGwnBHhQB73xViTXWV
	EtAJexQuNg2r79/RdWkvJ3KDLNBmjj5XzXecRHFT07fGj6JFJv1Bitd3BOTIGNTDj+3e
	q29BvpfvgUTFsSOycaz88mA2de8G9aslrCBHUaepgS3gkXtj9fSX7XEgfhVYvTxRcb/B
	CtIw==
MIME-Version: 1.0
X-Received: by 10.220.164.80 with SMTP id d16mr2231085vcy.15.1393355160658;
	Tue, 25 Feb 2014 11:06:00 -0800 (PST)
Received: by 10.52.35.170 with HTTP; Tue, 25 Feb 2014 11:06:00 -0800 (PST)
In-Reply-To: <20140225172747.GR26981@jama>
References: <1393348614-15618-1-git-send-email-schnitzeltony@googlemail.com>
	<1393348614-15618-2-git-send-email-schnitzeltony@googlemail.com>
	<20140225172747.GR26981@jama>
Date: Tue, 25 Feb 2014 20:06:00 +0100
Message-ID: <CALbNGRSk-Cbv8nyEhUANsJ+ib2U7xfTDqTYogVoohFb=17WB5Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-qt5][jansa/qt5-5.2.1] qtbase.inc: set virtual/mesa and virtual/egl as dependency in PACKAGECONFIG[kms]
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
X-List-Received-Date: Tue, 25 Feb 2014 19:06:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2014 at 6:27 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Feb 25, 2014 at 06:16:54PM +0100, Andreas M=C3=BCller wrote:
>> * there is no kms around
>> * mesa is the default implementation for (lib)gbm (see config.tests/qpa/=
kms)
>> * in configure we find:
>>   | if [ "$CFG_KMS" =3D "yes" ]; then
>>   |     if [ "$CFG_EGL" =3D "no" ]; then
>>   |         echo "The KMS plugin requires EGL support and cannot be buil=
t"
>>   |         exit 101
>>   |     fi
>>   | fi
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  recipes-qt/qt5/qtbase.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
>> index 116c86f..6c6ec5a 100644
>> --- a/recipes-qt/qt5/qtbase.inc
>> +++ b/recipes-qt/qt5/qtbase.inc
>> @@ -108,7 +108,7 @@ PACKAGECONFIG[gtkstyle] =3D "-gtkstyle,-no-gtkstyle,=
gtk+"
>>  PACKAGECONFIG[directfb] =3D "-directfb,-no-directfb,directfb"
>>  PACKAGECONFIG[linuxfb] =3D "-linuxfb,-no-linuxfb"
>>  PACKAGECONFIG[mitshm] =3D "-mitshm,-no-mitshm,mitshm"
>> -PACKAGECONFIG[kms] =3D "-kms,-no-kms,kms"
>> +PACKAGECONFIG[kms] =3D "-kms,-no-kms,virtual/mesa virtual/egl"
>
> Maybe we should introduce some virtual/gbm later, but I'm ok with
> virtual/mesa until we have it.
virtual/mesa has different meanings gbm / wayland-egl - it took me a
while to get mesa-free...
>
> Also there is no virtual/mesa in oe-core/dylan, but I guess that there
> is minimum user with dylan who also want kms.
>
> BTW: jansa/qt5-5.2.1 branch was already merged to master, so I plan to
> apply this only for master (jansa/qt5-5.2.1 is dead-end).
I missed that - thanks

Andreas

