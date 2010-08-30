Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Oq6vW-0002Nc-S3
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 18:09:49 +0200
Received: by eyb7 with SMTP id 7so3334959eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 09:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=oBd9jYC+dZhOvwO4YS2Djrv/SM22uhv8AKLJA+G2r/M=;
	b=WBecsPAmFkNC/V+vP2/ADKubJVoxIgoU7JClWiaXv/XD7tkoBI93STa+vG89URJk29
	KQ+FWBK3Cmfg8CDoyZYvgVfLy0owwxjOpAM8+BEXrzy57WDsSDChQFzwyy5PX+pOTiOV
	VAVojGo61pecdwA5HpyCQ6QSCNHIhWhZ69bbU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=a2JM8JxUcYlm/xn0QsBZoeQqBBRYrkhubo1dNQlb+KMe/WCzwcHTvb9a9TEfa2Np1D
	yfda1Axcd1rsvf1KD7zKa61cvv84eqTuWjwlrgBloc2BsPOOLuhNFu4iIujbljORkMK/
	akIq5bU5i/Q0Mva4miY+n2Mx2UH7/3Y1Pj8/Y=
MIME-Version: 1.0
Received: by 10.216.185.4 with SMTP id t4mr5035258wem.87.1283184552873; Mon,
	30 Aug 2010 09:09:12 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Mon, 30 Aug 2010 09:09:12 -0700 (PDT)
In-Reply-To: <AANLkTikONxUinXtW0V6nxzt11MWE0Qt3HUxsZ9N+0_48@mail.gmail.com>
References: <AANLkTinvhMiZhHC4GrR8Muf-7oPa-j3zBeDWCZrkTd-z@mail.gmail.com>
	<AANLkTimH2YnW3CnLFxa6NyNCeC0-jNqy0dhDXS_ddWX_@mail.gmail.com>
	<AANLkTinJ7rUj8jq=PYeVXk7yZiLB6AtxQm9JKDcXZswR@mail.gmail.com>
	<AANLkTikONxUinXtW0V6nxzt11MWE0Qt3HUxsZ9N+0_48@mail.gmail.com>
Date: Mon, 30 Aug 2010 12:09:12 -0400
Message-ID: <AANLkTi=_WQfCcTZ4JmHOOTagBiN+4EtAi3J=5XpoRopt@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Simple srctree example seems not depend on toolchain
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
X-List-Received-Date: Mon, 30 Aug 2010 16:09:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Aug 29, 2010 at 2:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Aug 29, 2010 at 7:30 AM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
>> Hello,
>>
>> On Sun, Aug 29, 2010 at 12:27 AM, Leon Woestenberg
>> <leon.woestenberg@gmail.com> wrote:
>>> On Sat, Aug 28, 2010 at 10:46 PM, Leon Woestenberg
>>> <leon.woestenberg@gmail.com> wrote:
>>>> in an attempt to learn how to use srctree I am hitting either 1) an
>>>> oversight on my behalf or 2) a bug in srctree.bbclass 3) something
>>>> else
>>>>
>>> After further debugging I am more sure I'm seeing wrong behaviour from
>>> srctree.bbclass.
>>>
>>
>> This was a bogus report. I thought I was working against latest OE
>> GIT, but in fact, it seems the GIT service is unreliable currently and
>> I have probably hit an aborted pull.
>> Download speed from GIT is ~20 kB/s.
>>
>> I'm interested in adding this helloworld2 as helloworld-srctree as an
>> srctree example.
>
> Yes please go ahead that will be a good template to have.

I have two other srctree examples -- I wonder if we should think of a
consistent way to organize examples so its a little more obvious where
to find them?

http://cgit.bec-systems.com/cgit.cgi/autotools-demo/
http://cgit.bec-systems.com/cgit.cgi/qt-overo-palo-gpio/

example-helloworld
example-srctree-helloworld
example-srctree-autotools
example-srctree-qt-overo-palo-gpio

Thanks,
Cliff

-- 
=================
http://bec-systems.com


