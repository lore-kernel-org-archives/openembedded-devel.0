Received: from mail-iw0-f184.google.com ([209.85.223.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NwLaZ-0007nI-4X
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 22:29:37 +0200
Received: by iwn14 with SMTP id 14so12175051iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 13:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=A9BwhgU9FNu7djRaCK743Hp75+ka0A8b+23UgxQvJbo=;
	b=Mg3N7gggPPbknWVVlpwJ0ehSS3Ttn8NzpVpQzzyrMMSByfuJ2rD7moKoW2+gprqVGs
	jj9C4b+ll34e6FqaCAYW9BBtR3qtHyF/qId9wl0UhqMuu1avsflKMJ5tSw3Ou7UQzA8L
	7/F3CgCa1JcewZAaXIcvJUZDMSByd5aFjk3Mw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VxqK+YET9bywrBPmeNTpxNntoNXivpp4/8QGd0Uu29tfmI5nKov2RpDQdy+ydpdsQp
	ITXtgwTigJ/wTpu8TWZbQVp0lkd62plWLUVPjc5d5oyeQ2eXHzqiST5rJSjePxLMVFPQ
	hlMTJyburrHVTUBpaa2j08+n+KxS89HiDjDBU=
MIME-Version: 1.0
Received: by 10.231.32.66 with HTTP; Mon, 29 Mar 2010 13:26:19 -0700 (PDT)
In-Reply-To: <1269892238.5924.3.camel@mattotaupa>
References: <e2e2e5501003290204v44f677f0s401d0e729cb05dd6@mail.gmail.com>
	<1269892238.5924.3.camel@mattotaupa>
Date: Mon, 29 Mar 2010 13:26:19 -0700
Received: by 10.143.26.28 with SMTP id d28mr147148wfj.103.1269894379581; Mon, 
	29 Mar 2010 13:26:19 -0700 (PDT)
Message-ID: <19c1b8a91003291326w2844cda8gac3c2b5f80901e62@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.184
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Downgrading the kernel
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
X-List-Received-Date: Mon, 29 Mar 2010 20:29:37 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2010 at 12:50 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Izak,
>
>
> Am Montag, den 29.03.2010, 11:04 +0200 schrieb Izak Burger:
>> First post for me on this list, so I appologise if this is documented el=
sewhere.
>
> Welcome!
>
> [=85]
>
>> Without getting into the specifics and the ethics of clones, or the
>> specifics of how I downgraded to bootloader and unbricked it, my goals
>> are to work around enough of this so I can get on with the task at
>> hand, and for this I need to downgrade the kernel from 2.6.18 to
>> 2.6.12, in order for the older binary-only kernel modules to work with
>> it (the older modules don't check the bootloader).
>>
>> So far I haven't been able to figure out exactly what needs changing
>> to select the kernel version, and I'm also unsure what other packages
>> might be affected. Alternatively, I could also just stick with 1.5,
>> which seems to have the 2.6.12 kernel from a cursory glance. Any
>> advice will be much appreciated.
>
> You can use `PREFERRED_VERSION_RecipeName` in your local.conf

or PREFERRED_VERSION_<recipe>_local

as far as
> I know. So look for =BBPREFERRED_VERSION=AB and also =BBDEFAULT_PREFERENC=
E=AB.
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


