Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0790771A5A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 04:40:27 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 12so2739064uas.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 21:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ZMthKKH6Wo8VyYRXq/LD9U/poMPf33VkfI2ke+jmG2Y=;
	b=nePwkHGCKtPLBqX5FfSEn2eBsfes8ze3itWFri42wW4Rg8lxx/g4sHtIPKtI7wK3cn
	oebMMrYV6A3aF63RD4EJFW6tbA30SxIzNq4bS9IF9OJ3Qy/RhFGWtU2j3oRZJfrUl+x0
	8Eh6Rv3hrY3J0gnMKLWhwS293ld5L0YObBbQwzs2icBXqQR9AiSqwcPskcysoXZl58wl
	ROSw7EvHNXriX3rwMPwwXq/BBFFSP1VZRV+WB827fjt+miFb9rcg6w4VJfseV0U7Zuk0
	dTHi8E54TWlMXpWyu7yqZjDWr/A16ecT4Xd6OGm18PXLe5TMqVa2r1iu0DMiOZdAt8Ay
	oG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ZMthKKH6Wo8VyYRXq/LD9U/poMPf33VkfI2ke+jmG2Y=;
	b=R5g2bOZzEH5Pdn3Gv76KrBWbvA8Mu4hunuFmbxBKagn7asTYyZUGR83yFl9bsExPLE
	1RpEpT4aEvPKlMA7nU/l5T55B5HJ8mwNq/UdyO1y4Xh3snYRwYCF4H9PjdTV6DlF2Bik
	p8dEy6yS+bIMEZ4fjurudrQGKzcLxmJX4j5YHHQPYKQ6rY+cpFyizJrrWz+k3FRRHlfo
	0ZM+h6jWAPJFWLByeCWkfVArk18i9lK+COEuFZPLpdShtXkeB6L43C4YVkRGFPbthT+h
	XoGYWTPfRXUGZSuv26y1D4qRzHxXxGWs6S36K6stJdqDXbnunJrNZywdjcr+UXIBWFWh
	iHsA==
X-Gm-Message-State: ABUngveN+2h2rjCcptz8jlAdkHoHy2M8n1op2xj/Bruj0AHZB5YpKNkiYv3z0xtBr1QUnm7KSaP7F30eAcaBzg==
X-Received: by 10.176.1.3 with SMTP id 3mr4182299uak.170.1478234428518; Thu,
	03 Nov 2016 21:40:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.107.142 with HTTP; Thu, 3 Nov 2016 21:40:27 -0700 (PDT)
In-Reply-To: <581BFCDE.10308@windriver.com>
References: <20161102063040.23598-1-Qi.Chen@windriver.com>
	<CANx9H-D_PU1LkZqzY-zrnzu2O=DwVQrrQ0YPtEOB-ocv2F-y_Q@mail.gmail.com>
	<581BFCDE.10308@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 3 Nov 2016 21:40:27 -0700
Message-ID: <CANx9H-BjG3sfHoCQKs9KHP_1fo=d+HHURzT1FPW5iOdvT8Uf9g@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH V2] gnuplot: upgrade to 5.0.5
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
X-List-Received-Date: Fri, 04 Nov 2016 04:40:29 -0000
Content-Type: text/plain; charset=UTF-8

It doesn't matter. With the PACKAGECONFIG it will default to disabled.
Done. Somebody else's problem if they need qt4.

On Thu, Nov 3, 2016 at 8:13 PM, ChenQi <Qi.Chen@windriver.com> wrote:

