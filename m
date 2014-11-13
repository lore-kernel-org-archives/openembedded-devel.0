Return-Path: <cavallini.koan@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7966560167
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 16:06:32 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id r20so8797553wiv.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 08:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5DFpmdmu0McRERZ/y6/FDjLLeE/fBwEJAfeyhGx+DZM=;
	b=hQ6qu5NQ7Gm2LdvTYJuY2kSKsr2mfwFVajNmEMdHFqppowsWgNdJI2VyO59CVdAwUN
	H8tQ+1fta+X5iNWN/yerd59B6wDTEYCwSX7KxlO+WRSalZJcjrbKq3lIYvo6r5Nvs7qp
	gt937E5KG3Dm5yBEMIzK7TVrAKQ4UxCBVyuK6MfzuKmtSSHv9vKaG1HzJ/uZeSI/Q+s6
	KicvOf50gspOdSeI3OavUrGj2rlNbX0wG7oNQ0LsIJcRWwEDk4x/y6rs1v4IBTVXrAsB
	EVC7DvapV8+EhPvz6jwOWqzvaC+7EXiXzXTfFJEKB++FtfxHDA9Vx6PBHSXZfNV2UGZk
	r1eg==
MIME-Version: 1.0
X-Received: by 10.180.93.37 with SMTP id cr5mr5191847wib.76.1415894792132;
	Thu, 13 Nov 2014 08:06:32 -0800 (PST)
Received: by 10.194.184.72 with HTTP; Thu, 13 Nov 2014 08:06:32 -0800 (PST)
In-Reply-To: <CAF6djU_J9zY_7dPTSnyV4Sq+0+fxy8fhB6XJ3GCg1X79mQWMyQ@mail.gmail.com>
References: <CAFQ+Digyv4Ks8iQOdcPGOKJsRYW1woW0RsC0YXwzNi6YL+=fVg@mail.gmail.com>
	<CAFQ+DigkXjS0GLxi6Mk+C9VYUYsjx44QaiP4zrUR8xQ1oUM5CQ@mail.gmail.com>
	<CAF6djU_J9zY_7dPTSnyV4Sq+0+fxy8fhB6XJ3GCg1X79mQWMyQ@mail.gmail.com>
Date: Thu, 13 Nov 2014 17:06:32 +0100
Message-ID: <CAFQ+DijQSvJm_V=EvDVhMF0yqQCPO2BZ-CRUCz--91wB=-LhNg@mail.gmail.com>
From: Marco Cavallini <cavallini.koan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][daisy][BUG]
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
X-List-Received-Date: Thu, 13 Nov 2014 16:06:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi =E5=BD=A5=E7=91=BE
I needed to add the following line in
meta-fsl-arm/qt5-layer/recipes-qt/qtmultimedia_%.bbappend
 PACKAGECONFIG_append_mx6 =3D " gstreamer010"

Thank you very much

2014-11-13 14:41 GMT+01:00 =E5=BD=A5=E7=91=BE <coldnew.tw@gmail.com>:
> As I remember, meta-qt5's QtMultimedia add a patch to make work on
> gstreamer1.0 by default.
>
> You can disable it by setting the PACKAGECONFIG in your bbappend. (please
> look through qtmultimedia_xxx.bb)
>
> If you use default setup, you need to install gstreamer1.0.
>
> 2014-11-13 19:47 GMT+08:00 Marco Cavallini <cavallini.koan@gmail.com>:
>
>> Sorry there's a typo
>> I mean 'DAISY'
>>
>> 2014-11-13 12:45 GMT+01:00 Marco Cavallini <cavallini.koan@gmail.com>:
>> > Hello,
>> > I am using meta-qt5 dora.
>> > Everything looks ok except the multimedia extensions.
>> > I found a note about a bug in Qt5.2.1
>> >
>> > Bug info:
>> > console logs for any application trying to use audio features in
>> qt5-multimedia:
>> > defaultServiceProvider::requestService(): no service found for -
>> > "org.qt-project.qt.mediaplayer"
>> > Player error: The QMediaPlayer object does not have a valid service
>> >
>> > Link:
>> > https://bugs.archlinux.org/task/40068
>> >
>> > Description:
>> > It appears that libgstmediaplayer.so was accidently left out of the
>> > release for 5.2.1-3.
>> > his breaks any QT5 application that uses audio files.
>> > See https://bbs.archlinux.org/viewtopic.php?pid=3D1408020#p1408020
>> >
>> > Anybody knows what is the required patch?
>> >
>> > TIA
>> > --
>> > Marco Cavallini
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

