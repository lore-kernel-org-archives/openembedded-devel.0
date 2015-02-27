Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8615971637
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 00:30:58 +0000 (UTC)
Received: by yks20 with SMTP id 20so5771466yks.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 16:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=ayT8dGkmmP02MJFCJ0gH9mZ4U4dS4hAs8hBJ6DfP2QA=;
	b=arDuc0Q0iomDIGXrSWk7BG1CHM/8RTb8UG9vqyjenBVeUrfqHCV3nhIkRVHKtkfV+k
	XRJvYo08hIktYLtxb1DhJuFyYq6ykeYPxr+HJIzKpr4D0CJobiP8//oboTAnXTX4AQyD
	3ZPNMeHY3aIQL989UrK9MosRJhj5r9RwrneJXh0KaNFNImq2c5le9R5iXcJ0f4XepWaZ
	gBf7T731u20i7NqRx2hXSKQo/rXzrhZMEYEIAYXnIq0DDSJlZBR81Oixwj9+sEzf5tQ3
	c7ErIuuRtk6G0Ac0KtpSgj162qSYqKxEHI8RE2+4mdXdiUibJJALhL7UPm9bf+eSB+iw
	0qsA==
MIME-Version: 1.0
X-Received: by 10.236.190.5 with SMTP id d5mr10585627yhn.67.1424997060175;
	Thu, 26 Feb 2015 16:31:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Thu, 26 Feb 2015 16:31:00 -0800 (PST)
In-Reply-To: <1424908098.7043.8.camel@hbruce-desk3.amr.corp.intel.com>
References: <F81DC1078564A34BB4DA30CAE03814D127697625@ORSMSX104.amr.corp.intel.com>
	<CAP9ODKpdNS16hMUpiuogNna=YpO-m8LgCD5O87XBKFysKeQH3Q@mail.gmail.com>
	<2039424.onani1CoMk@peggleto-mobl5.ger.corp.intel.com>
	<CAP9ODKpz2e5usvJNihsA9Cq9wSzxoP1-oLdULupAvxXnFqd19Q@mail.gmail.com>
	<1424908098.7043.8.camel@hbruce-desk3.amr.corp.intel.com>
Date: Thu, 26 Feb 2015 21:31:00 -0300
X-Google-Sender-Auth: _ISMCyDTVVX8j7sbvzO185c_AYg
Message-ID: <CAP9ODKpzxTHGZ658Y0qPmO1qheFh5gyan6=e1P3D5RnBL0AO_w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Why no recipe for openjdk-headless?
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
X-List-Received-Date: Fri, 27 Feb 2015 00:30:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 25, 2015 at 8:49 PM, Bruce, Henry <henry.bruce@intel.com> wrote:
> On Tue, 2015-02-24 at 14:57 -0300, Otavio Salvador wrote:
>> On Tue, Feb 24, 2015 at 2:54 PM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>> > On Tuesday 24 February 2015 14:06:41 Otavio Salvador wrote:
>> >> On Tue, Feb 24, 2015 at 4:00 AM, Bruce, Henry <henry.bruce@intel.com> wrote:
>> >> > I'm putting together an OS image that includes  a Java headless
>> >> > application. Having used the openjdk7-jre-headless package on Ubuntu I
>> >> > was hoping to find a matching recipe, but sadly none exist,.  The
>> >> > openjdk7-jre recipe requires the X11 distro feature which adds
>> >> > unnecessary luggage for a small footprint IoT solution. Thanks to a
>> >> > bbappend from https://github.com/woglinde/meta-java/issues/45 I can
>> >> > minimize footprint, but a headless recipe would be a better solution.
>> >> > I'm fairly new to Yocto so could someone explain the challenges of a
>> >> > headless recipe and where one might start when creating one?
>> >>
>> >> Patches are welcome. I think the link you posted has a good base of
>> >> work done so you could start there and later follow the README file to
>> >> post the patches here.
>> >
>> > Perhaps more concretely, this would presumably be a place where you would use
>> > PACKAGECONFIG to add and remove the appropriate dependencies and also options
>> > in EXTRA_OECONF. It looks like that bbappend has a mixture of things that are
>> > and aren't related to building without X. Henry, I'm not sure if you've come
>> > across PACKAGECONFIG yet but just in case, here is an example from our
>> > mpeg2dec recipe:
>> >
>> > PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>> > PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 libxext libxv"
>> >
>> > (Obviously you'd need to use values appropriate for the openjdk recipe in
>> > the second line.)
>>
>> The only drawback I see from the PACKAGECONFIG solution, for this
>> specific case, is that I can see use cases where one product will use
>> headless and another use complete Java and this would impose or
>> machine specific packages or split distros.
>>
>> However I also think that MOST people will use headless so maybe we
>> could add the PACKAGECONFIG and default to headless and handle the
>> exception when it happens...
>>
>
> Otavio and Paul - thanks for the pointers.
> PACKAGECONFIG looks like a good approach as I can't see much demand for
> headful applications in the embedded space.
> As there is no quick route to a headless recipe I can live with current
> bbappend solution for the time being.
> I'll soon be out for couple of months and will check in when I get back.

I have pushed the patches; please if you have some time try to prepare
the patch and send for review. It'd be of great help.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

