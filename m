Return-Path: <prvs=743a3bca2=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 983A573D46
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 08:04:33 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aq0EAN26OVasEApK/2dsb2JhbABehA5vBrsqhAYjhTY6AoIIAQEBAQEBgQuENQEBAQMBMgFFEQsNCwkWDwkDAgECAUUGDQYCAheICw0IwTYBAQEHAQEBARsEhlWEfoQ7AQFqhBEFh0GHDId7hR2RIReTD4RocQWDbjqBBwEBAQ
X-IPAS-Result: Aq0EAN26OVasEApK/2dsb2JhbABehA5vBrsqhAYjhTY6AoIIAQEBAQEBgQuENQEBAQMBMgFFEQsNCwkWDwkDAgECAUUGDQYCAheICw0IwTYBAQEHAQEBARsEhlWEfoQ7AQFqhBEFh0GHDId7hR2RIReTD4RocQWDbjqBBwEBAQ
Message-ID: <5639BBD0.2050201@skidata.com>
Date: Wed, 4 Nov 2015 09:03:28 +0100
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
	<5638C28E.7040505@skidata.com>
	<2BAA39D9-E6DA-403E-AFAB-1E59CFE61DF2@gmail.com>
	<5638D571.3090500@skidata.com>
	<7448BFE6-D551-4E46-A7B0-F568423C219A@gmail.com>
In-Reply-To: <7448BFE6-D551-4E46-A7B0-F568423C219A@gmail.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Wed, 04 Nov 2015 08:04:36 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit


On 11/03/2015 05:20 PM, Jens Rehsack wrote:
> 
> Am 03.11.2015 um 16:40 schrieb Richard Leitner <richard.leitner@skidata.com>:
>>
>> On 11/03/2015 03:54 PM, Jens Rehsack wrote:
>>> That's maybe because I copy the format-patch output manually into the mail.
>>> Use this one: https://github.com/rehsack/meta-java/commit/57eba04b0f68a55b3250a692bc5834902709c903
>>
>> Same error :-(
>> Do I need any previous patches applied which are not yet on master?
> 
> Depends - this one comes first, because openjdk-8 supports building for distro's without x11:
> 
> https://github.com/rehsack/meta-java/commit/566f95135c9f8b8bedd1e24b2b5872177b1fdbe4

Thank you for the hint! Now it applies.

But I get following error when running "bitbake openjdk-7":


ERROR: Function failed: do_configure (log file is located at
/build/myTarget/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/temp/log.do_configure.31291)
ERROR: Logfile of failure stored in:
/build/myTarget/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/temp/log.do_configure.31291
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| ERROR: no configure script found at
/build/myTarget/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2/configure
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/build/myTarget/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/temp/log.do_configure.31291)
ERROR: Task 1074
(/opt/yocto/poky/meta-java/recipes-core/openjdk/openjdk-8-native_72b05.bb,
do_configure) failed with exit code '1'


Why is openjdk-8-native built at all here?
Nonetheless the same error occurs when building openjdk-8!

Furthermore following two warnings pop up:


WARNING: Variable key ALTERNATIVE_${JDKPN} (java) replaces original key
ALTERNATIVE_openjdk-8 (java).
WARNING: Variable key ALTERNATIVE_${JDKPN} (java) replaces original key
ALTERNATIVE_openjdk-8 (java).


Currently I have no time digging deeper into the problem, sorry for that!
But if you have a hint/solution I will test it again!

> 
> You had trouble testing it because of cacao-native re-configure ... which should now be fixed.
> 

Yes, seems to be fixed now ;-)


Thank you & kind regards,
Richard L

