Return-Path: <attie.grande@argentum-systems.co.uk>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2F579C90
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 14:07:46 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id h15so10853813edb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 06:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=argentum-systems-co-uk.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VWhliBglm8amV1XUzAzU9vnc2ElQrmt4CrkJjqKFa2Q=;
	b=FIPfr0L4UIiKe9xHYoncE7aCcw0W4guzgu8BNS/0wIO43jTvjqm8apzFhMRXVO2qOx
	x4ipg8b3zfD3KYMLWV25s8mn8H1y2BcxbjlSkBMiHWgKHGVaWAJbTwjtpw2OyYmXn/+c
	Qa4Iq4LPc4JqL+dFdqep7wJDN4BQgsfyxHnpYQJmtUQuxb/we4rxypYoE1WMC0vSsAbW
	N57ht2VvGFhuDIc2PTMxBdbIGTRd2D6bN1V0R6fqUN4TdxL0gUlxgre5L9+TO+pndwDJ
	UlTi9u6BKmfKTun/U1HMfJC8Dt6b+7oty9qrBOFt7WoNZmPSH7G0MkjIiIIpS4cssOG1
	VL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VWhliBglm8amV1XUzAzU9vnc2ElQrmt4CrkJjqKFa2Q=;
	b=hl8KuG41K7XnbKFVjg43BxbSbXuKTPYM+8ijZ00mlrY+CSxfq5rsiMA8WmaMIdmQRe
	hjEQbY2WvIl/3OSHE7sFApnVyN11RNwBh0JuT7XFPvJ1Notmh5QZh4eRo53czDQzWits
	FUIjABLzG3vWlVeJZPMdZzZB1GySZ7UqLiDUVfv7VjZgsCiP3PvLMcKxO6+dJeo7t0hq
	3RGmmlCZTCHWrSE0BGskIDg0H7lKhVE5SuB9NTsvtSMlLBrNnKueE7YpczM0qYrykx/o
	cLSQO5uKaIC4h3MlPRXU/ZNAg2eGIWbYhyiq/xFh52ZX5TsinCFcyeWbV/0Get/RKvwo
	IELQ==
X-Gm-Message-State: AA+aEWblvp9BXMowJ4d/Lnq2n8t8NAugc+CpeD9b7bSK3HMfNniJ5k6Y
	60gJcqtGdOQEORx8cU1JIzf3VWIcsiBI/77dAd5Lxg==
X-Google-Smtp-Source: AFSGD/VMo0JHl5wc98IpHfETgV/ycq4gbRp2IdNUsLlOvMa19to6PYVmrWLbmttYJNuM+8QD2IkfrQltijsx5/BJq6M=
X-Received: by 2002:a17:906:60b:: with SMTP id
	s11-v6mr10507042ejb.25.1545055666719; 
	Mon, 17 Dec 2018 06:07:46 -0800 (PST)
MIME-Version: 1.0
References: <CAAsqSTcN2Bkk_k_MLEWSTesEFEJURrXvHdyY2TzuA_fEh4iJUw@mail.gmail.com>
	<6c8e0af4-bb46-ba48-eafb-a91a60bc837d@skidata.com>
In-Reply-To: <6c8e0af4-bb46-ba48-eafb-a91a60bc837d@skidata.com>
From: Attie Grande <attie.grande@argentum-systems.co.uk>
Date: Mon, 17 Dec 2018 14:07:36 +0000
Message-ID: <CAAsqSTdT-+0y=m_Oo2+8JEAmcGfVWLktUgXLG5LZ5qSmkHfVSw@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH 2/2] openjdk-8: better interface invocations
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
X-List-Received-Date: Mon, 17 Dec 2018 14:07:46 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

It looks like gmail has helpfully wrapped some of the lines...
Also, my patch was intended to go on top of the sumo branch - apologies.

It looks like you've bumped to 172b11 on master-next already.
I'll try this and report back - possibly in the new year...

Some crashes are available here:
  - https://pastebin.com/raw/f1PB4uJm
  - https://pastebin.com/raw/iXTz8v9z

Attie


