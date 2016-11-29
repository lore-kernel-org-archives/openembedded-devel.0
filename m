Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3F32D719E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:14:35 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id n21so181436657qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=dzpretQFG70BkYBuBS3Wr7vX49QuZl2wTQTXWJmOyZk=;
	b=qRmECSA8a1NrZqNQKclG7fHdnhY8QWhvkpa508mO2eSsPRTQRBGJ7n/z4seIVB/0xR
	AXyqNLP/0L/WESz4aygjxZpgkaZAjJRdbGYwc/w8iSNIOqB1nVY/6jOTMoCsiGvSyC7s
	4ZMf51Ot/xrD6IAgt5a/CK6yEU5yebCwhdeFoFn5G6vkeYIvGgS9KiOB+xsjxkzQvhWu
	V/5ktS5cKsrXAiChtyMt34ubf4HHW59Hgu5JLSd/23u+agT22OxegahuM5ljg03PN/Il
	VIWQWLTEkcrYl6YfYoVTumfcJdGcVLEG9N1P0l4QSaRP2Ixk9TdHpT/d6RuodG5LyURa
	hlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=dzpretQFG70BkYBuBS3Wr7vX49QuZl2wTQTXWJmOyZk=;
	b=VmciOHCHTuqyAl9aFIltwcWj0VIHVCI+WRxZizQBgnDEks4d68PeLuxiEyIPZfSjKI
	wskxkzP4uDQ3Z0pHVwuqAk0tBW/69izKLwURMb7rXeGKkO+bILV26FbpSmpHFaeQ/4lu
	5ZIhevgf8stWWtvtJlj+iOKWkk47qK9ABuUz3n2jcJW/imirsWTXxnbGAFcPtn9L0ZsD
	PmPHkesX+m8Bb2akp4+lo0TtbgwrfvKsy0I6pasajPVQlAZVI3OOQjtmx6hixMvefuUR
	x/K5HHe47bgWp23sgV0pJq3vLSNj0Dr0x3JWL131j4usbpEkfXWIzdTev7S3+g/HjGY8
	Kd5A==
X-Gm-Message-State: AKaTC00zGcz/jB6Bq0DWi4aeAbt1U4ro36OrsoFuj9aedmcFyOTZ+0SXn0HSquoB1gixukMUUR8yE3D3LllMgrJ7
X-Received: by 10.55.5.145 with SMTP id 139mr25035479qkf.77.1480439676832;
	Tue, 29 Nov 2016 09:14:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 29 Nov 2016 09:14:15 -0800 (PST)
In-Reply-To: <o1jct4$pvp$1@blaine.gmane.org>
References: <20161128225759.9756-1-raj.khem@gmail.com>
	<CAJTo0LZ+2+MhZ4TepH1dDzC3LyG7gz70TNEzoDjXgaBTjvHOsg@mail.gmail.com>
	<o1jct4$pvp$1@blaine.gmane.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Nov 2016 17:14:15 +0000
Message-ID: <CAJTo0LYLgFFR+6d3SDkso6X28N00tVAnUGuJg4sPG-msMKWU6A@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Tue, 29 Nov 2016 17:14:36 -0000
Content-Type: text/plain; charset=UTF-8

On 29 November 2016 at 08:06, Koen Kooi <koen@dominion.thruhere.net> wrote:

> If libva goes in, can we get libva-intel-driver in as well? Those go
> hand-in-glove currently.
>

Khem, does the AMD BSP use that?  I'd have thought that bit was actually
meta-intel specific.

Ross

