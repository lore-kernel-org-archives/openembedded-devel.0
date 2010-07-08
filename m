Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OX9WC-0007gx-8H
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 11:05:32 +0200
Received: by bwz10 with SMTP id 10so1102867bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=x82YMzNE8f7hpqLwx+qFbd0vrnqbp96Fe2kMzENex9I=;
	b=e91oLvqnbI3AUL3RMJpWHrhHf7Su7oiZFXWR9ztED0nV/xvPXv59wXjpUd4N9zT2Jy
	PPg+nI3fKTrx1bpyCv/03H5RB75mYnUSHKLJRATBIug8xqr3hchxlPY4N5qt0VoKOSxv
	ROviLT8g8/cVXurcayOdU1V3pvN3MH3+mpx4E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=rloT5A6rufYHYIssbSi6mt4LhpteuzG8YgV/9J2RGTuWpLvLEkjOvrsbwO9umU5SYw
	OjLARB4BpwyKh6BZ1CN7/6xyms3ciWZr3p84D8TngyjWp00WFYFC6qUbSWed8f6ZyXt2
	hwfUEJY+84mj5rr2pBj6KUa2ycNK/LnXXnii4=
Received: by 10.204.6.74 with SMTP id 10mr6710834bky.203.1278627403872;
	Thu, 08 Jul 2010 15:16:43 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id s34sm690841bkk.1.2010.07.08.15.16.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 08 Jul 2010 15:16:43 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OWzOT-0008Oa-HP; Fri, 09 Jul 2010 00:16:33 +0200
Date: Fri, 9 Jul 2010 00:16:33 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20100708221633.GE23169@mx.loc>
References: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com>
	<1278444743-4924-4-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTimnWBxCFMLlns8Q8LJ-3BvpWqqTNkqZ8ZlWbQdo@mail.gmail.com>
	<1278622050.15825.18.camel@lenovo.internal.reciva.com>
	<AANLkTinf_zr9QQdPJyevN-ve62_Pqi3WDNygAgABPt32@mail.gmail.com>
	<1278624574.15825.30.camel@lenovo.internal.reciva.com>
	<AANLkTikn4ygx6v-P4WvZWHvxD9rQAq5kyDuMdolDPbdn@mail.gmail.com>
	<1278624869.15825.35.camel@lenovo.internal.reciva.com>
	<AANLkTikuNN4qw76uAXxlmIhIlOJVTxjRD8vN7lg7kRyf@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikuNN4qw76uAXxlmIhIlOJVTxjRD8vN7lg7kRyf@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Fri, 09 Jul 2010 09:05:32 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 08, 2010 at 03:03:04PM -0700, Khem Raj wrote:
>On Thu, Jul 8, 2010 at 2:34 PM, Phil Blundell <philb@gnu.org> wrote:
>> On Thu, 2010-07-08 at 14:31 -0700, Khem Raj wrote:
>>> On Thu, Jul 8, 2010 at 2:29 PM, Phil Blundell <philb@gnu.org> wrote:
>>> > On Thu, 2010-07-08 at 14:03 -0700, Khem Raj wrote:
>>> >> If I am not wrong you can still do interworking and not have bx (using
>>> >> mov pc,lr)
>>> >
>>> > That's not an interworking instruction in ARMv4T, and I don't think it
>>> > is in ARMv5TE either.  You might be thinking of pop {pc}, which is
>>> > interworking in ARMv5TE, but even this is not interworking in v4t.
>>>
>>> tst lr, #1
>>> moveq pc, lr
>>> bx lr
>>>
>>> Thats how its done on armv4 for EABI
>>
>> Right, but the MOV in that case is not an interworking instruction; it's
>> just a way to avoid executing BX when you don't actually need to switch
>> mode, so that you can create a library which still works in an ARM-only
>> environment.
>>
>> The final BX in that sequence is mandatory in order for it to actually
>> function as an interworking return.
>
>right you are. yes bx is always needed for thumb interworking. So I guess
>for uclibc we can rely on THUMB_INTERWORK distro feature if set correctly.

AFAIR eabi implies thumb, thumb makes interwork possible, interwork
imples bx but my memory could fail me on this.

Can you, khem, think of a set of "thumb" and "interwork" (and
potentially "bx" for HW that supports it, like IIRC all e.g. cortex
onward based designs) in DISTRO_FEATURES and MACHINE_FEATURES that can
be used generically?

A first step would be to just resuse the infrastructure in this thread,
later on we could think about some sort of combined_feature mechanism to
properly setup arm ontop of this proposed infrastructure.

cheers,


