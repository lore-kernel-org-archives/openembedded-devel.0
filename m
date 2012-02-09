Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RvIPe-0008Kb-6O
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 02:03:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 6C3153158A87
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2012 01:54:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 5CCS7v4ENOlL
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2012 01:54:44 +0100 (CET)
Received: from [172.22.22.61] (drms-590c4e0c.pool.mediaWays.net [89.12.78.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id E48BC3158A83
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2012 01:54:43 +0100 (CET)
Message-ID: <4F331951.2010701@opendreambox.org>
Date: Thu, 09 Feb 2012 01:54:41 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F2A97B7.2080709@opendreambox.org>
	<CAP9ODKqah-6Y6hp-beD0hUi=-r6VXJ02QD=puXFFYW2Hq8FACw@mail.gmail.com>
	<4F32CE7B.8050109@opendreambox.org>
	<CAP9ODKr+bmWJX8tjesyTvP8_4pEgFDXjOA+s2ZbSq5U+=PC4rw@mail.gmail.com>
In-Reply-To: <CAP9ODKr+bmWJX8tjesyTvP8_4pEgFDXjOA+s2ZbSq5U+=PC4rw@mail.gmail.com>
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
X-List-Received-Date: Thu, 09 Feb 2012 01:03:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 08.02.2012 20:48, Otavio Salvador wrote:
> On Wed, Feb 8, 2012 at 17:35, Andreas Oberritter <obi@opendreambox.org>wrote:
> 
>> I already explained in the commit message, why a PR bump is not needed.
>> Can you please explain which other possible failures you're expecting,
>> so I can learn why my reasoning may be wrong?
>>
>> This patch only fixes an unavailable build dependency at bitbake level,
>> nothing more.
>>
> 
> Can the user call:
> 
> bitbake libsm
> 
> and then build giflib? in case of positive, we need to enforce have or not
> it linked.

At the time I created the patch, the user couldn't run bitbake libsm
(for the same reason that it wouldn't be built automatically through
giflib's DEPENDS).

That said, I updated the repos after your mail and ran bitbake libsm in
order to get the error message again, but the error vanished.
Apparently, an indirect dependency on libx11 was dropped during the last
few weeks. I searched the logs, but didn't find the change. Strange.
Now, many x11 packages got built even though x11 still wasn't listed in
my DISTRO_FEATURES.

Anyway, please consider this patch obsolete. I'll probably resend an
updated version together with other patches to disable some more x11
libraries on demand.

Regards,
Andreas


