Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id BB657701A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Aug 2014 13:05:43 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Aug 2014 06:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,825,1400050800"; d="scan'208";a="466486962"
Received: from colmmora-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.127])
	by azsmga001.ch.intel.com with ESMTP; 08 Aug 2014 06:05:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 08 Aug 2014 14:05:42 +0100
Message-ID: <1638429.iXmVO7ted9@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140808100208.GC14848@jama>
References: <20140806192249.GP14848@jama> <20140808004507.GZ14848@jama>
	<20140808100208.GC14848@jama>
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
X-List-Received-Date: Fri, 08 Aug 2014 13:05:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 08 August 2014 12:02:08 Martin Jansa wrote:
> And now it failed on jenkins builder (maybe because this one is using
> gold)
> 
> | cd
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/
> | mariadb/5.5.38-r0/build/storage/myisam &&
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/
> | arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gcc  -DHAVE_CONFIG_H -Wall 
> | -march=armv5te -marm -mthumb-interwork 
> | --sysroot=/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm 
> | -O2 -pipe -g -feliminate-unused-debug-types -fPIC -O2 -g -DNDEBUG
> | -DDBUG_OFF
> | -I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueab
> | i/mariadb/5.5.38-r0/build/include
> | -I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueab
> | i/mariadb/5.5.38-r0/mariadb-5.5.38/include
> | -I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueab
> | i/mariadb/5.5.38-r0/mariadb-5.5.38/sql
> | -I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueab
> | i/mariadb/5.5.38-r0/mariadb-5.5.38/regex
> | -I/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include
> |     -fvisibility=hidden -o CMakeFiles/myisam.dir/mi_create.c.o   -c
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/
> | mariadb/5.5.38-r0/mariadb-5.5.38/storage/myisam/mi_create.c
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libe
> | xec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: error:
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/
> | mariadb/5.5.38-r0/build/libmysql/libmysql_versions.ld:155:9: invalid use
> | of VERSION in input file collect2: error: ld returned 1 exit status
> | make[2]: *** [libmysql/libmysqlclient.so.18..0] Error 1
> | make[2]: Leaving directory
> | `/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi
> | /mariadb/5.5.38-r0/build' make[1]: ***
> | [libmysql/CMakeFiles/libmysql.dir/all] Error 2

I'm really not sure what to do about this. There is a bug report about this 
here:

  https://sourceware.org/bugzilla/show_bug.cgi?id=16895

Unfortunately there is no viable workaround or patch either in the linked 
gentoo/mariadb bugs.

Any suggestions?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

