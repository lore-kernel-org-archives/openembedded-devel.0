Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S0ASA-00040w-In
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 12:33:47 +0100
Received: by wibhq7 with SMTP id hq7so4317977wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 03:25:25 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.78.6 as permitted sender)
	client-ip=10.180.78.6; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.78.6 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.78.6])
	by 10.180.78.6 with SMTP id x6mr35106594wiw.18.1329909925964 (num_hops
	= 1); Wed, 22 Feb 2012 03:25:25 -0800 (PST)
Received: by 10.180.78.6 with SMTP id x6mr29089124wiw.18.1329909925870;
	Wed, 22 Feb 2012 03:25:25 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gf3sm27050251wib.6.2012.02.22.03.25.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 03:25:25 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F44C4D6.5090204@opendreambox.org>
Date: Wed, 22 Feb 2012 12:25:23 +0100
Message-Id: <9D0FE6A7-91F9-4C5A-BB85-CA4988D13A6C@dominion.thruhere.net>
References: <1329745909-21013-1-git-send-email-eric@eukrea.com>
	<4F429115.3070907@opendreambox.org>
	<20120222101227.59546393@eb-e6520>
	<CAAQYJAs2FdO0STqq837wajztxv_7x7FPesZJM5OisQrjm+c6LA@mail.gmail.com>
	<4F44C4D6.5090204@opendreambox.org>
To: Andreas Oberritter <obi@opendreambox.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmM6ZNPcpsgqxui5LF7SFq//1YWyd8Olb6v+oKErDQ22G8DqUdHirUeuFFa34RgoZinaYcG
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 22 Feb 2012 11:33:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 22 feb. 2012, om 11:35 heeft Andreas Oberritter het volgende =
geschreven:

> On 22.02.2012 10:52, Andrea Adami wrote:
>> On Wed, Feb 22, 2012 at 10:12 AM, Eric B=E9nard <eric@eukrea.com> =
wrote:
>>> Hi Andreas,
>>>=20
>>> Le Mon, 20 Feb 2012 19:29:41 +0100,
>>> Andreas Oberritter <obi@opendreambox.org> a =E9crit :
>>>> On 20.02.2012 14:51, Eric B=E9nard wrote:
>>>>> - imported 2.0.5 from oe-classic
>>>>> - upgrade to 2.3.5 which is latest stable
>>>>> - tested on ARMv5 with Angstrom
>>>>=20
>>>> I created a recipe for vsftpd, too. Here's my version for your
>>>> reference. All patches were taken from the Debian or Ubuntu =
package.
>>>>=20
>>>> It differs from your recipe in these ways:
>>>> - uses openssl
>>>> - uses pam if available
>>>> - uses xinetd
>>>> - allows to set custom default configuration options in bbappends
>>>> - only build-tested with OE-core, no runtime tests so far.
>>>>=20
>>> your recipe was just pushed (with this email as the commit message =
...).
>>> I think it would have need a little rework, at least to not depend =
on
>>> xinetd by default and be runtime tested before being pushed.
>>>=20
>>> Eric
>>=20
>> And preferably should be committed in =
meta-oe/recipes-connectivity/vsftpd/
>> Now is in root of meta-openembedded.
>> Cheers
>> Andrea
>=20
> Yes. That was definitely not meant to be applied as is. Koen, did you =
by
> accident pick the wrong patch? Please revert and commit
> http://patches.openembedded.org/patch/21437/ instead.

Right, I picked the wrong patch, sorry about that. The "was that path =
intentional?" remark in patchwork suddenly makes sense, I couldn't =
figure it out while I was reading through the discussion.
Anyway, my bad, the 21437 patch is in now.

regards,

Koen=


