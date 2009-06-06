Received: from [63.80.53.70] (helo=smtp-relay1.palm.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <prvs=Michael.Morrell=4017be958@palm.com>)
	id 1MCpIH-0006gf-Cl
	for openembedded-devel@openembedded.org; Sat, 06 Jun 2009 08:22:17 +0200
X-IronPort-AV: E=Sophos;i="4.41,314,1241420400"; d="scan'208";a="14501288"
Received: from unknown (HELO mailhost02.palm.com) ([148.92.223.90])
	by smtp-relay1.palm.com with ESMTP; 05 Jun 2009 23:13:00 -0700
Received: from ushqwmh02.palm1.palmone.com (ushqwmh02.palm1.palmone.com
	[148.92.223.143])
	by mailhost02.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	n566Cc66028300 for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Jun 2009 23:13:00 -0700 (PDT)
Received: from ushqwmb02.palm1.palmone.com ([148.92.223.121]) by
	ushqwmh02.palm1.palmone.com ([148.92.223.143]) with mapi;
	Fri, 5 Jun 2009 23:12:38 -0700
From: Michael Morrell <Michael.Morrell@palm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@openembedded.org>
Date: Fri, 5 Jun 2009 23:12:37 -0700
Thread-Topic: populate_staging history question
Thread-Index: AcnmbcoFxIfyr5E7SOSUUI6TCmKLSg==
Message-ID: <D15778FFF6A6CA4FAF01B8D2C378030033D06FF8AE@ushqwmb02.palm1.palmone.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: populate_staging history question
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
X-List-Received-Date: Sat, 06 Jun 2009 06:22:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have a question about the history of when populate_staging gets run.  A l=
ong time ago, it was run after package_write, but in August of 2007, Richar=
d changed it in Poky to be runnable after compile, then shortly thereafter =
changed it to be runnable after install (there's a note about conflicts bet=
ween install and populate_staging).  This change was ported to OE in Septem=
ber 2007.

Can someone explain what the conflict was? -- it seems that install and pop=
ulate_staging should be able to be run at the same time.

Also, why is the build task scheduled to be after populate_staging?  Since =
package_write is the final task, I expected build to be after that task.

Thanks,

  Michael


