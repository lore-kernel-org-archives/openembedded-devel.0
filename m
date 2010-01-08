Received: from exprod5og105.obsmtp.com ([64.18.0.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1NTByq-0004bQ-JJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 11:22:11 +0100
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob105.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS0cG060MtnkndkKytuMOiKQw+KAy3/x7@postini.com;
	Fri, 08 Jan 2010 02:20:04 PST
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip07.e2k.ad.ge.com with ESMTP; 08 Jan 2010 04:33:31 -0500
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 08 Jan 2010 04:33:31 -0500
Message-ID: <4B46FC81.10006@gefanuc.com>
Date: Fri, 08 Jan 2010 09:36:01 +0000
From: Martyn Welch <martyn.welch@gefanuc.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <hi5b61$f7h$1@ger.gmane.org>	<1262892164.2553.230.camel@lenovo.internal.reciva.com>	<c384c5ea1001071148h770db2a7p10f6a7b51582fea5@mail.gmail.com>
	<1262896003.2553.266.camel@lenovo.internal.reciva.com>
In-Reply-To: <1262896003.2553.266.camel@lenovo.internal.reciva.com>
X-SA-Exim-Connect-IP: 64.18.0.180
X-SA-Exim-Mail-From: martyn.welch@gefanuc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Bump default version for gtk+ to 2.18.3
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
X-List-Received-Date: Fri, 08 Jan 2010 10:22:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> Automatically adding new versions with a negative DEFAULT_PREFERENCE
>  doesn't scale: if everybody did this then, eventually, we would end
>  up with virtually the whole tree being D_P -1. And it sends a
> confusing message to other users, since people tend to assume that a
> recipe with a negative D_P is broken or harmful in some way rather
> than merely untested or untrusted.  I would also propose that, in
> future, any setting of DEFAULT_PREFERENCE in a recipe must be
> accompanied by a comment explaining why it was set, and (if it is set
> negatively) under what conditions it can or should be removed.
>

I've recently had a small problem related to this. All of the kernel
packages seem to have DEFAULT_PREFERENCE=-1, for popular targets this
isn't a problem, but for less popular ones it was picking the latest
kernel at D_P=-1. Oddly this failed to build for "x86".

I'd suggest it would be sensible to remove all (or most)
"DEFAULT_PREFERENCE=-1" instances and only use
"DEFAULT_PREFERENCE-<target>=x" it to increase the preference for
specific targets, or leave it entirely up to the distributions.

Martyn


-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square,
Manchester,
E martyn.welch@gefanuc.com                   |   M2 3AB  VAT:GB 927559189



