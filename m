Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PqUTZ-0007NJ-QW
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 18:50:42 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PqUSM-0001qw-R9 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 09:49:26 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 18 Feb 2011 09:49:25 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 18 Feb 2011 10:49:25 -0700
Message-ID: <4D5EB11F.5040007@mentor.com>
Date: Fri, 18 Feb 2011 10:49:19 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D5EA4CA.7090205@dresearch.de>
In-Reply-To: <4D5EA4CA.7090205@dresearch.de>
X-OriginalArrivalTime: 18 Feb 2011 17:49:25.0315 (UTC)
	FILETIME=[2E8AD130:01CBCF94]
Subject: Re: Release-2011.03 - package acl contains bad RPATH
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
X-List-Received-Date: Fri, 18 Feb 2011 17:50:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/18/2011 09:56 AM, Steffen Sledz wrote:
> First negativ test result :(
>
> NOTE: Running task 963 of 1217 (ID: 668, /var/lib/jenkins/jobs/OE-testing/workspace/openembedded/recipes/udev/acl_2.2.49.bb, do_package)
> NOTE: package acl-2.2.49-r3: task do_package: Started
> ERROR: QA Issue with acl: package acl contains bad RPATH /var/lib/jenkins/jobs/OE-testing/workspace/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib in file /var/lib/jenkins/jobs/OE-testing/workspace/tmp/work/armv5te-angstrom-linux-gnueabi/acl-2.2.49-r3/packages-split/acl/usr/lib/libacl.so.1.1.0
> ERROR: QA Issue with acl: package acl contains bad RPATH /var/lib/jenkins/jobs/OE-testing/workspace/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib in file /var/lib/jenkins/jobs/OE-testing/workspace/tmp/work/armv5te-angstrom-linux-gnueabi/acl-2.2.49-r3/packages-split/acl/usr/lib/libacl.so.1
> ERROR: Task 668 (/var/lib/jenkins/jobs/OE-testing/workspace/openembedded/recipes/udev/acl_2.2.49.bb, do_package) failed with 256
> FATAL: QA run found fatal errors. Please consider fixing them.

Yeap.  My current goal is to hammer out many more of the RPATH issues 
that still exist after 
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?h=trini/simplify-target-flags 
and update the release branch again Tuesday.

-- 
Tom Rini
Mentor Graphics Corporation


