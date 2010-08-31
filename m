Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OqWV3-0004d9-6u
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 21:28:12 +0200
Received: by wyg36 with SMTP id 36so7674667wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 12:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=3g2C2CDoBQu45pbNmpz2cssLGJR7MDIxHHGh8tASp0w=;
	b=NtMebyAzDBfVUUk27LN/adRTXiZJxiScspQjOxBbICQkDE08d0RwhMeqhPl0QU4v41
	cyZa+n1bg9K+XJJ46QmsqLAq4KXuIQsIgze5N1msofn0JAFmq9Lpy7O6Gx9gTtJBfA3z
	L+AV+y0n1anp34bzYEFVWHlPntrEF8ZoMrWY0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=dFiaelDp3cYzW+0d5pwUEj2j+++6UQtASH/9SZrvu9OhzSFKlJTg661xlsBEdzAc7K
	7FtX2SVud9Y4kFOXsSDJpZ/UdgpvZzx4PkqnH+VFOdCon/BYJN601/Hj/6v9MfLjTCUw
	WGVysFr+oZOX+BDJbwOtzjWRFtnhfA48+K0T4=
MIME-Version: 1.0
Received: by 10.227.27.214 with SMTP id j22mr6122391wbc.72.1283282851646; Tue,
	31 Aug 2010 12:27:31 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Tue, 31 Aug 2010 12:27:31 -0700 (PDT)
Date: Tue, 31 Aug 2010 12:27:31 -0700
Message-ID: <AANLkTimq+M2qtGzz1keuPBXFfYi-Qw9fPz2v4XXCd0JT@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	"General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Boost 1.41 seems to have build issues
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
X-List-Received-Date: Tue, 31 Aug 2010 19:28:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

When I bummed boost to the 1.41 version I noticed during building it
did not build in the normal manner and displayed a bunch of warning
though did not fail to build. Seems like it should not have so many
errors or inability to find libraries. Could be my inexperience
talking. Hope someone can explain why this isnt bad if it isnt but to
me an error is an error, and would cause other issues once used on the
image possibly. This is not the full message just a clip of it:

