Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id CC54C609B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 08:47:12 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so14340460pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 01:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=O7WrD0McTyOO6HzlE6iUCTc3hF5hu+twRp36CffBwGc=;
	b=XWlUd1cz1gB57hcYgOEWNr59iL2ZcXxaC6fmQKKlzTihXALCQalhTIoFeRa8TQ10kA
	OSXdGNqFls94PwpcWiENhMSzWU6wMa/JSVFfMRR4K7CRWBpwsLmFRHot8X+q/p0UgMhn
	4Oe/3quHuDWvVTT+Oh0mhMRxFMkXywa9eWXWmi5u2bAnm+ThCojwNeZpWOLVb+BRDEpk
	S4PSVmVThbc/K1E1UEBncHou4Z3eKL+cq87KDCphPkXe8KrAq1Uxq0qqxQGoFR6VWxUc
	ct6M8iMO+dgCuXNRR4ZArQVdOiA/tSs7N7/bNvzQLbvOLN0aS7tkEyNjeT4tqC5+Z9o8
	Hmkg==
MIME-Version: 1.0
X-Received: by 10.70.89.199 with SMTP id bq7mr13365546pdb.168.1432284433647;
	Fri, 22 May 2015 01:47:13 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Fri, 22 May 2015 01:47:13 -0700 (PDT)
In-Reply-To: <22737241.NHZM3DgOrk@peggleto-mobl.ger.corp.intel.com>
References: <20150520212053.62A5E5040E@opal.openembedded.org>
	<CALbNGRTLxNG6936gZ1N_W2tpOpAtO8oDN7hnm=kZs-GPoVMe-A@mail.gmail.com>
	<22737241.NHZM3DgOrk@peggleto-mobl.ger.corp.intel.com>
Date: Fri, 22 May 2015 10:47:13 +0200
Message-ID: <CALbNGRRqNaq-Wc9F=4nxJ6MNb9zxWer_nRp74tt7Ta5Mng9Y-w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] Shiqun Lin : sanity.bbclass: improve the sanity check for PATH and BBPATH
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
X-List-Received-Date: Fri, 22 May 2015 08:47:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2015 at 10:41 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 22 May 2015 07:15:36 Andreas M=C3=BCller wrote:
>> On Wed, May 20, 2015 at 11:20 PM,  <git@git.openembedded.org> wrote:
>> > Module: openembedded-core.git
>> > Branch: master-next
>> > Commit: b6a23572b8f14e27d4341892b9069e7cac1e9c14
>> > URL:
>> > http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=3D=
b6a23572b
>> > 8f14e27d4341892b9069e7cac1e9c14
>> >
>> > Author: Shiqun Lin <Shiqun.Lin@windriver.com>
>> > Date:   Wed Jan  7 15:00:31 2015 +0800
>> >
>> > sanity.bbclass: improve the sanity check for PATH and BBPATH
>> >
>> > Build fails if "./" is in the PATH
>> >
>> > To reproduce the issue:
>> >   $ export PATH=3D"./:$PATH"
>> >   $ make -C build-tools elfutils
>> >
>> >   Error: ./ld: unrecognized option '--sysroot=3D/'
>> >
>> > Signed-off-by: Shiqun Lin <Shiqun.Lin@windriver.com>
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >
>> > ---
>> >
>> >  meta/classes/sanity.bbclass | 8 ++++----
>> >  1 file changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> > index fc8c980..e738110 100644
>> > --- a/meta/classes/sanity.bbclass
>> > +++ b/meta/classes/sanity.bbclass
>> >
>> > @@ -653,9 +653,9 @@ def check_sanity_version_change(status, d):
>> >              status.addresult("You have a 32-bit libc, but no 32-bit
>> >              headers.  You must install the 32-bit libc headers.\n")>
>> >      bbpaths =3D d.getVar('BBPATH', True).split(":")
>> >
>> > -    if ("." in bbpaths or "" in bbpaths) and not status.reparse:
>> >
>> > +    if ("." in bbpaths or "./" in bbpaths or "" in bbpaths) and not
> status.reparse:
>> >          status.addresult("BBPATH references the current directory, ei=
ther
>> >          through "    \>
>> > -                "an empty entry, or a '.'.\n\t This is unsafe and mea=
ns
>> > your "\ +                "an empty entry, a './' or a '.'.\n\t This is
>> > unsafe and means your "\>
>> >                  "layer configuration is adding empty elements to
>> >                  BBPATH.\n\t "\
>> >                  "Please check your layer.conf files and other BBPATH =
"
>> >                      \
>> >                  "settings to remove the current working directory "
>> >                      \
>> >
>> > @@ -693,8 +693,8 @@ def check_sanity_everybuild(status, d):
>> >      sanity_check_conffiles(status, d)
>> >
>> >      paths =3D d.getVar('PATH', True).split(":")
>> >
>> > -    if "." in paths or "" in paths:
>> > -        status.addresult("PATH contains '.' or '' (empty element), wh=
ich
>> > will break the build, please remove this.\nParsed PATH is " + str(path=
s)
>> > + "\n") +    if "." in paths or "./" in paths or "" in paths:
>> > +        status.addresult("PATH contains '.', './' or '' (empty elemen=
t),
>> > which will break the build, please remove this.\nParsed PATH is " +
>> > str(paths) + "\n")>
>> >      # Check that the DISTRO is valid, if set
>> >      # need to take into account DISTRO renaming DISTRO
>> >
>> > --
>>
>> The PATH part is problematic: My system (fedora 22) or my user - have
>> not yet checked where it comes from - sets './' in PATH. I am not
>> happy risking fallout on my system for yocto's sanity.
>
> FWIW, it's not in PATH for my account on F21.
>
> Cheers,
> Paul
FWIW2 (forgive me - I was without coffee): Have F20 here not F22

Andreas

