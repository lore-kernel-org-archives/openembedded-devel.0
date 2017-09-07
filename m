Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id AB18071A32
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 11:15:34 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id v19so617498ite.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 04:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8XytmeTETfcTFMtQqg5WHMrlpjoRMZOzrAKHEtlvNRQ=;
	b=a51LFUSx8lRFpQz7AInPzoaiwsvub3PCbqaY8oufHST4F5FQ9Zlm6zbug9YMYtcwGC
	QYQkn6bpfBBlT63nOePi2g4DKAML+5bj84MH6W+7B6hkXZ/Tb66wpB089vTq+AFRGIO5
	LhLUHbJZOFNOGn2s3kNA90VPr9wE+EpQX3+83v4jhdOLVUoe3AsHweQEntJrQMfbEiaf
	bK+OE0MEaut0hCRdVpzRzilFCA73RGqv4/RbChNuEaTwlR2Eju8uMXQB+prSC/t55Vng
	cRi/XeKY3o0kLoM6OxoCP4iitok/zfV2XXYGmjSMZLnP21sNmrC/2YpXyGay/Lv2vdFO
	QG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8XytmeTETfcTFMtQqg5WHMrlpjoRMZOzrAKHEtlvNRQ=;
	b=EEngsy693bdejpXGfwz1pz5Ctkk8/Xo9RwGvTrBsZiUweHL2SO/eLKnQ3WH7+xU+mp
	VPmkjyCtX15FotpzEioroEe9ui1krl00zLYCf9bBy7IVjg+7nrJGDXw+PkI/vzY55lSq
	n2QQ0uAgtW26rkiw+IH66AN+zk1tfRXl/sEDHreMnvdE+d2+i7N4yjjnKAoP0bClVtpy
	lxLIuA7QE3CFlyxid33nv0W8L55M8DxRH9f7K7+kG3qfv8Z/XNYcC7wH+hMR3ZR0xsWq
	EVw+ueVzHplkXmSb4+M7arP1ZAKLiW9FMR5w/S9CODwpQkGUrEOqsat9ZGbGEXInU3uj
	M/pQ==
X-Gm-Message-State: AHPjjUjfqPceo+YoKCP9ddgsFrqXAe7s1bn790/zAdlcfhWI7DDj0uFN
	73CPFNg2VSDVjmanfSREHQMZzg/bEZAw
X-Google-Smtp-Source: ADKCNb5XwSGYxDQHVq4wv5MDLTEELw5HRGx6F2KsLhJP1nKo3QuxZNibFEfMR3/QhVpNVgf7HZP/+L4hwjiwodKrJU4=
X-Received: by 10.36.143.195 with SMTP id k186mr3066324itd.88.1504782935755;
	Thu, 07 Sep 2017 04:15:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Thu, 7 Sep 2017 04:15:15 -0700 (PDT)
In-Reply-To: <CAFbHwiQgzwPctvRJ5bDQKzjDGZx9XyvABU2Ldbew_OPNCELWmA@mail.gmail.com>
References: <20170907091744.27071-1-willn@resin.io>
	<CA+chaQc=8OV73nEFd2zhQ+7kGaEB0zAki5SJ9_342JmU0AgX4Q@mail.gmail.com>
	<CAFbHwiQgzwPctvRJ5bDQKzjDGZx9XyvABU2Ldbew_OPNCELWmA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Sep 2017 12:15:15 +0100
Message-ID: <CAJTo0LbX7z9vZt98r6-KNQJGauq8G3+++8z2cY0G2kz7NS9LBA@mail.gmail.com>
To: Will Newton <will.newton@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Will Newton <willn@resin.io>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Thu, 07 Sep 2017 11:15:34 -0000
Content-Type: text/plain; charset="UTF-8"

This class is in oe-core, so should go do openembedded-core@ not -devel@.

Ross

On 7 September 2017 at 10:20, Will Newton <will.newton@gmail.com> wrote:

> On Thu, Sep 7, 2017 at 10:18 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > Wrong ML
>
> I appreciate you taking the time to craft this response, but it isn't
> very helpful to me.
>
> > On Thu, Sep 7, 2017 at 11:17 AM, Will Newton <will.newton@gmail.com>
> wrote:
> >>
> >> The previous logic applied a regex to TUNE_FEATURES which could
> >> set the GOARM value to 7 incorrectly, for example when dealing
> >> with an arm1176 core. Simplify to check for the presence of
> >> "armv7a" instead. At the same time add a check for "armv6" and
> >> set GOARM to 6 in that case.
> >>
> >> Signed-off-by: Will Newton <willn@resin.io>
> >> ---
> >>  meta/classes/goarch.bbclass | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> >> index 4a5b2ec..35f2987 100644
> >> --- a/meta/classes/goarch.bbclass
> >> +++ b/meta/classes/goarch.bbclass
> >> @@ -38,8 +38,11 @@ def go_map_arch(a, d):
> >>
> >>  def go_map_arm(a, f, d):
> >>      import re
> >> -    if re.match('arm.*', a) and re.match('arm.*7.*', f):
> >> -        return '7'
> >> +    if re.match('arm.*', a):
> >> +        if 'armv7a' in f:
> >> +            return '7'
> >> +        elif 'armv6' in f:
> >> +            return '6'
> >>      return ''
> >>
> >>  def go_map_os(o, d):
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

