Return-Path: <abrestic@google.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id ACF41798CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 23:56:06 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id h26-v6so6189267otl.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 16:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=waymo.com; s=google;
	h=mime-version:reply-to:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=mkIBNN9AtCqX4WtGAJdGU8uZfMCpSs65+tYhyfn70ek=;
	b=IGfWDqrOXA4iB2sjFkjmX39ezD/RdKc7L58RpU+ScaIKIHA/VokquBbI5ACff4LvBb
	qC5DTXo7pLREqpWTzjifx3DzXT2lVAHJfnVFtfiA/XBD/kRL2yxXrnWND1+RY6RjvgQl
	k529Ur9oy7UsDteyv3Q6Z34rII9sbb1iXJxvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=mkIBNN9AtCqX4WtGAJdGU8uZfMCpSs65+tYhyfn70ek=;
	b=lXOOSv1nxPqr5NP8uw1IdzIVHrQ7L++u0NCiX1+Wh2X4O0sh/YEYVUXP7LodgYHECO
	eg9rif5LQ9ieBFOpkSfS8xi5C8uKzYIvvXDgqW57HG2X9K8GvAWbARKALIiy6xDxBaLA
	skcCTjwnqtp33y+yppE1Ct6iQw64TbjxSv0d/TXC3SfLjR8vUAovwlwPeCeonU5o02MD
	JUR5v9Se6TzHNgCBUGZnim7RCoWYnX1PPfQH3RIKPUi984O/Gz2QQvW2X6Kz5/u2695A
	7TobehMwAjZ4ebR6emXA1aOxl7JjUjliX6E8H2rh0OduLdRXFwg5Wn/UBsZu+yo2Bvvk
	7BNQ==
X-Gm-Message-State: APzg51BITz8YnyY7Jb4rxPkX+WrIK53eSS71ocSz6Um2xdKhy7R8sOKr
	sFYpGv4lydxF+ZL2AHoeYnF9gMv2z0qp6csVe7Ut
X-Google-Smtp-Source: ANB0VdauzxhM0gs8YEM+mncx+k6Lv+O19x0WlPBpTRc1YBCsESiHy8a6B65r3UZNa29uuTPt0H9affNjrQbKpSBMZrI=
X-Received: by 2002:a9d:48a8:: with SMTP id
	d37-v6mr6361255otf.316.1536969367194; 
	Fri, 14 Sep 2018 16:56:07 -0700 (PDT)
MIME-Version: 1.0
Reply-To: abrestic@waymo.com
Received: by 2002:ac9:79c7:0:0:0:0:0 with HTTP; Fri, 14 Sep 2018 16:56:06
	-0700 (PDT)
In-Reply-To: <58f99cfa-3da7-b4de-b068-a21655ad0870@windriver.com>
References: <20180912212255.194513-1-abrestic@waymo.com>
	<2a92e298-73d6-a5b2-4cc9-88cb6e32d1be@windriver.com>
	<CAL1qeaHu+AZwF0GgBQ7a=AqRBieuZ0m-ZuxNg57c-L1s+xjEyg@mail.gmail.com>
	<58f99cfa-3da7-b4de-b068-a21655ad0870@windriver.com>
