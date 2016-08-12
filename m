Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0E58173259
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 06:37:41 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so1117467wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 23:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=+SGDiRDMM6RvOUIGd8e4SnGP0DhZsx1ZpdoFaH/37rY=;
	b=W5wQj4ze2d9QGuRbh0GZiyzEeQ5Tp+um/xi5Lbrb2XYRQoJR+3wQjC/W8K2qowSPS1
	87otSpz3DKyI3jN8bENp6rasYyJkbSzNaZSCmNrFdDvUeHnO1xHFhQGKHFrO9YF6uwV1
	U2kmrLE3OzH7gX+THvZlH4sySxNaH87I72iytPLRE5P172UYfFJ3mF/RyoSVoEb2pD3c
	R+rCi3ihhnLgTdvpzfjA9H25I5LwQ7bnIOSeNZkQWM1iDN5rWpD/8JKYHB2qq41FLITb
	lAkM9IZhGbN3G6798Gf+aZd+AT2OhVg1gAKiYgE3AfFakKMvuBYcRJLnvhRAFJrgRrmG
	vMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=+SGDiRDMM6RvOUIGd8e4SnGP0DhZsx1ZpdoFaH/37rY=;
	b=FRTlEneQe2/iF6gAbRVYQwodyqAVVsXxKywUAZQ2G6/yVERX+fb5EfBLqDgM6KWxko
	hY/s7Kn1PjmAHruIGxrUQFnyvB7Q+UZJZspr0kKrVkkcrEf9hkp8bM4n02zITAaNwGlS
	o1SmcC96Fp/MCNy0h3bzJ6XVWv7WHaCIO9UJqJ8LK7OpZK1GZ9O9lP/LWCsSo3u2cA82
	aTTh4jBXjFlLoOtj425wITPu3AwbQO1TTYYZmTyYQLj87wx4L8JmWm3lZXCEhhJgNz/A
	0aXbKFMF9UgkoGxcs5xV4CGcFlqhVGat8Os0I2mac5h1muqxRlayS3bwv9NiNs8LbqVz
	8cUw==
X-Gm-Message-State: AEkoousVUESzL3FvPzC4hDEno+yGpIUJEHoIqzqqdfY/gpRcWgkZdQCKj3vMfiL56yLjv9h1zM+rHGT6s1g9jA==
X-Received: by 10.28.37.71 with SMTP id l68mr1313663wml.50.1470983862110; Thu,
	11 Aug 2016 23:37:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.139.148 with HTTP; Thu, 11 Aug 2016 23:37:21 -0700 (PDT)
In-Reply-To: <D01FFBA5-7B48-4F0F-B1E0-3D96FE48044F@gmail.com>
References: <1470920876-22501-1-git-send-email-ricardo.ribalda@gmail.com>
	<D01FFBA5-7B48-4F0F-B1E0-3D96FE48044F@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 12 Aug 2016 08:37:21 +0200
Message-ID: <CAPybu_35+Ug0CpasvpVg=WfC2N3F_6hmcSbN7CJ7tquhGr7C8A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3 1/2] gflags: New recipe
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
X-List-Received-Date: Fri, 12 Aug 2016 06:37:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Khem

On Fri, Aug 12, 2016 at 7:36 AM, Khem Raj <raj.khem@gmail.com> wrote:

>> +DESCRIPTION =3D "The gflags package contains a C++ library that impleme=
nts commandline flags processing. It includes built-in support for standard=
 types such as string and the ability to define flags in the source file in=
 which they are used"
>> +HOMEPAGE =3D "https://github.com/gflags/gflags"
>> +LICENSE =3D =E2=80=9CBSD"
>
> which Clause ?

I have no idea,
I has the same License file as glog:

https://github.com/gflags/gflags/blob/master/COPYING.txt
https://github.com/google/glog/blob/master/COPYING

That is why I choose BSD.

Regards!

