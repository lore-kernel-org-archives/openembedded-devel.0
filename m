Received: from na3sys009aog101.obsmtp.com ([74.125.149.67])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PupYG-0000fE-1K
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 18:09:28 +0100
Received: from source ([209.85.216.180]) (using TLSv1) by
	na3sys009aob101.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTW55cR8RG6o/y6Rfkurli7GA4C/Ejh33@postini.com;
	Wed, 02 Mar 2011 09:08:02 PST
Received: by qyk10 with SMTP id 10so254141qyk.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 09:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=0ypGoC0tXDx4iFDtxv/EgsC1cdJS8MDihIyyLdeJ1Gs=;
	b=qDmEvacgtU5UZEHAjEyCZQuap//TlpRA08Ii/+RL+r+VI5ruvMN2ouCcC94AGxisdI
	N4qsMbivhozQitzUH5XOccWuS5kAogABGK7/BNPxZ20Spkcc3irvgvzejp6rN89u+5Wk
	F67lBgYRCmbqVcqbBY11/a72rputUBWIxHEvA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=oTvkt+jWtDnt7EL5dbwc3bio2M165g4e7zqRnV934HejiH12mf/Ff37GfShwwRADr1
	ELitLpslMA5+dQhd75fETDA27Q2J1dwG3CqnQcDP7pHQ0+v3n8W1+3UUn9NHeAXUuEpw
	HQHJCCY9my1z/KZlGCL21MPZrVCFaRNTTDucg=
MIME-Version: 1.0
Received: by 10.52.71.65 with SMTP id s1mr46364vdu.104.1299085242793; Wed, 02
	Mar 2011 09:00:42 -0800 (PST)
Received: by 10.52.167.193 with HTTP; Wed, 2 Mar 2011 09:00:42 -0800 (PST)
In-Reply-To: <4D6E75BD.7050005@mentor.com>
References: <cover.1299076392.git.bengardiner@nanometrics.ca>
	<4D6E75BD.7050005@mentor.com>
Date: Wed, 2 Mar 2011 12:00:42 -0500
Message-ID: <AANLkTimwptJ9rS1mdDUcXxSwV5CXpgNH5O7hLtY2x5UF@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Tom Rini <tom_rini@mentor.com>
Cc: Andrea Galbusera <gizero@gmail.com>, Koen Kooi <koen@openembedded.org>,
	openembedded-devel@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH v2 0/2] allow linux-lib-headers with external-toolchain-csl
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
X-List-Received-Date: Wed, 02 Mar 2011 17:09:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Tom,

On Wed, Mar 2, 2011 at 11:52 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 03/02/2011 08:05 AM, Ben Gardiner wrote:
>>
>> This patch series enables the use of linux-libc-headers with
>> external CSL toolchain. This is useful when building userspace
>> applications to use ABI features not present in the headers bundled
>> with the CSL toolchain.
>>
>> Version 1 of this patch was tested in arago [1] and found to work there.
>>
>> Testing was performed there also by Andrea Galbusera<gizero@gmail.com>.
>> Who found that the changes enabled a couple of packages to pickup kernel
>> headers that were not bundled with the CSL toolchain.
>>
>> I tested this series on 3dc72c4ca0a9ce677f6c3a56517626984b5eaaa0 of
>> git://git.openembedded.org/openembedded#master
>>
>> Using the following local.conf (comment- and blank-lines trimmed):
>
> With some slight modifications to not use rsync (since the host may not h=
ave
> that) and to punt the local.conf.sample bit to another commit I'm doing
> shortly with a full -csl example, I've applied this locally and will push
> today. =A0Thanks!

Glad you like it!

I was not aware of the rsync restriction, thanks. What are the mod's
you're going to use? I'd be happy to re-spin the series with your
changes and the local.conf.sample extracted.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


