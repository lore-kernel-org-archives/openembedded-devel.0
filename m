Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Onwmr-00056o-Pn
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 18:56:02 +0200
Received: by ywa8 with SMTP id 8so1723655ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 09:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ygANZuz9od9IZOALvL7d7/hoYUMQpXFiAqgLIjFgZGk=;
	b=XXAa+d2JA9Orb0cPEH4V40bwxhWHtqcDQ50DwWvxs2hmXItU/tDAShG456oMHJ+LTJ
	agXdlP+hfDqRXM+ptEcg/zai18AXDOn3MuON+txyXZYV9QpHLptP7+wLOKgvNRyN0pXc
	1D5y3XWQYfNfYPyYv/7AVqvLpePAgPBSnUhRI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YdpGiWDjFauHw4Hnu/sfxSUJbXN/csWMjAk1OGPdcO9LAviYhzOtwCxcv6oLRWKcqj
	h5m3kW3wLkdYRlIw/zmlqT+dDYhuNOuRpTsthq4rDzGuNAt0Ql366jhQQ7pLFu/gYWzu
	+BUi63McgqfHQ8nupjl6+dWFqE+vcg4AuCJUc=
MIME-Version: 1.0
Received: by 10.90.72.15 with SMTP id u15mr4547666aga.189.1282668910560; Tue,
	24 Aug 2010 09:55:10 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Tue, 24 Aug 2010 09:55:10 -0700 (PDT)
In-Reply-To: <AANLkTinWXK-HZHOLv2b2ApdPQ+LW22bvwsOO5TGOc1kx@mail.gmail.com>
References: <AANLkTimXc3kLFR1m1uXM6OXZQn3idnbiDcEHPU0wpwEC@mail.gmail.com>
	<AANLkTikd-_vDny=kJKeS+NVWeYyfxiE_yXdUE+t1ac48@mail.gmail.com>
	<AANLkTi=s9gHBx_uPgiPGhu9b7D10JGytQaxyd-SZ+sfQ@mail.gmail.com>
	<AANLkTinWXK-HZHOLv2b2ApdPQ+LW22bvwsOO5TGOc1kx@mail.gmail.com>
Date: Tue, 24 Aug 2010 18:55:10 +0200
Message-ID: <AANLkTim9n1JsDc+bmYN5g20kBtobi5Ti-60Joq1U_rQZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: script to remove orphaned files
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
X-List-Received-Date: Tue, 24 Aug 2010 16:56:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/24 Chris Larson <clarson@kergoth.com>:
> On Mon, Aug 23, 2010 at 11:32 PM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>

>> Currently the parser is in bitbake, I have no idea on how to hook
>> those kind of checks in the parser, or how to craft a python parser
>> that would be able to do the above.
>> It would be nice if someone with more python knowledge could give that a
>> stab.
>> BTW: I have been thinking about crafting a parser with lex/yacc, but
>> especially the override mechanism does not allow to make a simple .y
>> file for it (e.g. SRC_URI cannot be made a token because we also can
>> have SRC_URI_xyz etc)
>
>
> SRC_URI shouldn't be a token. =A0It's not special to the file format, it'=
s
> just a variable :)

True.
Language it is not different from another variable, but semantically
it has a specific meaning, that's why I also see it as a token
although technically it isn't.

Frans.


