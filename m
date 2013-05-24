Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id E6AD86A532
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 13:15:17 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id n12so6125769oag.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 06:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=kQNA0efCoy7MSZg9nAGJgYfOMsn1f3MiRmke2rYfhhs=;
	b=A6SseZ14HMhUxvEryCoHFUymQ7re9fGoc8BAXCxT27gnQLmjjDGK29I0ObWyooGd1B
	fXK+0ChDY1oTIJB5MC0dumRDLdJAezI6Y6dryQZBNgjExnrxgeOAZTjvAS3D8rhPbVoJ
	7/uGTx8RxngYwTc29zy1RlgNIZVg59riVqZDNARePB3WOzZ717/O/O8/XGv+YKf6im9K
	AvR2WDAEgQBEaETGIgXZjxXeu78UpOe6S9fz/iwqUiK6vNTJjS5oIbPQlo0qfEMOOEOb
	eTxv//PZT86Sr1GA+52qJmpGb5VriIheIdTwVqlc2S2r32Bu5KQj73TFXLBaeC9ktLHw
	lG1w==
MIME-Version: 1.0
X-Received: by 10.182.199.106 with SMTP id jj10mr11703897obc.45.1369401318407; 
	Fri, 24 May 2013 06:15:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Fri, 24 May 2013 06:15:18 -0700 (PDT)
In-Reply-To: <3360048.L8lNidcH0T@luxon>
References: <3360048.L8lNidcH0T@luxon>
Date: Fri, 24 May 2013 10:15:18 -0300
X-Google-Sender-Auth: ooN_rC-qnYpwhimh2aMya9PT2Us
Message-ID: <CAP9ODKq3_R3T17h05_7=vm+UCKYBqJfwkBB6GT5PiNwjUuUVpg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] Qt5 and CMake in OE/Yocto
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
X-List-Received-Date: Fri, 24 May 2013 13:15:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 24, 2013 at 7:04 AM, Manuel Nickschas <
manuel.nickschas@bmw-carit.de> wrote:

> we're trying to deploy a Qt5-based piece of software on a Yocto system (I
> hope this is on topic for this mailing list as well; the issue I'm about to
> describe should occur on pure OE too). As build system for this software,
> we
> use CMake.
>
> We've added meta-qt5 (master) and successfully installed qtbase on the
> platform. However, there is a serious issue if one tries to cross-compile
> CMake-based software against the resulting Qt5 installation.
>

\m/ nice!


> As you probably know, Qt5 ships its own support for CMake in the form of a
> bunch of Qt5$ModuleConfig.cmake files somewhere in /usr/lib/cmake.
> These files are found with a find_package(Qt5Core) call and set everything
> needed for building against the Qt5 installation. The problem is, that
> those
> files contain absolute paths to both the libraries and the host tools for
> building (such as moc, rcc etc).
>
> meta-qt5 actually installs two sets of CMake files for Qt5, one in the
> target
> sysroot (from the qtbase package) and one in the native sysroot (from the
> qtbase-native package). A recipe inheriting cmake.bbclass will find the
> ones
> in the target sysroot.
>
> The issue is that these files hardcode the paths *on the target*, i.e.
> they try
> to find the host tools in /usr/bin/qt5/ and the libraries in /usr/lib/.
> Obviously,
> this fails when trying to build against those, because the target sysroot
> path
> isn't prepended.
>
> If I remove the CMake files from the target sysroot (could not figure out
> how
> to force it otherwise in my recipe), the ones from the native sysroot are
> found
> and used instead. These actually contain proper paths into the native
> sysroot, so the build tools - like moc - are found and the program compiles
> successfully - but it can't link, because it then tries to link to the
> libraries in
> the native sysroot. And those are, of course, built for the wrong
> architecture.
>
> I'm at a loss as of how to properly fix this issue. What we need is a set
> of
> CMake config files for Qt5 that point to the tools in the native sysroot
> and the
> libraries in the target sysroot. However, we probably wouldn't want to
> deploy
> them as such on the target (because there we want to actually point to both
> tools and libraries in /usr for the target), and we probably also wouldn't
> want
> to do it in the native sysroot (because then we couldn't build native
> things
> that like to link to the native libraries).
>
> Of course, I could just copy the CMake files from Qt5, patch them
> accordingly and ship them as part of my project; but bundling such things
> is
> evil and I would really like to avoid this.
>
> So now I'm wondering, are people here aware of that issue and have a plan
> or idea on how to fix this?
>
> https://bugreports.qt-project.org/browse/QTBUG-28922 might be relevant,
> although I am not sure if this is describing a similar issue and if it
> applies to
> the multiple sysroot approach Yocto uses.
>

Martin has been the main drive force in the Qt5 work but he seems to focus
in qmake projects. I didn't yet start moving to Qt5 (I use CMake a lot) so
didn't look at the issue yet.

The best way to fix it seems to change the CMake modules (in Qt5) to use
the environment variables to grasp the need paths. This way, we can reuse
the qmake_base class and get it properly set I think.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

