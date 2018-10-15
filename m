Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 029F571BF9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 10:41:28 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id i4-v6so8965850pgq.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 03:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ts29SHWS+8xfLBWh83+yE27JOxx2aAHZ5qoHXZaGytI=;
	b=DucgPtTbAAuXopfAEFAikkl22BzUr6TyJwsuXkW6Q5pUTIt66VjTgoX+Xy4OKI3MdW
	/E7EuYsyonEKPdOOCZ9Aw2IUMoFSZz5m4rG3HwOY1NDg/X8iXAazUiQBZLV/9hafNWDS
	q5Pb0M9zxZ086F2DfV8B4254rAGGb1oGvvvMJk3uWfax+XRmlTYMX4XD2/JFYzWQnphP
	scpfCU5yJzunHJhBjf+VNcrASPDXMQsgg4Lc2UjviSPT3XBLKjL+VmO2KosxscfeAFTL
	N5we0739kUG242GtZGCfAUPNZ7Hqap9TNshQKn4y+dm+fKGs3GzM10b6NOVnqO+Q+zRm
	76ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ts29SHWS+8xfLBWh83+yE27JOxx2aAHZ5qoHXZaGytI=;
	b=q6RMm9cFD6iO5ZcAxBEqEoaQvbGdgYWz3AM1a+ksXGfJCqKHbqXzxQ4gLF7Omx7tqt
	2N6FwCcQgS66MIEjQsyUiq7ZZhKptEWQKOundfVkvV7tQ+KZEEmGpyAOPw72Qvus7+Gc
	zq4tRQh/K9NADLoarho50JBRWvfwFHsr55/qUhgDaMzoipIiQ1i/Oo+GwknlyWG8j4M5
	bA54aM8UGN1qqb4eAdgYRDGTJCEqMgdJFKarHms0PzZ2WtOrml3QV5AiTJvsCdXljfFb
	3/rSm9yi16KpZmTEb3/WXcR1RCDxU0c8unhBtbjCcNZ/tulkuZbXJwk2ggZtc6MNfTyv
	dZTA==
X-Gm-Message-State: ABuFfojFavlydHOlSu7x7b+LdCXZFSMW4ou/GC8FhE+1zePol0GhYgJv
	erlzk2aZCx+TXPf7WwIwbCsy3rKWU7asougvYZ8=
X-Google-Smtp-Source: ACcGV610ZaVFQaEy/QPqW0fDpy2RiDnpFeN8X01y1zrSR7s7jkVYmAZ9OrkDFQUW25vjPWRK2VQHqZ7O6v2UbA4Fsmk=
X-Received: by 2002:a63:f252:: with SMTP id
	d18-v6mr15677434pgk.2.1539600089650; 
	Mon, 15 Oct 2018 03:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <1538581223-13647-1-git-send-email-ankit.tarot@gmail.com>
	<b0446aaa-3f8a-54c1-539f-887f671b9cb5@gmail.com>
	<CAM_RqkOLurOJ7DSHwAeQ3OzXE4u-mVGDE02Vc5izuRgRU=SXEg@mail.gmail.com>
	<CAMKF1spEdZOse-9yh6f3ia+evHJ_+6OJni+FePF_jEDSXvE4vg@mail.gmail.com>
In-Reply-To: <CAMKF1spEdZOse-9yh6f3ia+evHJ_+6OJni+FePF_jEDSXvE4vg@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Mon, 15 Oct 2018 16:11:18 +0530
Message-ID: <CAM_RqkN1iDr=E8OK5dZWpbxNb722aU=q2gtWSPcsoCWnBLv_PA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] opencl-headers: Initial recipe for OpenCL headers
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
X-List-Received-Date: Mon, 15 Oct 2018 10:41:29 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raj,

On Sun, Oct 14, 2018 at 11:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Oct 6, 2018 at 1:49 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
> >
> > Hi Armin,
> >
> > On Thu, Oct 4, 2018 at 4:40 AM akuster808 <akuster808@gmail.com> wrote:
> > >
> > >
> > >
> > > On 10/03/2018 08:40 AM, Ankit Navik wrote:
> > > > Add generic recipe for OpenCL API headers.
> > > >
> > > > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > > > ---
> > > >  .../recipes-core/opencl-headers/opencl-headers_git.bb | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > >  create mode 100644 meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > > >
> > > > diff --git a/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > > > new file mode 100644
> > > > index 0000000..16bc247
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > > > @@ -0,0 +1,19 @@
> > > > +SUMMARY  = "OpenCL API Headers"
> > > > +DESCRIPTION = "OpenCL compute API headers from Khronos Group"
> > > > +LICENSE  = "CLOSED"
> > > There is a license file at the repo. Would adding a "Khronos" license be
> > > more appropriate?
> > >
> > > https://github.com/KhronosGroup/OpenCL-Headers/blob/master/LICENSE
> > >
> > > - armin
> >
> > I have tried adding "Khronos", but it was throwing QA error for
> > license. Hence kept it as closed.
> > Any other suggestion for license ?
> >
>
> Please add a template for this license into meta-oe/licenses and then
> reference it in relevant recipes.
Thanks for your suggestion, will incorporate in v2 patch.
>
> > Regards, Ankit
> > >
> > > > +LIC_FILES_CHKSUM = "file://CL/opencl.h;beginline=1;endline=27;md5=687394644e8c4ec4fd3d77f2f86bc042"
> > > > +SECTION = "base"
> > > > +
> > > > +S = "${WORKDIR}/git"
> > > > +SRCREV = "40c5d226c7c0706f0176884e9b94b3886679c983"
> > > > +SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git"
> > > > +
> > > > +do_configure[noexec] = "1"
> > > > +do_compile[noexec] = "1"
> > > > +
> > > > +do_install () {
> > > > +     install -d ${D}${includedir}/CL/
> > > > +     for f in ${S}/CL/*.h; do
> > > > +             install -m 0644 $f ${D}${includedir}/CL/
> > > > +     done
> > > > +}
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

