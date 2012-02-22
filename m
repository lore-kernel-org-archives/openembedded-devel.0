Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S09fa-0001xT-KI
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 11:43:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 82558315924E;
	Wed, 22 Feb 2012 11:35:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id xdhM6oowWjLJ; Wed, 22 Feb 2012 11:35:03 +0100 (CET)
Received: from [172.22.22.61] (drms-590edffa.pool.mediaWays.net
	[89.14.223.250])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 29873315922E;
	Wed, 22 Feb 2012 11:35:03 +0100 (CET)
Message-ID: <4F44C4D6.5090204@opendreambox.org>
Date: Wed, 22 Feb 2012 11:35:02 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1329745909-21013-1-git-send-email-eric@eukrea.com>
	<4F429115.3070907@opendreambox.org>
	<20120222101227.59546393@eb-e6520>
	<CAAQYJAs2FdO0STqq837wajztxv_7x7FPesZJM5OisQrjm+c6LA@mail.gmail.com>
In-Reply-To: <CAAQYJAs2FdO0STqq837wajztxv_7x7FPesZJM5OisQrjm+c6LA@mail.gmail.com>
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [meta-oe] vsftpd: add new package
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
X-List-Received-Date: Wed, 22 Feb 2012 10:43:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 22.02.2012 10:52, Andrea Adami wrote:
> On Wed, Feb 22, 2012 at 10:12 AM, Eric B=E9nard <eric@eukrea.com> wrote=
:
>> Hi Andreas,
>>
>> Le Mon, 20 Feb 2012 19:29:41 +0100,
>> Andreas Oberritter <obi@opendreambox.org> a =E9crit :
>>> On 20.02.2012 14:51, Eric B=E9nard wrote:
>>>> - imported 2.0.5 from oe-classic
>>>> - upgrade to 2.3.5 which is latest stable
>>>> - tested on ARMv5 with Angstrom
>>>
>>> I created a recipe for vsftpd, too. Here's my version for your
>>> reference. All patches were taken from the Debian or Ubuntu package.
>>>
>>> It differs from your recipe in these ways:
>>> - uses openssl
>>> - uses pam if available
>>> - uses xinetd
>>> - allows to set custom default configuration options in bbappends
>>> - only build-tested with OE-core, no runtime tests so far.
>>>
>> your recipe was just pushed (with this email as the commit message ...=
).
>> I think it would have need a little rework, at least to not depend on
>> xinetd by default and be runtime tested before being pushed.
>>
>> Eric
>=20
> And preferably should be committed in meta-oe/recipes-connectivity/vsft=
pd/
> Now is in root of meta-openembedded.
> Cheers
> Andrea

Yes. That was definitely not meant to be applied as is. Koen, did you by
accident pick the wrong patch? Please revert and commit
http://patches.openembedded.org/patch/21437/ instead.

Regards,
Andreas


