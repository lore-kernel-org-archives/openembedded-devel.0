Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D359277D3A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 00:53:21 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id t189so35980368wmt.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 17:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SqaJA/8Nhp/qD8/hpWCODImVzEw8A2JQ4zEcYEmUOwI=;
	b=t+waIwYK4TvACPSExjQcPtTYh1OYTNKMQnzUX7EwT/GFqxJzUBf3B/dz7+JmVJDN8G
	xl6LHKsDCmdhHFCN3T6/bNplPkZysvj4HKJHSYsm1XOf0qyHFZedp5QRz7NKOY/e7kI1
	mzPsYgLGfWAzJ4UaFe3EmERlu08qJW+CC0IuP2mMIvcS9piBBPjP38Zw0fM/m78aQdv1
	CKhc5moDsTs4DPK+0dF2/VAibG0dX3YfE+CPkhLeEqVB1xYRTaT4E9+k0ajsgnSJGKC2
	y9eoq8o1D6gGi/hjgzongb7ym5HPJFQbxaRFOflkyAns2fHez6d3n2D/fTb/0ZhfssxD
	8JGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SqaJA/8Nhp/qD8/hpWCODImVzEw8A2JQ4zEcYEmUOwI=;
	b=uHuP6ju095rw/Dc26Jss5btRmvNIGV41cam9KiuYz+wKqyLfhQ8oipvmrjhp8qBUO7
	QmyKeJeYynP9rRiGwHn5/EOg5Q9+qXL4Fzo1jOMqwqkq1AGNZDcfKqo6F///VXI7eC+G
	kTiZmCczyRBivqOUy5ffvGBbQJpzhgyHUULOsqvQ0k+Uied334vrb9ctwq+0fsJzCu6F
	CCl+ODAcdvqd+QV1uHti30qWUKWwyLu+FzU0s8ZuZSiOUr1VtlU66Z+8QG+lM74PLCBx
	yhv6SYKhaVafc1+iKWGj9Gw8L2lWSPxZgl/fKupOcPkFkhlo9ZyXSLL/nQNBB4CLPCCb
	+HEQ==
X-Gm-Message-State: AN3rC/6bX47JXoPVe/WOq7EtsL72lZkHWPY5GSt3N30DFIdJGA5aIgHK
	b2HB5AShFri9TBSDPk/M1Cb2TwuRfQ==
X-Received: by 10.28.70.129 with SMTP id t123mr743460wma.98.1492044802435;
	Wed, 12 Apr 2017 17:53:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.153.248 with HTTP; Wed, 12 Apr 2017 17:53:21 -0700 (PDT)
In-Reply-To: <20170413021127.47ff6bc7@t510.zcs.saftware.de>
References: <20170326203053.GH15664@denix.org>
	<20170329230613.GS15664@denix.org>
	<20170413004504.2cae0270@t510.zcs.saftware.de>
	<CAJ86T=X2379-ZvEVS-AYku6NENYC48+t11T0GpOic-xyYAPzKQ@mail.gmail.com>
	<20170413021127.47ff6bc7@t510.zcs.saftware.de>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 12 Apr 2017 17:53:21 -0700
Message-ID: <CAJ86T=W3YBoLXH+J16XhJ+FO_ZtW17hPX8+djgqrgVNFXkeBkg@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Apr 2017 00:53:22 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 12, 2017 at 5:11 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On Wed, 12 Apr 2017 16:38:58 -0700
> Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> On Wed, Apr 12, 2017 at 3:45 PM, Andreas Oberritter
>> <obi@opendreambox.org> wrote:
>> > On Wed, 29 Mar 2017 19:06:14 -0400
>> > Denys Dmytriyenko <denis@denix.org> wrote:
>> >
>> >> On Sun, Mar 26, 2017 at 04:30:53PM -0400, Denys Dmytriyenko wrote:
>> >> > Hi,
>> >> >
>> >> > I've been having the following build issues lately with qtwebkit 5.8 from
>> >> > master:
>> >> >
>> >> > | make[2]: Entering directory '/OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/build/Source'
>> >> > | rm -f libQt5WebKit.so.5.8.0 libQt5WebKit.so libQt5WebKit.so.5 libQt5WebKit.so.5.8
>> >> > | linking ../lib/libQt5WebKit.so.5.8.0
>> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `__bss_start'
>> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `__bss_start'
>> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_edata'
>> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_edata'
>> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_end'
>> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_end'
>> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `__bss_start'
>> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `_edata'
>> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `_end'
>> >> > | collect2: error: ld returned 1 exit status
>> >> > | Makefile.api:92: recipe for target '../lib/libQt5WebKit.so.5.8.0' failed
>> >> > | make[2]: *** [../lib/libQt5WebKit.so.5.8.0] Error 1
>> >> > | make[2]: Leaving directory '/OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/build/Source'
>> >> > | Makefile.QtWebKit:44: recipe for target 'sub-api-pri-make_first-ordered' failed
>> >> > | make[1]: *** [sub-api-pri-make_first-ordered] Error 2
>> >> >
>> >> > I believe I was able to build 5.8/master before, so I'm suspecting recent
>> >> > binutils upgrade... But I can be wrong. Would really appreciate some help
>> >> > here. Thanks.
>> >>
>> >> Anyone else see this?
>> >>
>> >
>> > I do. Have you been able to solve it in the meantime?
>>
>> Do you both have gold enabled?
>>
>>   https://bugs.launchpad.net/ubuntu/+source/qtwebkit-opensource-src/+bug/1653529
>
> I don't use the ld-is-gold flag, but gold gets built nevertheless. It's just not
> the default linker. I guess qtwebkit forces its use. So the question becomes whether
> I should set ld-is-gold or teach qtwebkit not to use gold, in order not to mix both
> linkers.

Assuming qtwebkit has a configure option to explicitly enable/disable
gold, I'd say add a PACKAGECONFIG option.

In the short term keep the PACKAGECONFIG option disabled and in the
longer term (once qtwebkit builds successfully with gold enabled) set
the PACKAGECONFIG option based on the testing the distro feature.

> Regards,
> Andreas

