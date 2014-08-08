Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8AA536FE7E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Aug 2014 13:02:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Aug 2014 06:02:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,825,1400050800"; d="scan'208";a="581957633"
Received: from colmmora-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.127])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2014 06:01:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 08 Aug 2014 14:01:37 +0100
Message-ID: <5216672.5TmkmhXQ6e@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140808004507.GZ14848@jama>
References: <20140806192249.GP14848@jama>
	<1407418315-15620-1-git-send-email-paul.eggleton@linux.intel.com>
	<20140808004507.GZ14848@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] mariadb: update to 5.5.38
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
X-List-Received-Date: Fri, 08 Aug 2014 13:02:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 08 August 2014 02:45:07 Martin Jansa wrote:
> On Thu, Aug 07, 2014 at 02:31:55PM +0100, Paul Eggleton wrote:
> > * Upstream switched from autotools to cmake
> > * Separate build dir and parallel make now work
> > * Library versioning no longer used for plugins; other libtool cruft
> >   gone
> > * Proper upstream initscript
> > * Plugins moved from client library package to mariadb-server package
> > 
> >   (matches how Fedora packages these)
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> > Changes since v1:
> > * Add readline and libaio to DEPENDS
> > * Disable usage of boost
> 
> Thanks for update, I've found few more differences between failing (after
> building world) and working (with minimal deps) build:
> 
> 646c646
> < -- Looking for include files valgrind/memcheck.h, valgrind/valgrind.h -
> found ---
> 
> > -- Looking for include files valgrind/memcheck.h, valgrind/valgrind.h -
> > not found
> 733c733
> < -- Looking for include file security/pam_appl.h - found
> ---
> 
> > -- Looking for include file security/pam_appl.h - not found
> 
> 759c759
> < -- Looking for event.h - found
> ---
> 
> > -- Looking for event.h - not found

PAM is an issue, I will fix that one. The other two are unconditional checks, 
but actually making use of the dependency is off by default regardless of 
whether or not it is present (don't you just love consistency...)

> There is also floating systemtap-native dependency which enables DTRACE
> support in mariadb (see mariadb-5.5.38/cmake/dtrace.cmake).

OK, I'll explicitly set ENABLE_DTRACE to FALSE then.
 
> And groff-native is the cause for following error:
> | Scanning dependencies of target ps
> | make[2]: Leaving directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
> | make -f dbug/CMakeFiles/ps.dir/build.make dbug/CMakeFiles/ps.dir/build
> | make[2]: Entering directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
> | /sysroots/x86_64-linux/usr/bin/cmake -E cmake_progress_report
> | /work/i586-oe-linux/mariadb/5.5.38-r0/build/CMakeFiles [ 84%] Generating
> | example3.r
> | cd /work/i586-oe-linux/mariadb/5.5.38-r0/build/dbug && sed -e
> | 's!\\!\\\\!g'
> | </work/i586-oe-linux/mariadb/5.5.38-r0/mariadb-5.5.38/dbug/example3.c
> | >example3.r /sysroots/x86_64-linux/usr/bin/cmake -E cmake_progress_report
> | /work/i586-oe-linux/mariadb/5.5.38-r0/build/CMakeFiles [ 84%] Generating
> | output1.r, output2.r, output3.r, output4.r, output5.r cd
> | /work/i586-oe-linux/mariadb/5.5.38-r0/build/dbug && ./factorial 1 2 3 4 5
> | > output1.r ./factorial: /lib/i386-linux-gnu/libc.so.6: version
> | `GLIBC_2.17' not found (required by ./factorial) make[2]: ***
> | [dbug/output1.r] Error 1
> | make[2]: Leaving directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
> | make[1]: *** [dbug/CMakeFiles/ps.dir/all] Error 2
> | make[1]: Leaving directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> 
> Adding -DGROFF=False -DNROFF=False to EXTRA_OECMAKE allowed me to build it
> after world, but please check other floating deps as well.

OK, I'll add those.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

