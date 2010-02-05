Received: from smtp-relay1.palm.com ([63.80.53.70])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <prvs=Michael.Morrell=645426946@palm.com>)
	id 1NdErP-0000gI-JB for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 04:28:04 +0100
X-IronPort-AV: E=Sophos;i="4.49,409,1262592000"; d="scan'208";a="23808640"
Received: from unknown (HELO mailhost01.palm.com) ([148.92.223.30])
	by smtp-relay1.palm.com with ESMTP; 04 Feb 2010 19:24:22 -0800
Received: from ushqwmh02.palm1.palmone.com (ushqwmh02.palm1.palmone.com
	[148.92.223.143])
	by mailhost01.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	o153OLdD013613 for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Feb 2010 19:24:22 -0800 (PST)
Received: from ushqwmb02.palm1.palmone.com ([148.92.223.121]) by
	ushqwmh02.palm1.palmone.com ([148.92.223.143]) with mapi;
	Thu, 4 Feb 2010 19:24:22 -0800
From: Michael Morrell <Michael.Morrell@palm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Feb 2010 19:24:20 -0800
Thread-Topic: Issues with .list files
Thread-Index: AcqmErSiU6Hu+QlKSvm4G6MrO4moyQ==
Message-ID: <D15778FFF6A6CA4FAF01B8D2C3780300499DAE1590@ushqwmb02.palm1.palmone.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 63.80.53.70
X-SA-Exim-Mail-From: prvs=Michael.Morrell=645426946@palm.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Issues with .list files
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
X-List-Received-Date: Fri, 05 Feb 2010 03:28:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If I understand the algorithm in package_do_shlibs correctly, each package =
creates a .list file which is a list of all the shared libraries provided b=
y that package.  It also generates a list of all the libraries that it need=
s and looks for those in .list files created by other packages so it can cr=
eate a runtime dependency against that package.

The way it looks for .list files is to simply scan all *.list files in the =
directory.  This has two problems that I can see.

First, it is inefficient.  It should only have to look through .list files =
creates by packages created by bb files which were DEPENDed on by this bb f=
ile.

Second, when a bitbake run is done with lots of parallelism, it is possible=
 that it tries to open a nonexistent .list file (it was there when it did t=
he os.listdir call, but that package later removed it before it recreates i=
t), causing a crash here.  We are seeing such crashes reasonably often.

Before I try to fix this on my own, I wanted to get some opinions on the be=
st way to handle this.

Thanks,

  Michael


