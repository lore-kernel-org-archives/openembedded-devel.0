Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1752277D4D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 23:38:58 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id o81so99132184wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 16:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CLpe5TDQrV7YHbacbK55dGWBBAlBdRszi6UOLtAIW6w=;
	b=QCUUO3EG8zVHUou73w3GHKe0mgLcNVUIY92MpiS4gXZxYoEZOrCGMk1Y+3Pe5JYMjH
	Ty8mQ5/8YexKpiO55vCzl+YZsE0fuBc/B/fUIi1tbGAzm0apWSKovZ9nbopCDw7ozHaw
	t3P9f3toq2+PfaMkgvhIzLh5+KkT5rYc9K99qdH18NQokedtPGDicsLBFrisqJlV1eOM
	lm08JcGA8+V2nzym7SEgAHkpp67XS8R+lQsMY1k9JUcqGR32Oz4mrB4trXe3+Hf0N6/q
	9CtXESQEbSPMUgmnRqwDD7GrV2hzBYOXnhdBtOTjkXtKdgqVu/6HREIoO+o2iN2TAtIG
	sZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CLpe5TDQrV7YHbacbK55dGWBBAlBdRszi6UOLtAIW6w=;
	b=qbgqHoB+QgZBHfbbfI+zJFm7cyEQVLZ5ta8BL9bVj0t4kxDA/7v3ar0et/PfRF0SAv
	4NqYQ9OQa2Pk/WyN1j2EkH1YYVm28dM5RpTe9rbPzsS9HxbcSDZIAuhTIfW1XpT2InZK
	7+/OtFa9HY/WjP93/U4tgXJT61wKWBV43/KglZsz9Ig92KUFvySHgB1oZscP8oca2iVe
	pikBL9eD+oJut0PtrX2v3x0pE4tvQ+wuncWyfjGlLIWQMN66+tZyy5HoSEw0cpQD8vLO
	PBiC/qZs4WyIrlLzjTpwoL4y6+4huBQAVHmbReRV76Rx8VpLz1NG54jJe8V/ynr1uIES
	RlAA==
X-Gm-Message-State: AN3rC/4w6ImQzruGBkqlB3Cs+hEHC5/uxrpDoyND1h9M32h5Gl1pqRRM
	ZHvXmugQf4DywdEBLD+pKWCpcNZ5vQ==
X-Received: by 10.28.129.147 with SMTP id c141mr17845708wmd.98.1492040339569; 
	Wed, 12 Apr 2017 16:38:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.153.248 with HTTP; Wed, 12 Apr 2017 16:38:58 -0700 (PDT)
In-Reply-To: <20170413004504.2cae0270@t510.zcs.saftware.de>
References: <20170326203053.GH15664@denix.org>
	<20170329230613.GS15664@denix.org>
	<20170413004504.2cae0270@t510.zcs.saftware.de>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 12 Apr 2017 16:38:58 -0700
Message-ID: <CAJ86T=X2379-ZvEVS-AYku6NENYC48+t11T0GpOic-xyYAPzKQ@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] qtwebkit 5.8 build issues?
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
X-List-Received-Date: Wed, 12 Apr 2017 23:38:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 12, 2017 at 3:45 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On Wed, 29 Mar 2017 19:06:14 -0400
> Denys Dmytriyenko <denis@denix.org> wrote:
>
>> On Sun, Mar 26, 2017 at 04:30:53PM -0400, Denys Dmytriyenko wrote:
>> > Hi,
>> >
>> > I've been having the following build issues lately with qtwebkit 5.8 from
>> > master:
>> >
>> > | make[2]: Entering directory '/OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/build/Source'
>> > | rm -f libQt5WebKit.so.5.8.0 libQt5WebKit.so libQt5WebKit.so.5 libQt5WebKit.so.5.8
>> > | linking ../lib/libQt5WebKit.so.5.8.0
>> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `__bss_start'
>> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `__bss_start'
>> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_edata'
>> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_edata'
>> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_end'
>> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_end'
>> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `__bss_start'
>> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `_edata'
>> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `_end'
>> > | collect2: error: ld returned 1 exit status
>> > | Makefile.api:92: recipe for target '../lib/libQt5WebKit.so.5.8.0' failed
>> > | make[2]: *** [../lib/libQt5WebKit.so.5.8.0] Error 1
>> > | make[2]: Leaving directory '/OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/build/Source'
>> > | Makefile.QtWebKit:44: recipe for target 'sub-api-pri-make_first-ordered' failed
>> > | make[1]: *** [sub-api-pri-make_first-ordered] Error 2
>> >
>> > I believe I was able to build 5.8/master before, so I'm suspecting recent
>> > binutils upgrade... But I can be wrong. Would really appreciate some help
>> > here. Thanks.
>>
>> Anyone else see this?
>>
>
> I do. Have you been able to solve it in the meantime?

Do you both have gold enabled?

  https://bugs.launchpad.net/ubuntu/+source/qtwebkit-opensource-src/+bug/1653529

> Regards,
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

