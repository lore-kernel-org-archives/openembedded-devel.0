Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UaWxA-00022b-5q
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 May 2013 21:56:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r49JcUeV021308
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 May 2013 12:38:30 -0700 (PDT)
Received: from msp-dhcp6.wrs.com (172.25.34.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 9 May 2013 12:38:30 -0700
Message-ID: <518BFB35.5070202@windriver.com>
Date: Thu, 9 May 2013 14:38:29 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
Subject: meta-networking rp-pppoe
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
X-List-Received-Date: Thu, 09 May 2013 19:56:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I'm having a couple of problems with rp-pppoe.

The first issue is simple.  '${P}' is used in the SRC_URI, so if I am configured 
to use multilibs I get failures.  The following fixes it:

-SRC_URI = "http://www.roaringpenguin.com/files/download/${P}.tar.gz \
+SRC_URI = "http://www.roaringpenguin.com/files/download/${BP}.tar.gz \


The second issue however, is something I haven't been able to figure out.  When 
running the do_configure task, I get a failure:

checking packing order of bit fields... no defaults for cross-compiling
configure: error: ./configure failed for src

Looking into this, there is a patch that appears to be expecting something to 
pass in "rpppoe_cv_pack_bitfields" with a value of 'normal' or 'rev'.  But I 
don't see anything in the recipe that actually sets that value.

Is this is a bug in the integration, or am I missing something?


