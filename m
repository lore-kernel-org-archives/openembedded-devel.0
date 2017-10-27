Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 11EF9782E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 17:06:56 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Oct 2017 10:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; 
	d="scan'208,217";a="143010646"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.134])
	([10.219.128.134])
	by orsmga004.jf.intel.com with ESMTP; 27 Oct 2017 10:06:56 -0700
Date: Fri, 27 Oct 2017 12:17:00 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Message-Id: <1509124620.11251.30@fm-out.intel.com>
In-Reply-To: <14dedd60-c1ec-f23c-407e-764eb2ada48f@jp.fujitsu.com>
References: <14dedd60-c1ec-f23c-407e-764eb2ada48f@jp.fujitsu.com>
X-Mailer: geary/0.11.3
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: openjdk checksum wrong
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
X-List-Received-Date: Fri, 27 Oct 2017 17:06:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed



On Fri, Oct 27, 2017 at 3:03 AM, Fan Xin <fan.xin@jp.fujitsu.com> wrote:
> Hello,
> 
> I am trying to build openjdk-8 based jethro, and I use the recipe 
> file from meta-java.
> 
> I meet the following error message.
> 
> ERROR: Fetcher failure for URL: 
> 'http://hg.openjdk.java.net/jdk8u/jdk8u/jdk/archive/48c99b423839.tar.bz2;name=jdk;unpack=false'. 
> Checksum mismatch!
> File: '/downloads/48c99b423839.tar.bz2' has md5 checksum 
> 7cde47e80f540aa01d51376affe6b8b0 when 
> 316fc871a823ff8f1db39a2fca51bd12 was expected
> File: '/downloads/48c99b423839.tar.bz2' has sha256 checksum 
> 8627e3e19ac6cfd250e435be659fbfdf65f3cb2c6c9678c9e5ec0db2ae1fcc90 when 
> bca18458ba0a0b8d79639829b8a71cdf65dd788b5c28658102b6b4691a47a420 was 
> expected
> If this change is expected (e.g. you have upgraded to a new version 
> without updating the checksums) then you can use these lines within 
> the recipe:
> SRC_URI[jdk.md5sum] = "7cde47e80f540aa01d51376affe6b8b0"
> SRC_URI[jdk.sha256sum] = 
> "8627e3e19ac6cfd250e435be659fbfdf65f3cb2c6c9678c9e5ec0db2ae1fcc90"
> Otherwise you should retry the download and/or check with upstream to 
> determine if the file has become corrupted or otherwise unexpectedly 
> modified.
> 
> It said the checksum mismatch, but I did not modify the recipe file 
> and archive file. I just download the recipe file and try to build it.
> 
> Cound anyone tell me what is wrong I have done? or how to modify this.
> 
> By the way, if I modify the recipe file with the new md5sum code, the 
> build will fail at the unpack phase and get the "Data integrity 
> error".


create a patch to fix the checksums (and send it to the mailing list) 
and for the other issue, start a new thread with the problem.

> 
> 
> Best Regards,
> Fan Xin
> 
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

