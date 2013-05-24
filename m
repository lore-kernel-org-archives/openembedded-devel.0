Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd19416.kasserver.com (dd19416.kasserver.com [85.13.139.185])
	by mail.openembedded.org (Postfix) with ESMTP id 3D77A61F47
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 12:44:56 +0000 (UTC)
Received: from [129.70.144.11] (hooge.TechFak.Uni-Bielefeld.DE [129.70.144.11])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id 483781841371
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 14:44:56 +0200 (CEST)
Message-ID: <519F60B9.1020604@herbrechtsmeier.net>
Date: Fri, 24 May 2013 14:44:41 +0200
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <3389668.90m8Qn9G8H@luxon> <20130524120750.GV32431@jama>
In-Reply-To: <20130524120750.GV32431@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] Problems with Qt5 and CMake
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
X-List-Received-Date: Fri, 24 May 2013 12:44:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 24.05.2013 14:07, schrieb Martin Jansa:
> On Fri, May 24, 2013 at 01:34:40PM +0200, Manuel Nickschas wrote:
>> Hi,
>>
>> we're trying to deploy a Qt5-based piece of software on a Yocto system (I
>> hope this is on topic for this mailing list as well; the issue I'm about to
>> describe should occur on pure OE too). As build system for this software, we
>> use CMake.
>>
>> We've added meta-qt5 (master) and successfully installed qtbase on the
>> platform. However, there is a serious issue if one tries to cross-compile
>> CMake-based software against the resulting Qt5 installation.
>>
>> As you probably know, Qt5 ships its own support for CMake in the form of a
>> bunch of Qt5$ModuleConfig.cmake files somewhere in /usr/lib/cmake.
>> These files are found with a find_package(Qt5Core) call and set everything
>> needed for building against the Qt5 installation. The problem is, that those
>> files contain absolute paths to both the libraries and the host tools for
>> building (such as moc, rcc etc).
>>
>> meta-qt5 actually installs two sets of CMake files for Qt5, one in the target
>> sysroot (from the qtbase package) and one in the native sysroot (from the
>> qtbase-native package). A recipe inheriting cmake.bbclass will find the ones
>> in the target sysroot.
>>
>> The issue is that these files hardcode the paths *on the target*, i.e. they try
>> to find the host tools in /usr/bin/qt5/ and the libraries in /usr/lib/. Obviously,
>> this fails when trying to build against those, because the target sysroot path
>> isn't prepended.
>>
>> If I remove the CMake files from the target sysroot (could not figure out how
>> to force it otherwise in my recipe), the ones from the native sysroot are found
>> and used instead. These actually contain proper paths into the native
>> sysroot, so the build tools - like moc - are found and the program compiles
>> successfully - but it can't link, because it then tries to link to the libraries in
>> the native sysroot. And those are, of course, built for the wrong architecture.
>>
>> I'm at a loss as of how to properly fix this issue. What we need is a set of
>> CMake config files for Qt5 that point to the tools in the native sysroot and the
>> libraries in the target sysroot. However, we probably wouldn't want to deploy
>> them as such on the target (because there we want to actually point to both
>> tools and libraries in /usr for the target), and we probably also wouldn't want
>> to do it in the native sysroot (because then we couldn't build native things
>> that like to link to the native libraries).
>>
>> Of course, I could just copy the CMake files from Qt5, patch them
>> accordingly and ship them as part of my project; but bundling such things is
>> evil and I would really like to avoid this.
>>
>> So now I'm wondering, are people here aware of that issue and have a plan
>> or idea on how to fix this?
>>
>> https://bugreports.qt-project.org/browse/QTBUG-28922 might be relevant,
>> although I am not sure if this is describing a similar issue and if it applies to
>> the multiple sysroot approach Yocto uses.
>>
>> Thank you for any pointers.
> I don't have any component which uses CMake and Qt5, so I haven't tested
> this, but .prl, .la and .pc files were also generated with wrong paths,
> check those patches in qtbase.
Pkg-config use /PKG_CONFIG_SYSROOT_DIR to modify the include and library 
paths and the files are manual fixed to only contain the path on the 
machine./

> It would be good to let CMake respect OE_QMAKE_PATH_* variables, so you can
> generate .cmake files with correct paths for target and in OE builds
> override them with OE_QMAKE_PATH_* values to use correct sysroot.
CMake offers find_xxx functions and CMAKE_FIND_ROOT_PATH to modify the 
program, include and library paths.
Or you could use CMAKE_CURRENT_LIST_DIR in a cmake file to get the path 
of the file.

The problem is that its up to the developer to use this functions and 
that CMake don't support a common way to model the dependencies like the 
Requires field of pkg-config files.

> The same for finding native host tools in
> OE_QMAKE_PATH_EXTERNAL_HOST_BINS.
The cmake.class overlays the machine sysroot over the native sysroot and 
don't install any binaries into the machine sysroot. Thereby the 
find_program function detects the binary in the native sysroot and all 
the other find_xxx functions detect the include files and libraries in 
the machine sysroot.


