Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd19416.kasserver.com (dd19416.kasserver.com [85.13.139.185])
	by mail.openembedded.org (Postfix) with ESMTP id D9FB56969F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 14:56:53 +0000 (UTC)
Received: from [129.70.144.11] (hooge.TechFak.Uni-Bielefeld.DE [129.70.144.11])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id 4EEBA1841371
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 16:56:54 +0200 (CEST)
Message-ID: <519F7FA9.60100@herbrechtsmeier.net>
Date: Fri, 24 May 2013 16:56:41 +0200
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <3389668.90m8Qn9G8H@luxon> <20130524120750.GV32431@jama>
	<519F60B9.1020604@herbrechtsmeier.net> <5622796.kW1BjNgdNO@luxon>
In-Reply-To: <5622796.kW1BjNgdNO@luxon>
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
X-List-Received-Date: Fri, 24 May 2013 14:56:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 24.05.2013 15:03, schrieb Manuel Nickschas:
> On Friday 24 May 2013 14:44:41 Stefan Herbrechtsmeier wrote:
>
> Hi,
>
>>> It would be good to let CMake respect OE_QMAKE_PATH_* variables, so
> you
>>> can
>>> generate .cmake files with correct paths for target and in OE builds
>>> override them with OE_QMAKE_PATH_* values to use correct sysroot.
>> CMake offers find_xxx functions and CMAKE_FIND_ROOT_PATH to
> modify the
>> program, include and library paths.
>> Or you could use CMAKE_CURRENT_LIST_DIR in a cmake file to get the
> path
>> of the file.
>>
>> The problem is that its up to the developer to use this functions and
>> that CMake don't support a common way to model the dependencies like
> the
>> Requires field of pkg-config files.
>>
>>> The same for finding native host tools in
>>> OE_QMAKE_PATH_EXTERNAL_HOST_BINS.
>> The cmake.class overlays the machine sysroot over the native sysroot and
>> don't install any binaries into the machine sysroot. Thereby the
>> find_program function detects the binary in the native sysroot and all
>> the other find_xxx functions detect the include files and libraries in
>> the machine sysroot.
> Hm, no, that is not the issue. The issue is that Qt5 uses a fairly recent
> CMake feature where find_package and friends
What do you mean by friends?

>   look for a *Config.cmake file
> first, and then use that to set everything up. In case of Qt5, please have a
> look at the files Qt5 (the qtbase package) installs into the target sysroot, in
> /usr/lib/cmake/.
I don't use qt but have similar problems with other cmake projects.

> In particular, the issue is with
> $sysroot/usr/lib/cmake/Qt5Core/Qt5CoreConfigExtras.cmake:
>
> [...]
>      set_target_properties(Qt5::moc PROPERTIES
>          IMPORTED_LOCATION "/usr/bin/qt5/moc"
>      )
> [...]
>
> and similar for other host binaries such as rcc or qdbusxml2cpp (in
> Qt5DBus/Qt5DBusConfigExtras.cmake).
If they would use find_program they would get the correct path for moc.

> The path specified there is clearly wrong for cross-compiling, because it
> references the location in the target itself, without prepending the sysroot
> prefix. Thus, it won't find moc. In particular, it needs not even find the moc
> from the target sysroot, but from the native sysroot, as it's a host tool.
All paths in the target sysroot represents the path on the target. They 
should be
adapted via an variable or automatically detected during runtime.

> Unfortunately, I have no clue how the Qt5 build system ends up generating
> those paths; I assume it's not using CMake and find_program, but
> hardcodes the paths somewhere.
>
> One could probably patch this away, but then you'd end up with host-
> specific absolute paths inside the target, which will then break if you try to
> use them for compiling something inside the target.
You should prepend a variable or use find_program.


