Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UXuCS-00045Y-1l
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 16:09:32 +0200
Received: by mail-ee0-f53.google.com with SMTP id d49so285613eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 May 2013 06:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=hGB19ZsgPr3njOhPxOOq4Vk1cXizP0vy+Ou+6FfgdJg=;
	b=RcCFlA0/XyeBZXL/gvMdGGYFBMZLQCBW5nVQZAPKIFuD4zqO7o5CQQ5/BxYoTd917G
	HOu5b2x8DTVD3w4DJt677E4fon6LZW3WV93diEzB9k8AkfGCo4AI4N5TCvsgFZYP49PX
	SgL1bBHw5Zo4Dmtz2ZUkYsAhRl3PR3QP6sr+oEMfUIo3jPb+OksoKwUlrsasVcZ0fNwS
	2Yi1sgRQbOsLbibdlNMh1/T3UqxDpnrqrh/oeCOOpkKfxd18AHJzBXhyhaIurSOfY/wh
	gTQuOw/55hvLLShH4wCQzWQREBiRK8c0jvZGsHqcUmky/PgKGaiBdO9PiVAjFlJBjmNK
	4U/Q==
X-Received: by 10.14.22.7 with SMTP id s7mr19909445ees.32.1367502698487;
	Thu, 02 May 2013 06:51:38 -0700 (PDT)
Received: from ?IPv6:2001:610:612::9177:8ba1:cbe:1b13?
	([2001:610:612:0:9177:8ba1:cbe:1b13])
	by mx.google.com with ESMTPSA id f9sm9839624eeu.11.2013.05.02.06.51.35
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 02 May 2013 06:51:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1515263.cqA6k5LnsF@helios>
Date: Thu, 2 May 2013 15:51:34 +0200
Message-Id: <B47ECC58-2AC2-4BC3-80C7-396E1C4F83EE@dominion.thruhere.net>
References: <1364484753-22122-1-git-send-email-koen@dominion.thruhere.net>
	<20130328215943.GA6608@novatech.datenfreihafen.org>
	<20130401153135.GJ10672@windriver.com> <1515263.cqA6k5LnsF@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnPqD5xvModBKi/Pt3soy8ihSx2+UR4azQW48Ji1ygC91Gjs8k+VMqrN3oNze4MtGW93YWT
Cc: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <Joe.MacDonald@windriver.com>
Subject: Re: [meta-networking][PATCH] 6lowpan-tools: add git version
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
X-List-Received-Date: Thu, 02 May 2013 14:09:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 mei 2013, om 12:21 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Monday 01 April 2013 11:31:35 Joe MacDonald wrote:
>> [Re: [oe] [meta-networking][PATCH] 6lowpan-tools: add git version] On=20=

> 13.03.28 (Thu 21:59) Stefan Schmidt wrote:
>>> On Thu, 2013-03-28 at 16:32, Koen Kooi wrote:
>>>> The 0.3 release was 6 months ago and git HEAD contains fixes to =
make it
>>>> work with contiki, so build from git instead of backporting all the
>>>> patches.>=20
>>> Sounds like a good idea. And not only because one of the patches is
>>> from me ;)
>>>=20
>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>> ---
>>>>=20
>>>> .../recipes-support/6lowpan/6lowpan-tools_git.bb     | 20
>>>> ++++++++++++++++++++ 1 file changed, 20 insertions(+)
>>>> create mode 100644
>>>> meta-networking/recipes-support/6lowpan/6lowpan-tools_git.bb>=20
>>> Any special reason why this is named 6lowpan here?
>>>=20
>>> 6lowpan normally refers to IPv6 over LoWPAN while the lowpan-tools
>>> do not configure anything regarding IPv6 but the plain LoWPAN which =
is
>>> the protocol layer below. I would suggest renaming it to =
lowpan-tools.
>>=20
>> I've not used these myself.  Based on what I saw on the project web
>> page, 6lowpan seems like a pretty good name:
>>=20
>>   The goal of this project is to create an implementation of 802.15.4
>>   and several protocols which run on top of it (primarily 6LoWPAN) =
for
>>   Linux.
>>=20
>> But a quick look around in my apt-cache turns up lowpan-tools.  Seems
>> like that's what it's also named in Fedora land, so I'm thinking =
that's
>> probably the right call here, too.
>=20
> lowpan-tools was the name we had in OE-Classic as well.
>=20
> Koen, would you mind renaming this and sending a v2? Could you also =
use SRCPV=20
> in PV and add SUMMARY and HOMEPAGE at the same time?

I'll have a look at it=


