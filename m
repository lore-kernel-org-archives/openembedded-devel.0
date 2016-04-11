Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA9C601D4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 11:09:23 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id a6so13832946vkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 04:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-transfer-encoding;
	bh=w8nbtEaVPCHXuHvN1kLhyn8/SB4WvnZaY3eqI1OP66U=;
	b=vdiv048DmCY/dVg82V9OaI6uwAkjFxd9Sv16DdvOtQy9UV+F56gFK2BLXRqpG2e1z4
	Q4JAhxDzvEuHrSuvFZTqlx/fzTyHEs8IA6XBvGH1GeMFRl+mwbtZoWWEuCClyPlf1JYI
	fUG9DWOaTJmlDvdtmRd1oOCEJM1FeC4nAF0DKUwu6Wa7VxlRgnxhfyZ492vax40I4Owm
	b160e/LkekRHEw89/d0YZ6DUKORyL0VXMIv163xU0SVf3vPo2orP3o/hNGosa1qkc4CM
	ZEYXjJCem273kKRUPJVStpwWRZee4Df0mMZSClV5itgw4RltBvtKk8BGck5BW0s40A9f
	NSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-transfer-encoding;
	bh=w8nbtEaVPCHXuHvN1kLhyn8/SB4WvnZaY3eqI1OP66U=;
	b=Wz7W8emghhlc/uUEM7JDiNKdZgodPVQ3I7B+raJKOJCbl6o8f+bzOwJucM1GDlDCPU
	beaJgUxWV1QOdRk/esRwC0RN4H3ZE6MlFyrRVYB9aU/18xAJQlAup7Oe81qvplnWA2MX
	0JpuyQaryNhHldy+P6HmZ5EXqC8owaONJQTJ6OJtlWS+3wUsXxjT3U3Cex5TK3WG3hn3
	sLGzCctqYi9Hs9L2JvpvEbvqjVKeCXFHT2mUAFMsBc545WMXZ8keln3kegmoo84SItD5
	zbFyr4LZFbKvTw9rA19Kt9x6zaxlkjJyi5fGhia689HboQa3FagPjFdn/pALRkOELRhG
	l3qg==
X-Gm-Message-State: AD7BkJIl9uRrHIBhGX/pbAYbh60Vqr2Xmk3VQIEsnBkVQ2tTN81L+XgGevwopmilUkcY7a1OW1SKR6kprCS+6w==
MIME-Version: 1.0
X-Received: by 10.159.34.71 with SMTP id 65mr11100452uad.103.1460372963858;
	Mon, 11 Apr 2016 04:09:23 -0700 (PDT)
Received: by 10.159.35.65 with HTTP; Mon, 11 Apr 2016 04:09:23 -0700 (PDT)
In-Reply-To: <570B3E08.1070908@theqtcompany.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
	<1460317290-4787-32-git-send-email-schnitzeltony@googlemail.com>
	<570B3E08.1070908@theqtcompany.com>
Date: Mon, 11 Apr 2016 13:09:23 +0200
Message-ID: <CALbNGRQfDnvkO4UT69fF9nPRQzf9L3Z2xZ7LkhCgGX+kDgk4uw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2 31/31] qtquickcontrols2: initial add 5.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Apr 2016 11:09:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2016 at 8:02 AM, Samuli Piippo
<samuli.piippo@theqtcompany.com> wrote:
> On 10.04.2016 22:41, Andreas M=C3=BCller wrote:
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>   recipes-qt/qt5/qtquickcontrols2_git.bb | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>   create mode 100644 recipes-qt/qt5/qtquickcontrols2_git.bb
>>
>> diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb
>> b/recipes-qt/qt5/qtquickcontrols2_git.bb
>> new file mode 100644
>> index 0000000..41c781e
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
>> @@ -0,0 +1,15 @@
>> +require qt5.inc
>> +require qt5-git.inc
>> +
>> +LICENSE =3D "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
>> +LIC_FILES_CHKSUM =3D " \
>> +    file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>> +    file://LICENSE.LGPLv3;md5=3D8ba7f2099d17d636d5fcc8303bb17587 \
>> +    file://LICENSE.GPLv3;md5=3D40f9bf30e783ddc201497165dfb32afb \
>> +"
>> +
>> +DEPENDS +=3D "qtdeclarative"
>> +
>> +FILES_${PN}-qmlplugins +=3D "${libdir}/qt5/qml/Qt"
>
>
> all /designer/ files should go the ${PN}-designer package, since they are
> not needed in the target.
> Should be added by including one more level of subfolders in qt5.inc
>
>> +
>> +SRCREV =3D "7fc567eda8a187e365f4c29c6e8f08440bf31218"
>>
> --
I checked the image of qtquickcontrols2 for files matching your
comment but can't find any. What files do you mean?

Andreas

