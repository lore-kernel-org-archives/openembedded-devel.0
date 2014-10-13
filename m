Return-Path: <nickdademo@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id B017860167
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 23:45:25 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id h136so14855331oig.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 16:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=8JMdSQyLXLFBUoibMbJF6QSWTYYlRdwOIatdwcKOYq8=;
	b=Q45hFIkONOCrYPYGH+B22nXwlyllr0DT1Ncd5uU12T0V/5Qu6mU+8gdfpEQkQEHnn6
	alesqQ5FZP+H4oZtfSfyu5wWsdyXU7J25/BNoNCfrL7lc0dqcVS2RBf4iaHi4xItMwmC
	s6jT8GBujeowHXsIHzixRRlRdJSSIt8cPmE/stqsZXbdYBZjrfZkX+I8nHhEuB2rF3cM
	Q64LPEW4ftRw6GHg+CHTt0h/U81M1tdXh26AS4lsNH6ESHznJHRw6jAVestSjk9OiUMh
	AEU3U9OSjdRwrvlhjHHfC1Wk/+2wRp587g5nf7qpJyumdyMmtw8RFIHT+laqhBe6IhrE
	UQLw==
X-Received: by 10.182.27.103 with SMTP id s7mr1434338obg.30.1413243925947;
	Mon, 13 Oct 2014 16:45:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.167.163 with HTTP; Mon, 13 Oct 2014 16:45:05 -0700 (PDT)
In-Reply-To: <20141013214342.GA4461@ad.chargestorm.se>
References: <CANR6C54p6yC1FPviBpmX-qHiF198s3vK7UWEmmDj3hYs7mAovQ@mail.gmail.com>
	<CANR6C57416FmV0MHSKmKLvD=Xdf=Lds5OnrHu_6nCW8z3qB_jg@mail.gmail.com>
	<20141013071037.GA5099@ad.chargestorm.se>
	<CANR6C54sFocGNOmgQ65vJy_ZEmadg_LBReDQf8w=TKxYKXhxhg@mail.gmail.com>
	<20141013214342.GA4461@ad.chargestorm.se>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Tue, 14 Oct 2014 10:45:05 +1100
Message-ID: <CANR6C54oxFGe_i09XmO1NBioQ+XihZnmsqzT_yv_P=KFc4+rQg@mail.gmail.com>
To: "Nick D'Ademo" <nickdademo@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] What is needed to build a recipe with CMake?
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
X-List-Received-Date: Mon, 13 Oct 2014 23:45:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks Anders! "inherit cmake_qt5" was the missing piece of the puzzle!


On Tue, Oct 14, 2014 at 8:43 AM, Anders Darander <anders@chargestorm.se>
wrote:

> * Nick D'Ademo <nickdademo@gmail.com> [141013 23:10]:
> >    Are you using Qmake or Cmake to build? (I suspect Qmake).
> >    My source code actually has no .PRO file.
>
> Hm, when you state it like that ;)
> I might very well have changed it to not use cmake... KDSoap is shipping
> multiple build systems etc, and as long as I can get it to build...
>
> However, Martin gave you a hint to look at meta-webos-port for more
> recipes using cmake.
>
> Have you inherited cmake_qt5? That class ought to set everything up for
> you.
>
> Cheers,
> Anders
>
> >    On Mon, Oct 13, 2014 at 6:10 PM, Anders Darander
> >    <[1]anders@chargestorm.se> wrote:
>
> >      Hi,
> >      * Nick D'Ademo <[2]nickdademo@gmail.com> [141013 01:50]:
> >      > Has anyone had any success at all building a Qt5-based recipe wi=
th
> >      CMake?
> >      Yes, I've at least got a local recipe here building KDSoap, which
> >      uses
> >      cmake.
> >      > On Wed, Oct 8, 2014 at 1:41 PM, Nick D'Ademo
> >      <[3]nickdademo@gmail.com> wrote:
> >      > > Looks like the *qmake* binary cannot be found.
> >      > > The relevant parts of the recipe are as follows:
> >      > > *DEPENDS =3D "qtbase"*
> >      Just as you, I've got hte DEPENDS li=C5=84e above in my recipe. Ho=
wever,
> >      I've
> >      also the following line (situated after the DEPENDS +=3D...)
> >      inherit qmake5
> >      That line should set up all the necessary path's in order to find
> >      qmake.
> >      Let us know if this helps you.
> >      Cheers,
> >      Anders
> >      --
> >      Abstainer, n.:
> >              A weak person who yields to the temptation of denying
> >      himself a
> >              pleasure.
> >                      -- Ambrose Bierce, "The Devil's Dictionary"
> >      --
> >      _______________________________________________
> >      Openembedded-devel mailing list
> >      [4]Openembedded-devel@lists.openembedded.org
> >      [5]
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> > References
>
> >    1. mailto:anders@chargestorm.se
> >    2. mailto:nickdademo@gmail.com
> >    3. mailto:nickdademo@gmail.com
> >    4. mailto:Openembedded-devel@lists.openembedded.org
> >    5. http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Anders Darander
> ChargeStorm AB          Tel: +46 702 44 84 36
> Hospitalsgatan 8        Email: anders@chargestorm.se
> 602 27 Norrk=C3=B6ping       Web: www.chargestorm.se
>

