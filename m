Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OX9s6-0006mt-Ub
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 11:27:51 +0200
Received: by iwn34 with SMTP id 34so1977305iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=yDxKJYREd9d1vzWEVX9LPi9h05x87VXfO0zP8cOwVUA=;
	b=wCNL6XEIb6lDaWc3S+JqsuY4/ih+MaAlO42WXSOi4Uf0V0HaYwZy0bNyanHFpWaOjN
	afm6sZ6A3O4YzP2oa/1efVBZxdvGSt1t/eGo6jM9PpkLHyIcHHSjCF0O+rb6D/yvFOjd
	8DTEnEMc+kwbtoUd7PlX84eORaL6ids3C5ops=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=ZUKGiIljLI0/8YgUzhA5FgPl+e0DoTjrO9Z+AAGWNEr7C1VzRwpCHo+oKIPsEkb0rT
	k91QCidPgv2DNIykFG7Lf8GkP598X+l3QVh/cLC6ZY0YhQhcCn5bBK+55IyGuNrW0uqS
	ISdaziOxbxwENZwmIbwtxxOQxu5kUq/tcpwFQ=
Received: by 10.231.33.76 with SMTP id g12mr8699314ibd.199.1278626505189; Thu, 
	08 Jul 2010 15:01:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 8 Jul 2010 15:01:25 -0700 (PDT)
In-Reply-To: <1278624724.15825.32.camel@lenovo.internal.reciva.com>
References: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com> 
	<1278444743-4924-4-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTimnWBxCFMLlns8Q8LJ-3BvpWqqTNkqZ8ZlWbQdo@mail.gmail.com> 
	<1278622050.15825.18.camel@lenovo.internal.reciva.com>
	<AANLkTinJLDCgt2ku0lIoHiT0EPlYMH8HDJLI-hAaXMvG@mail.gmail.com> 
	<1278624724.15825.32.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jul 2010 15:01:25 -0700
Message-ID: <AANLkTimo1BwySoObG0fcPIR7jWiwtmkE22jucMfafjll@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][v3 3/4] uClibc: redo configuration
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
X-List-Received-Date: Fri, 09 Jul 2010 09:27:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 8, 2010 at 2:32 PM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2010-07-08 at 14:12 -0700, Khem Raj wrote:
>> hmm TARGET_ARCH wouldnt be the one but BASE_PACKAGE_ARCH does have sub-a=
rch
>> info. Although I would agree with you that we can build this information=
 from
>> BASE_PACKAGE_ARCH but its not as bad to have it as a machine feature eit=
her.
>
> I do think it is fairly undesirable to have the same thing configured in
> two places. =A0If a DISTRO sets THUMB_INTERWORK to off on a v4t platform
> then I think they would have a reasonable expectation that this would
> cause bx to not be used. =A0If uclibc is looking at some other place to
> decide then it will not behave in the expected fashion.

should we make THUMB_INTERWORK a distro feature ? currently its an independ=
ent
variable. This should be set in consent with chosen machine so if a machine
does not support interworking then distro should remove it from a possible
set of distro features. Then uclibc can rely on this distro feature to turn
bx support on|off.

>
> p.
>
>
>
>


