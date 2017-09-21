Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 958AE77FDE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 19:44:30 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id p37so3643444wrb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 12:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BTfpjDtMDC+cTc8SUPSHtni1gOQN7cFbeDA9jzMZoA0=;
	b=dRGtMi4Qi3z5GrZ8PL7RpY2djLzCop+2zSYDqP0SKYXVz1leE3R1mgUkhne6PYh98V
	V9I1jm1dqXKPMV7d8NxPy2HnqWEvu7I1NVIwMQjSf/VS9/kKLv8Y7EzHG5hLwP2v9tef
	wOghdEVXib5yJpIztUFNh+GZo0WQEuo1AwZVJKB5HokOGuFqvS0YOyVwsj8T7v9Qzkca
	X/ZnQSWCJI7IV7uH2sxb4WS9B7o6MJ7IwIoxhUve3/C+h+R+HCyzSaEsb9dioilsGBxn
	tqyi4l9nAl8W3H3SbzqwpHlJN1QuQ9FLb4qYZgPNc3ELZ0BMS7JpK7/a3INVA+e2IbKg
	YElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BTfpjDtMDC+cTc8SUPSHtni1gOQN7cFbeDA9jzMZoA0=;
	b=uCGQbWtrWCGp7qdd3kquKm0KWuM8ZmYBSItESzEhpRHSGSmqqDuyQqNlyryWUYtpp5
	d2q8wafuoHOyeyKid/7JC8QKfTR5i58PotSvfggiLTEfC116fwqy1w2MMLWw6xO80rS0
	l7AkO3XleSu1idtXLl3u39sVtbTHffce4ELVZYHbLXnySEMunKYiGBiqx/w64YmV/+L6
	/S1Bq8tJNrXbL7C3ZrfUYveZ1/TjpXnCw7P/okBIZVgV0hXynulhatZcv6pSbM7iIwFG
	yuYMTjPTR4oP0yA/hZhDFCcdFECqfSSoRNo42jDv4Hec0CyzZIikOrva8l2JHmQZsMGV
	8fYg==
X-Gm-Message-State: AHPjjUjRBGxAbdkaAvLbrB7bHR7qTvH1Osw3POeG6l06tmpFewrC8Kjm
	fzNB7ndsIZ27J/Z6AiapnCaCwrcBZ8G2IaWqbdw=
X-Google-Smtp-Source: AOwi7QCev2X6+QHOO+sLPxUh0wt1e1Y+FMcrQOBrUQAY7KiPXFABtm3DOCY0XxUVztyJ6yB+xUkyeOdRSA3lZv3+bKU=
X-Received: by 10.223.186.6 with SMTP id o6mr2610938wrg.263.1506023071331;
	Thu, 21 Sep 2017 12:44:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Thu, 21 Sep 2017 12:44:30 -0700 (PDT)
In-Reply-To: <CAMKF1sps70RNgvw+nRdp9uSh8Rx16Eisa+Jh5agVcXAH5ctPZw@mail.gmail.com>
References: <20170921064721.17250-1-kai.kang@windriver.com>
	<20170921064721.17250-2-kai.kang@windriver.com>
	<CAMKF1sps70RNgvw+nRdp9uSh8Rx16Eisa+Jh5agVcXAH5ctPZw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 21 Sep 2017 12:44:30 -0700
Message-ID: <CAJ86T=UAo6ejGQDQ9WDbRdyDcO7ATcFV9sja4MFW0v0yGugN7w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/1] lvm2: disable thin provisioning support if GPLv3 incompatible
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
X-List-Received-Date: Thu, 21 Sep 2017 19:44:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 21, 2017 at 7:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Sep 20, 2017 at 11:47 PM,  <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Disable thin provisioning support for lvm2 if it is set GPLv3
>> incompatible.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
>> index ab8db9cba..9791554a9 100644
>> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
>> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
>> @@ -23,7 +23,7 @@ inherit autotools-brokensep pkgconfig systemd
>>  LVM2_PACKAGECONFIG = "dmeventd lvmetad"
>>  LVM2_PACKAGECONFIG_append_class-target = " \
>>      ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
>> -    thin-provisioning-tools \
>> +    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'thin-provisioning-tools', d)} \
>>      udev \
>>  "
> there are other strings like GPL-3.0, as well as other types of GPL 3
> derivative licenses, I wonder if this will work for all

Perhaps something like:

  ${@incompatible_license_contains('GPLv3', '', 'thin-provisioning-tools', d)}

would work more reliably?

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

