Received: from exchge01.hosted.kanobe.net ([76.191.73.10])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jfaith@soundmetrics.com>) id 1OqXM3-0007QS-F0
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 22:22:55 +0200
Received: from [192.168.10.133] (75.147.191.205) by exchge-01.knbe.kanobe.net
	(76.191.73.11) with Microsoft SMTP Server id 14.0.702.0;
	Tue, 31 Aug 2010 13:20:54 -0700
Message-ID: <4C7D6411.6030407@soundmetrics.com>
Date: Tue, 31 Aug 2010 13:20:33 -0700
From: John Faith <jfaith@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17
	(Ubuntu-1.1.17+nobinonly-0ubuntu1)
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <AANLkTimq+M2qtGzz1keuPBXFfYi-Qw9fPz2v4XXCd0JT@mail.gmail.com>
In-Reply-To: <AANLkTimq+M2qtGzz1keuPBXFfYi-Qw9fPz2v4XXCd0JT@mail.gmail.com>
X-SA-Exim-Connect-IP: 76.191.73.10
X-SA-Exim-Mail-From: jfaith@soundmetrics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Boost 1.41 seems to have build issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Aug 2010 20:22:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

J. L. wrote:
> When I bummed boost to the 1.41 version I noticed during building it
> did not build in the normal manner and displayed a bunch of warning
> though did not fail to build. Seems like it should not have so many
> errors or inability to find libraries. Could be my inexperience
> talking. Hope someone can explain why this isnt bad if it isnt but to
> me an error is an error, and would cause other issues once used on the
> image possibly. This is not the full message just a clip of it:
>
> NOTE:   /usr/lib/Boost.cmake
> NOTE:   /usr/share/boost-1.41.0/cmake/BoostConfig.cmake
> NOTE:   /usr/share/boost-1.41.0/cmake/BoostConfigVersion.cmake
> NOTE: Multiple libraries (libboost_date_time-mt-d.so.1.41.0,
> libboost_date_time-mt.so.1.41.0) found and LEAD_SONAME not defined
> NOTE: Multiple libraries (libboost_filesystem-mt.so.1.41.0,
> libboost_filesystem-mt-d.so.1.41.0) found and LEAD_SONAME not defined
> NOTE: Multiple libraries (libboost_graph-mt.so.1.41.0,
> libboost_graph-mt-d.so.1.41.0) found and LEAD_SONAME not defined
> NOTE: Multiple libraries (libboost_iostreams-mt-d.so.1.41.0,
> libboost_iostreams-mt.so.1.41.0) found and LEAD_SONAME not defined
> NOTE: Multiple libraries (libboost_program_options-mt.so.1.41.0,
> libboost_program_options-mt-d.so.1.41.0) found and LEAD_SONAME not
> defined
> NOTE: Multiple libraries (libboost_python-mt-d.so.1.41.0,
> libboost_python-mt.so.1.41.0) found and LEAD_SONAME not defined
> NOTE: Multiple libraries (libboost_regex-mt-d.so.1.41.0,
> libboost_regex-mt.so.1.41.0) found and LEAD_SONAME not defined
> NOTE: Multiple libraries (libboost_wserialization-mt-d.so.1.41.0,
> libboost_serialization-mt-d.so.1.41.0,
> libboost_wserialization-mt.so.1.41.0,
> libboost_serialization-mt.so.1.41.0) found and LEAD_SONAME not defined
> NOTE: Multiple libraries (libboost_signals-mt-d.so.1.41.0,
> libboost_signals-mt.so.1.41.0) found and LEAD_SONAME not defined
> NOTE: Multiple libraries (libboost_system-mt-d.so.1.41.0,
> libboost_system-mt.so.1.41.0) found and LEAD_SONAME not defined
> NOTE: Multiple libraries (libboost_unit_test_framework-mt-d.so.1.41.0,
> libboost_unit_test_framework-mt.so.1.41.0) found and LEAD_SONAME not
> defined
> NOTE: Multiple libraries (libboost_thread-mt.so.1.41.0,
> libboost_thread-mt-d.so.1.41.0) found and LEAD_SONAME not defined
> NOTE: Multiple libraries (libboost_prg_exec_monitor-mt-d.so.1.41.0,
> libboost_wave-mt-d.so.1.41.0, libboost_prg_exec_monitor-mt.so.1.41.0,
> libboost_wave-mt.so.1.41.0) found and LEAD_SONAME not defined
> NOTE: Couldn't find shared library provider for libstdc++.so.6
> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>
>   
<snip>
> ERROR: QA Issue with boost-date-time: non -dev package contains
> symlink .so: boost-date-time path
> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-date-time/usr/lib/libboost_date_time-mt.so'
> ERROR: QA Issue with boost-date-time: non -dev package contains
> symlink .so: boost-date-time path
> '/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-date-time/usr/lib/libboost_date_time-mt-d.so'
>
>   
<snip>


Which machine are you building for?

Not sure about the errors you saw, but when I tried to build for 
omap3evm, I hit a completely different problem:

cd 
/home/jfaith/oe/arago-tmp/work/armv7a-none-linux-gnueabi/boost-1.41.0-r8.1/boost-1.41.0.cmake0/libs/date_time/src 
&& /home/jfaith/oe/arago-tmp/sysroots/i686-linux/usr/bin/cmake -E 
cmake_link_script CMakeFiles/boost_date_time-mt-static.dir/link.txt 
--verbose=1
CMAKE_AR-NOTFOUND cr ../../../lib/libboost_date_time-mt.a  
CMakeFiles/boost_date_time-mt-static.dir/gregorian/greg_month.cpp.o 
CMakeFiles/boost_date_time-mt-static.dir/gregorian/greg_weekday.cpp.o 
CMakeFiles/boost_date_time-mt-static.dir/gregorian/date_generators.cpp.o
Error running link command: No such file or directory
make[2]: *** [lib/libboost_date_time-mt.a] Error 2

,
John




