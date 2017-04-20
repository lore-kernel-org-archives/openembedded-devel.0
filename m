Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E9C906FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 16:40:43 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id m123so42658065wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uEL2BMtHLl/c6imVqy+R3ISPUSRCQQdGFm3ajY+7PwI=;
	b=ekx7lew6/UsTavjwFz18gCvJ4mnwC5PvtWE18o1chP4+Rn/9bvh1xdZJ2hhWGbFCOp
	n77JGstUGpqRoQjgPtfvTlvPFakQoMhxIo4i0HiluVG7HjF9Zu2Tq+P0SIcAtGEOkufd
	MeHN5TJCnyCOgNyagug5GQH9dKsTMC4uzieaPi/VznnJBVFVWWsJHV5goW3NSZu4/8/O
	VZIZwNVBnQIJtQn0ICwuKBkErt3PW/cEvW/O8F4NKAUIBatOSDZFxdTOeqDLRKaqgRn9
	EPA+lI6H5ZkXgOopF4C9AWAaSlA2DWkglNkELc6NEa36jhbfz+xaLiytnRdVnsJJpew1
	06pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uEL2BMtHLl/c6imVqy+R3ISPUSRCQQdGFm3ajY+7PwI=;
	b=U1f6+wx6vrTFmhNubhYf0nE6/nUEE4A6PxozmAsB4qdnfaB53cfdSN+b5fS3E1iXBL
	vmTXw0KbpUGO9cfqttEJpeqgbBetB0h69ivZJxd6Sz8JwnlOD4lLNLolQN8X4e1vWu18
	iGJFPF0KbEhtTnxdyogXGCT8b9Q/nGzimmGDIVPMMiQNsdkSUUhYKFzRWa4qEAUsQ/RV
	q5qeCWUMlARm0pQI5gJThFcabQ3WM3ZlCkpJwcDboqoUXMPTHSLE69P6A+tG635MVnCk
	0vI9sWeF6MtLeEaTW5BrdDLVRBIX1vwieI5sXXs3C+u9CT1RAxGgOH5pIIDY8YTlwdqH
	q4GQ==
X-Gm-Message-State: AN3rC/5o43/z+Ti5286zquG25TW6dyggViMeX6K5Q/FncOenLPQy7NaF
	a3K/dApWZzXdbB1JixMnVObckc2knQ==
X-Received: by 10.28.221.212 with SMTP id u203mr4004591wmg.101.1492706444462; 
	Thu, 20 Apr 2017 09:40:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Thu, 20 Apr 2017 09:40:13 -0700 (PDT)
In-Reply-To: <CA+chaQfS27T2RuU4Wj-zGd7msSOrpuxysTxys6mocPFy+tLW1w@mail.gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
	<20170418182142.27253-27-raj.khem@gmail.com>
	<CAMKF1sqP-mQDReWq=Ttt5+RHB01DHHjdDTPKhuk4tSRT=S4qSA@mail.gmail.com>
	<CA+chaQfS27T2RuU4Wj-zGd7msSOrpuxysTxys6mocPFy+tLW1w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Apr 2017 09:40:13 -0700
Message-ID: <CAMKF1so-xZmByMWgv4YjrW1CingX2+ONFUMTPXhuHsAxczcNBw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][ 27/32] mosh: Upgrade to 1.3.0
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
X-List-Received-Date: Thu, 20 Apr 2017 16:40:44 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 20, 2017 at 12:16 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> OK, I took it from there. There were 2 more patches in that branch:
> pick 58ec00043 ne10: Fix build errors on cortex-a7 cpus
> pick 49de0a778 live555: Update from 20130430  to 20170410

yes right. New fixes that are ready to be upstreamed keep appearing there

> which I haven't seen on ML, will keep them for next build, but if you want
> them to be applied send them to ML as well.
>

sent

> Jose: can you please check why patchwork didn't pick this series (twice)?
>
> Thanks
>
>
> On Wed, Apr 19, 2017 at 6:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> I sent the series but its not showing up in patchwork again, I have no
>> idea whats going on. Meanwhile you can cherry-pick them from
>>
>> https://github.com/kraj/meta-openembedded/tree/kraj/master
>>
>> On Tue, Apr 18, 2017 at 11:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >  meta-oe/recipes-connectivity/mosh/{mosh_1.2.4.bb => mosh_1.3.0.bb} | 5
>> > ++---
>> >  1 file changed, 2 insertions(+), 3 deletions(-)
>> >  rename meta-oe/recipes-connectivity/mosh/{mosh_1.2.4.bb =>
>> > mosh_1.3.0.bb} (93%)
>> >
>> > diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
>> > b/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
>> > similarity index 93%
>> > rename from meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
>> > rename to meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
>> > index e4d5b69bc..9fc8435ee 100644
>> > --- a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
>> > +++ b/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
>> > @@ -15,9 +15,8 @@ LIC_FILES_CHKSUM =
>> > "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> >  DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl
>> > libutempter"
>> >
>> >  SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
>> > -
>> > -SRC_URI[md5sum] = "c2d918f4d91fdc32546e2e089f9281b2"
>> > -SRC_URI[sha256sum] =
>> > "e74d0d323226046e402dd469a176075fc2013b69b0e67cea49762c957175df46"
>> > +SRC_URI[md5sum] = "d961276995936953bf2d5a794068b076"
>> > +SRC_URI[sha256sum] =
>> > "320e12f461e55d71566597976bd9440ba6c5265fa68fbf614c6f1c8401f93376"
>> >
>> >  inherit autotools pkgconfig
>> >
>> > --
>> > 2.12.2
>> >
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

