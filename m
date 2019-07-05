Return-Path: <Liwei.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 744017E807
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 01:40:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x651dxhj019899
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Jul 2019 18:40:10 -0700
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 4 Jul 2019 18:39:49 -0700
Message-ID: <5D1EAA63.1030709@windriver.com>
Date: Fri, 5 Jul 2019 09:39:47 +0800
From: Liwei Song <liwei.song@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1562232055-238768-1-git-send-email-liwei.song@windriver.com>
	<c136bc02-35be-44d8-6382-b8c8239dcbc4@intel.com>
In-Reply-To: <c136bc02-35be-44d8-6382-b8c8239dcbc4@intel.com>
Subject: Re: [meta-oe][PATCH] pm-graph: package the pm-graph files
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
X-List-Received-Date: Fri, 05 Jul 2019 01:40:35 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit



On 07/04/2019 06:31 PM, Saini, Naveen Kumar wrote:
> 
> 
> On 7/4/19 5:20 PM, Liwei Song wrote:
>> +FILES_${PN} = "${nonarch_libdir}/pm-graph \
>> +               ${bindir}/sleepgraph \
>> +               ${bindir}/bootgraph \
>> +"
> 
> FILES_${PN} inherits ${bindir} & ${libdir} by default. So it is not required.

Got it, Thanks, will send a v2 to remove it.


Liwei.

