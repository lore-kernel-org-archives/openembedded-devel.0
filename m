Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PEf5T-0000NI-Li
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 10:29:29 +0100
Received: by yxe42 with SMTP id 42so2729525yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 02:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=E6nmgZ4dRYQfwhSBLV+AvpKiygXJHPCsbp5OD3ubZJc=;
	b=jNxooqEluQmDjI+tB7yEThcs485WURQVgaH1cZMp9u+yQfsaaUOZZZ5S8g5qqDEUKb
	8tI1i527xs22M2/ZPhrN49OkiY0ZXwvvuOZn6gB/QENrxKbZxwxNLyeHPenfQnEoZBlT
	sjGMNF110YJ9puqK5tXB9jb2t1X5IGdZd8rZc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=E7zYfTPiIPiDxnLcE75kOCQDxR7VyHgzeNRFNLHNtid5E64Xcl9l7XGZqvpV74Wpm3
	25IwQOZGWGVrt/SmtxGWKgU+Eb+RhduLbTs2RDvhs9CZbtyj848k+046iyhdOSv0DuIO
	zbsxKSVg+BjU2bSbf642Xk4pv41vGkGdB2y4U=
Received: by 10.90.57.2 with SMTP id f2mr2524020aga.118.1289035712223; Sat, 06
	Nov 2010 02:28:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Sat, 6 Nov 2010 02:28:12 -0700 (PDT)
In-Reply-To: <20101105235600.GA3671@boggieman.bredbandsbolaget.se>
References: <20101105235600.GA3671@boggieman.bredbandsbolaget.se>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Nov 2010 02:28:12 -0700
Message-ID: <AANLkTin_S+1w109vBADYQPaG=8onZzMK7t87dFO4WDPc@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ARMv4 not working with latest gcc,eglibc
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
X-List-Received-Date: Sat, 06 Nov 2010 09:29:29 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 5, 2010 at 4:56 PM, Kristoffer Ericson
<kristoffer.ericson@gmail.com> wrote:
> Hi,
>
> Khems addition of gcc 4.5 patch effectivly removed the thumb 'bx' instruction from
> the binaries, but Im getting the exact same issue as before (kernel panic at init time).
>

what is your kernel version ?
I would suggest to try a different one. There are reports og gcc 4.5
miscompiling 2.6.35

> Filip zyzniewski had the combination of gcc 4.4.2 + eglibc 2.12 working well on his machine,
> I also know another person with an ARMv4t which used gcc 4.5 + eglibc 2.12 without any issues (with same distro file).
> Therefore I still believe its an compiler/thumb issue.
> Im currently trying to reproduce filips environment to make sure, once I do it should be confirmed.
>
> Best wishes
> Kristoffer Ericson
> http://www.jlime.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


