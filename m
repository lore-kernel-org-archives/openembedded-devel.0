Return-Path: <net147@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id D6FAC76E70
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Apr 2016 11:57:43 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id gy3so11373055igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Apr 2016 04:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=SW2jxtq639QhbDjZOE2K1P6li9UvbKytC0yyzPFR7cs=;
	b=Bq9K9+WqCLTe+q3sx+WwTiDUXhf+FKIfI1lLJP7j49jzNaWWjUx5B7oF4ChkNO65c7
	nGOhRoMBRhoHytd5vBVhTojOQ03qEMOODSqJeR0CckXL69uV6O2EWXaTysIUWVGvdvq/
	64rYAKuDmos5k3CpZh8klMZKLy/l66Oj1q0FX0QUWYSr7oxkfqBeLhyw11GIkuP0cTAP
	oUhdM3RNgxEcgVVQsEslGzZAfNcYtKHWHti3mc/JKkefMWzcYQLUg1LeB3+Xu4kJk6dJ
	G8HEX5IwPXCzXwk7ijEkL5F/ThPH0vgo3TDu3rBLVDeLMx6ezEILOmb7k9Ops6PCV6Q2
	YYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=SW2jxtq639QhbDjZOE2K1P6li9UvbKytC0yyzPFR7cs=;
	b=hLcd2cZnxcMGsU9jLqlP8+gOmFQpBSwDx0Hh3MzzI44Nk6dxESTfrr0jz2sgcSYpF2
	M5Gl3A7iABr0DuEurEWhXejPl9hPdmFfjfIaF+THxqJPe/cV7Qhwc/AVDPLMqL1s9Ci5
	j5PklO0jzhjbPFINHZouVJ6M0vP5duFmG8YYJYjQP295/MIhRlGQ8DQfyAFIIg0fg8IA
	XKSZrDF/PNt5b42iX3OPCYziG+pWIAyCVQ9x7Cy5EgTSq/XHizYMYdqSQCMHaLZ44ziB
	0YeUu44DARfcGDysWuLQQbTUfzXAcf56Ck6+W82lVe9B32CO3dAj1mGbgeOjhC1iFFwN
	eAGw==
X-Gm-Message-State: AD7BkJI9CRTD7wPVXn2ho+y7A9PZz41khoXd4XB9xiA4xc2b2TGUelhoMDsVNV1XGI9OI0eaoLiqvTro8/3M4w==
MIME-Version: 1.0
X-Received: by 10.50.61.209 with SMTP id s17mr2994903igr.7.1460116664016; Fri,
	08 Apr 2016 04:57:44 -0700 (PDT)
Received: by 10.36.69.12 with HTTP; Fri, 8 Apr 2016 04:57:43 -0700 (PDT)
In-Reply-To: <6245F2E3-BAF0-4EE9-AF56-64706B0F8F43@gmail.com>
References: <6245F2E3-BAF0-4EE9-AF56-64706B0F8F43@gmail.com>
Date: Fri, 8 Apr 2016 21:57:43 +1000
Message-ID: <CANwerB1xTJ3D3x_zKSnYmc7HdCNJkxOkkKP++_vFCJNFP1C=vw@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-qt5: sdk, qtcreator and OE_QMAKE_ variables
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
X-List-Received-Date: Fri, 08 Apr 2016 11:57:45 -0000
Content-Type: text/plain; charset=UTF-8

Hi Jean-Francois,

On 8 April 2016 at 03:21, Jean-Francois Dagenais
<jeff.dagenais@gmail.com> wrote:
> Hi all!
>
> We use QtCreator on the developper desktop for much of our development. The
> target builds are made with a yocto sdk which we made using "populate_sdk" with
> qt4 included.
>
> Since we jump from native builds to targeted builds, I devised a way not to use
> the full sourcing of environment-setup-xyz.sh when invoking qtcreator. Doing so
> would mess up the native (desktop) builds and we'd have to stop and relaunch
> qtcreator many times per day. Not to mention the aggravation of not being in the
> right environment and not realizing it for while when switching tasks.
>
> We create a qtcreator "kit" composed of the yocto SDK's qmake, gcc and gdb. All
> that is missing then are the OE_QMAKE_xyz variables which are put into the qmake
> generated Makefiles. Using toolchain_create_sdk_env_script_append as a hook, I
> generate a text file with the OE_QMAKE_xyz variables pre-expanded in a format
> suitable of being copy/pasted in the "Batch Edit..." button of the build
> environment setup of qtcreator projects.
>
> Works pretty well. (Our targets were both x86_64 and x86 based). This was on
> fido with qt4. Now moving onto yocto's master branch and meta-qt5, I want to
> take it further and skip the whole copy/pasted env stuff. Which is an annoyance
> since we each need to copy/paste for each project we setup in qtcreator and are
> stored in the "volatile" .pro.user files.
>
> If it is the case that all what's missing are the pre-expansions of OE_QMAKE_
> variables, it seems like a simple task. I noticed the oe-device-extra.pri (from
> the "No such file or directory" error messages I get when using the SDK). So
> starting from the same sdk_env_script_append strategy, I create this file at the
> proper place. By inspecting the linux-oe-g++/qmake.conf and where it includes
> oe-device-extra.pri, I figured what the file should contain to properly set the
> QMake variables whith pre-expanded stuff (targeted items like
> arm-piko-linux-gnueabi-g++ etc.) and no longer rely on OE_QMAKE_xyz to be in the
> environment.
>
> This way I do NOT have to source the environment, the builds succeed and once
> deployed, they execute (still very early in testing tough).
>
> One more thing, we systematically relocate the SDK install to a path in the
> user's home. I am in the process of reviewing if there is "leakage" into either
> /opt/poky/x.y.z/... or my system.
>
> Does anyone have any insights, warning, suggestions regarding this strategy? It
> seems too easy and pretty to be true, I am thus weary. Perhaps this fits only
> our limited target scenarios?
>
>
> Thanks in advance!  Cheers!  /JFD

On recent versions of Qt Creator, you can edit the environment for a
kit rather than a project.

I have a script which sources the environment-setup script, greps the
environment-setup and environment-setup.d/qt5.sh scripts for the names
of variables that are assigned and then greps for those variables in
the output of the env command. The output is then pasted into the
environment for the kit in Qt Creator.

Regards,
Jonathan

