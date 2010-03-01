Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NmEl9-0007SA-OU
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 00:10:48 +0100
Received: by iwn10 with SMTP id 10so2724424iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 15:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=wqGLJC5poTvaR5+CRtQiPBJ8alqfQ+L7E6TTQQ1pluA=;
	b=v0a3NIfpx8v7qCkwGOel/dlK7C1J9aW38QNmRSos0XyXtq4wpjHH/JALo0uLooli3r
	f4Y9Ljxdavn3ilYaGbJB1YcfDXoJ+RM9SuWwYpOKw4BB8Dmd/J05pklzYlyhQvENcBOL
	HfSfLc8YT9QRmb0r9/xim3Z1A6IJtQzoDsgN8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=nlN3+U0yMy0SM7Y5b71PXzZOAPKO534XAWe7Ck0kpu2Y0e10E8nQea6LiXRhHYxotQ
	Qp7f83gmMFPzrmerca6YUhvKqp0kAFDdfdoRy5BR02kkEhnYwKb4LoUodjNWSV4S7udN
	9DQ3GqeBOBmYye8BSpX7ExLB0XKvOGdD83VTo=
MIME-Version: 1.0
Received: by 10.231.145.5 with SMTP id b5mr115150ibv.70.1267484873107; Mon, 01 
	Mar 2010 15:07:53 -0800 (PST)
In-Reply-To: <20100301233537.dc587174.ospite@studenti.unina.it>
References: <1267381940-6598-1-git-send-email-ospite@studenti.unina.it>
	<19c1b8a91003011414p3610b861k136ea412526bff19@mail.gmail.com>
	<20100301233537.dc587174.ospite@studenti.unina.it>
Date: Mon, 1 Mar 2010 15:07:53 -0800
Message-ID: <19c1b8a91003011507o83cf215k8da55bbadbae8b4c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Antonio Ospite <ospite@studenti.unina.it>
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC, PATCH] distros: prettier notation for dev snapshots version strings
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
X-List-Received-Date: Mon, 01 Mar 2010 23:10:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 1, 2010 at 2:35 PM, Antonio Ospite <ospite@studenti.unina.it> w=
rote:
> On Mon, 1 Mar 2010 14:14:13 -0800
> Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sun, Feb 28, 2010 at 10:32 AM, Antonio Ospite
>> <ospite@studenti.unina.it> wrote:
>> > Make archives names look a little better. Compare the current:
>> > =A0minimal-.dev-snapshot-20100216-i686-linux-armv5te-linux-gnueabi-too=
lchain.tar.bz2
>> > to the proposed:
>> > =A0minimal-dev.snapshot.20100216-i686-linux-armv5te-linux-gnueabi-tool=
chain.tar.bz2
>>
>> may be just getting rid of that '-.' and using just '-' would be enough =
?
>> is there any advantage of using . over -
>>
>
> I thought that using some dot-notation would make more clear both that
> the string indicates a _version_ and that it is a single field on its
> own.

if there a post processing tool that would benefit  from this  then I
would say its fine.

>
> Regards,
> =A0 Antonio
>
> --
> Antonio Ospite
> http://ao2.it
>
> PGP public key ID: 0x4553B001
>
> A: Because it messes up the order in which people normally read text.
> =A0 See http://en.wikipedia.org/wiki/Posting_style
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>


