Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B7EC671B18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 08:29:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2016 01:29:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,518,1473145200"; d="scan'208";a="1056506454"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga001.fm.intel.com with ESMTP; 20 Oct 2016 01:29:16 -0700
Date: Thu, 20 Oct 2016 11:30:12 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161020083012.GA30415@mbabyjoh-desk.ger.corp.intel.com>
References: <CAOwy=PPr-9vu=kJTSR8qJk6_31jjP1FrUO3XvO_JrSDb2-n-fQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOwy=PPr-9vu=kJTSR8qJk6_31jjP1FrUO3XvO_JrSDb2-n-fQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java] fails to fetch icedtea
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
X-List-Received-Date: Thu, 20 Oct 2016 08:29:16 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Joel,

On Thu, Oct 20, 2016 at 08:36:06AM +0200, Joël Guittet wrote:
> Hi,
> 
> I'm building an image with OpenJDK, but fetching icedtea fails. It was
> correctly done few weeks ago. Log indicates error on checksum, but I have
> reviewed changes on meta-java and I do not understand why. Anybody with the
> same issue?
> 

Apparently, there were some updates in the upstream servers and it resulted in
change in checksums (pretty bad)

Richard Leitner sent a fix for that yesterday and it is in master-next now:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?h=master-next&id=8b028a5e67c8081a4ecd65d33fe52fed46416a1a

> Log:
> 
> WARNING: Checksum failure encountered with download of
> http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/archive/f89009ada191.tar.bz2;name=openjdk;unpack=false
> - will attempt other sources if available
> WARNING: Renaming /home/kubuntu/yocto/build/downloads/f89009ada191.tar.bz2
> to
> /home/kubuntu/yocto/build/downloads/f89009ada191.tar.bz2_bad-checksum_2bc941373ca4b033c9a25f972eec7858
> ERROR: Fetcher failure for URL: '
> http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/archive/f89009ada191.tar.bz2;name=openjdk;unpack=false'.
> Checksum mismatch!
> File: '/home/kubuntu/yocto/build/downloads/f89009ada191.tar.bz2' has md5
> checksum 2bc941373ca4b033c9a25f972eec7858 when
> c26bbb33addfaeb14d28a1329b4b5a3e was expected
> File: '/home/kubuntu/yocto/build/downloads/f89009ada191.tar.bz2' has sha256
> checksum 5efd8e66f18fcbf45527bcc74aa3e6ed11f66bc793c88e3841925c4acb4827ba
> when 54a0ef02b56b265b4122324e08a33c42ececbf2a300ada260611e7b6ccdba96d was
> expected
> If this change is expected (e.g. you have upgraded to a new version without
> updating the checksums) then you can use these lines within the recipe:
> SRC_URI[openjdk.md5sum] = "2bc941373ca4b033c9a25f972eec7858"
> SRC_URI[openjdk.sha256sum] =
> "5efd8e66f18fcbf45527bcc74aa3e6ed11f66bc793c88e3841925c4acb4827ba"
> Otherwise you should retry the download and/or check with upstream to
> determine if the file has become corrupted or otherwise unexpectedly
> modified.
> 
> ERROR: Function failed: Fetcher failure for URL: '
> http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/archive/f89009ada191.tar.bz2;name=openjdk;unpack=false'.
> Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in:
> /home/kubuntu/yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/temp/log.do_fetch.10452
> ERROR: Task 1258
> (/home/kubuntu/yocto/build/../meta-java/recipes-core/icedtea/
> icedtea7-native_2.1.3.bb, do_fetch) failed with exit code '1'
> 
> Regards,
> Joel
> -- 

Best Regards,
Maxin

