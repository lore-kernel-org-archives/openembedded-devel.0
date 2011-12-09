Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RZA4b-0006uO-23
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Dec 2011 00:41:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 561E93156C4A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:34:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id AyFBJ7Mx+AjT
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:34:52 +0100 (CET)
Received: from [172.22.22.61] (drms-590ceabd.pool.mediaWays.net
	[89.12.234.189])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 03A603156C47
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:34:51 +0100 (CET)
Message-ID: <4EE29B1A.7010005@opendreambox.org>
Date: Sat, 10 Dec 2011 00:34:50 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EE27BB8.3020903@opendreambox.org>
	<CAMKF1speb=XwcnmmhAC3hqKZ7tc8yDXOLNEhXweuyY+sSzx_Gw@mail.gmail.com>
In-Reply-To: <CAMKF1speb=XwcnmmhAC3hqKZ7tc8yDXOLNEhXweuyY+sSzx_Gw@mail.gmail.com>
Subject: Re: fakeroot 1.15.1 in 2011.03-maintenance
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
X-List-Received-Date: Fri, 09 Dec 2011 23:41:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09.12.2011 22:43, Khem Raj wrote:
> On Fri, Dec 9, 2011 at 1:20 PM, Andreas Oberritter <obi@opendreambox.org> wrote:
>> one week ago, the fakeroot recipe was moved to 1.15.1 [1] in order to fix
>> a download problem, even though previous attempts were rejected [2,3].
>> Well, now I get the following error:
>>
> 
> we should stash the tar file on sources.openembedded.org and be done with it.

Please do so, if you have the necessary access rights. Btw, ltrace fails for the same reason.

FWIW, I "fixed" the fakeroot issue using

MIRRORS_prepend() {
${DEBIAN_MIRROR}       http://snapshot.debian.org/archive/debian/20110301T040946Z/pool
${DEBIAN_MIRROR}       http://snapshot.debian.org/archive/debian/20110901T033808Z/pool
}

I'd recommend removing
${DEBIAN_MIRROR}/main   http://snapshot.debian.net/archive/pool
from mirrors.bbclass, as it results in broken downloads.

Regards,
Andreas



