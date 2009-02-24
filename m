Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Lc3v1-0003ri-7R
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 21:30:19 +0100
Received: from [192.168.1.105] (e180190230.adsl.alicedsl.de [85.180.190.230])
	by drlauer-research.com (Postfix) with ESMTP id 188CA58413E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2009 21:51:18 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <go1jd3$mlv$1@ger.gmane.org>
References: <1235501736.8911.52.camel@alap>  <go1jd3$mlv$1@ger.gmane.org>
Organization: Vanille-Media
Date: Tue, 24 Feb 2009 21:27:15 +0100
Message-Id: <1235507235.2621.6.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Re: [PATCH] add the openmoko git kernel stable branch to fso/milestone5
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
X-List-Received-Date: Tue, 24 Feb 2009 20:30:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Dienstag, den 24.02.2009, 20:56 +0100 schrieb Koen Kooi:
> On 24-02-09 19:55, Angus Ainslie wrote:
> 
> > +KERNEL_RELEASE = "2.6.29-rc3"
> > +KERNEL_VERSION = "${KERNEL_RELEASE}"
> > +
> > +OMV = "stable"
> > +PV = "${KERNEL_RELEASE}-${OMV}+gitr${SRCREV}"
> 
> NACK. This violates OEs versioning policy since 2.6.29-rc3 will sort 
> higher than 2.6.29 final.

Right.

Angus, I'd just keep 2.6.28+whatever. I don't think it's that relevant
which rc is the baseline of this version.

If you disagree, just go with 2.6.28+2.6.29rc3.

In general, the format is <stable>+<devel> until <devel> has become
final. This (and all the other policies) should be in the Wiki. If not,
please alert us and we'll add them.

Cheers,

-- 
:M:



