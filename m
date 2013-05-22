Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 45EEF60881
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 14:33:50 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id u57so1240043wes.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 07:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=sV5GyfkgVksdXjoDwG8lsAnhPRcjWoenKHsw18+15bE=;
	b=t/Gf0beq/biQgpdUS3v8HkQqTEBfIvhGvpkcXWZrYQUoaie09ZXVv/SW9r6QD3HZJB
	+InJXgoIgSLc/SwOa8MKTbOX+lQ5SZOajAd4ux3JxfT8d+ODE34IINtRmJaFhOeCmDrn
	srGUk3K0WOzHrHhG//yO5GawVxMJLnzY0sM6xeaxXxOe2ymYPShlqdaJcpUCdKBBx33c
	Ctz7A7OapdDkCVh87x1eulz7Ch+/fEFmX5PuHQBmnTvEWImZXJWmL2msehtihDMV0ZBp
	NCB/OqhhV7Bj2AJ1JkhNTJ/A6pMo43HWvV0uqC3ewwTnjrQKQi0UN5kVAeM0EafjDbVB
	32Iw==
MIME-Version: 1.0
X-Received: by 10.180.109.84 with SMTP id hq20mr15392680wib.11.1369233229950; 
	Wed, 22 May 2013 07:33:49 -0700 (PDT)
Received: by 10.216.52.133 with HTTP; Wed, 22 May 2013 07:33:49 -0700 (PDT)
In-Reply-To: <519CCFFF.2060506@windriver.com>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
	<CALbNGRSV7KK5hPddSiVTRborW6_PZfYstDFfu4M2oRJ5QwtV_Q@mail.gmail.com>
	<519CCFFF.2060506@windriver.com>
Date: Wed, 22 May 2013 16:33:49 +0200
Message-ID: <CALbNGRTbELHNDyfF_0zfu9qL=ZpG17ffx3DU-bw8GNbrKODcgA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] OE TSC Minutes 7 May 2013
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
X-List-Received-Date: Wed, 22 May 2013 14:33:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2013 at 4:02 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 5/22/13 3:31 AM, Andreas M=C3=BCller wrote:
>>
>> On Tue, May 21, 2013 at 9:36 PM, Jeff Osier-Mixon <jefro@jefro.net> wrot=
e:
>>>
>>> OpenEmbedded Technical Steering Committee
>>> 7 May 2013
>>>
>>> Attendees:
>>>    Koen (koen)
>>>    Khem (khem)
>>>    Fray (fray)
>>>    Paul (bluelightning)
>>>    Richard (RP)
>>> Apologies:
>>>
>>> Notes: Jefro
>>>
>>> Agenda at a glance:
>>>
>>> 1. pick a chair
>>> 2. new issues
>>> 3. lingering issues
>>> a. systemd merge unhappiness
>>> 4. projects in progress - status
>>> a. oe-classic recipe migration status
>>> b. oe-core release
>>> c. systemd into master
>>> d. meta-oe appends/overlayed recipes RFC
>>> e. 1.5 planning
>>> 5. infrastructure
>>> a. mailing list moving to YP server, in progress
>>> b. oe.org flooded
>>> 6. projects deferred
>>> a. raise awareness of "janitor" list, QA "bugs"
>>> b. document whitespace changes to the shell
>>> c. raise ntp with the Yocto Project [RP]
>>>
>> There are three issues I would like to comment on:
>>
>> 1. systemd migration:
>>
>>  From what I see the only major step left over is to bury meta-systemd.
>> The only appends found there are those for oe-core. I asked for this
>> long time ago [1] and support was offered but...
>>
>> 2. indention:
>> Reading between the lines there is some unhappiness on meta-oe using
>> four spaces for shell and python code. I personally agree with Martin
>> here because I have not seen a technical reason for shell requiring
>> tabs so far. To me this looks like a style decision which increases
>> the burden to submit for low-skilled people like me. Could somebody
>> please enlighten me: For what technical reason do we need tabs in
>> shell code?
>
>
> (Background) When the spacing was decided, looking at the existing OE
> recipes and classes, the majority of things were indented such that pytho=
n
> used tabs, and recipe (shell scripting) used spaces.  During the cleanup =
of
> the scripting sections it was decided that the least impact to all was
> desirable.  Thus the python-tab, shell-spaces convention.

??? - see

commit 604d46c686d06d62d5a07b9c7f4fa170f99307d8
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Wed Jul 11 17:33:43 2012 +0000

    Convert tab indentation in python functions into four-space

    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


So now at least I am totally confused ( which might be an argument
preferring only one type of indentation )

>
> It's true that shell scripts don't really care about indenting, so the fo=
ur
> spaces is just a convention that was decided on based on that.  The conce=
rn
> is that if we go in and change the convention now, it's going to cause a =
lot
> of potential disruption.
>
> So the answer isn't that it's a technical reason, it's a community reason=
.

Please give me the link to the decision written and I'll follow the communi=
ty.

> Don't rock the boat on something that is just going to annoy people and
> provide no actual help.  So far I haven't seen a compelling argument to
> change the convention BTW, other then (paraphrase) "I don't like spaces, =
and
> want to use tabs".  (Note, when I write shell scripts, I prefer tabs as
> well..)
>

Please don't misunderstand me: I thought I have read some sidenotes on
meta-oe using four-spaces for all type of code:

(9:31:13 AM) fray: ok.. so what about the comment of an 'oe'
maintainer ignoring the TSC?

Maybe I am over-interpreting this. Whatever, this is not that
important and should stop here - we face other challenges - sorry for
the noise

Andreas

