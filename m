Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D7C8170746
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 21:17:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s79LHbXH029835
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 9 Aug 2014 14:17:38 -0700 (PDT)
Received: from msp-dhcp9.wrs.com (172.25.34.9) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 9 Aug 2014 14:17:36 -0700
Message-ID: <53E68FF0.50104@windriver.com>
Date: Sat, 9 Aug 2014 16:17:36 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20140809124025.6627.qmail@f4mail-235-198.rediffmail.com>
In-Reply-To: <20140809124025.6627.qmail@f4mail-235-198.rediffmail.com>
Subject: Re: Error: package not found in the base feeds
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
X-List-Received-Date: Sat, 09 Aug 2014 21:17:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/9/14, 7:40 AM, Himanshu Pandey wrote:
> Hi,I am getting following error:Error: spread not found in the base feeds (genericx86_64 x86_64 noarch any all).Error: liburiparser not found in the base feeds (genericx86_64 x86_64 noarch any all).

This message indicates that something put "liburiparser" into the IMAGE_INSTALL 
(or PACKAGE_INSTALL) variable.  The system was unable to find a package with 
that name (or the 'debian renamed' version if applicable) within the system 
packages.

You'll likely need to look at the recipe that was supposed to come from and 
figure out if you are using the wrong name -- or if it wasn't created for some 
reason.

--Mark

> Please help to resolve the same.
> Regards,Himanshu
>


