Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MclKG-0000Cq-TS
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 21:23:33 +0200
Received: by qw-out-1920.google.com with SMTP id 4so776313qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 12:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=8jr5bHn2wqb+JiBsMlnRpemQgzdVlj7jTnbyznbpPsI=;
	b=ij+3qJi3QukLxlGeOfyDfJC7P7hib4bTVy79b0wj+7pjoM+7RVe40kyvjbaJbpLTqP
	7vYZ4Lv9eh81BVtgVxwhlF37FADySZNP/2so8EpzERqbtWjabh0jGrCuOiMbk+7e5beE
	2E5jtrDKCJPAHefxR4Q3aZxizcegkV0AjAy3I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=F/cGQfwcq+ojmzPaMuT0xVA3lzT2chglIrLrUhMQeqPLdzrMt7ukJAvqhkQpd4BInt
	8Vnf9Rqov4zlFMQ1F6W9VJXoLzSezN9dAh5s7amva4tdmxWJdGC4YqWb0dP6CY+FMlAC
	FrLtGS997VHYLhlZUZOh+Ps10GZQ3Df3M2HJ4=
MIME-Version: 1.0
Received: by 10.229.43.68 with SMTP id v4mr1736681qce.95.1250449599810; Sun, 
	16 Aug 2009 12:06:39 -0700 (PDT)
In-Reply-To: <19c1b8a90908151021s67bbdd9fh52a07dce6d51ace8@mail.gmail.com>
References: <20090814215138.GB31011@gmail.com>
	<20090815022703.GH14883@smtp.west.cox.net>
	<19c1b8a90908151021s67bbdd9fh52a07dce6d51ace8@mail.gmail.com>
Date: Sun, 16 Aug 2009 12:06:39 -0700
Message-ID: <19c1b8a90908161206i4da9939dsa914d4cb6f5feecb@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding eglibc versions of minimal and micro distro
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
X-List-Received-Date: Sun, 16 Aug 2009 19:23:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sat, Aug 15, 2009 at 10:21 AM, Khem Raj<raj.khem@gmail.com> wrote:
> On Fri, Aug 14, 2009 at 7:27 PM, Tom Rini<trini@embeddedalley.com> wrote:
>> On Fri, Aug 14, 2009 at 02:51:38PM -0700, Khem Raj wrote:
>>
>>> Hi
>>>
>>> I would like to add minimal-eglibc and micro-eglibc distros on same
>>> lines as -uclibc one's
>>>
>>> Any objections ?
>>
>> minimal-uclibc and micro-uclibc should go away and just pickup from LIBC
>> being passed in / set.
>
> Ideally yes but there are other things like libintl libiconv etc which
> needs special handling
> for uclibc. So having uclibc counterparts is good.
>
> But I think for micro and minimal I propose that we should chose
> eglibc. It fits in better
> IMO

If no one has objections then I will switch minimal and micro distros
to use eglibc by default (2.10 atm)

Thanks

-Khem

>
>>
>> --
>> Tom Rini
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>


