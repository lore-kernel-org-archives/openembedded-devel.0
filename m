Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NrkxN-0003fU-VF
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 05:34:14 +0100
Received: by gye5 with SMTP id 5so296734gye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 21:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=jGmGA14ezX9+NmQJ/6NIr5VoZFfxNDsoWan7ZTZ1sHk=;
	b=ZLBrhf0o72z44xJ7aNYFGp0MzzxZ/Xv7rEKDZOqGVI2tkAZwSeLj9i5+5EaTCysNo5
	B+ArUsP8q+MCItNokmUymThH0d3SG9qeL055c6c5hy+QrCRPb6fSyidItkgm97SMvZKd
	cYHpGQ+p8x/RZaT3iGD8EQT4cIGnHtlkaBZNk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=W4m4PjIbic2IGqgIRRLTuBZMIFjojrhbEEuK0BYAUjG24hHr7EgIASw71uAaQqAwEw
	ELL+PwEZNU9E+kOuzNeubCq4z6Ks0rv4uuCW8qi97I/kfGumPOaSm6AUg1ixoKGG1NFD
	qR9JBhJEvJxxB2TToxTOgQxz8doM3CWDgxzac=
MIME-Version: 1.0
Received: by 10.100.59.13 with SMTP id h13mr440939ana.198.1268800265966; Tue, 
	16 Mar 2010 21:31:05 -0700 (PDT)
In-Reply-To: <201003170303.49144.holger+oe@freyther.de>
References: <1268773130-4625-1-git-send-email-ulf.samuelsson@atmel.com>
	<1268786621.20395.4.camel@trini-m4400>
	<201003170303.49144.holger+oe@freyther.de>
Date: Tue, 16 Mar 2010 21:31:05 -0700
Message-ID: <19c1b8a91003162131k63f87976k1deeb01c80b95187@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/1] libstdc++.bb: copy libstdc++.so* to rootfs
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
X-List-Received-Date: Wed, 17 Mar 2010 04:34:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2010 at 7:03 PM, Holger Hans Peter Freyther
<holger+oe@freyther.de> wrote:
> On Wednesday 17 March 2010 01:43:41 Tom Rini wrote:
>
>> Checking in a non-external-toolchain based build I have around, I see
>> staging/<target>/usr/lib/libstdc++.so / libstc++.so.6 which point at
>> libstdc++.so.6.0.10, which exists. =A0Can you explain how you're getting=
 a
>> lack of libstdc++? =A0Thanks.
>
> I assume he is using gcc to link and some external lib linked C++ symbols=
 into
> the global scope... This was a bug in some versions of gcc and we solved =
it in
> WebKit/GTK+ by having a linker script and excluding everything _Z*.
>
> So I would nack this change and instead figure out which C library is exp=
osing
> C++ symbols.


I think we have had discussions about packaging gcc runtime. There
were some proposals on packaging it
but the directions seems to be that we need to package them better.
Weather we create  a single package
for all runtime or package each language runtime differently is
decision to me made. I think toolchain-desuck
branch would be the right place to get this done.

>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


