Return-Path: <petr.nechaev@cogentembedded.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id A03006FFA4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 15:59:26 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id o189so41806234ioe.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2016 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4DPbN4MjY+igrIvUZ0sZWnQxMYSvTUFkpiILAIlik6U=;
	b=T5B9S3JrG65mqGTvCWd7PXBXUQm8Ll7rHLvKMtONZlowLFPY8dvO0KUNDvW0iPX8qa
	Q8/oxgb49Y4Tmuch7FJcz22vw89xXeSK5dKbipq0PN1h+7C+IqADNaeJm8b7IWoyap9R
	B+ayVsGAY76IMSNNqpGDAX+RjwiT3Xl5BRhwAs2nRK+fHIlIZPqdNwmoOSFOQJ85dKxy
	vjwao1PHkyeduFlmbxxCPMMawti0y4aEcbvFX+Vs5f2cw7vwrEl7P4ZAxPVzR43P9Ybi
	5vaC+zrqRD+sxqmTtrk9kI+JYmZ6/y2SJghsOm5OGZGOCF2MnGVW9cQvHyM1lrC5yKa8
	uPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4DPbN4MjY+igrIvUZ0sZWnQxMYSvTUFkpiILAIlik6U=;
	b=SAq4KJUlpIJ+8IKqGcs6pZJ5zYNubV6JfPkCvb2qwFKRpRo6Cnz363YBMJQqZYHZJg
	O46y1fz+tpd9CwFPN1iSWZG+aa8vl4u7IeSbolpF6Vbw7PK6isKim/Ayf/mHnn9b2/nb
	0W4GoTnXeA7SZzC+SWVAV8UGtlt4Uq8i9KzGbKm0phqBVEgh0BaPE92Wd0RWunJ0GJGz
	z3qJBVPk8nr3MDIuTFmeTgsut8WN2oNo5evP8QaT42cwIlRprYjlhE30JmtsTNB/pxnT
	+etR/JDZJ9NVyn3WvIgllNRhsebesIoMkbPH0zkxVU75HTREH6IETKm5VoMhJakQASDJ
	IjhA==
X-Gm-Message-State: ALyK8tJUwZ6c3yfbt5qORqGk+Gwe0TCpxpRyvlaNfjM1z3canmxkTQhT7P7rou6FQ8FMDhOP4CcH8YTivNBvkg==
X-Received: by 10.107.41.19 with SMTP id p19mr18598962iop.30.1465487966221;
	Thu, 09 Jun 2016 08:59:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.4.88 with HTTP; Thu, 9 Jun 2016 08:59:25 -0700 (PDT)
In-Reply-To: <33320.10.7.198.51.1465487815.squirrel@linux.intel.com>
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
	<CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
	<33320.10.7.198.51.1465487815.squirrel@linux.intel.com>
From: Petr Nechaev <petr.nechaev@cogentembedded.com>
Date: Thu, 9 Jun 2016 11:59:25 -0400
Message-ID: <CAHPquwP2RDW3T5hiizow6=1xJzwgCPDDs=z+OHgaEedcXTh6bg@mail.gmail.com>
To: timothy.t.orling@linux.intel.com
Cc: Konstantin Ripak <konstantin.ripak@cogentembedded.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] the fate of Vala in OE
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
X-List-Received-Date: Thu, 09 Jun 2016 15:59:28 -0000
Content-Type: text/plain; charset=UTF-8

We do use Vala for internal gstreamer-related projects so I would
volunteer to support it in oe-core.
---
Petr


On Thu, Jun 9, 2016 at 11:56 AM,  <timothy.t.orling@linux.intel.com> wrote:
>> On 9 June 2016 at 15:08, Philip Balister <philip@balister.org> wrote:
>>
>>> That said, what other layers use vala? If it leaves core, is there a
>>> layer that can host it and support other layers using it without to much
>>> trouble?
>>>
>>
>> That's the key question really - can the support be extracted and added to
>> eg meta-vala in some way?
>>
>> Ross
>
> I use vala for clutter/cogl/weston/wayland development, although not in
> any published public layers. Part of me hates to see it leave core, but a
> well maintained layer is acceptable-ish. I know that vala-terminal in
> meta-oe has been in and out of blacklist for quite a while now.
>
> Cheers.
>
> --Tim
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

