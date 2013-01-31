Received: from [8.20.30.154] (helo=mx1.devonhealth.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <igeiser@devonit.com>) id 1U0sSO-00079n-4H
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 12:37:29 +0100
Received: from emfserver.devonintlgroup.com (10.0.7.48) by mx1.devonhealth.com
	(10.0.20.154) with Microsoft SMTP Server id 8.3.213.0;
	Thu, 31 Jan 2013 06:20:38 -0500
Received: from [10.0.2.7] by emfserver.devonintlgroup.com over TLS secured
	channel with ESMTP (Devon Health Services, Inc Email Firewall SMTP Relay
	(Email Firewall v6.5)); Thu, 31 Jan 2013 06:20:27 -0500
X-Server-Uuid: 6CB55748-6642-4D3C-9211-397BC4E7A815
Received: from SOUTHSIDE.devonintlgroup.com ([10.0.2.2]) by
	boddingtons.devonintlgroup.com ([10.0.2.7]) with mapi; Thu, 31 Jan 2013
	06:20:27 -0500
From: Ian Geiser <igeiser@devonit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Jan 2013 06:20:25 -0500
Thread-Topic: MACHINE_KERNEL_PR vs recipe PR
Thread-Index: Ac3/pPe8cbBeAo3DTJCvGafNscUXLA==
Message-ID: <B57A220D1EE1644685BA9AD5C790D20526BE045E71@SOUTHSIDE.devonintlgroup.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-WSS-ID: 7D148CF14CW1011405-01-01
Subject: MACHINE_KERNEL_PR vs recipe PR
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
X-List-Received-Date: Thu, 31 Jan 2013 11:37:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am curious about the machine_kerne_pr class.  What is the advantage/diffe=
rence between using MACHINE_KERNEL_PR to change the kernel recipe revision =
vs using PR in the recipe?  Shouldn't anything that DEPENDS on virtual/kern=
el get rebuilt if PR changes in the kernel recipe?  From what I can tell al=
l it does anyway is set the PR value of whatever inherits it to MACHINE_KER=
NEL_PR. Or is there a use for this beyond just making sure a package gets r=
ebuilt?

Thanks!



