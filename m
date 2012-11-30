Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TeWyn-0006Az-Hc
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 21:14:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAUGIXZ2003150
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 08:18:33 -0800 (PST)
Received: from msp-dhcp46.wrs.com (172.25.34.46) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 30 Nov 2012 08:18:33 -0800
Message-ID: <50B8DC5A.7050203@windriver.com>
Date: Fri, 30 Nov 2012 10:18:34 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
Cc: Joe MacDonald <joe.macdonald@windriver.com>
Subject: netperf in meta-networking
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
X-List-Received-Date: Fri, 30 Nov 2012 20:14:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I was helping someone with building netperf from meta-networking last night, and 
stumbled on what I think is a bug.

SUMMARY = "A networking benchmarking tool"
DESCRIPTION = "Network performance benchmark including tests for TCP, UDP, 
sockets, ATM and more."
SECTION = "console/network"
HOMEPAGE = "http://www.netperf.org/"
LICENSE = "netperf"
LICENSE_FLAGS = "commercial"

In the above, the LICENSE_FLAGS are set to 'commercial'.  I think this is 
incorrect.  It should be set to 'non-commercial'.

There is a subtle difference between them which is why I think it's a bug...

commercial -- there are some commercial requirements necessary to use this 
recipe in a commercial device... you are responsible for understanding them and 
doing whatever is necessary... (for non-commercial devices you can likely use it...)

non-commercial -- this item is restricted to non-commercial users only.  As in 
the case of netperf, the license says it's only for non-commercial use.

So anyway, my suggestion is to simply change the value of the flag.

--Mark


