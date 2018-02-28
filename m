Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EE7E778818
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 07:05:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w1S75D95025500
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Feb 2018 23:05:13 -0800 (PST)
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 27 Feb 2018 23:04:46 -0800
To: "Md Ismail, Zakiah" <zakiah.md.ismail@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1A5BB22468458840B08C979DDA869BF27EB738@PGSMSX103.gar.corp.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <380f5877-b037-057c-33ed-321cf4cd05a3@windriver.com>
Date: Wed, 28 Feb 2018 15:05:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1A5BB22468458840B08C979DDA869BF27EB738@PGSMSX103.gar.corp.intel.com>
X-Originating-IP: [128.224.162.197]
Subject: Re: Dependency loop in cryptsetup
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
X-List-Received-Date: Wed, 28 Feb 2018 07:05:14 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2018 11:48 AM, Md Ismail, Zakiah wrote:
> Hi,
>
> I want to enable cyrptsetup in systemd by adding PACKAGECONFIG_append_pn-systemd = " cryptsetup" in my local.conf; however, I encounter the dependency loop issue. The issue is similar to this: https://bugzilla.yoctoproject.org/show_bug.cgi?id=11856. The difference is I'm using the latest commit from meta-openembedded rocko branch. Please advise on the steps to solve this issue. Thanks in advance!
>
> Regards,
> Zakiah
>
>
I'd like to provide some information here, as I worked on this issue.
When I first encountered this circular dependency problem, I solved this 
problem by separating lvm2 into two recipes and making them having 
different dependencies.
After that, I found that if we do so, then using tools from lvm2 would 
have problem. I did some investigation and found that lvm2 and 
libdevmapper recipes must have the same dependencies to work correctly 
at runtime. So I sent patches to fix this runtime problem, and 
introducing this circular dependency problem back.

That's the whole history of this problem. The current status is that, we 
still have this circular dependency problem.

I thought about this problem for quite a while at that. The circular 
dependency is about the following three packages.
libdevmapper, udev, cryptsetup.
cryptsetup depends on libdevmapper, I checked the its configure and can 
confirm that it's a necessity.
libdevmapper depends on udev (provided by systemd), and this dependency 
could be broke by removing udev from PACKAGECONFIG, with the cost of 
losing of functionality.
udev depends on cryptsetup, and as this is what user wants, the 
dependency could not be broke.

In summary, your only option at the moment is to remove 'udev' from lvm2 
and libdevmapper with the cost of losing some functionality.

P.S.
To totally solve this problem, in the scheme of OE, the only option 
seems to break systemd into multiple recipes, which I really don't 
suggest to do.

Best Regards,
Chen Qi

