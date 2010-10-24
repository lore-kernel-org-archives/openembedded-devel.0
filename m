Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PA52j-00006a-72
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 20:11:43 +0200
Received: by wya21 with SMTP id 21so2577668wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 11:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=eRnflbVQ1W8Cp9q+KBfHHBdS1vS8LXmbRS0R9IL2oak=;
	b=syI8KWAASYEZPz3nK0LRHcMG+VaC3zsRkYUMwCwnQ4V0+GZ3fACHlELKG6PVd3y362
	f33i45oD9cInIs5WPa9nwn8L814dakwZ3mAh3EilfGi3iMpmnFtIR7L6f+jhMkBq2lFN
	O8I8Auz3MIUncpeyQcKa5e2kgJLraS0goIHSk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=aiQqe9OmqxzGgta2e6dRRIh3dMnqv8YUGaYNqFcLuNzG5SFlZZ3yVipn4ZHZeJHAUZ
	OwGsVgob071F0zbTfBl5BPQ3gohT+kpLpvd1Kg2bSmTDuqg1JOSlfsWZ1BvcGCbPeG1s
	IcjJSWs4OKrxvWMQxofvnZJoU3IK3DvNTuiFA=
Received: by 10.216.65.70 with SMTP id e48mr1985491wed.44.1287943861022; Sun,
	24 Oct 2010 11:11:01 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Sun, 24 Oct 2010 11:10:40 -0700 (PDT)
In-Reply-To: <AANLkTimyqP-aP=+poQSHFE=ePogb66en0BwNCYWwCkXk@mail.gmail.com>
References: <AANLkTimyqP-aP=+poQSHFE=ePogb66en0BwNCYWwCkXk@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 24 Oct 2010 11:10:40 -0700
X-Google-Sender-Auth: c_Ik0jFt1xirPRwtpJqZOsJlH6A
Message-ID: <AANLkTimUZ9KiEdhbu2R=VV0mCVh_gWqoxHxpwrnTSJeX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: sed dependency
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
X-List-Received-Date: Sun, 24 Oct 2010 18:11:43 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 24, 2010 at 5:00 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> Triggered by this: http://patchwork.openembedded.org/patch/3099/
> I was wondering whether we should have sed-native as always-required ?
>
> If not lots of recipes might require an update like the one above:
>
> frans@linux-suse:~/oe/openembedded/recipes> grep sed -l */* -w | wc
>    776     776   20661
> frans@linux-suse:~/oe/openembedded/recipes> grep sed-native */* | wc
>      9      61     737
>
> Guess despite the -w there will be some false hits in the first grep
> (because it is in postinst or in a comment), but I expect some 700+
> recipes remaining.
>
> (actually thinking about it we could also do a scan on all added code
> to see if there is a dep on e.g. sed or grep, but guess due to the
> overhead then it is better to generically depend on sed-native).
>
> Guess something similar holds for grep (gave 128 matches) and probably
> some other tools).
>

If something is covered by posix / SuSv3, I see no need to use a -native.
 We have to expect a certain amount of sanity in our build environment.  For
specific non-portable usages, those should certainly be fixed to not use
that functionality, to use some form of sanitizing wrapper, or to depend on
the gnu tool specifically via -native, imo.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

