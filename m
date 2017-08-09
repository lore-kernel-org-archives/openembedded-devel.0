Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4796071B48
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 02:43:28 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id k20so10549482wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 19:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1aKh6zDCTs1TrEywWe5uU+bkG4duePns9b2XTXM2uwc=;
	b=NuetBuLhwHqz2HcpW8Bya/KtN/3F7WupE7K9mUeqfD582HnnbwyIQJIdpSvFiGFvUd
	yy7QJjff7XD6h0svxLtgJ5Ao7z8lzzzJE1g20jZTOMtv5HCod28pGUcZegRG4t3wYkqE
	QqpPxT/hheYBbxOK63XgEcqPXBJhvsNOre3XRt2DxAKyzQZ6UFz8zSbSyU9ls/fd5bQ/
	poYC5ovMEAIJvpeYXKk+9mOCFnyzVdnozocOXqexRxdEy0TzxRq69Jvq3/ui6jjpC4yX
	oSrr43GKPR5Nm+ABW8sRkfCaXStqmPO5eLG7JRcJInchAcdB8fliaVxV+PlelH3FRVSj
	2grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1aKh6zDCTs1TrEywWe5uU+bkG4duePns9b2XTXM2uwc=;
	b=PAyMwl8929UX/9IQ/mzOMaDqYt3HYRW1heSN54mznK+F001g8vYgFO+aJIyUleoeyT
	oyt6gw02nfHlbkNq0y9At0f6ms/O6KjpfXPYmzBFd1tU6KmaWoZ1uy2Ywyr7t3qQgFp2
	5s+ZjqUMxBVBStWWOKhQN68r+4AKZsj3tkAoMgPSdtVyXay/15Vgiiq8As0Md6as4LRi
	Q0jIVngZ66KvR3Rh+PHXJCMOcFrSGo2BjQdKxMQyd6V7jGbRZuNpWKNWgn/LDbk6ToyZ
	5PlGl3+sQfWUTHqz00RQ0Zyzqp8q/Ib3Y00/YS5RpVt19BauW08v7Ae3pYTN33rMrTZC
	0z3Q==
X-Gm-Message-State: AHYfb5hAUl1NrgBqe8Spys+czebs3C4w5QPWF9eWj6KD1b5EAZqR9AQZ
	Sy0nFPBn1970vo6D+daGQFNUKjSxDA==
X-Received: by 10.80.142.68 with SMTP id 4mr6719016edx.186.1502246610011; Tue,
	08 Aug 2017 19:43:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Tue, 8 Aug 2017 19:42:59 -0700 (PDT)
In-Reply-To: <CALbNGRQQHqg-qWOxJim5Do08VSUCt_F8kSA-75LXeDx=SoDbqA@mail.gmail.com>
References: <20170801170152.94586-1-Randy.MacLeod@windriver.com>
	<olqm6a$87a$1@blaine.gmane.org>
	<4aaa2c14-284f-71b4-47d2-fc7e8e27beef@windriver.com>
	<BFE10A87-CF18-46BA-88E4-A795FB20506E@dominion.thruhere.net>
	<f3b1d5bc-6d6f-4fdd-8076-5d856af4b8cf@windriver.com>
	<CAMKF1srRkN_vfF5HkMQy4YM5aa8bUCC+HOX0zALdbweUeT8dCQ@mail.gmail.com>
	<9ec26f7f-f87b-b470-ee15-459ac5712bfd@windriver.com>
	<CALbNGRQQHqg-qWOxJim5Do08VSUCt_F8kSA-75LXeDx=SoDbqA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Aug 2017 19:42:59 -0700
Message-ID: <CAMKF1spVbt=sEkrkrJbPjLJ=SRC7zAkPKy4A9xUK1OR=90pOMQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] imagemagick: upgrade from 7.0.5 to 7.0.6p4
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
X-List-Received-Date: Wed, 09 Aug 2017 02:43:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 8, 2017 at 7:28 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Aug 9, 2017 at 4:02 AM, Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>> On 2017-08-08 08:42 PM, Khem Raj wrote:
>>>
>>> I am seeing
>>>
>>> downloads
>>> 'http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4.tar.x=
z'
>>> --progress=3Ddot -v failed with exit code 8, output:
>>> --2017-08-08 15:05:59--
>>> http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4.tar.xz
>>> Resolving www.imagemagick.org... 198.72.81.86
>>> Connecting to www.imagemagick.org|198.72.81.86|:80... connected.
>>> HTTP request sent, awaiting response... 404 Not Found
>>> 2017-08-08 15:05:59 ERROR 404: Not Found.
>>>
>>>
>>> ERROR: imagemagick-7.0.6-r0 do_fetch: Fetcher failure for URL:
>>> 'http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4.tar.x=
z'.
>>> Unable to fetch URL from any source.
>>> ERROR: imagemagick-7.0.6-r0 do_fetch: Function failed: base_do_fetch
>>> ERROR: Logfile of failure stored in:
>>>
>>> /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/imag=
emagick/7.0.6-r0/temp/log.do_fetch.17282
>>
>>
>> Ugh, the imagemagick devs have moved on to:
>>  http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-5.tar.gz
>>
>> and deleted the 7.0.6-4 tarball already!
>> I'll send a patch in the morning and also talk to upstream about their
>> archiving policy. I don't see a directory for that at the moment.
>>
>> Thanks for the heads up.
>>
>> ../Randy
>>
> Yes and they will do it again until 7-0.7.x comes up :(

I think we should copy the tarballs to source.openembedded.org before
accepting imagemagick updates.

>
> Andreas

