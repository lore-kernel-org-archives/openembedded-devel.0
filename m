Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PGVIH-0002rp-Ng
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Nov 2010 12:26:18 +0100
Received: from [192.168.178.20] (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id E068B1B40D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Nov 2010 12:26:29 +0100 (CET)
Message-ID: <4CDBD29F.9030907@sensortherm.de>
Date: Thu, 11 Nov 2010 12:25:19 +0100
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CD42BE7.8090109@sensortherm.de>
	<4CD42DC7.7010008@crhc.illinois.edu>
In-Reply-To: <4CD42DC7.7010008@crhc.illinois.edu>
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: dm355_codecs_03_10_00_00.tar.gz
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
X-List-Received-Date: Thu, 11 Nov 2010 11:26:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 05.11.2010 17:16, schrieb Matt Johnson:
> On 11/05/2010 11:08 AM, Klaus Schwarzkopf wrote:
>> Hi,
>>
>> i try to install the recipe ti-codecs-dm355_3.10.00.00.bb:
>>
>> MACHINE=dm355-leopard bitbake -b ti-codecs-dm355_3.10.00.00.bb
>>
>> I get the following error:
>>
>> klaus@ubuntu:~/development/oe$ MACHINE=dm355-leopard bitbake -b
>> ti-codecs-dm355_3.10.00.00.bb
>> NOTE: preferred version 1_13_000 of ti-codecs-dm355 not available (for
>> item ti-codecs-dm355)
>>
>> Build Configuration:
>> BB_VERSION = "1.8.18"
>> METADATA_BRANCH = "master"
>> METADATA_REVISION = "a33cf7368366d425c71369339e88a50d5660b7c0"
>> TARGET_ARCH = "arm"
>> TARGET_OS = "linux-gnueabi"
>> MACHINE = "dm355-leopard"
>> DISTRO = "angstrom"
>> DISTRO_VERSION = "2010.7-test-20101104"
>> TARGET_FPU = "soft"
>>
>> NOTE: Preparing runqueue
>> NOTE: Executing runqueue
>> NOTE: Running task 2 of 17 (ID: 8,
>> /home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.00.00.bb,
>>
>>
>> do_fetch)
>> NOTE: fetch
>> ftp://gtftp01.gt.design.ti.com/arago/dm355_codecs_03_10_00_00.tar.gz
>> --2010-11-04 20:28:42--
>> ftp://gtftp01.gt.design.ti.com/arago/dm355_codecs_03_10_00_00.tar.gz
>> =>
>> `/home/klaus/development/oe/downloads/dm355_codecs_03_10_00_00.tar.gz'
>> Resolving gtftp01.gt.design.ti.com... failed: Name or service not known.
>> wget: unable to resolve host address `gtftp01.gt.design.ti.com'
>> NOTE: fetch
>> http://mirrors.openembedded.org//dm355_codecs_03_10_00_00.tar.gz
>> --2010-11-04 20:28:42--
>> http://mirrors.openembedded.org//dm355_codecs_03_10_00_00.tar.gz
>> Resolving mirrors.openembedded.org... 82.197.159.157
>> Connecting to mirrors.openembedded.org|82.197.159.157|:80... connected.
>> HTTP request sent, awaiting response... 404 Not Found
>> 2010-11-04 20:28:42 ERROR 404: Not Found.
>>
>> NOTE: fetch
>> http://sources.openembedded.org//dm355_codecs_03_10_00_00.tar.gz
>> --2010-11-04 20:28:43--
>> http://sources.openembedded.org//dm355_codecs_03_10_00_00.tar.gz
>> Resolving sources.openembedded.org... 140.211.169.165
>> Connecting to sources.openembedded.org|140.211.169.165|:80... connected.
>> HTTP request sent, awaiting response... 404 Not Found
>> 2010-11-04 20:28:43 ERROR 404: Not Found.
>>
>> NOTE: fetch
>> http://www.angstrom-distribution.org/unstable/sources/dm355_codecs_03_10_00_00.tar.gz
>>
>> --2010-11-04 20:28:43--
>> http://www.angstrom-distribution.org/unstable/sources/dm355_codecs_03_10_00_00.tar.gz
>>
>> Resolving www.angstrom-distribution.org... 188.40.83.200
>> Connecting to www.angstrom-distribution.org|188.40.83.200|:80...
>> connected.
>> HTTP request sent, awaiting response... 404 Not Found
>> 2010-11-04 20:28:43 ERROR 404: Not Found.
>>
>> NOTE: Task failed: Fetch failed:
>> ftp://gtftp01.gt.design.ti.com/arago/dm355_codecs_03_10_00_00.tar.gz;name=dm355codecsbin
>>
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of
>> /home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.00.00.bb
>>
>>
>> do_fetch failed
>> ERROR: Task 8
>> (/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.00.00.bb,
>>
>>
>> do_fetch) failed
>> NOTE: Tasks Summary: Attempted 1 tasks of which 1 didn't need to be
>> rerun and 1 failed.
>> ERROR:
>> '/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.00.00.bb'
>>
>>
>> failed
>> klaus@ubuntu:~/development/oe$
>>
>>
>>
>> Where is the file? Is the recipe to old?
>>
>> Thanks!
>>
>> Regards,
>> Klaus
>>
>>
>>
>>
> Klaus,
> ti-codecs is now at 3.10.00.02, but I think the larger issue is just one
> of server-side directory reorganization since the recipe was updated.
> That tarball is part of the DVSDK, which can be downloaded here
> http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_3_10/latest/index_FDS.html
>
> We should probably update the recipe at some point not to attempt to
> fetch the tarball directly, unless someone else has it hosted separately.
> -Matt
>


Have somebody the file dm355_codecs_03_10_00_00.tar.gz? I can host it.

Klaus