NOTE:   /usr/lib/Boost.cmake
NOTE:   /usr/share/boost-1.41.0/cmake/BoostConfig.cmake
NOTE:   /usr/share/boost-1.41.0/cmake/BoostConfigVersion.cmake
NOTE: Multiple libraries (libboost_date_time-mt-d.so.1.41.0,
libboost_date_time-mt.so.1.41.0) found and LEAD_SONAME not defined
NOTE: Multiple libraries (libboost_filesystem-mt.so.1.41.0,
libboost_filesystem-mt-d.so.1.41.0) found and LEAD_SONAME not defined
NOTE: Multiple libraries (libboost_graph-mt.so.1.41.0,
libboost_graph-mt-d.so.1.41.0) found and LEAD_SONAME not defined
NOTE: Multiple libraries (libboost_iostreams-mt-d.so.1.41.0,
libboost_iostreams-mt.so.1.41.0) found and LEAD_SONAME not defined
NOTE: Multiple libraries (libboost_program_options-mt.so.1.41.0,
libboost_program_options-mt-d.so.1.41.0) found and LEAD_SONAME not
defined
NOTE: Multiple libraries (libboost_python-mt-d.so.1.41.0,
libboost_python-mt.so.1.41.0) found and LEAD_SONAME not defined
NOTE: Multiple libraries (libboost_regex-mt-d.so.1.41.0,
libboost_regex-mt.so.1.41.0) found and LEAD_SONAME not defined
NOTE: Multiple libraries (libboost_wserialization-mt-d.so.1.41.0,
libboost_serialization-mt-d.so.1.41.0,
libboost_wserialization-mt.so.1.41.0,
libboost_serialization-mt.so.1.41.0) found and LEAD_SONAME not defined
NOTE: Multiple libraries (libboost_signals-mt-d.so.1.41.0,
libboost_signals-mt.so.1.41.0) found and LEAD_SONAME not defined
NOTE: Multiple libraries (libboost_system-mt-d.so.1.41.0,
libboost_system-mt.so.1.41.0) found and LEAD_SONAME not defined
NOTE: Multiple libraries (libboost_unit_test_framework-mt-d.so.1.41.0,
libboost_unit_test_framework-mt.so.1.41.0) found and LEAD_SONAME not
defined
NOTE: Multiple libraries (libboost_thread-mt.so.1.41.0,
libboost_thread-mt-d.so.1.41.0) found and LEAD_SONAME not defined
NOTE: Multiple libraries (libboost_prg_exec_monitor-mt-d.so.1.41.0,
libboost_wave-mt-d.so.1.41.0, libboost_prg_exec_monitor-mt.so.1.41.0,
libboost_wave-mt.so.1.41.0) found and LEAD_SONAME not defined
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1
ERROR: QA Issue with boost-date-time: non -dev package contains
symlink .so: boost-date-time path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-date-time/usr/lib/libboost_date_time-mt.so'
ERROR: QA Issue with boost-date-time: non -dev package contains
symlink .so: boost-date-time path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-date-time/usr/lib/libboost_date_time-mt-d.so'
ERROR: QA Issue with boost-filesystem: non -dev package contains
symlink .so: boost-filesystem path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-filesystem/usr/lib/libboost_filesystem-mt-d.so'
ERROR: QA Issue with boost-filesystem: non -dev package contains
symlink .so: boost-filesystem path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-filesystem/usr/lib/libboost_filesystem-mt.so'
ERROR: QA Issue with boost-graph: non -dev package contains symlink
.so: boost-graph path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-graph/usr/lib/libboost_graph-mt.so'
ERROR: QA Issue with boost-graph: non -dev package contains symlink
.so: boost-graph path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-graph/usr/lib/libboost_graph-mt-d.so'
ERROR: QA Issue with boost-iostreams: non -dev package contains
symlink .so: boost-iostreams path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-iostreams/usr/lib/libboost_iostreams-mt-d.so'
ERROR: QA Issue with boost-iostreams: non -dev package contains
symlink .so: boost-iostreams path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-iostreams/usr/lib/libboost_iostreams-mt.so'
ERROR: QA Issue with boost-program-options: non -dev package contains
symlink .so: boost-program-options path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-program-options/usr/lib/libboost_program_options-mt.so'
ERROR: QA Issue with boost-program-options: non -dev package contains
symlink .so: boost-program-options path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-program-options/usr/lib/libboost_program_options-mt-d.so'
ERROR: QA Issue with boost-python: non -dev package contains symlink
.so: boost-python path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-python/usr/lib/libboost_python-mt-d.so'
ERROR: QA Issue with boost-python: non -dev package contains symlink
.so: boost-python path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-python/usr/lib/libboost_python-mt.so'
ERROR: QA Issue with boost-regex: non -dev package contains symlink
.so: boost-regex path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-regex/usr/lib/libboost_regex-mt-d.so'
ERROR: QA Issue with boost-regex: non -dev package contains symlink
.so: boost-regex path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-regex/usr/lib/libboost_regex-mt.so'
ERROR: QA Issue with boost-serialization: non -dev package contains
symlink .so: boost-serialization path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-serialization/usr/lib/libboost_wserialization-mt-d.so'
ERROR: QA Issue with boost-serialization: non -dev package contains
symlink .so: boost-serialization path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-serialization/usr/lib/libboost_serialization-mt-d.so'
ERROR: QA Issue with boost-serialization: non -dev package contains
symlink .so: boost-serialization path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-serialization/usr/lib/libboost_wserialization-mt.so'
ERROR: QA Issue with boost-serialization: non -dev package contains
symlink .so: boost-serialization path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-serialization/usr/lib/libboost_serialization-mt.so'
ERROR: QA Issue with boost-signals: non -dev package contains symlink
.so: boost-signals path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-signals/usr/lib/libboost_signals-mt-d.so'
ERROR: QA Issue with boost-signals: non -dev package contains symlink
.so: boost-signals path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-signals/usr/lib/libboost_signals-mt.so'
ERROR: QA Issue with boost-system: non -dev package contains symlink
.so: boost-system path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-system/usr/lib/libboost_system-mt.so'
ERROR: QA Issue with boost-system: non -dev package contains symlink
.so: boost-system path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-system/usr/lib/libboost_system-mt-d.so'
ERROR: QA Issue with boost-test: non -dev package contains symlink
.so: boost-test path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-test/usr/lib/libboost_unit_test_framework-mt-d.so'
ERROR: QA Issue with boost-test: non -dev package contains symlink
.so: boost-test path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-test/usr/lib/libboost_prg_exec_monitor-mt.so'
ERROR: QA Issue with boost-test: non -dev package contains symlink
.so: boost-test path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-test/usr/lib/libboost_prg_exec_monitor-mt-d.so'
ERROR: QA Issue with boost-test: non -dev package contains symlink
.so: boost-test path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-test/usr/lib/libboost_unit_test_framework-mt.so'
ERROR: QA Issue with boost-thread: non -dev package contains symlink
.so: boost-thread path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-thread/usr/lib/libboost_thread-mt.so'
ERROR: QA Issue with boost-thread: non -dev package contains symlink
.so: boost-thread path
'/work/armv7a-angstrom-linux-gnueabi/boost-1.41.0-r8.1/packages-split/boost-thread/usr/lib/libboost_thread-mt-d.so'


