Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PKu2J-0002LQ-PY
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 15:40:00 +0100
Received: by yxd5 with SMTP id 5so5145328yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 06:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=GWF0srtUqn6DCd/JrY5pM04olc3aQeEFuf9wFTHaqyQ=;
	b=j8OyIZhJrqeL10VEJkLQCz32xjUtwXJZbGY7EjwDK0BIhP7wDHKLMqoSrLYzEidIff
	welh4hNq8HDI7YMjoanzRCVXT7eHhzeDF77wYfbc9de0XmcUrTTl3d4kW19Cu+3Kgv3h
	rs4BMAsX/tYbl04Gr/G01acGFVTsOV2DsS7qQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=ATepFlLikb+AMsIbzrRUyX0fptZ13TSgs1U2C1s6Alq5t38V0FnAaXebpbUDRa1Y6q
	zcBINv2DZnQ+x06MjGpmIf6gBX5OeZYuaQWGb5Xo/6WyL7kfU8XjoaOP6oq79b74oSTO
	hqr2VEaqVZ/ZzM8gRd1+XtE83nQZBJbsqq2Yk=
Received: by 10.216.22.70 with SMTP id s48mr1092466wes.27.1290523124437; Tue,
	23 Nov 2010 06:38:44 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 23 Nov 2010 06:38:24 -0800 (PST)
In-Reply-To: <icgjd2$7oa$1@dough.gmane.org>
References: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
	<icgjd2$7oa$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Nov 2010 07:38:24 -0700
X-Google-Sender-Auth: 3TYF7tS62DAqEj0ksle5sCcEmnI
Message-ID: <AANLkTi=A2j2hR6xtdB+JVe7ktUZcS2gA5QOT_GbH-McL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Tue, 23 Nov 2010 14:40:00 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 23, 2010 at 7:34 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> Thanks for your time, and do let me know what you think, either of the
>> code, performance in general, or the new progress bar (shows an ETA),
>> or anything else :)
>
> And don't forget to play with BB_NUMBER_PARSE_THREADS, it defaults to
> the number of CPUs :)

Indeed, thanks, Koen.  Don't know how I forgot to mention that :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


