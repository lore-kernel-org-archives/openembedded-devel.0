Return-Path: <Liwei.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9467F7E539
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 02:04:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6523NXq020434
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Jul 2019 19:04:09 -0700
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 4 Jul 2019 19:03:50 -0700
Message-ID: <5D1EB004.8080305@windriver.com>
Date: Fri, 5 Jul 2019 10:03:48 +0800
From: Liwei Song <liwei.song@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
References: <1562291023-261126-1-git-send-email-liwei.song@windriver.com>
	<32b2fbe7-f358-474a-d71a-2eb82e9b834e@intel.com>
In-Reply-To: <32b2fbe7-f358-474a-d71a-2eb82e9b834e@intel.com>
Subject: Re: [meta-oe][PATCH v2] pm-graph: package the pm-graph files
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
X-List-Received-Date: Fri, 05 Jul 2019 02:04:43 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit



On 07/05/2019 10:01 AM, Saini, Naveen Kumar wrote:
> 
> 
> On 7/5/19 9:43 AM, Liwei Song wrote:
>> package /usr/lib/pm-grap and /bin/* files created by pm-graph
>> to aviod "Files were installed but not shipped in any package"
>> error.
>>
>> Signed-off-by: Liwei Song <liwei.song@windriver.com>
>> ---
>>   meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
>> index ea12e054d3ab..00301298309e 100644
>> --- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
>> +++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
>> @@ -18,3 +18,6 @@ do_install() {
>>   }
>>     RDEPENDS_${PN} += "python-core python-threading python-datetime python-subprocess python-compression"
>> +
>> +FILES_${PN} += "${nonarch_libdir}/pm-graph \
> This too not required. Please have a look at
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/conf/bitbake.conf
> 
> Could you share your error !

The error I got:
ERROR: pm-graph-5.3-r0 do_package: QA Issue: pm-graph: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/pm-graph
  /usr/lib/pm-graph/sleepgraph.py
  /usr/lib/pm-graph/bootgraph.py
  /usr/lib/pm-graph/config
  /usr/lib/pm-graph/config/cgskip.txt
  /usr/lib/pm-graph/config/freeze-callgraph.cfg
  /usr/lib/pm-graph/config/freeze.cfg
  /usr/lib/pm-graph/config/freeze-dev.cfg
  /usr/lib/pm-graph/config/standby-callgraph.cfg
  /usr/lib/pm-graph/config/standby.cfg
  /usr/lib/pm-graph/config/standby-dev.cfg
  /usr/lib/pm-graph/config/suspend-callgraph.cfg
  /usr/lib/pm-graph/config/suspend.cfg
  /usr/lib/pm-graph/config/suspend-dev.cfg
  /usr/lib/pm-graph/config/suspend-x2-proc.cfg
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
pm-graph: 16 installed and not shipped files. [installed-vs-shipped]
ERROR: pm-graph-5.3-r0 do_package: Fatal QA errors found, failing task.
ERROR: pm-graph-5.3-r0 do_package: 
ERROR: pm-graph-5.3-r0 do_package: Function failed: do_package


Thanks,
Liwei.
>> +"
>>
> 
> 

