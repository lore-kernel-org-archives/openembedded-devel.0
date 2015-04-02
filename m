Return-Path: <ticotimo@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id C3B3265C9C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2015 04:57:04 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so68014456ied.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 21:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fVx/giBli2pYRMx2DwU7mXyC+lzCo/YUzFYoVkqM5xk=;
	b=O16eWVU3XQN6blCJInROIsXnYIQ7ocWF9AQqyDWOYT8J/593zvPFWB6rLQKVUHwLKf
	88IeFA+Y+FwptyMDW6diBA5L9fNZKhTQZqsV0xtYYqERigoQJn7btFRak19sJbJCksHr
	NbqCY+Awbgc6BAfKEGz8QzwECNp8Jw2DT1dgoqwpseN1IK30fso031Q9N06mKJFXQwwa
	QEODdRPLUIuk7urmtV4027EJvV+ZuEAu+oz/Nxd6wC1AixfC01GCulYSPv9sF9s7+jIv
	Mz8R99BqGi7db/efXsz4zlG7bTkIq+/ZnkgJXE+dIJz8wk0b0NIaZnHK2GOb+Xp1ick0
	D7Sw==
MIME-Version: 1.0
X-Received: by 10.50.137.2 with SMTP id qe2mr11402661igb.20.1427950625859;
	Wed, 01 Apr 2015 21:57:05 -0700 (PDT)
Received: by 10.36.76.151 with HTTP; Wed, 1 Apr 2015 21:57:05 -0700 (PDT)
In-Reply-To: <551CC7F3.9080300@gmail.com>
References: <54F47045.4080503@windriver.com> <20150302142645.GC2309@jama>
	<551CC7F3.9080300@gmail.com>
Date: Wed, 1 Apr 2015 21:57:05 -0700
Message-ID: <CANx9H-CJXC1OHRqV0G58_xKVhez-VD3A8a4aHXO2MPthvcwD-Q@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Discuss: ruby-1.9.x EOL -- someone to add ruby-2.2?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Apr 2015 04:57:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2015 at 9:39 PM, akuster808 <akuster808@gmail.com> wrote:

> Randy,
>
>
> On 03/02/2015 06:26 AM, Martin Jansa wrote:
>
>> On Mon, Mar 02, 2015 at 09:14:29AM -0500, Randy MacLeod wrote:
>>
>>>
>>> As stated in the post below, ruby-1.9.3 is no longer supported
>>> and CVEs will not be released.
>>>
>>> I'm not a rubyist but I assume we should upgrade to ruby-2.2.0 which
>>> became the stable version as of December 25, 2014. Comments?
>>> Martin, you are listed as maintainer of the meta-multimedia,
>>> do you have any concerns about such an upgrade?
>>>
>>
>> No concerns from me.. I don't use ruby much (mostly ruby-native for
>> webkit builds) so I would welcome such upgrade.
>>
>>  If anyone wants to start work on this for meta-oe, that'd be great.
>>> If no one gets around to it, then a developer from WindRiver will
>>> likely be able to work on it but not a few months.
>>>
>>
> I started on the upgrade. Hope to have it done soon.
> - Armin
>

I will help if there is any collateral damage in meta-openembedded.
-Tim

>
>
>>> ../Randy
>>>
>>> ---
>>> As of today, all support for Ruby 1.9.3 has ended. Bug and security
>>> fixes from more recent Ruby versions will no longer be backported to
>>> 1.9.3.
>>>
>>> This end of life was announced over a year ago.
>>>
>>> We highly recommend that you upgrade to Ruby 2.0.0 or above as soon as
>>> possible. Please contact us if you=E2=80=99d like to continue maintaini=
ng the
>>> 1.9.3 branch or if for some reason you can=E2=80=99t upgrade.
>>>
>>> Posted by Olivier Lacan on 23 Feb 2015
>>> ---
>>> Also see:
>>> https://bugs.ruby-lang.org/projects/ruby/wiki/ReleaseEngineering
>>>
>>> --
>>> # Randy MacLeod. SMTS, Linux, Wind River
>>> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200 Ottawa, Ontario,
>>> Canada K2K 2W5
>>>
>>
>>
>>
>>  --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

