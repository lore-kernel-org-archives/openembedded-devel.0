Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LoI1N-0001fn-Uq
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 15:59:26 +0200
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LoHzJ-0005wm-Rz
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 08:57:17 -0500
Message-ID: <49D0CFC7.9090902@dls.net>
Date: Mon, 30 Mar 2009 08:57:27 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20090328211530.7700adb1@mail.villafam.com>	<200903301254.51359.hs4233@mail.mn-solutions.de>	<1238411534.16991.120.camel@mill.internal.reciva.com>
	<200903301333.04881.hs4233@mail.mn-solutions.de>
In-Reply-To: <200903301333.04881.hs4233@mail.mn-solutions.de>
Subject: Re: TinyLogin
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
X-List-Received-Date: Mon, 30 Mar 2009 13:59:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Holger Schurig wrote:

> However, I like to base fear on evidence, that's why I replied.

Having spent 4 years of my life working in the security space, and a
year of that actually reviewing source code for security-related issues,
I can safely say that in my part of the world (central US), it is the
other way around:

when security is involved, fear is based on _lack_ of evidence of
correctness.

Due to its size and frequency of change the code is impossible for human
review, and due to structure of the code, it is unlikely for automated
commercial tools to be able to do much with it (I know; I tried once).

IMO (for what that's worth), we need to support the "everything is
busybox!" sort of build; there's just no alternative for small devices.
 But the problem is what do we do for that middle ground, for devices
that can't fit the entire set of "proper" tools but might not be willing
to take the security risk associated with running busybox SETUID.

I rather suspect tinylogin will live on, even if maintenance is minimal.

-Mike (mwester)


