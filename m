Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id ECCDC78353
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 02:16:13 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id v189so32687495pgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 19:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3hHGI6kv8Z1+fzK2xcxw316W8vPzFK+cjunKntI+h+o=;
	b=D5gITpz9yg5zps9/GoPb7Jfl0S9NPhQgAWgFJ4moTsLEQQzvBHeNCHDURxvB93pyXh
	AUSyTz2VLFvNp5gXvqPuJZXd/a6M/6UYb349MYeEyDkzgvqA7A/gcMcFuZj+kYdHOkto
	YU/UGW7wc8nYORxwTsEVtDNekewWS661bEz4KEcZjLTWmI4VaI2BSUIRXh8F8XoQpuWo
	YxDdr27b0udqGSJOdGjtOQNoCBtl5LQjlcjumeL9XRpGn5kFZlM5KPA84sdjoAm2On1+
	IJBnHsLi2zb5Uk2Kn9d0S309DgIMVlSR+hkAhCpOh6nianNdPmJ0x7e0tRtO1Pucacfe
	9XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3hHGI6kv8Z1+fzK2xcxw316W8vPzFK+cjunKntI+h+o=;
	b=r1oQ7QkOCzefuasrhJf2p7tTv36Mr9Onc3j6ys0DNPt9ZAJ5naJwqy3r8F+eWNFna9
	M8Pul0dxeoxlfhomgK0C+UVlXn72a1EX/dFd3CliPpXB4/EJlwo5WopwQJ5sTh1WyFa4
	vo8CleIxRE745Ubg/spYbaV92+vOj5EjE5AYNzZeGRcMBsSJJ9CsHt7vpTrMmIbTT7YU
	C+Bk/XEBqQm1jA7XmefISZhdqEBoZRvklGuhgevqaRYmTq1NMOJ+f08lA2zIyybn7UF4
	+LAWc1mWqtGdd1SCseENQZn3YzHPaYp3Q3vtTJgsqKuR39FQbVXoTjvoNs83Gvpo0jaN
	vpoA==
X-Gm-Message-State: AHYfb5ga8VyidTOifTelY9fr81yh6oW/dnY5CP4bLtMwJGxVhAMJ41Y0
	6RTDB7HUBigpF9GMOpj160ZvyyR/JQ==
X-Received: by 10.84.149.139 with SMTP id m11mr3940579pla.376.1502936174964;
	Wed, 16 Aug 2017 19:16:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Wed, 16 Aug 2017 19:15:44 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA014B86538C@ALA-MBD.corp.ad.wrs.com>
References: <20170816053740.24934-1-jackie.huang@windriver.com>
	<CAMKF1sr1sKAThgm-tJPam+VAMqg4=wtSv7qhZ5ciBq+c6-gjsg@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B8652B2@ALA-MBD.corp.ad.wrs.com>
	<CAMKF1sqf3=F9S2EymZnJ2N77=qx1-svNAVU+t7rd9qvnFxctvQ@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B86538C@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Aug 2017 19:15:44 -0700
Message-ID: <CAMKF1sqyUfoFveEtU2D1WfcJ3n7TiZSWiPJL9=P31guR3Ss4hw@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] vlock: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Aug 2017 02:16:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 16, 2017 at 6:12 PM, Huang, Jie (Jackie)
<Jackie.Huang@windriver.com> wrote:
>
>
>> -----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: Thursday, August 17, 2017 09:02
>> To: Huang, Jie (Jackie)
>> Cc: openembeded-devel
>> Subject: Re: [oe] [meta-oe][PATCH v2] vlock: add new recipe
>>
>> On Wed, Aug 16, 2017 at 5:48 PM, Huang, Jie (Jackie)
>> <Jackie.Huang@windriver.com> wrote:
>> >
>> >
>> >> -----Original Message-----
>> >> From: Khem Raj [mailto:raj.khem@gmail.com]
>> >> Sent: Thursday, August 17, 2017 01:12
>> >> To: Huang, Jie (Jackie)
>> >> Cc: openembeded-devel
>> >> Subject: Re: [oe] [meta-oe][PATCH v2] vlock: add new recipe
>> >>
>> >> On Tue, Aug 15, 2017 at 10:37 PM,  <jackie.huang@windriver.com> wrote:
>> >> > From: Jackie Huang <jackie.huang@windriver.com>
>> >> >
>> >> > vlock is a program to lock one or more
>> >> > sessions on the Linux console.
>> >> >
>> >> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> >> > ---
>> >> >  .../vlock/vlock-2.2.3/disable_vlockrc.patch        |  37 +++++++
>> >> >  .../vlock/vlock-2.2.3/vlock-no_tally.patch         | 107
>> >> +++++++++++++++++++++
>> >> >  .../recipes-extended/vlock/vlock-2.2.3/vlock_pam   |   3 +
>> >> >  .../vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch |  19 ++++
>> >> >  meta-oe/recipes-extended/vlock/vlock_2.2.3.bb      |  59 ++++++++++++
>> >> >  5 files changed, 225 insertions(+)
>> >> >  create mode 100644 meta-oe/recipes-extended/vlock/vlock-
>> >> 2.2.3/disable_vlockrc.patch
>> >> >  create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-
>> >> no_tally.patch
>> >> >  create mode 100644 meta-oe/recipes-extended/vlock/vlock-
>> 2.2.3/vlock_pam
>> >> >  create mode 100644 meta-oe/recipes-extended/vlock/vlock-
>> >> 2.2.3/vlock_pam_tally2_reset.patch
>> >> >  create mode 100644 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
>> >> >
>> >> > diff --git a/meta-oe/recipes-extended/vlock/vlock-
>> 2.2.3/disable_vlockrc.patch
>> >> b/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
>> >> > new file mode 100644
>> >> > index 000000000..ee0d074de
>> >> > --- /dev/null
>> >> > +++ b/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
>> >> > @@ -0,0 +1,37 @@
>> >> > +Upstream-Status: Inappropriate [configuration]
>> >> > +
>> >> > +written by: Jeff Polk <jeff.polk@windriver.com>
>> >>
>> >> I think a SOB is better than inventing another tag.
>> >
>> > I just follow the guideline:
>> >
>> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Imp
>> orting_from_Elsewhere
>> >
>> > """
>> > It is also necessary to document the original author of the change. You should
>> indicate the original author by simply stating "written by" or "posted to the ...
>> mailing list by". You must not add a Signed-off-by: tag line with their name, only
>> the original author may add their own Signed-off-by: tag line.
>> > """
>> >
>>
>> I wasn't suggesting that you add SOB for someone else. I was suggesting to
>> not have original author attribution so close to the format for
>> Signed-off-by, tested-off-by etc. Something like
>>
>> Original Patch from: < source >
>>
>> where source is publicly listed URL where the patch is posted.
>
> I got the patch from our internal layer and the author is no longer in our company,
> what is the suggesting way if I can't find a public URL for this?
>

you have to consult your company's upstreaming policy.


> Thanks,
> Jackie
>
>>
>>
>> > Thanks,
>> > Jackie

