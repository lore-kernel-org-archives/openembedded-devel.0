Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PRQxm-0000Jk-ED
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 16:02:18 +0100
Received: by wwi17 with SMTP id 17so4460620wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 07:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=zNfJDee3fC8tDDKR3igKOuOEhVzahQEgWjKhZ68cZ6A=;
	b=fhKT450hNfV3sTolFjRinAdhb6QHwmxD3eoYdrQCytL0+XMnVPYccAvXOOMW7uBUar
	jFpm2RLA+VAQAL3kHjI44YInUq11QRs8wZBX4HufNu8MIKe3CBvb75XQ9Dd25v9lSCKe
	/v7IEQFkw1fdDhOqFt7A4aiccY2a8ktHg+B5U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=we/hToFdDwJNYfq5yVZelWBdaBnLxWvBrZHzuBIjGiJKanfzmUzz3qsJ5lI9D252md
	XjG3s5Nm9fLDHyG3/NJKPOqozUCXeu/6ATelpBOmymq7pdgANiFxkTrE7qlRN3vHxipj
	vK89bzPrC0AXKIaAw9ibCQMjSQuDJBbyZJ6V8=
Received: by 10.216.154.8 with SMTP id g8mr828567wek.12.1292079642156; Sat, 11
	Dec 2010 07:00:42 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Sat, 11 Dec 2010 07:00:22 -0800 (PST)
In-Reply-To: <A24693684029E5489D1D202277BE89448587464B@dlee02.ent.ti.com>
References: <A24693684029E5489D1D202277BE894484FB9740@dlee02.ent.ti.com>
	<A24693684029E5489D1D202277BE89448587464B@dlee02.ent.ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 11 Dec 2010 08:00:22 -0700
X-Google-Sender-Auth: fbLIJANkfjdE0ze7AO5EP3XLI84
Message-ID: <AANLkTimN_uxrQ+=L9hWQWubK+xLcBeuD2Nw8oxt5z8Dh@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: srctree and stamps
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
X-List-Received-Date: Sat, 11 Dec 2010 15:02:19 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 10, 2010 at 7:17 AM, Ambrose, Martin <martin@ti.com> wrote:
> On Fri, Nov 19, 2010 at 20:01:28, Ambrose, Martin wrote:
>
>> I find that using the latest srctree the stamps aren't updated in the same fashion
>> as regular recipes. In the example below I build the srctree recipe (mypackage) and
>> then build an image depending on same. Even though the package is built just prior
>> the image build still processes several steps which seem redundant.
>>
>> I see some special handling of stamps in srctree.bbclass and wonder if this
>> is expected/desired behavior.
>>
>> Thanks for any help/pointers.
>
> First: sorry for the double post -- some transitory problem with our mail server.
>
> I found that the lack of expected stamps resulted in errors when building images
> with srctree recipes as run time dependencies. Since the do_populate_sysroot,
> among others, task stamp was not present it was run again. Various errors
> could occur depending on the nature of the recipe but I often saw
>
> * resolve_conffiles: Existing conffile /home/user/work/oe/arago-tmp/rootfs/my-image/etc/device_table is different from the conffile in the new package.
>
> The following patch to create the missing stamps is my resolution.
> Comments welcome.

This looks right to me.  When it was switched from exec_task to
exec_func to avoid other complications, I guess it was forgotten that
exec_task is what runs make_stamp :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