On Mon, 17 Dec 2018 at 13:55, Richard Leitner
<richard.leitner@skidata.com> wrote:
>
> Hi,
> thanks for the patch. Nonetheless this patch doesn't apply neither to master nor to master-next.
> Please take a look at it. Thanks!
>
> regards;Richard.L
>
> On 30.11.18 14:10, Attie Grande wrote:
> > Fixes a SEGFAULT when OpenJDK 8 is build for an i.MX6 platform, possibly
> > others.
>
> Do you have any logs of these segfaults?
> I have no issues during my i.MX6 builds. What libc are you using?
>
> >
> > The original patch (below) has been modified to work with jdk8.
> >
> > Further information:
> >   https://bugs.openjdk.java.net/browse/JDK-8194739
> >   http://hg.openjdk.java.net/jdk/jdk10/rev/69d1a1590485
> >
> > Signed-off-by: Attie Grande <attie.grande@argentum-systems.co.uk>
> > ---
> >  recipes-core/openjdk/openjdk-8-release-16xbyy.inc  |  1 +
> >  .../JDK-8194739-better-interface-invocations.patch | 62 ++++++++++++++++++++++
> >  2 files changed, 63 insertions(+)
> >  create mode 100644
> > recipes-core/openjdk/patches-openjdk-8/JDK-8194739-better-interface-invocations.patch
> >
> > diff --git a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> > b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> > index 23c99fe..b7cdede 100644
> > --- a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> > +++ b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> > @@ -17,6 +17,7 @@ PATCHES_URI = "\
> >      file://0009-jdk-disable-backtrace-musl-build-fix.patch \
> >      file://0010-build-fix-build-on-as-needed-toolchains-generic.patch \
> >      file://JDK-8202600-undefined-behaviour-in-os_linux_zero.cpp.patch \
> > +    file://JDK-8194739-better-interface-invocations.patch \
> >  "
> >  # some patches extracted from
> > http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
> >  # reported via
> > http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
> > diff --git a/recipes-core/openjdk/patches-openjdk-8/JDK-8194739-better-interface-invocations.patch
> > b/recipes-core/openjdk/patches-openjdk-8/JDK-8194739-better-interface-invocations.patch
> > new file mode 100644
> > index 0000000..a185dac
> > --- /dev/null
> > +++ b/recipes-core/openjdk/patches-openjdk-8/JDK-8194739-better-interface-invocations.patch
> > @@ -0,0 +1,62 @@
> > +--- a/hotspot/src/cpu/zero/vm/methodHandles_zero.cpp Tue Dec 19
> > 17:31:53 2017 -0500
> > ++++ b/hotspot/src/cpu/zero/vm/methodHandles_zero.cpp Mon Jan 22
> > 15:19:02 2018 +0000
> > +@@ -180,3 +180,9 @@
> > +     return NULL;
> > +   }
> > + }
> > ++
> > ++#ifndef PRODUCT
> > ++void MethodHandles::trace_method_handle(MacroAssembler* _masm, const
> > char* adaptername) {
> > ++  // This is just a stub.
> > ++}
> > ++#endif //PRODUCT
> > +--- a/hotspot/src/share/vm/interpreter/bytecodeInterpreter.cpp Tue
> > Dec 19 17:31:53 2017 -0500
> > ++++ b/hotspot/src/share/vm/interpreter/bytecodeInterpreter.cpp Mon
> > Jan 22 15:19:02 2018 +0000
> > +@@ -2569,13 +2569,35 @@
> > +
> > +         // this could definitely be cleaned up QQQ
> > +         Method* callee;
> > +-        Klass* iclass = cache->f1_as_klass();
> > +-        // InstanceKlass* interface = (InstanceKlass*) iclass;
> > ++        Method *interface_method = cache->f2_as_interface_method();
> > ++        InstanceKlass* iclass = interface_method->method_holder();
> > ++
> > +         // get receiver
> > +         int parms = cache->parameter_size();
> > +         oop rcvr = STACK_OBJECT(-parms);
> > +         CHECK_NULL(rcvr);
> > +         InstanceKlass* int2 = (InstanceKlass*) rcvr->klass();
> > ++
> > ++        // Receiver subtype check against resolved interface klass (REFC).
> > ++        {
> > ++          Klass* refc = cache->f1_as_klass();
> > ++          itableOffsetEntry* scan;
> > ++          for (scan = (itableOffsetEntry*) int2->start_of_itable();
> > ++               scan->interface_klass() != NULL;
> > ++               scan++) {
> > ++            if (scan->interface_klass() == refc) {
> > ++              break;
> > ++            }
> > ++          }
> > ++          // Check that the entry is non-null.  A null entry means
> > ++          // that the receiver class doesn't implement the
> > ++          // interface, and wasn't the same as when the caller was
> > ++          // compiled.
> > ++          if (scan->interface_klass() == NULL) {
> > ++            VM_JAVA_ERROR(vmSymbols::java_lang_IncompatibleClassChangeError(),
> > "", note_no_trap);
> > ++          }
> > ++        }
> > ++
> > +         itableOffsetEntry* ki = (itableOffsetEntry*) int2->start_of_itable();
> > +         int i;
> > +         for ( i = 0 ; i < int2->itable_length() ; i++, ki++ ) {
> > +@@ -2587,7 +2608,8 @@
> > +         if (i == int2->itable_length()) {
> > +           VM_JAVA_ERROR(vmSymbols::java_lang_IncompatibleClassChangeError(),
> > "", note_no_trap);
> > +         }
> > +-        int mindex = cache->f2_as_index();
> > ++        int mindex = interface_method->itable_index();
> > ++
> > +         itableMethodEntry* im = ki->first_method_entry(rcvr->klass());
> > +         callee = im[mindex].method();
> > +         if (callee == NULL) {
> >

