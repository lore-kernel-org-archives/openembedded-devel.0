Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JC1F4-0003U4-I3
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 00:18:50 +0100
Received: from PROMETHEUS (e180179042.adsl.alicedsl.de [85.180.179.42])
	by drlauer-research.com (Postfix) with ESMTP id 35D09584BB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jan 2008 23:54:28 +0100 (CET)
Date: Mon, 7 Jan 2008 23:52:36 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <582475286.20080107235236@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1199742459.4680.69.camel@localhost.localdomain>
References: <1068494393.20080104031751@gmail.com>
	<1199663243.4658.71.camel@localhost.localdomain>
	<116173998.20080107221856@gmail.com>
	<1199738665.4680.66.camel@localhost.localdomain>
	<1199742459.4680.69.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Metadata Q/A (was: Another weird case of PACKAGES_DYNAMIC and task deps, it seems)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2008 23:18:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Mon, 2008-01-07 at 20:44 +0000, Richard Purdie wrote:
>> My money is on:
>> 
>> DEPENDS_collie += "bc-native"
>> 
>> in linux-rp.inc. Try removing that...

> Confirmed and fixed in 00610b176af0e4f4563f78fb71dc1219c777d13e.

> Let me stress once again, += and overrides do not do what you expect. It
> adds "bc_native" to the variable named "DEPENDS_collie", not "DEPENDS".

> DEPENDS_append_collie = " bc-native" 

> is a very different thing and corrects this problem...

Can we

a) forbid variable assignment to foo_bar in general (when bar is not
in {append, prepend, <override>} ?

b) have an extra Q/A class that scans the metadata for those kinds of
problems?

Regards,

:M:

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



