Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9FEB378283
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 12:02:25 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id k22so17839771iod.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 05:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FtA7nkWqkwv/ZPiXZ7B1SNZ8rMP4ZIlVhc3CLDVC8cE=;
	b=MaaSNMGz+2FMSFedWvMVQNDUbDDmawpEJ8R0Q5OrVs1cVbPGVjAvjIFpCLz7Q8khNY
	3XKfvk8hslFg3kCBXG5aZaQoOggwtNoOgZVQyUL5pvvpLnfOVs6p20ISo4hOYViMuMoX
	+8KRHqYIb73ZLKyEfjXW62yf0JH4r1etBvQCRTAag4skzgKUZNZGjB9eHQg0NqjoPdOf
	61y4wyTJu1f+R0FZ+5gcSYxUHGfFL6aCmT0TfqfnyV9Qyh9CKi/aFNkBp1TX0T4WCZ35
	fQTZjfDa468sGAxg7I0+fCiEU+f0uy8pperJcpg/ttIjRrRt6OqkgQBET1WEWO7iGmPI
	kq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FtA7nkWqkwv/ZPiXZ7B1SNZ8rMP4ZIlVhc3CLDVC8cE=;
	b=ApTbLp+/0KfLs5jGt6W53M2d1S3af8EcNBpX1nsgx/o26X8aGCVPF1mHxDfJU4or7h
	seV2/MOMLGkKJ7jsp4O+bemxd5bvIjQR5jdbJ+wS8VEvU1Z1+BtnAl4Kp5b4P82giUrk
	z2A16Q8w6lvErGq9x09khW7FUwVtsG+eHxdi6Yg9/y9mYpKdpT5X/9/HfbsYTPuwJ7KR
	0hBvKu0f4PVx6Zn1tjOq79Iye2DuGeLwX4Z/ypFdD3Ws6xs9n9EaNnSiT7JOyEafRSNu
	IbsYlj2YwUA8MO6xkc3APt2egBntMjwhY3JVL5dN3bIGXWkVP9BelAqgTfprUF9Vg1TY
	ItSQ==
X-Gm-Message-State: AHYfb5g/C9VKZAEU9O9rBSZFBnCa1la8ejPxH/keGUySTVat1ieOxeeD
	W7+Ku0/YnwEyMsSEk0QD2ruXHg8KvzKR
X-Received: by 10.36.23.80 with SMTP id 77mr3733030ith.70.1504008146859; Tue,
	29 Aug 2017 05:02:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.13.67 with HTTP; Tue, 29 Aug 2017 05:02:06 -0700 (PDT)
X-Originating-IP: [181.220.79.73]
In-Reply-To: <096b316f-2464-76db-0179-acb1bbd9c761@windriver.com>
References: <20170828181315.8179-1-fabio.berton@ossystems.com.br>
	<c51a31ee-0d0a-f2ba-8791-c6ac04e0d80f@windriver.com>
	<0d791125-a113-03a5-d1cd-61a54c4a2550@windriver.com>
	<f381675e-2355-f6dc-212d-5f62b7ce3392@windriver.com>
	<31444891-a355-0519-263e-6aa98e179eb2@windriver.com>
	<096b316f-2464-76db-0179-acb1bbd9c761@windriver.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 29 Aug 2017 09:02:06 -0300
Message-ID: <CAAPZna0iQcDy60ZqfAUTR4wXHiuZVyKQWHr3do2a+wKYPGTaZQ@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] iproute2: Move append to meta-networking layer
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
X-List-Received-Date: Tue, 29 Aug 2017 12:02:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I agree that is better move libmnl to oe-core, you can abandon this patch
and Yi Zhao patch.

On Mon, Aug 28, 2017 at 10:54 PM, Yi Zhao <yi.zhao@windriver.com> wrote:

