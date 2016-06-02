Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 50745773A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:08:31 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a20so2826419wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2016 03:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=edPicQYOHBYldL5MBEK2xvdmIkD6RJOlEDwZ72jmUXM=;
	b=HEiIIQiAyLG/BRaBQcpIPcnxBqvHb1lIzTgoqvuBhvooppGo7r8trwuTKG2G3xddrY
	r+oFrsqZ5tdTKqsNEQ9lyjAJDZz7kW0ZG1ar4vuCEj0T/nnNK1TQ+hz+FVibZhb1Ei74
	6bqej5dQsMbDzFDm8IJMt2YrnQ4F4Z0rPQ5MbCJreu4NG71EE656H/GWyOUG+el3nwPv
	T09q9ODOSCOaucZAJI7Ipj+wTHUp4HISEGy+XOmxQiHa68d8QbtXQ0e6zgkRVUO+7fbr
	jrPNPWJtPH0JKpangAa2hJNEa6SvtgwFzMq4teMUhiexQLP3fP+wemtIfYze0ZVUyPeg
	RyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=edPicQYOHBYldL5MBEK2xvdmIkD6RJOlEDwZ72jmUXM=;
	b=WDlPRMqvG8WBXkw2v1Z4+8f/x584qRV+WpnAKp1WoXck9FCT5Q3nD1v7Lg/E0W+4W8
	nBQQRbkZEAgD9ZjcrGaYUZaexGyOz8+hckAHx0PcIEOeLukmpVctoFWNSGwnF+64RlpB
	RlT3WeJ4pPdy1QcG1L/lQy+ivNbfaF23ayZL0euKckoieGyQ5usgoxqdhBcgjXLMRUm+
	/Rx2aPB8T8KmyXKgo92FasoOvbZSvDbHbkCYuj64Dr3UbqEPbp4CKwuaV8T9E1it6yCD
	A50emsScpha2PL2+ToKwu+01Cojvv0DfVYFrd8PQ/Je/nn8oNtUR+P6haDLzTJytFi04
	8mlQ==
X-Gm-Message-State: ALyK8tKNm95OgCtWz3Q+7/CsF1BtBTJo+/UCAOPWigoDupope32W/Rj6PDiX50heru3KhpIlEHefkCP4K80XLQ==
X-Received: by 10.194.18.141 with SMTP id w13mr8834899wjd.32.1464862112413;
	Thu, 02 Jun 2016 03:08:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.88.84 with HTTP; Thu, 2 Jun 2016 03:08:12 -0700 (PDT)
In-Reply-To: <CAP9ODKp+wY9AVGxgS7HfKwgGmrKXadOmLYzL5R104-N5MNu7xg@mail.gmail.com>
References: <1464786802-11176-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAP9ODKp+wY9AVGxgS7HfKwgGmrKXadOmLYzL5R104-N5MNu7xg@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 2 Jun 2016 12:08:12 +0200
Message-ID: <CAPybu_1SQ0Gw36wB8fiisLZ_zmo0B3gWF85T2M2t2i-X7oe3dg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] opencv: Reorder PACKAGES variable
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
X-List-Received-Date: Thu, 02 Jun 2016 10:08:33 -0000
Content-Type: text/plain; charset=UTF-8

Shall i send a v2 with the empty line?


Thanks!

On Wed, Jun 1, 2016 at 3:44 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Wed, Jun 1, 2016 at 10:13 AM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>> PACKAGES content order is important, because it determines the
>> destination of the files, when the folders overlaps.
>>
>> Without this patch:
>>
>> NOTE: Executing RunQueue Tasks
>> ERROR: QA Issue: non debug package contains .debug directory:
>> opencv-apps path
>> packages-split/opencv-apps/usr/share/OpenCV/java/.debug/libopencv_java310.so
>> [debug-files]
>> WARNING: QA Issue: opencv-apps: found library in wrong location:
>> /usr/share/OpenCV/java/libopencv_java310.so
>> opencv-apps: found library in wrong location:
>> /usr/share/OpenCV/java/.debug/libopencv_java310.so [libdir]
>> ERROR: QA run found fatal errors. Please consider fixing them.
>> ERROR: Function failed: do_package_qa
>>
>> Fixes: 3132af1d1d15 ("opencv: Fix metapkg dependencies for opencv-java ... ")
>
> Empty line here, please.
>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Ricardo Ribalda