From: Andrew Bresticker <abrestic@waymo.com>
Date: Fri, 14 Sep 2018 16:56:06 -0700
Message-ID: <CAL1qeaExxb1gU2y7mmdg8OsGGHNzxY9Pw1tdpy4zARd2XDj=Sw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libdevmapper: Install dmsetup
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
X-List-Received-Date: Fri, 14 Sep 2018 23:56:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 13, 2018 at 6:50 PM, Hongxu Jia <hongxu.jia@windriver.com> wrot=
e:
> On 2018=E5=B9=B409=E6=9C=8814=E6=97=A5 00:22, Andrew Bresticker wrote:
>>
>> Hi,
>>
>> On Thu, Sep 13, 2018 at 8:22 AM, Hongxu Jia <hongxu.jia@windriver.com>
>> wrote:
>>>
>>> On 2018=E5=B9=B409=E6=9C=8813=E6=97=A5 05:22, Andrew Bresticker wrote:
>>>
>>> Commit 6aa1dd223a140 ("lvm2/libdevmapper: fix invoking lvcreate failed"=
)
>>> accidentally removed installation of dmsetup as part of the libdevmappe=
r
>>> recipe. Add it back by explicitly installing it in do_install().
>>>
>>>
>>> Why? I am afraid your fix will cause `invoking lvcreate failed'
>>
>> Because presently users have no way to install the 'dmsetup' binary.
>> Commit 7f17da154372 ("lvm2: separate libdevmapper to avoid circular
>> dependency") moved installation of dmsetup from lvm2 to the
>> libdevmapper package, and then your commit removes installation of
>> dmsetup entirely (and in fact adds a patch to explicitly disable
>> installation of it as part of the lvm2 package).
>>
>> It looks like the cause of the 'invoking lvcreate failed' issue was a
>> mismatch in EXTRA_OECONF/PACKAGECONFIG between lvm2 and libdevmapper,
>> which was fixed in your patch. The installation of an unrelated binary
>> (dmsetup) doesn't undo that.
>
>
> Would you do the following test with this fix? If lvcreate works
> well, the patch is fine to me.

Yes, lvcreate still works just fine:

# lvm pvcreate /dev/sdf1
  Physical volume "/dev/sdf1" successfully created.
# lvm vgcreate -s 4096K wrl /dev/sdf1
  Volume group "wrl" successfully created
# lvm lvcreate -n swap -L 300M -y --type linear wrl
  Logical volume "swap" created.

But I misspoke before -- your patch actually moved installation of
dmsetup back to lvm2 from libdevmapper. So my patch results in dmsetup
getting installed in two different packages, which is obviously no
good. I think we do want to move it back to libdevmapper, though, per
commit 269d009a81d4 ("lvm2: libdevicemapper package needs udev rules
and dmsetup"). Patch v2 incoming...

Thanks,
Andrew

>
> //Hongxu
>
>
>> Thanks,
>> Andrew
>>
>>> Here is the original log of `Commit 6aa1dd223a140',
>>> I quess the `---' cuased the log truncate in git
>>>
>>> Previously, libdevmapper is separated from lvm2 in the following commit=
:
>>> ---
>>> commit 7f17da154372b5ec33947766783444961e8aa67c
>>> Author: Chen Qi <Qi.Chen@windriver.com>
>>> Date:   Mon Apr 24 16:06:41 2017 +0800
>>>
>>>      lvm2: separate libdevmapper to avoid circular dependency
>>> ---
>>>
>>> It caused invoking lvcreate failed:
>>> ---
>>> root@qemux86-64:~# lvm pvcreate /dev/sda
>>>    Physical volume "/dev/sda" successfully created.
>>> root@qemux86-64:~# lvm vgcreate -s 4096K wrl /dev/sda
>>>    Volume group "wrl" successfully created
>>> root@qemux86-64:~# lvm lvcreate -n swap -L 2293648K -y --type linear wr=
l
>>>    Rounding up size to full physical extent 2.19 GiB
>>>    /dev/wrl/swap: not found: device not cleared
>>>    Aborting. Failed to wipe start of new LV.
>>> ---
>>>
>>> The lvm2 and libdevmapper should use the same PACKAGECONFIG
>>> and EXTRA_OECONF.
>>>
>>> And do not manually remove useless files.
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>
>>> //Hongxu
>>>
>>>
>>>
>>> Signed-off-by: Andrew Bresticker <abrestic@waymo.com>
>>> ---
>>>   meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
>>> b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
>>> index f3f11ef64..26af3275d 100644
>>> --- a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
>>> +++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
>>> @@ -9,6 +9,7 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
>>>
>>>   do_install() {
>>>       oe_runmake 'DESTDIR=3D${D}' -C libdm install
>>> +    oe_runmake 'DESTDIR=3D${D}' -C tools install_device-mapper
>>>   }
>>>
>>>   RRECOMMENDS_${PN}_append_class-target =3D " lvm2-udevrules"
>>>
>>>
>