>
>
> =E5=9C=A8 2017=E5=B9=B408=E6=9C=8829=E6=97=A5 09:48, Mark Hatle =E5=86=99=
=E9=81=93:
>
>> On 8/28/17 8:30 PM, Yi Zhao wrote:
>>
>>>
>>> =E5=9C=A8 2017=E5=B9=B408=E6=9C=8829=E6=97=A5 09:19, Mark Hatle =E5=86=
=99=E9=81=93:
>>>
>>>> On 8/28/17 8:07 PM, Mark Hatle wrote:
>>>>
>>>>> On 8/28/17 1:13 PM, Fabio Berton wrote:
>>>>>
>>>>>> meta-openembedded commit eb8994f44a080d9c7fd2c87b6b6935ad0a55eb27
>>>>>> added
>>>>>> iproute2 append to enable tipc PACKAGECONFIG that install libmnl
>>>>>> package. libmnl recipe is in meta-networking layer and this layer
>>>>>> needs to be added to bblayers.conf file to build libmnl. Move
>>>>>> iproute2 append to meta-networking to allow build iproute2 without a=
dd
>>>>>> meta-networking layer to bblayers.conf.
>>>>>>
>>>>> At first I thought this was the right answer.. but the more I look at
>>>>> this, the
>>>>> more issues I find.
>>>>>
>>>>> The iproute2 bbappend modifies the PACKAGECONFIG.  The modification o=
f
>>>>> the
>>>>> PACKAGECONFIG (other then adding new options) should not be done in a
>>>>> bbappend,
>>>>> otherwise it 'changes' the settings for that recipe.
>>>>>
>>>>> I'm thinking the right fix is actually to remove iproute2 bbappend.
>>>>> And any
>>>>> distributions or users who need tipc should enable it themselves
>>>>> within their
>>>>> distribution configuration files (and also include the meta-networkin=
g
>>>>> layer) as
>>>>> necessary.
>>>>>
>>>> Sorry to reply to my reply.. but
>>>>
>>>> Simply reverting this ends up with:
>>>>
>>>> ERROR: Nothing RPROVIDES 'iproute2-tipc' (but
>>>> /home/mhatle/git/lpd/master/layers/meta-openembedded/meta-ne
>>>> tworking/recipes-extended/tipcutils/tipcutils_git.bb
>>>> RDEPENDS on or otherwise requires it)
>>>>
>>>> So somehow tipcutils requirement needs to be based on the configuratio=
n
>>>> of
>>>> iproute2.  I'm not sure how to do this.
>>>>
>>> Hi Mark,
>>>
>>> The tipcutils 2.2 removed the tipc-config tool and recommended to use
>>> the new configuration tool named "tipc" in iproute2 package for
>>> configuring the tipc.
>>>
>> The problem still remains that the PACKAGECONFIG change violates the Yoc=
to
>> Project compliance check scripts requirement that PACKAGECONFIGs only be
>> set by
>> the original .bb or by a distribution configuration.
>>
>> I agree with the other comments that libmnl should be moved to oe-core
>> (if that
>> is still possible), but the PACKAGECONFIG piece is still a problem that
>> needs to
>> be resolved.
>>
>
> Once the libmnl is moved,  the iproute2 can build tipc directly and no
> need PACKAGECONFIG, we can remove it too.
>
> Yi
>
>
>
>> The tipc in iproute2 needs libmnl as dependency but it is in
>>> meta-networking layer now. so I add this bbappend because we can not
>>> enable tipc build in oe-core directly.
>>> Randy had pointed the best way is move libmnl to oe-core and enable tip=
c
>>> build in iproute2 by default.
>>>
>>> Yi
>>>
>>> --Mark
>>>>
>>>> --Mark
>>>>>
>>>>> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>>>>>> ---
>>>>>>    .../recipes-connectivity/iproute2/iproute2_%.bbappend
>>>>>>          | 0
>>>>>>    1 file changed, 0 insertions(+), 0 deletions(-)
>>>>>>    rename {meta-oe =3D> meta-networking}/recipes-conne
>>>>>> ctivity/iproute2/iproute2_%.bbappend (100%)
>>>>>>
>>>>>> diff --git a/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappe=
nd
>>>>>> b/meta-networking/recipes-connectivity/iproute2/iproute2_%.bbappend
>>>>>> similarity index 100%
>>>>>> rename from meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappen=
d
>>>>>> rename to meta-networking/recipes-connectivity/iproute2/iproute2_%.
>>>>>> bbappend
>>>>>>
>>>>>>
>>
>

