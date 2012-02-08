Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RvDQT-0002Pt-GR
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 20:43:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 722A33158A73
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2012 20:35:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id gIIdhP6XW9ai
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2012 20:35:25 +0100 (CET)
Received: from [172.22.22.61] (drms-590c4e0c.pool.mediaWays.net [89.12.78.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id CA7E83158A6C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2012 20:35:24 +0100 (CET)
Message-ID: <4F32CE7B.8050109@opendreambox.org>
Date: Wed, 08 Feb 2012 20:35:23 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F2A97B7.2080709@opendreambox.org>
	<CAP9ODKqah-6Y6hp-beD0hUi=-r6VXJ02QD=puXFFYW2Hq8FACw@mail.gmail.com>
In-Reply-To: <CAP9ODKqah-6Y6hp-beD0hUi=-r6VXJ02QD=puXFFYW2Hq8FACw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] giflib: don't depend on libsm if x11 is unavailable
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
X-List-Received-Date: Wed, 08 Feb 2012 19:43:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 08.02.2012 19:41, Otavio Salvador wrote:
> On Thu, Feb 2, 2012 at 12:03, Andreas Oberritter <obi@opendreambox.org>wrote:
> 
>> There's no need to alter configure flags, because without x11,
>> libsm cannot be picked up accidentially. Because this just fixes
>> a missing dependency failure without x11, no PR bump is required
>> either.
>>
> 
> I do prefer a clear configure option depending on if it is going to use or
> not libsm otherwise if user has built it, it is going to be taken.

Currently, there are two possibilities:

1.) x11 is in DISTRO_FEATURES
    -> libsm is built, giflib is built with libsm
2.) x11 is not in DISTRO_FEATURES
    -> giflib build is broken, because libsm does not exist in this
configuration

Therefore, the scenario you're describing cannot happen.

> Also,
> please PR bump in any case since it can help spot other possible failures
> that we'd not catch otherwise.

I already explained in the commit message, why a PR bump is not needed.
Can you please explain which other possible failures you're expecting,
so I can learn why my reasoning may be wrong?

This patch only fixes an unavailable build dependency at bitbake level,
nothing more.

Regards,
Andreas


