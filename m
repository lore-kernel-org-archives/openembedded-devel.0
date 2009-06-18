Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MHJfy-0006yY-5m
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 17:37:18 +0200
Received: from [10.50.1.165] (unknown [10.50.1.165])
	by hermes.mvista.com (Postfix) with ESMTP
	id 1006A18182; Thu, 18 Jun 2009 08:26:42 -0700 (PDT)
Message-Id: <7EEC2685-FA35-4C80-8D16-2935F9A0EE1F@mvista.com>
From: Christopher Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200906181000.23470.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0 (Apple Message framework v935.3)
Date: Thu, 18 Jun 2009 08:26:40 -0700
References: <1245265221-19129-1-git-send-email-clarson@mvista.com>
	<200906181000.23470.marcin@juszkiewicz.com.pl>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: [PATCH] bitbake.conf, package_ipk.bbclass: rather than including FILE in SRC_URI, move that fallback to package_ipk.
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
X-List-Received-Date: Thu, 18 Jun 2009 15:37:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable


On Jun 18, 2009, at 1:00 AM, Marcin Juszkiewicz wrote:

> Dnia =C5=9Broda, 17 czerwca 2009 o 21:00:21 Chris Larson napisa=C5=82(a)=
:
>> classes/package_ipk.bbclass |    3 ++-
>> conf/bitbake.conf           |    2 +-
>> 2 files changed, 3 insertions(+), 2 deletions(-)
>
> What if I use package_deb or package_rpm?

Good question, I'll test.  The reason I only went with package_ipk is =20=

that package_ipk is why SRC_URI got set that way to begin with, due to =20=

ipkg requiring Source to create a package :)
--=20
Chris Larson
Software Engineer
MontaVista Software, Inc.
Email: clarson AT mvista DOT com
Email: clarson AT kergoth DOT com



