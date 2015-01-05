Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 53409727D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 14:34:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 05 Jan 2015 06:29:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,700,1413270000"; d="scan'208";a="664589564"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by orsmga002.jf.intel.com with ESMTP; 05 Jan 2015 06:34:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Fan, Xin" <fan.xin@jp.fujitsu.com>
Date: Mon, 05 Jan 2015 14:33:59 +0000
Message-ID: <2746815.1G8tsLzyMa@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <72334B6CF8FF6542A565D43122925D601999FF@G01JPEXMBYT21>
References: <72334B6CF8FF6542A565D43122925D601999FF@G01JPEXMBYT21>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 05 Jan 2015 14:34:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Fan,

On Friday 28 November 2014 06:05:36 Fan, Xin wrote:
> I wonder that why the ntp uses the without-openssl build option and disables
> the openssl by default.
> 
> In my opinion, the ntp needs openssl to support public key cryptography and
> it should be enabled by default.

I set it up this way originally because I didn't figure SSL to be that 
important for a protocol like ntp for the common case. To my mind, it depends 
on what you are doing with time on the system which is being synchronised - if 
you are only using it to display a clock somewhere for the user, the security 
of the connection to the ntp server isn't really that important vs. avoiding 
the dependency on another library. If on the other hand you are writing logs 
or you are using a time-sensitive protocol such as Kerberos on the same system 
then you might want to consider enabling it.

There will always be differences in how people expect software to be configured 
for whatever target and application they are building for, hence why we make 
it fairly easy to adjust the configuration. In this case you only need to set 
your own PACKAGECONFIG value for ntp to include "openssl" and SSL support will 
be enabled.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

