Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oh0eM-0006IF-IJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 15:38:23 +0200
Received: by fxm12 with SMTP id 12so2997187fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 06:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=9dkW59hnOyrojGaBvEcgJYh2szesq2Xfos7E2JdxH+0=;
	b=ZjSjwaRHq97DwrdSQGQs28Py/fYqxHm5CIdtraAREKwN36J+6D+XnRy+bL0yn4s7DT
	HfI+HEXL9Mmp5En8pqfcgq5I8Kgj9VTI5IjypH2+cCV7ru2PuKCz/CSJChhdE7W5YVfd
	710DSfwLCeG6QXKcz9g7ze7JrpxIpWUX2aURU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KRUQs67iaHuQfl4uYDc6GIJ+j/thWcra5zg1fP+fLhpAgNLm/BopK929OT82CjdZg6
	rHzuaX77l60Zm2S0nQHoddG89XIsNv3Gh4smi1VvVTIPCTvU0ZmMdTrNtXGtbTBeLybs
	Juvw7r/FKYOk05ddGwTNH7XuqcoYe8HCWMF6w=
MIME-Version: 1.0
Received: by 10.204.7.219 with SMTP id e27mr7187901bke.191.1281015495709; Thu, 
	05 Aug 2010 06:38:15 -0700 (PDT)
Received: by 10.204.21.202 with HTTP; Thu, 5 Aug 2010 06:38:15 -0700 (PDT)
In-Reply-To: <1281011993.16235.284.camel@rex>
References: <1278323612.30247.3579.camel@rex> <1281003567.16235.254.camel@rex>
	<AANLkTinDqkXzuPxytNCEq6xinJ1kct1cj5vU_kM=NZ=Z@mail.gmail.com>
	<1281011993.16235.284.camel@rex>
Date: Thu, 5 Aug 2010 15:38:15 +0200
Message-ID: <AANLkTinp3f29VzRLtBbrmiwiXeQHuWK+aYwO6=A0T+s5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Bitbake-dev] RFC: How to improve packaged-staging and setscene
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
X-List-Received-Date: Thu, 05 Aug 2010 13:38:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/5 Richard Purdie <rpurdie@rpsys.net>:
> On Thu, 2010-08-05 at 13:12 +0200, Frans Meulenbroeks wrote:
>> Sounds good to me. Not sure whether I have time to try it out on short
>> term. Too much other things at hand.
>>
>> One small concern:
>> Would it in your proposal be possible to disable packaged staging?
>> I think it would be nice if a user (in local.conf or so) could decide
>> on whether he wants to spent build time and space on this.
>
> Technically, disabling would be possible but you lose some important
> benefits such as when enabled, cleaning a package will remove whatever
> it put into staging.

Ah ok, that is a benefit I would not like to give up.
>
> One of our problems in OE is too many code paths. I'd like to see us try
> and minimise that problem. Disk space is cheap and this code shouldn't
> take much more time.

Space is less of an issue than time. An additonal task does consume
some time, if only to get started

>
> Once combined with checksums, it should actually save people large
> amounts of time as needing to rebuild from scratch should be a think of
> the patch (unless you make a change effecting everything in which case
> you'd expect it).

Well one of the scenario's I was thinking of when I had this in mind
was an autobuilder which builds images from scratch for verification
purposes.

But I understand your concern about paths. Indeed currently there are
sometimes unexpected side effects

Frans


