Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OXA1l-000716-SS
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 11:37:50 +0200
Received: by yxl31 with SMTP id 31so399265yxl.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 02:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=sOXGlICWZIgIXQF1vlTQ8/YJOs8cNh/IKEuyD8NCHVs=;
	b=evGleQTIfLx+d0JHwmjqNQSHCza2ukwVK23Qcr6U1KSSsZP6dkmnQVOqnKbUgwr490
	gYcGJSl8PQ3aCz3cU1kgGe7FzNvNqzFoayNTf2zTUqVSwrSo17M+ptlvkzveX56eBAcq
	PENu/X+Nj243/5AF3Um5qOLNW7evc0cGECSew=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=FIn2eAsqJhre9jkZVU7w/5uElgy95wdZ/iFfgIgBUwqSo+e7w1IVzAv6MKV4+z4prY
	qF+/ulQYpglNZRUbtu6SIA7ojVAyWCGSLBpIZYaKLQA/oYF4d0WMX8KqLs8jlLbpxKTK
	GZtgwOxTXl+VGjNbL3iiXqn8Q0ANvLxlxn8Hg=
Received: by 10.150.242.7 with SMTP id p7mr1138963ybh.371.1278626605291; Thu, 
	08 Jul 2010 15:03:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 8 Jul 2010 15:03:04 -0700 (PDT)
In-Reply-To: <1278624869.15825.35.camel@lenovo.internal.reciva.com>
References: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com> 
	<1278444743-4924-4-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTimnWBxCFMLlns8Q8LJ-3BvpWqqTNkqZ8ZlWbQdo@mail.gmail.com> 
	<1278622050.15825.18.camel@lenovo.internal.reciva.com>
	<AANLkTinf_zr9QQdPJyevN-ve62_Pqi3WDNygAgABPt32@mail.gmail.com> 
	<1278624574.15825.30.camel@lenovo.internal.reciva.com>
	<AANLkTikn4ygx6v-P4WvZWHvxD9rQAq5kyDuMdolDPbdn@mail.gmail.com> 
	<1278624869.15825.35.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jul 2010 15:03:04 -0700
Message-ID: <AANLkTikuNN4qw76uAXxlmIhIlOJVTxjRD8vN7lg7kRyf@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][v3 3/4] uClibc: redo configuration
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
X-List-Received-Date: Fri, 09 Jul 2010 09:37:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 8, 2010 at 2:34 PM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2010-07-08 at 14:31 -0700, Khem Raj wrote:
>> On Thu, Jul 8, 2010 at 2:29 PM, Phil Blundell <philb@gnu.org> wrote:
>> > On Thu, 2010-07-08 at 14:03 -0700, Khem Raj wrote:
>> >> If I am not wrong you can still do interworking and not have bx (usin=
g
>> >> mov pc,lr)
>> >
>> > That's not an interworking instruction in ARMv4T, and I don't think it
>> > is in ARMv5TE either. =A0You might be thinking of pop {pc}, which is
>> > interworking in ARMv5TE, but even this is not interworking in v4t.
>>
>> tst lr, #1
>> moveq pc, lr
>> bx lr
>>
>> Thats how its done on armv4 for EABI
>
> Right, but the MOV in that case is not an interworking instruction; it's
> just a way to avoid executing BX when you don't actually need to switch
> mode, so that you can create a library which still works in an ARM-only
> environment.
>
> The final BX in that sequence is mandatory in order for it to actually
> function as an interworking return.

right you are. yes bx is always needed for thumb interworking. So I guess
for uclibc we can rely on THUMB_INTERWORK distro feature if set correctly.
>
> p.
>
>
>


