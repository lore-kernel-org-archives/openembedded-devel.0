Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89AD16186D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2014 02:50:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0L2oUBU011139
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Jan 2014 18:50:30 -0800 (PST)
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 20 Jan 2014 18:50:30 -0800
Message-ID: <52DDE074.7070000@windriver.com>
Date: Tue, 21 Jan 2014 10:50:28 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1389940848-376-1-git-send-email-jackie.huang@windriver.com>
	<1500081.lxhvWhSdf3@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1500081.lxhvWhSdf3@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] strongswan: update verion to 5.1.1
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
X-List-Received-Date: Tue, 21 Jan 2014 02:50:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 1/20/2014 10:56 PM, Paul Eggleton wrote:
> On Friday 17 January 2014 14:40:48 jackie.huang@windriver.com wrote:
>> * Add rdepends on strongswan-plugins.
>
> Is this really correct? Does strongswan not work without the plugins?

Yes, without the plugins, the ipsec_starter fails to start:

root@qemu0:~# ipsec start
Starting strongSwan 5.1.1 IPsec [starter]...
root@qemu0:~# tail /var/log/auth.log -n 4
2014-01-21T02:46:57.175940+00:00 qemu0 ipsec_starter[926]: Starting 
strongSwan 5.1.1 IPsec [starter]...
2014-01-21T02:46:57.653396+00:00 qemu0 ipsec_starter[935]: charon has 
quit: initialization failed
2014-01-21T02:46:57.656916+00:00 qemu0 ipsec_starter[935]: charon 
refused to be started
2014-01-21T02:46:57.661374+00:00 qemu0 ipsec_starter[935]: ipsec starter 
stopped

Thanks,
Jackie

>
> Cheers,
> Paul
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