> On 11/04/2016 10:23 AM, Tim Orling wrote:
>
>> I would rather see a PACKAGECONFIG for qt5
>>
>> On Tue, Nov 1, 2016 at 11:30 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>>
>> Add '--disable-qt' to EXTRA_OECONF to fix do_compile failure.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   .../gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch    | 16
>>> ----------------
>>>   .../recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch | 11
>>> -----------
>>>   meta-oe/recipes-extended/gnuplot/gnuplot.inc             |  2 +-
>>>   .../gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch  | 16
>>> ++++++++++++++++
>>>   meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch   | 11
>>> +++++++++++
>>>   meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb        | 14
>>> --------------
>>>   meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb        | 14
>>> ++++++++++++++
>>>   7 files changed, 42 insertions(+), 42 deletions(-)
>>>   delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-
>>> loadlibs-configure-in-fix.patch
>>>   delete mode 100644 meta-oe/recipes-extended/
>>> gnuplot/gnuplot-4.6.5/subdirs.patch
>>>   create mode 100644 meta-oe/recipes-extended/gnupl
>>> ot/gnuplot/lua-loadlibs-
>>> configure-in-fix.patch
>>>   create mode 100644 meta-oe/recipes-extended/gnupl
>>> ot/gnuplot/subdirs.patch
>>>   delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
>>>   create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
>>>
>>> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-
>>> loadlibs-configure-in-fix.patch b/meta-oe/recipes-extended/
>>> gnuplot/gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch
>>> deleted file mode 100644
>>> index 23f2cd2..0000000
>>> --- a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-
>>> loadlibs-configure-in-fix.patch
>>> +++ /dev/null
>>> @@ -1,16 +0,0 @@
>>> -Index: gnuplot-4.6.5/configure.in
>>> -===================================================================
>>> ---- gnuplot-4.6.5.orig/configure.in
>>> -+++ gnuplot-4.6.5/configure.in
>>> -@@ -690,6 +690,11 @@ if test "${with_lua}" = yes ; then
>>> -   fi
>>> -
>>> -   if test "$with_lua" != no; then
>>> -+    dnl check for dlopen/dl to fix loadlibs link failure
>>> -+    AC_CHECK_FUNC([dlopen], [],
>>> -+      AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
>>> -+    AC_SUBST(DLOPEN_LIBS)
>>> -+    LUA_LIBS="$LUA_LIBS $DLOPEN_LIBS"
>>> -     TERMLIBS="$TERMLIBS $LUA_LIBS"
>>> -     CPPFLAGS="$CPPFLAGS $LUA_CFLAGS"
>>> -   else
>>> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.pat
>>> ch
>>> b/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
>>> deleted file mode 100644
>>> index 8c7d1f0..0000000
>>> --- a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
>>> +++ /dev/null
>>> @@ -1,11 +0,0 @@
>>> ---- /tmp/Makefile.am   2007-08-23 13:10:15.560659023 +0200
>>> -+++ gnuplot-4.2.0/Makefile.am  2007-08-23 13:10:34.961764629 +0200
>>> -@@ -1,7 +1,7 @@
>>> - ## Process this file with automake to produce Makefile.in
>>> -*-Makefile-*-
>>> - AUTOMAKE_OPTIONS = foreign 1.2h
>>> -
>>> --SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
>>> -+SUBDIRS = config m4 term src  $(LISPDIR) man share
>>> -
>>> - EXTRA_DIST = BUGS CodeStyle Copyright FAQ GNUmakefile INSTALL
>>> INSTALL.gnu \
>>> - Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST README.exp
>>> \
>>> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
>>> b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
>>> index 69bc74b..d8d9a5f 100644
>>> --- a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
>>> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
>>> @@ -17,7 +17,7 @@ PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,
>>> cairo
>>> pango"
>>>   PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua"
>>>
>>>   EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR}/.. \
>>> -                --without-lisp-files \
>>> +                --without-qt \
>>>
>>> This would be more universal in a PACKAGECONFIG
>> e.g. PACKAGECONFIG[qt4] = "--with-qt,--without-qt,qt4-x11-free"
>>
>>
> The problem is that it fails to compile with qt4. So I just disabled it.
>
> Regards,
> Chen Qi
>
>
>                   --without-tutorial \
>>>                   --disable-wxwidgets"
>>>
>>> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-conf
>>> igure-in-fix.patch
>>> b/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-
>>> configure-in-fix.patch
>>> new file mode 100644
>>> index 0000000..23f2cd2
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-
>>> configure-in-fix.patch
>>> @@ -0,0 +1,16 @@
>>> +Index: gnuplot-4.6.5/configure.in
>>> +===================================================================
>>> +--- gnuplot-4.6.5.orig/configure.in
>>> ++++ gnuplot-4.6.5/configure.in
>>> +@@ -690,6 +690,11 @@ if test "${with_lua}" = yes ; then
>>> +   fi
>>> +
>>> +   if test "$with_lua" != no; then
>>> ++    dnl check for dlopen/dl to fix loadlibs link failure
>>> ++    AC_CHECK_FUNC([dlopen], [],
>>> ++      AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
>>> ++    AC_SUBST(DLOPEN_LIBS)
>>> ++    LUA_LIBS="$LUA_LIBS $DLOPEN_LIBS"
>>> +     TERMLIBS="$TERMLIBS $LUA_LIBS"
>>> +     CPPFLAGS="$CPPFLAGS $LUA_CFLAGS"
>>> +   else
>>> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
>>> b/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
>>> new file mode 100644
>>> index 0000000..8c7d1f0
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
>>> @@ -0,0 +1,11 @@
>>> +--- /tmp/Makefile.am   2007-08-23 13:10:15.560659023 +0200
>>> ++++ gnuplot-4.2.0/Makefile.am  2007-08-23 13:10:34.961764629 +0200
>>> +@@ -1,7 +1,7 @@
>>> + ## Process this file with automake to produce Makefile.in
>>> -*-Makefile-*-
>>> + AUTOMAKE_OPTIONS = foreign 1.2h
>>> +
>>> +-SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
>>> ++SUBDIRS = config m4 term src  $(LISPDIR) man share
>>> +
>>> + EXTRA_DIST = BUGS CodeStyle Copyright FAQ GNUmakefile INSTALL
>>> INSTALL.gnu \
>>> + Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST README.exp
>>> \
>>> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
>>> b/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
>>> deleted file mode 100644
>>> index 3f694a0..0000000
>>> --- a/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
>>> +++ /dev/null
>>> @@ -1,14 +0,0 @@
>>> -require gnuplot.inc
>>> -
>>> -SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${BP}.tar.gz;name=archive \
>>> -    http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot
>>> \
>>> -    file://subdirs.patch \
>>> -    file://lua-loadlibs-configure-in-fix.patch \
>>> -    file://gnuplot.desktop \
>>> -    file://gnuplot.png \
>>> -"
>>> -
>>> -SRC_URI[archive.md5sum] = "9a476b21f74bd99c876f1509d731a0f9"
>>> -SRC_URI[archive.sha256sum] = "e550f030c7d04570e89c3d4e3f6e82
>>> 296816508419c86ab46c4dd73156519a2d"
>>> -SRC_URI[qtplot.md5sum] = "0a481885a496092c77eb4017540b5cf6"
>>> -SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a26
>>> 7cd6478cb5147f55d7530c94f1ad5f4132"
>>> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
>>> b/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
>>> new file mode 100644
>>> index 0000000..42308ba
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
>>> @@ -0,0 +1,14 @@
>>> +require gnuplot.inc
>>> +
>>> +SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${BP}.tar.gz;name=archive \
>>> +    http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot
>>> \
>>> +    file://subdirs.patch \
>>> +    file://lua-loadlibs-configure-in-fix.patch \
>>> +    file://gnuplot.desktop \
>>> +    file://gnuplot.png \
>>> +"
>>> +
>>> +SRC_URI[archive.md5sum] = "c5e96fca73afbee4f57cbc1bfce6b3b8"
>>> +SRC_URI[archive.sha256sum] = "25f3e0bf192e01115c580f278c3725
>>> d7a569eb848786e12b455a3fda70312053"
>>> +SRC_URI[qtplot.md5sum] = "0a481885a496092c77eb4017540b5cf6"
>>> +SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a26
>>> 7cd6478cb5147f55d7530c94f1ad5f4132"
>>> --
>>> 2.8.3
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

