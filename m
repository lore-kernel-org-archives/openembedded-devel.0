Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsrjX-0001H2-1d
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 08:32:44 +0200
Received: by iwn2 with SMTP id 2so4930332iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 23:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=u6uq7pLZZLmMweu9KrktlVs3s9kII3+Cna82nF1JhCU=;
	b=vPsW6OUBCTXhPYAffTuLmqA8/8UZtdd3rrYh1l5e7NDrN4EM5RLg8l7oZ63K0qLN15
	7jNCePu4+t9PqKbmG5f0Ut971cd9ngwihwilDkFJuZhF+7GnawSZ8Zk0SiKmXHShaXI2
	N/Fyj2pgAviXNtCEAh9X8Mc9IXXBTv9wvYdjc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Qlg4qy/3smi8XVh4DdNtRXgs69NRTRD/hGIVbbpFxjI4ywNuTfZsWm5fMuFKtOApQ0
	/HRzlD3HYOgtKsUWoMQs9ARCO1qgzMe/ukUw6DtYrI0wy4Br2WKXDQb1+tiNi88xKE9O
	jTyB42Sa6ORyz05GFoBylixSuTTUPeXnO0Up8=
MIME-Version: 1.0
Received: by 10.231.179.24 with SMTP id bo24mr6882342ibb.193.1283841124220;
	Mon, 06 Sep 2010 23:32:04 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 23:32:04 -0700 (PDT)
In-Reply-To: <AANLkTimjZwZ9TCLcWz3ZRQ2pGYj_nb=kE-qYtVW5uSBg@mail.gmail.com>
References: <1283775540-13164-1-git-send-email-noor_ahsan@mentor.com>
	<AANLkTimjZwZ9TCLcWz3ZRQ2pGYj_nb=kE-qYtVW5uSBg@mail.gmail.com>
Date: Tue, 7 Sep 2010 08:32:04 +0200
Message-ID: <AANLkTimxy+r7_Wgaq1SvmWHBPRuvZ+Wtvn1Ctm=maaGb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libsdl-native: Convert to new style staging, remove do_stage
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
X-List-Received-Date: Tue, 07 Sep 2010 06:32:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/7 Graham Gower <graham.gower@gmail.com>:
> On 6 September 2010 21:49, Noor Ahsan <noor_ahsan@mentor.com> wrote:
>> * Remove do_stage ()
>> * Replace tabs with 8 spaces in do_configure
>
> I see that spaces and not tabs are the OE policy, but I can't lay my
> eyes on anything that says how many spaces are preferred. I see a lot
> of recipes and examples using 4 space indentation (and most others use
> a tab). Is this something that people care about?
>
> -Graham
>
> PS: Personally I'm a tab man, not a spaceman.

Afaik it is not defined.
There is http://wiki.openembedded.net/index.php/Styleguide
which only says "#
# Use spaces for indentation as developers tends to use different
amount of spaces per one tab. "
now we're just using a different amount of spaces :-)

(actually using different # of spaces for a tab is not that bad as
long as you stick to tabs only. That is why the linux kernel requires
indentig by tabs).

Frans (who also likes tabs, if only because it is the default in vi
with autoindent (and yeah, I know you can change that))


