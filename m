Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PKyCz-0003wo-1k
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 20:07:17 +0100
Received: by wwb39 with SMTP id 39so111252wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 11:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=TAbTuvRPeRKxmk+pzZejk2tjROHL/ZsuRGX2YEHLpUQ=;
	b=GYMBwY7WqOCiafQycTte+lTdJzj2+XBzI5LDt0yXoffDcUjR9mB4uVdPUjmxKYmqlV
	meV25VSNDgrKzFHABSJFVTqY4IHYxElN8toSGITcYjWJvxEfRJ3ZHie7xCfI9SBzqtEv
	oqnGmEk3TAIVKNcH2sj7P/1UyHUjMIpK6lukQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=TNPExmB10ubdHRnX0G2NEwcJiogmzHX2VWQFmWxfSc2UqxHsVljD/+ULLae0i68OTQ
	UnBkuu19OyYkXaHyi6rWX30xHO/NbaWfXxAntdhjfcBrA3hkOkyaRglex0rzwvSnRnX5
	8SaMI8uw9qFQ6SnVnQnEX96nTBYmOAfx13xMA=
Received: by 10.216.24.139 with SMTP id x11mr7031393wex.27.1290539162910; Tue,
	23 Nov 2010 11:06:02 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 23 Nov 2010 11:05:42 -0800 (PST)
In-Reply-To: <AANLkTimuLxR88D2jRH=-Ky0BRLK5GkbyqUcSO8FhK=KW@mail.gmail.com>
References: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
	<ich10v$f5b$1@dough.gmane.org>
	<AANLkTimuLxR88D2jRH=-Ky0BRLK5GkbyqUcSO8FhK=KW@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Nov 2010 12:05:42 -0700
X-Google-Sender-Auth: JG6tJ8IzIIiKW1rO9cyFxVsJz3Q
Message-ID: <AANLkTikHr_T-D+Zbcfb9K-yJqB85TBh71mJoFnOF3kyc@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BitBake parallel parsing testing
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
X-List-Received-Date: Tue, 23 Nov 2010 19:07:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 23, 2010 at 11:42 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Tue, Nov 23, 2010 at 11:26 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> On 23-11-10 15:29, Chris Larson wrote:
>>
>>> Thanks for your time, and do let me know what you think, either of the
>>> code, performance in general, or the new progress bar (shows an ETA),
>>
>> The heuristic for the progress needs some work, it currently seems to
>> take in account all the parsed recipes instead of the last N recipes.
>
> That's what our progress display always did, it's just more obvious now.
>
>> Try ctrl-c'ing it at 75% and restarting, you'll see the ETA taking weird
>> values. In my case it stayed on "10 seconds" for more than a minute.

Okay, I disabled the ETA display for the time being.  It's useful, but
less than reliable, so we'll revisit it after revamping the progress
handling and incorporating cache file loading into the progress.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


