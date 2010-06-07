Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@dominion.thruhere.net>) id 1OLXEP-0006lk-BN
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 09:59:04 +0200
Received: by wwb34 with SMTP id 34so2303071wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 00:54:29 -0700 (PDT)
Received: by 10.216.86.140 with SMTP id w12mr1948181wee.95.1275897269518;
	Mon, 07 Jun 2010 00:54:29 -0700 (PDT)
Received: from [172.20.1.5] (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id g17sm1293377wee.17.2010.06.07.00.54.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Jun 2010 00:54:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1078)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20100607075056.GC1403@jama>
Date: Mon, 7 Jun 2010 09:54:27 +0200
Message-Id: <A6080A6A-203E-4A84-AAFD-E25A1BA55123@student.utwente.nl>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
	<1275299757-28908-2-git-send-email-ospite@studenti.unina.it>
	<hu0602$c6i$2@dough.gmane.org>
	<20100607092454.54ea161f.ospite@studenti.unina.it>
	<20100607075056.GC1403@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1078)
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: koen@dominion.thruhere.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.gnumonks.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 01/12] fso-image.inc: add an even shorter alias, for ls -l
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
X-List-Received-Date: Mon, 07 Jun 2010 07:59:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 jun 2010, om 09:50 heeft Martin Jansa het volgende geschreven:

> On Mon, Jun 07, 2010 at 09:24:54AM +0200, Antonio Ospite wrote:
>> On Mon, 31 May 2010 13:19:30 +0200
>> Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>=20
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>=20
>>> On 31-05-10 11:55, Antonio Ospite wrote:
>>>> 'l' is a must have along with 'll'.
>>>>=20
>>>> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
>> [...]
>>> diff --git a/recipes/images/fso-image.inc =
b/recipes/images/fso-image.inc
>> [...]
>>>> +    echo "alias l=3D'ls -l'" >>./etc/profile
>>>>     echo "alias ll=3D'ls -al'" >>./etc/profile
>>>>     # nfs
>>>>     mkdir -p ./local/pkg
>>>=20
>>> And what happens if you opkg upgrade base-files? You suddenly lost =
all
>>> your tweaks to /etc/profile.
>>=20
>> Right, /etc/profile would be overwritten, but that's quite =
independent
>> from this very patch, it's the whole fso-image.inc approach which
>> should be revised, so I'd like this one could still make it.
>>=20
>> Or if you can point to the right way to do what
>> recipes/images/fso-image.inc::fso_rootfs_postprocess() is doing I can
>> try to implement that.

<snip>

> FYI: I removed similar postprocess tweaks from shr images about a =
month
> ago, because of those reasons...

I removed them when I started developing narcissus (late 2008), since I =
couldn't reproduce OE images from their packages...

regards,

Koen=


