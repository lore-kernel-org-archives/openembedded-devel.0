Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TeUws-0002gK-8K
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 19:04:28 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so1007649ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 09:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=yLXuf9Nw1RwJ7zueb9UzP6Ti50Ghz1vmfEcf/p571G8=;
	b=f0nNTYBehkZrnXloaht2B+uzSuuYB8EtoBqHvvv1d7N5I+xf7XHusqe/SIntiNxf/r
	9b8DJHMujYR0m7kmA8ZF4EiQ5h66wLUbR510rtIbEn3cO2LKYisOcrlOHd2IjYkoxcoX
	4SSAfqEBTCauVffJ885Ynp2DhojJIEyCECrE7DnoalzlYKBDQNUbvZr/iJgDiCK0YZGU
	onI6FcNuyFSL6+2ECn7inW9CnKGreUg9ZHsGlSeGkPjojbKH/9e3B0dlykQ7JF/625uC
	Ve1uGP+oGf50Do/532tf8tdbf2Zm5VUl2S6rv7TytspN41decqDT0ohVOGo9Kui9J9JO
	4JyQ==
MIME-Version: 1.0
Received: by 10.43.69.206 with SMTP id yd14mr1549305icb.57.1354297800995; Fri,
	30 Nov 2012 09:50:00 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Fri, 30 Nov 2012 09:50:00 -0800 (PST)
In-Reply-To: <CALbNGRRBstvSuMr3jPaNvnggN+TdigApJ=EyxCWeHEdg4tdgbw@mail.gmail.com>
References: <CAPOJ94OVOe=fP-8cgCdDFGFEJskce4G=DMcTR6a-JDM9QHJg0w@mail.gmail.com>
	<CALbNGRRqj6NvBxqB+EGcLcFd9CcNKKnSNZmJHM8f=BA-biF3dg@mail.gmail.com>
	<CAPOJ94NZvsiBoMemWPFdBUQtqQzH2rrkq9eP5hQGpB8amY4U2g@mail.gmail.com>
	<CALbNGRSXeE0UvpsZqijRRg1nRW4XFe+52Zoz6kX6wX_QSuDM+Q@mail.gmail.com>
	<CALbNGRRBstvSuMr3jPaNvnggN+TdigApJ=EyxCWeHEdg4tdgbw@mail.gmail.com>
Date: Fri, 30 Nov 2012 18:50:00 +0100
Message-ID: <CALbNGRRdcaOXoXJcswP6PO7ivsmdCL0f6hEE86GDMnyx7+r=wA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Peter Bigot <bigotp@acm.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gphoto2: fix gettext build error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 18:04:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 30, 2012 at 6:45 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Nov 30, 2012 at 6:17 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>>> gettext 0.18.1 is installed both on the build machine, and as a native
>>> package used when building under bitbake.  If it's at all relevant, I h=
ave
>>> LANG=3Den_US.UTF-8 in the environment in which bitbake is executed.
>>>
>>> Did you try a full reversion of 5febf70?  Can you tell why, in your
>>> environment, autotools.bbclass replaces the Makefile.in.in for libgphot=
o2?
>>> It does not do this for me (otherwise I think Koen's patch that only re=
verts
>>> part of 5febf70 would not work).
>>>
>>> Peter
>>>
>> It should copy see autotools.bbclass line 195
>>
>> Andreas
> Peter
>
> One stupid question: Are you working with oe-core master - because
>
> commit 841ea3c1c18e50e77fccbd5f44d6a79a50913b67
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Thu Oct 11 08:43:01 2012 +0000
>
> which started my gphoto2 trouble is not found in danny
>
> Andreas
So from what I can see now is that meta-oe's

commit 92e3f684d14fd287194e78bc5e65f80504758b7d
Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed Nov 21 14:42:02 2012 +0000

    gphoto2: fix gettext build error

    Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

should be merged to danny and reverted (with PRbump) in master.

Andreas


