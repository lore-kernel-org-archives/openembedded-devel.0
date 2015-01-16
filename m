Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 347 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Jan 2015 02:11:56 UTC
Received: from fgwmail7.fujitsu.co.jp (fgwmail7.fujitsu.co.jp [192.51.44.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2DA01725F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 02:11:56 +0000 (UTC)
Received: from fgwmail5.fujitsu.co.jp (fgwmail5.fujitsu.co.jp [192.51.44.35])
	by fgwmail7.fujitsu.co.jp (Postfix) with ESMTP id 3C5901793140
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 11:06:13 +0900 (JST)
Received: from kw-mxoi2.gw.nic.fujitsu.com (unknown [10.0.237.143])
	by fgwmail5.fujitsu.co.jp (Postfix) with ESMTP id 2BBF63EE1BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 11:06:09 +0900 (JST)
Received: from s1.gw.fujitsu.co.jp (s1.gw.fujitsu.co.jp [10.0.50.91])
	by kw-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 61648AC085A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 11:06:07 +0900 (JST)
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by s1.gw.fujitsu.co.jp (Postfix) with ESMTP id 040E5E08004
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 11:06:07 +0900 (JST)
Received: from g01jpexchyt33.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	58336584233; Fri, 16 Jan 2015 11:05:28 +0900 (JST)
Received: from G01JPEXMBYT21.g01.fujitsu.local ([10.128.193.129]) by
	g01jpexchyt33 ([10.128.193.36]) with mapi id 14.03.0181.007;
	Fri, 16 Jan 2015 11:05:28 +0900
From: "Fan, Xin" <fan.xin@jp.fujitsu.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [oe] Question about ntp build option
Thread-Index: AQHQKPSo1awv1B8Xg0Wv8eLV49IUrJzCEDug
Date: Fri, 16 Jan 2015 02:05:27 +0000
Message-ID: <72334B6CF8FF6542A565D43122925D601A0E7C@G01JPEXMBYT21>
References: <72334B6CF8FF6542A565D43122925D601999FF@G01JPEXMBYT21>
	<2746815.1G8tsLzyMa@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2746815.1G8tsLzyMa@peggleto-mobl5.ger.corp.intel.com>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.19.50]
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Question about ntp build option
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
X-List-Received-Date: Fri, 16 Jan 2015 02:12:01 -0000
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"

Hi Paul,

First of all, thanks for your reply.

> There will always be differences in how people expect software to be 
> configured for whatever target and application they are building for, 
> hence why we make it fairly easy to adjust the configuration.
Actually, I had the same opinion with you at the beginning.

But in last December, the ntp published 4 serious vulnerabilities(CVE-2014-9293,
CVE-2014-9294,CVE-2014-9295,CVE-2014-9296). So I think even the display a clock 
function, it should　also be protected by openssl for the safety connection.

And I find more packages in Yocto　which also use the openssl as the 
default option, so I think ntp also should set the openssl option as default setting.

What do you think about it?

Cheers,
Fan

-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com] 
Sent: Monday, January 05, 2015 11:34 PM
To: Fan, Xin/樊 シン
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Question about ntp build option

Hi Fan,

On Friday 28 November 2014 06:05:36 Fan, Xin wrote:
> I wonder that why the ntp uses the without-openssl build option and 
> disables the openssl by default.
> 
> In my opinion, the ntp needs openssl to support public key 
> cryptography and it should be enabled by default.

I set it up this way originally because I didn't figure SSL to be that important for a protocol like ntp for the common case. To my mind, it depends on what you are doing with time on the system which is being synchronised - if you are only using it to display a clock somewhere for the user, the security of the connection to the ntp server isn't really that important vs. avoiding the dependency on another library. If on the other hand you are writing logs or you are using a time-sensitive protocol such as Kerberos on the same system then you might want to consider enabling it.

There will always be differences in how people expect software to be configured for whatever target and application they are building for, hence why we make it fairly easy to adjust the configuration. In this case you only need to set your own PACKAGECONFIG value for ntp to include "openssl" and SSL support will be enabled.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

