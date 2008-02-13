Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JPHid-00039O-N3
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Feb 2008 14:32:11 +0100
Received: from andromeda (e180166131.adsl.alicedsl.de [85.180.166.131])
	by drlauer-research.com (Postfix) with ESMTP id 2256F584391
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2008 14:37:25 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Feb 2008 14:32:42 +0100
User-Agent: KMail/1.9.7
References: <200802131340.02616.mickey@vanille-media.de>
	<47B2E83E.9090209@student.utwente.nl>
In-Reply-To: <47B2E83E.9090209@student.utwente.nl>
MIME-Version: 1.0
Message-Id: <200802131432.42455.mickey@vanille-media.de>
Subject: Re: tinylogin vs. busybox
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
X-List-Received-Date: Wed, 13 Feb 2008 13:32:11 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 13 February 2008 13:53:18 Koen Kooi wrote:
> Michael 'Mickey' Lauer schreef:
> | I just realized that we are still using tinylogin which has bugs and
>
> is dead.
>
> | Newer busybox releases contain all the functionality. Anyone know a
> | compelling reason to keep using tinylogin as the default in task-base? If
> | not, I'd like to switch to busybox (after changing its defconfig) soon.
>
> Using busybox as login requires it being setuid root, with all the nasty
> security implications stemming from that.

http://www.busybox.net/lists/busybox/2004-May/011551.html give me the opinion 
that this is not a problem.

> I don't think OE should force
> people to only have one user ('root') on their systems, since that is
> exactly what your proposed change would mean.

I agree, but I don't see why using busybox login would limit us to root-only. 
Care to give more details?

Besides, I think using something old and dead as tinylogin with known bugs is 
more of a security problem than setuid root busybox...

:M:
-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


