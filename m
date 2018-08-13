Return-Path: <prvs=756920f33=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 48CF1745A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 20:39:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,234,1531778400"; d="scan'208";a="11815653"
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>
References: <20180813193251.4079-1-git@andred.net>
	<b6bb9134fd23a76635c35823e0e5bf614aaf88c6.camel@andred.net>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <a54d3f0c-cd35-af84-dbca-c65f76aff762@skidata.com>
Date: Mon, 13 Aug 2018 22:39:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b6bb9134fd23a76635c35823e0e5bf614aaf88c6.camel@andred.net>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] openjdk-8: gcc-8 fix #4: undefined behaviour (hotspot)
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
X-List-Received-Date: Mon, 13 Aug 2018 20:39:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi André,
thanks again for the patch ;-)

On 08/13/2018 09:43 PM, André Draszik wrote:
> On Mon, 2018-08-13 at 20:32 +0100, André Draszik wrote:
>>
>> With these patches applied, the openjdk-8 ARM port works again:
>>> RESULTS:
>>> RESULTS - ping.PingTest.test_ping - Testcase 964: PASSED (0.04s)
>>> RESULTS - ssh.SSHTest.test_ssh - Testcase 224: PASSED (0.68s)
>>> RESULTS - java.JavaTest.test_java_exists - Testcase -1: PASSED (0.14s)
>>> RESULTS - java.JavaTest.test_java_jar_comp_mode - Testcase -1: FAILED
>>> (5.13s)
>>> RESULTS - java.JavaTest.test_java_jar_int_mode - Testcase -1: PASSED
>>> (4.48s)
>>> RESULTS - java.JavaTest.test_java_jar_works - Testcase -1: PASSED
>>> (4.44s)
>>> RESULTS - java.JavaTest.test_java_version - Testcase -1: PASSED (3.66s)
>>> RESULTS - javac.JavacTest.test_javac_exists - Testcase -1: PASSED
>>> (0.13s)
>>> RESULTS - javac.JavacTest.test_javac_works - Testcase -1: PASSED
>>> (30.87s)
>>> SUMMARY:
>>> openjdk-8-test-image () - Ran 9 tests in 50.263s
>>
>> The java.JavaTest.test_java_jar_comp_mode failure can be ignored for now,
>> as that test verifies compiled mode which is not available on arm. The
>> testcase must be fixed instead.

Yep. That's true.
According to my tests we have to this for compiled mode of several 
combinations:
	OpenJRE-8 on arm
	OpenJDK-7 on aarch64
	OpenJDK-7 on x86
	OpenJDK-7 on x86-64

All of them fail with "Incorrect mode" and therefore have no compiled 
mode/JIT built in.

Although (to be honest) I haven't looked into the JDK-7 problems... 
AFAIK they should be fixable (at least for x86{,-64})...

Maybe someone else here on the list (like Henning, Maxin or Otavio?) has 
more information/background on that?

> 
> Do you have an idea how to fix the test case? I've never looked into oeqa...

It's already on my todo list for tomorrow ;-)

regards;Richard.L

> 
> Cheers,
> Andre'
> 

