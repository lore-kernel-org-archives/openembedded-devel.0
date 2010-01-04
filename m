Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NRtGY-00081K-D5
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 21:11:05 +0100
Received: by pwi18 with SMTP id 18so9496650pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 12:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=oH/HNerLmHhXfGgnVzBZUe95EAn71yGqJnKkB4Xrl30=;
	b=p4ghabbedwdnDFI/eV2SYz8C+HFGKoVIpgcNTebqOqrRk5jx8DTyCx2DoQRjBmoth0
	IkHAyOFjkrCrV0yzH5Udo+3TSp1s4H4r6cTzVjiAHLHOJziR7k29OONfnbRaIBu9QH0j
	cQaVUsIxOsL9DaqFdWrX6R7BZ0wfLcjiqNGHY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=a+vs88yFPm3G1n8BU3OM5nybH0aMlUIngSjENtm6il+DC5GdrC0zEAH88u6yQJtRXd
	AExmVIuSm52zEcGtF5iGGeazRlNGCXrK66MMzW5xAFVvmWjgdANV8LUcO5fzuyZytP4/
	vCHnkHYi8FSQLrVQH2SBR9bJhyieDgTxhneEg=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.60.3 with SMTP id i3mr15213432wfa.147.1262635738080; Mon, 
	04 Jan 2010 12:08:58 -0800 (PST)
In-Reply-To: <4B424818.3030603@cbnco.com>
References: <1262450620.5161.33.camel@gnutoo-desktop>
	<4B424818.3030603@cbnco.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 4 Jan 2010 13:08:38 -0700
X-Google-Sender-Auth: b5696b61becde0be
Message-ID: <b6ebd0a51001041208h74a1dc7bjeca2730d4299282d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: DOLT(doltlibtool)
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
X-List-Received-Date: Mon, 04 Jan 2010 20:11:05 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 4, 2010 at 12:57 PM, Michael Smith <msmith@cbnco.com> wrote:

> GNUtoo wrote:
>
>  So far I identified 4 software using dolt:
>> *abiword 2.8.1
>> *goffice 0.7.4
>> *xf86-video-intel 2.9.1
>> *gmime 2.4.10
>>
>
> Also xserver-xorg (patched in c10e9906a2ecea7e9c04bf967a8882d6b4cd1077),
> cairo (b57a5b04cd35c935bd7ed46ec8db07ec7c0766db), and webkit
> (c70445331f91cb7f02503e7567927b9b6e40e6bb).
>
> The real fix is to get upstream dolt.m4 updated with this patch:
>
> http://lists.x.org/archives/xorg/2009-May/045835.html
> <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>

Personally, I'd rather see the libtool prefixing die, instead.  It's not
really necessary, other than a sanity check, and we could catch those via
qa_configure log checks or something.  We're needlessly deviating from
upstream libtool here, it's a remnant.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.

