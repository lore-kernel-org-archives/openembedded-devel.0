Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PSqNx-000094-2k
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 13:23:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id B11F6314BB6E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 13:21:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id vha6x-uSjrWf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 13:21:29 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 070D3314BAC3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 13:21:29 +0100 (CET)
Message-ID: <4D08B2C8.5010508@opendreambox.org>
Date: Wed, 15 Dec 2010 13:21:28 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1291941859-29257-1-git-send-email-eric@eukrea.com>
	<AANLkTinOcF=bKiZGZz1p4YZHSpW8Hy3LLumvG6VbqWg6@mail.gmail.com>
In-Reply-To: <AANLkTinOcF=bKiZGZz1p4YZHSpW8Hy3LLumvG6VbqWg6@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc: introduce version 4.5.2
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
X-List-Received-Date: Wed, 15 Dec 2010 12:23:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/10/2010 03:54 AM, Khem Raj wrote:
> On Thu, Dec 9, 2010 at 4:44 PM, Eric B=C3=A9nard <eric@eukrea.com> wrot=
e:
>> - based on gcc-4.5.2-RC-20101208 (svn 167585)
>> - without linaro patches (which seem to be the root of
>> problems when compiling at least on armv4 and armv5) :
>>        - samba 3.2.15 or 3.3.9 : http://tinderbox.openembedded.net/pub=
lic/logs/task/8666826.txt
>>        - samba 3.5.6 : http://pastebin.com/yuiYX2CM
>>
>=20
> as discussed on IRC may be we should try to find the faulty patch in
> current gcc 4.5 linaro patches we have.

I don't think that we need another svn-based pre-release recipe for gcc.
But I would still prefer to have a recipe for gcc 4.5.2 once it's
released, because I'd like to be able to pin a stable version with only
few required patches and Linaro only cares about ARM while I do not.

Regards,
Andreas


