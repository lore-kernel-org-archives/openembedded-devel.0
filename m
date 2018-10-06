Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0F56271A74
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Oct 2018 08:49:38 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p25-v6so7887191pli.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Oct 2018 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q9cU40Mv1P6CpgBkHzj0mO6o4oiC0tnmc2hOs38aFsA=;
	b=HzF7WTZP+r8SEZqJ3UPXDc2Clg5E/OAaH4UR+cRU8drmDLhmTrbLDQkvB3sgByaXPC
	dYu/ZtJDNnA6tn5wCLN24vcwrVC5FOdhvuEpWjrFxyaBPJaP87Gj4MNoRQwRtlk3istG
	RFN5cHPII1qtV/9lnTH50u4Jb99rUiOGzA19jnaOzEMaGM4dadQmxuiOBPHz4liVAuli
	rdAmM0EhqeaDdj0FmlTgvfBA+mvSLfd7RR2ykN350JPgzdFDPy4VIEaWLwiDfmRMpmoc
	6Q7wcpTMHtj/5pxQokovQFgunFpuffQFfEqkYkA6ILYQkRlK45VVSwq0lM+sxLhO2uGk
	hd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q9cU40Mv1P6CpgBkHzj0mO6o4oiC0tnmc2hOs38aFsA=;
	b=HJZJZxnDq7/iHpYk9nzcB6Nn+k13RRovWWr6QOUWswkyc5AvQLUzLDh1vqNMdx+KmD
	Q7Miq0tsm/9FsoWKeaY88PBu0CYfa0J40fhJjkHkM96b7Ug4QTKzC6KpnbX2RPFL3/Eu
	a2CIT359mu5FX3OqxM339zWsVB15LorgLsLp1xeR9HmZlzMFj/gjGjsvcwzsge4sT7Pp
	JA+GhAc09n9EyeGW0dv+m7qT/fXuq22A43Ho/lrr89P59IKjIq6dBw2RMtSVbKlHgBD6
	DH2N1fXLiRDMaY0N+TLW0nYFVPiZ88+D09eHk1hjUadpjzxtLloNNpIKmwznSX1mQYEf
	sQWQ==
X-Gm-Message-State: ABuFfoj9RvxAolyXpELrkL8JDqjtI3YH2ilC8+JYlv55dPiCTiuk87Zr
	3Wtcq3FzFEXXiMs9JZmwukeFBT+8wo4F+xiBKfg=
X-Google-Smtp-Source: ACcGV63xY3eIFl1yZXbq5Rwfz7OjNhcMEH3kyCE7HmP8bwFUkP0NAfEeBL/BzB75JUTugbhhJZQOFOXFoO7obvnQQZA=
X-Received: by 2002:a17:902:b03:: with SMTP id
	3-v6mr7561346plq.141.1538815780108; 
	Sat, 06 Oct 2018 01:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <1538581223-13647-1-git-send-email-ankit.tarot@gmail.com>
	<b0446aaa-3f8a-54c1-539f-887f671b9cb5@gmail.com>
In-Reply-To: <b0446aaa-3f8a-54c1-539f-887f671b9cb5@gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Sat, 6 Oct 2018 14:19:28 +0530
Message-ID: <CAM_RqkOLurOJ7DSHwAeQ3OzXE4u-mVGDE02Vc5izuRgRU=SXEg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
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
X-List-Received-Date: Sat, 06 Oct 2018 08:49:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Armin,

On Thu, Oct 4, 2018 at 4:40 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 10/03/2018 08:40 AM, Ankit Navik wrote:
> > Add generic recipe for OpenCL API headers.
> >
> > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > ---
> >  .../recipes-core/opencl-headers/opencl-headers_git.bb | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> >
> > diff --git a/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > new file mode 100644
> > index 0000000..16bc247
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY  = "OpenCL API Headers"
> > +DESCRIPTION = "OpenCL compute API headers from Khronos Group"
> > +LICENSE  = "CLOSED"
> There is a license file at the repo. Would adding a "Khronos" license be
> more appropriate?
>
> https://github.com/KhronosGroup/OpenCL-Headers/blob/master/LICENSE
>
> - armin

I have tried adding "Khronos", but it was throwing QA error for
license. Hence kept it as closed.
Any other suggestion for license ?

Regards, Ankit
>
> > +LIC_FILES_CHKSUM = "file://CL/opencl.h;beginline=1;endline=27;md5=687394644e8c4ec4fd3d77f2f86bc042"
> > +SECTION = "base"
> > +
> > +S = "${WORKDIR}/git"
> > +SRCREV = "40c5d226c7c0706f0176884e9b94b3886679c983"
> > +SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git"
> > +
> > +do_configure[noexec] = "1"
> > +do_compile[noexec] = "1"
> > +
> > +do_install () {
> > +     install -d ${D}${includedir}/CL/
> > +     for f in ${S}/CL/*.h; do
> > +             install -m 0644 $f ${D}${includedir}/CL/
> > +     done
> > +}
>

