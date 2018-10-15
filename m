Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 32C4E60402
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 18:20:03 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id y8-v6so12429984qka.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 11:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4ZxFT34sfPJZuZhfJOOPj+Th5TmmxzEipWdFrBMCuNo=;
	b=YwinjLOu40kWcttkeqTkLPKymZiK05j6JbgkmpL9EIUEqTfcZUqGhRgT5OYvEx6jJ5
	Lr0S0Uk7Sqjz3cQ9sH4OSY1+tC8DetnQBBWdlBmKXb3hcOOuN7YanIjBV1eKpf3hBbYa
	Ixztnh1Zr0GF12d3S/qboYMfkZn0rb/vt5v2hwS6VaZrQgGPENZd/efHTXuWtpd08UYG
	vn+qmVkAPu4RfXF/64AKJmcybIouc5E/nHLt0/a08fjoq4AktfnqwvyaM/EEGfhwUglJ
	XHwBK6V1s5sXVjH90fCk3i64CoWz8w4oqfiC+ejkY0VfQ/yN+1OYWDeRhVZF4V4gL5Ne
	IkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4ZxFT34sfPJZuZhfJOOPj+Th5TmmxzEipWdFrBMCuNo=;
	b=NKgBz2ezKcaRe6OSuu1W14gt123RzK69bw8VFdgjzSm/yybOxLm42cZJepJ/HeInsJ
	4XCYGpO2ot55t0HC0TwO/BGTFOr7PJ6gubkcf4I9/67LUGbuyhU6hrUkdIIAVXQhDWsN
	lvkE/L4/I4L9lBq8uiGp+UecibSa/2M5jPVUk0941ZX4AKemVtMrrjvNNgALrXDNWArs
	IUFwJYBcnxtF8zgSUOhiLEQNPBylo4COm2eWQhFdieUjC5o9DCZL3xDUhtipHUy5OxBW
	dYYGlvK2vGQp5VVxGV1Q0TFfzHm7aZa6dSBTjNxQEtw55YdqvC7OazdY/cL3M/5QJ4AD
	ipKw==
X-Gm-Message-State: ABuFfogQytzVU+KCR2Bnpsm85RLW/iK75DGB9IexQ9ILe0BrrScDN+Sz
	JgWKqEucxrC9khAsGUZ34Y4i96Qzt7Mvl0O+q/M=
X-Google-Smtp-Source: ACcGV60qSszmdZRIGyjL5lWneIlqXNBd4IQKfLzDxo7IP3p2Z/2wzq0MMN/VZ6EWe23gLPUAlZW4TzqeBms5MrsLdYU=
X-Received: by 2002:a37:9d55:: with SMTP id
	g82-v6mr17166228qke.315.1539627603930; 
	Mon, 15 Oct 2018 11:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <1538581223-13647-1-git-send-email-ankit.tarot@gmail.com>
	<b0446aaa-3f8a-54c1-539f-887f671b9cb5@gmail.com>
	<CAM_RqkOLurOJ7DSHwAeQ3OzXE4u-mVGDE02Vc5izuRgRU=SXEg@mail.gmail.com>
	<CAMKF1spEdZOse-9yh6f3ia+evHJ_+6OJni+FePF_jEDSXvE4vg@mail.gmail.com>
	<20181015031245.GB7186@denix.org>
	<CAM_RqkPb0pFu57guB7gL5NLni-+pvdwqyLS2vL1rB8-q8Jbimg@mail.gmail.com>
	<20181015181410.GF7186@denix.org>
In-Reply-To: <20181015181410.GF7186@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Oct 2018 11:19:37 -0700
Message-ID: <CAMKF1srW5-fDXbsEsFYS3Dj1AAPCCNfEhVpeYzBod66jaZu=EA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 15 Oct 2018 18:20:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 15, 2018 at 11:14 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Mon, Oct 15, 2018 at 04:13:03PM +0530, Ankit Navik wrote:
> > Hi Denis,
> > On Mon, Oct 15, 2018 at 8:42 AM Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > On Sun, Oct 14, 2018 at 11:29:26AM -0700, Khem Raj wrote:
> > > > On Sat, Oct 6, 2018 at 1:49 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
> > > > >
> > > > > Hi Armin,
> > > > >
> > > > > On Thu, Oct 4, 2018 at 4:40 AM akuster808 <akuster808@gmail.com> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > On 10/03/2018 08:40 AM, Ankit Navik wrote:
> > > > > > > Add generic recipe for OpenCL API headers.
> > > > > > >
> > > > > > > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > > > > > > ---
> > > > > > >  .../recipes-core/opencl-headers/opencl-headers_git.bb | 19 +++++++++++++++++++
> > > > > > >  1 file changed, 19 insertions(+)
> > > > > > >  create mode 100644 meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > > > > > >
> > > > > > > diff --git a/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > > > > > > new file mode 100644
> > > > > > > index 0000000..16bc247
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > > > > > > @@ -0,0 +1,19 @@
> > > > > > > +SUMMARY  = "OpenCL API Headers"
> > > > > > > +DESCRIPTION = "OpenCL compute API headers from Khronos Group"
> > > > > > > +LICENSE  = "CLOSED"
> > > > > > There is a license file at the repo. Would adding a "Khronos" license be
> > > > > > more appropriate?
> > > > > >
> > > > > > https://github.com/KhronosGroup/OpenCL-Headers/blob/master/LICENSE
> > > > > >
> > > > > > - armin
> > > > >
> > > > > I have tried adding "Khronos", but it was throwing QA error for
> > > > > license. Hence kept it as closed.
> > > > > Any other suggestion for license ?
> > > > >
> > > >
> > > > Please add a template for this license into meta-oe/licenses and then
> > > > reference it in relevant recipes.
> > > >
> > > > > Regards, Ankit
> > > > > >
> > > > > > > +LIC_FILES_CHKSUM = "file://CL/opencl.h;beginline=1;endline=27;md5=687394644e8c4ec4fd3d77f2f86bc042"
> > > > > > > +SECTION = "base"
> > > > > > > +
> > > > > > > +S = "${WORKDIR}/git"
> > > > > > > +SRCREV = "40c5d226c7c0706f0176884e9b94b3886679c983"
> > > > > > > +SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git"
> > > > > > > +
> > > > > > > +do_configure[noexec] = "1"
> > > > > > > +do_compile[noexec] = "1"
> > > > > > > +
> > > > > > > +do_install () {
> > > > > > > +     install -d ${D}${includedir}/CL/
> > > > > > > +     for f in ${S}/CL/*.h; do
> > > > > > > +             install -m 0644 $f ${D}${includedir}/CL/
> > >
> > > Single file install? Not very optimized...
>
> > Its not a single file, Installing all the header files.
>
> It's a single file install in a for loop, hence my comment about being
> unoptimal. Why not use "cp *.h"?

 I agree its suboptimal use here. May be

install [OPTION]... -t DIRECTORY SOURCE

could be tamed to make it better.
however cp messes the file permissions up if not used with right opts.
So I would not prefer it unless used with right
options to respect the file perms. Install does it correctly,

