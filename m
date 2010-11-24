Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PLFt4-00068o-Ay
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 14:59:54 +0100
Received: by wwb31 with SMTP id 31so317522wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 05:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=KuotkDobRjdqja7vktMlvCipm7LRmC4CeRhh7NaHT/k=;
	b=fCUeQHcnzPcgCwbPwOfEiXQKCJdt9wOT+rwlnJKC0dPsYLPWHOu/5HJjqyH3e/32J7
	q5jQGs17KyL6JWCyX/zi0ybZl4PBw6JcRNCHxdCuAIAihlWkMWEi0e12V4CZvq51Eja3
	fyIQt8yRRYq1LhucBJdJjJODjJ/sbSI2SjHcs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=nqtXWBn52O72gK0dSNnPMl1t/fsaov9f4OVXkUkWOdV2s9sh7WqE1NpzNkzbMciwYA
	8xuuR/vDxughpZBho9AuSYvvS45SmxMPsQbWOka76yo2WnNFOZlNUEWlj+Zp/wqOonGq
	ENyYm5TVertDWeI3Y6ARK/tp69Rd9kPO4V00E=
Received: by 10.216.3.3 with SMTP id 3mr2509811weg.57.1290607119214; Wed, 24
	Nov 2010 05:58:39 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Wed, 24 Nov 2010 05:58:19 -0800 (PST)
In-Reply-To: <icil2f$6jr$1@dough.gmane.org>
References: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
	<ich10v$f5b$1@dough.gmane.org>
	<AANLkTimuLxR88D2jRH=-Ky0BRLK5GkbyqUcSO8FhK=KW@mail.gmail.com>
	<icil2f$6jr$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 24 Nov 2010 06:58:19 -0700
X-Google-Sender-Auth: wPMyaNv1cFM5s1tZNU6QQ23vSig
Message-ID: <AANLkTimWsAFZa4yff_jmXwLqtTDiJCvZRr=VX6CL_-zD@mail.gmail.com>
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
X-List-Received-Date: Wed, 24 Nov 2010 13:59:54 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 24, 2010 at 2:14 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 23-11-10 19:42, Chris Larson wrote:
>> On Tue, Nov 23, 2010 at 11:26 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>> On 23-11-10 15:29, Chris Larson wrote:
>>>
>>>> Thanks for your time, and do let me know what you think, either of the
>>>> code, performance in general, or the new progress bar (shows an ETA),
>>>
>>> The heuristic for the progress needs some work, it currently seems to
>>> take in account all the parsed recipes instead of the last N recipes.
>>
>> That's what our progress display always did, it's just more obvious now.
>
> That's not what I meant :) I meant that the progressbar will jump to 75%
> since that was already parsed and the ETA heuristic gets thrown off by
> the "75% in 1 second".

Ah, yes, well, that's because we're using the same progress bar / ETA
for cached recipes as for actually parsing recipes, and obviously the
amount of time for those are quite different.  The ETA is gone until
we give thought to if we want to revamp our progress, and how best to
do so.  Ideally we'd probably use one progress bar for cache loading
and one progress bar for *actual* parsing (as opposed to processing).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


