Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 668 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Oct 2017 08:14:31 UTC
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id 2E0DE719F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 08:14:31 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 16a6_608c_8414fca9_7db3_4b7d_8422_84dd627c0f75;
	Fri, 27 Oct 2017 17:03:19 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id E73BAAC0132
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 17:03:18 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id D6C534CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 17:03:18 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id BDDDC1E0074
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 17:03:18 +0900 (JST)
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <14dedd60-c1ec-f23c-407e-764eb2ada48f@jp.fujitsu.com>
Date: Fri, 27 Oct 2017 17:03:18 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
X-TM-AS-MML: disable
Subject: openjdk checksum wrong
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
X-List-Received-Date: Fri, 27 Oct 2017 08:14:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello,

I am trying to build openjdk-8 based jethro, and I use the recipe file 
from meta-java.

I meet the following error message.

ERROR: Fetcher failure for URL: 
'http://hg.openjdk.java.net/jdk8u/jdk8u/jdk/archive/48c99b423839.tar.bz2;name=jdk;unpack=false'. 
Checksum mismatch!
File: '/downloads/48c99b423839.tar.bz2' has md5 checksum 
7cde47e80f540aa01d51376affe6b8b0 when 316fc871a823ff8f1db39a2fca51bd12 
was expected
File: '/downloads/48c99b423839.tar.bz2' has sha256 checksum 
8627e3e19ac6cfd250e435be659fbfdf65f3cb2c6c9678c9e5ec0db2ae1fcc90 when 
bca18458ba0a0b8d79639829b8a71cdf65dd788b5c28658102b6b4691a47a420 was 
expected
If this change is expected (e.g. you have upgraded to a new version 
without updating the checksums) then you can use these lines within the 
recipe:
SRC_URI[jdk.md5sum] = "7cde47e80f540aa01d51376affe6b8b0"
SRC_URI[jdk.sha256sum] = 
"8627e3e19ac6cfd250e435be659fbfdf65f3cb2c6c9678c9e5ec0db2ae1fcc90"
Otherwise you should retry the download and/or check with upstream to 
determine if the file has become corrupted or otherwise unexpectedly 
modified.

It said the checksum mismatch, but I did not modify the recipe file and 
archive file. I just download the recipe file and try to build it.

Cound anyone tell me what is wrong I have done? or how to modify this.

By the way, if I modify the recipe file with the new md5sum code, the 
build will fail at the unpack phase and get the "Data integrity error".

Best Regards,
Fan Xin


