Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OizlP-0007Nx-LT
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 03:06:00 +0200
Received: by bwz8 with SMTP id 8so2394850bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 18:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=J5MZkUmIWKav0FkJcaCI5VdGkaEfRjzF0iBC6nLhNWA=;
	b=UJzOw6p5xWSjr/FMCggWhP++HJqYsy2cIuliTbk6+oVxm6DNf6w36KtgqByBI1yKfP
	T9Trxmns/e8lRA0L2j97QsD9fo0VJxcu2Rwovx0Maoy2G4oaLz/p+lDYz5O0/6RBNHhG
	ndXnV5OyWliNHBKXIROKB7qkp0JJ6o1MgQHu0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=r20MxCgvYB77s9SnoJo8FfdA58p99Sy/nxhForckFcugORFxnseJ+gNLENOU2ktmiZ
	7KuNCqh/CpeDPz/PCzfVYKoHZBLY4Cq0BHZMRHajaVFfIgITrqYXXjD+YBwLMpOrxB38
	awjkmqVW8mba1ki44moN/1X7lyOUFLIf5uE0A=
MIME-Version: 1.0
Received: by 10.204.51.77 with SMTP id c13mr4729455bkg.98.1281488740537; Tue, 
	10 Aug 2010 18:05:40 -0700 (PDT)
Received: by 10.204.152.212 with HTTP; Tue, 10 Aug 2010 18:05:40 -0700 (PDT)
In-Reply-To: <4C61EE40.5020201@balister.org>
References: <4C61E523.7070405@gmail.com>
	<4C61EE40.5020201@balister.org>
Date: Wed, 11 Aug 2010 10:35:40 +0930
Message-ID: <AANLkTi=1LPSYyP4HdPF6+AajoCmot2jzU2id1URxf_q0@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Mass convert PREFERRED_VERSION_* to be weakly assigned.
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
X-List-Received-Date: Wed, 11 Aug 2010 01:06:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 11 August 2010 09:56, Philip Balister <philip@balister.org> wrote:
> On 08/10/2010 04:47 PM, Graham Gower wrote:
>>
>> find conf -type f -exec sed -i -e 's/^PREFERRED_VERSION_\([^ \t]*\)\([
>> \t]*\)=/PREFERRED_VERSION_\1\2?=/' {} \;
>
> Shouldn't DISTRO's decide on a per DISTRO decision whether or not their
> preferred versions are weak?
>
> I;m not entirely opposed to make the assignment weak for Angstrom, but I am
> very opposed to making all DISTRO's use the same policy.

Surely having disunity by giving different distros different policies
would be worse?

>
> It is a real nuisance trying to debug someone's Angstrom build, only to fins
> out they have loads of local overrides.

Point taken. local.conf really should be a mandatory piece of
information when reporting an issue.

>
> Philip
>

-Graham


