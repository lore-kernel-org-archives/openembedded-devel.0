Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OMjmb-0000Co-01
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 17:35:05 +0200
Received: by pxi14 with SMTP id 14so15580pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=dwoBgW0SIP4tr+XTtfJPWLWWH1WJH78n68ZWe7TQsew=;
	b=NQuCOK9aEctJhzUcOGhlSsQWdq2n1wbbDdjqxlavJNLY4EtxKujhpGglBpbc4zSAn7
	5Zgt6Mz0mJ/g1B1CNkKceNnPy/1i9jNR1PnOVqqli/AJ1m/V6awlFjt1Vl9/8m15ikEV
	SzEgu+oOa1pFWC/8pNU9bPxMtc+51Taq2a4iQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=agPDMgb5F9+KP7WsP6fP7meQuCWQuWVRmN0Rz6j7WLk7+3MbX4fuACtzhUl0jmvj7i
	HIQyDwGFfK5shOWw6rKKvqFqf+1BiSUOSz9SWJ4TP0yn7nSfPs4edC++KTYgsEbH6D+E
	wI0vs4BEVfGlu6Mti49BIY9PHecRTWCQ6olbk=
Received: by 10.142.151.29 with SMTP id y29mr228728wfd.261.1276183837372; Thu, 
	10 Jun 2010 08:30:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.211.2 with HTTP; Thu, 10 Jun 2010 08:30:17 -0700 (PDT)
In-Reply-To: <AANLkTimshL1qhg5y5iZViSz_jfBBpzOaGLw7S0wG_dtr@mail.gmail.com>
References: <AANLkTim3_p-OVwfb4ulBCm2vR19uCH1eYAZlHLQVM_BG@mail.gmail.com> 
	<AANLkTimshL1qhg5y5iZViSz_jfBBpzOaGLw7S0wG_dtr@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 10 Jun 2010 08:30:17 -0700
X-Google-Sender-Auth: lEhzf38fjfDf54JjgcSdWQ5VGLU
Message-ID: <AANLkTil_1Xk6jaiHSnTJQ7OS71tJmK7g0qLuU60u7fF-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: sean_hudson@dell.com
Subject: Re: [PATCH] Change wget fetcher to use the runfetchcmd
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
X-List-Received-Date: Thu, 10 Jun 2010 15:35:06 -0000
Content-Type: text/plain; charset=UTF-8

I went ahead and applied this to master.  We can always tweak it further,
but it's a definite improvement as is, in my opinion.

On Wed, Jun 9, 2010 at 8:08 AM, Chris Larson <clarson@kergoth.com> wrote:

> On Tue, Jun 8, 2010 at 12:40 PM, Ryan Phillips <ryan@trolocsis.com> wrote:
>
>> We were having problems with wget fetching through our proxy. One of
>> the problems stemmed from quoting around the environment variables,
>> and the other appears to be from legacy code not calling into
>> runfetchcmd within the wget fetcher.
>
>
> Seems fine for the most part.  One quick question: Can you explain why
> you're escaping the double quotes in your quoting of the env vars, when its
> contained in a singled quoted string, not double?  Of course, we should
> really switch that code over to using subprocess, passing the environment as
> a mapping, rather than this sort of shell script emission.
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

