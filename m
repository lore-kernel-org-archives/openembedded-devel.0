Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JfAlQ-0003Cj-QC
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 10:20:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2S9KiAc008635
	for <openembedded-devel@openembedded.org>; Fri, 28 Mar 2008 09:20:44 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08479-04 for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 09:20:40 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2S9KYCN008618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 28 Mar 2008 09:20:34 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0803271730j4c7b4c64uc7584fbaa9895fb5@mail.gmail.com>
References: <1206638249.4514.57.camel@dax.rpnet.com>
	<fsgsaq$nqf$1@ger.gmane.org> <47EC2661.90702@bolloretelecom.eu>
	<20080327230928.GD11881@smtp.west.cox.net>
	<c384c5ea0803271730j4c7b4c64uc7584fbaa9895fb5@mail.gmail.com>
Date: Fri, 28 Mar 2008 09:20:33 +0000
Message-Id: <1206696033.5029.9.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: ipkg/opkg offical response
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
X-List-Received-Date: Fri, 28 Mar 2008 09:20:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-03-28 at 01:30 +0100, Leon Woestenberg wrote:
> On Fri, Mar 28, 2008 at 12:09 AM, Tom Rini <trini@kernel.crashing.org> wrote:
> >
> >  I'll ask the silly qustion.  Given that mkimage hasn't changed in I
> >  don't know how long, why are both providing it?  Just to save on sources
> >  downloaded?  Did OM really change mkimage?
> >
> Good question, thanks for asking!
> 
> In fact, I have seen some of the kernel recipes seen switching between
> openmoko's and non-openmoko u-boot-tools, with and without breakage in
> the past.
> 
> Could the openmoko guys please describe what grants their version to exist? :-)

As far as I know, the mkimage tool hasn't changed in a long time so we
should be able to share one common version. Using a simpler recipe kind
of makes sense but I'll let the openmoko people answer.

One way forward might be to DEPEND on virtual/mkimage-native. The
various uboot providers can then PROVIDE this and it becomes distro
policy which one is selected?

Cheers,

Richard




