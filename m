Received: from sj-iport-5.cisco.com ([171.68.10.87])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vanhorj@cisco.com>) id 1NeeA0-00038m-UV
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 01:41:04 +0100
Authentication-Results: sj-iport-5.cisco.com;
	dkim=neutral (message not signed) header.i=none
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AikFAL88cEurRN+J/2dsb2JhbACBaAO+D5dchFQE
X-IronPort-AV: E=Sophos;i="4.49,432,1262563200"; 
	d="scan'208,217";a="147803565"
Received: from sj-core-3.cisco.com ([171.68.223.137])
	by sj-iport-5.cisco.com with ESMTP; 09 Feb 2010 00:37:22 +0000
Received: from xbh-rcd-301.cisco.com (xbh-rcd-301.cisco.com [72.163.63.8])
	by sj-core-3.cisco.com (8.13.8/8.14.3) with ESMTP id o190bMCU018849
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Feb 2010 00:37:22 GMT
Received: from xmb-rcd-209.cisco.com ([72.163.62.216]) by
	xbh-rcd-301.cisco.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 8 Feb 2010 18:37:22 -0600
x-mimeole: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
x-cr-hashedpuzzle: A1oX BLbV B1Er DmWh Dwrc Fdnd Ffcb FvaM FzeC GKYt HJDl IHcH
	I16E I/Zf JK74 KDbO; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {2ED0F495-09E5-4247-8A68-091955D9245C};
	dgBhAG4AaABvAHIAagBAAGMAaQBzAGMAbwAuAGMAbwBtAA==;
	Tue, 09 Feb 2010 00:37:21 GMT;
	aQBuAGkAdAByAGEAbQBmAHMAIABpAG0AYQBnAGUAIAB3AGkAdABoACAAcwBlAGMAbwBuAGQAYQByAHkAIABjAHIAYQBtAGYAcwAgAGkAbgBzAGkAZABlAA==
x-cr-puzzleid: {2ED0F495-09E5-4247-8A68-091955D9245C}
Date: Mon, 8 Feb 2010 18:37:21 -0600
Message-ID: <89CD81306A03F24FAEA2177A341C2C613B8764@XMB-RCD-209.cisco.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: initramfs image with secondary cramfs inside
Thread-Index: AcqpIApx8T1cqYfISMOrVlMc0K6tEQ==
From: "John Van Horne (vanhorj)" <vanhorj@cisco.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 09 Feb 2010 00:37:22.0460 (UTC)
	FILETIME=[0B267DC0:01CAA920]
X-SA-Exim-Connect-IP: 171.68.10.87
X-SA-Exim-Mail-From: vanhorj@cisco.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: initramfs image with secondary cramfs inside
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
X-List-Received-Date: Tue, 09 Feb 2010 00:41:04 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The system I'm working on boots up with an initramfs image which
contains a very minimal file system. During the boot process, a second
file system image, in cramfs format, is mounted and used as the root
file system. Does anyone have any experience using OE to build such an
image? My approach to this was to have a recipe for the cramfs image and
a recipe for the initramfs image, and to list the cramfs image as a
dependency of the initramfs recipe. Both of these recipes inherit the
image class. However, running bitbake on the initramfs recipe fails
because the cramfs do_rootfs and do_deploy_to tasks have not run. After
running bitbake with debug info turned on, it seems that the initramfs
recipe depends upon the do_populate_stage task of cramfs, but not
do_rootfs and do_deploy_to. Could anyone offer any insight into why this
is?

=20

Thanks

-John


