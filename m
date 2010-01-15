Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NVgpv-0007Rg-7n
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 08:43:18 +0100
Received: by ywh8 with SMTP id 8so284470ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 23:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=xpkj6d6lKuzfViKlhqvWx8hE0jV8SYwtMBSNToKf2xE=;
	b=LlPEu/AovTmP4IidEUWxHXnq4NkXGX26fC6OvKOUsp4bnI50C5RVYbtR/xz3zYu8uo
	iexDcsNt2cHgy9Shco4ubmjbcVPe1uY33pjq1ZcZjV4ZfwnjrGkLHTPyI0piX+8hXD4v
	qWih2Di2XCeBYCTgTZxFxjpM0nSzFRunenxj4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BsbwkMTZuG/fFwpEAJ5l1iO9FopjRBc6rO544akCf5VQTCNQUQ9ztzEIYChkbuGmfS
	aUQqvUTkWX43JiOgUpydUxAEqd+nKsMbXr2twDqL+Sjad1qGGRNZiXs9ob8OzzNDN0FE
	1QUYt1eRU1bliXZRWKthmkQT/0EReEXrIoua0=
MIME-Version: 1.0
Received: by 10.101.145.5 with SMTP id x5mr1348306ann.142.1263541263089; Thu, 
	14 Jan 2010 23:41:03 -0800 (PST)
In-Reply-To: <20100115014221.GA9872@denix.org>
References: <1263421337.3575.3.camel@dax.rpnet.com>
	<ac9c93b11001140102j36e07ca9u7cb9ddc5a9770cd4@mail.gmail.com>
	<20100115014221.GA9872@denix.org>
Date: Fri, 15 Jan 2010 08:41:03 +0100
Message-ID: <ac9c93b11001142341w5f28d1ecv933d2b11e130f4b@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: TSC Meeting 7/1/2010
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
X-List-Received-Date: Fri, 15 Jan 2010 07:43:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/1/15 Denys Dmytriyenko <denis@denix.org>:
> On Thu, Jan 14, 2010 at 10:02:57AM +0100, Frans Meulenbroeks wrote:
>> I suggest to review the rules;. E.g. this one:
>> # This should all be on one line and you should leave an empty line
>> before any detailed commit information.
>> Nice, but if you use git commit and enter your message empty lines are removed.
>
> Not really. "git format-patch" and "git am" use the empty line separation to
> determine, what becomes patch subject and what is patch description in the
> body. So, the above rule/requirement is very correct. More on the topic:
>
> http://progit.org/book/ch5-2.html#commit_guidelines
>
> --
> Denys

I stand corrected.
When I wrote that I seemed to recall that the file you get when you
commit says that whitespace and comment is removed, but my memory
played games with me as only the leading and trailing empty lines and
comments are removed. (and no one ever complained to me about not
having empty lines in the commit message)

And thanks for the progit.org link. Didn't know that one. Interesting reading.

Frans


