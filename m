Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLzUj-0004Sv-V1
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 16:09:45 +0200
Received: by gyg10 with SMTP id 10so3287977gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 07:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=LAeRj7tfgp3dIQgfHpGdYcWuI4+8tbGFe2/bL3s00Ck=;
	b=tevHTcFyIT/iz16ELtgIhd7tI5apkaUHtCntvR39/Wfee5M50wfrd4KoE65XiWfBcJ
	buONGWXj8m0br2wVKtqLcYT5R26ejTdcJ1f2pw3xXu3u6tB15/Df7t5ZP+8P6zTweAZ2
	CFYOqlzszIHVpELmyMSQegdaH2GR1hkfN14Fg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=CwqWtOD1ltaDu+uwq+3BiybgcjBKF9bw35q4Q8IBLiTNMv3i8PA/FCGvTdncQS1bRH
	mXaRm1Odh1qQtbUH/wCrIdSBHSdyH+spmGjCUq9ipT0KlQde9G4UWp603LtesilfqS4G
	piyzEvCZKdFE7TY3NJxE/hBLqZVzWuBk1zIBE=
Received: by 10.150.117.42 with SMTP id p42mr15571496ybc.77.1276005912641; 
	Tue, 08 Jun 2010 07:05:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.19.76 with HTTP; Tue, 8 Jun 2010 07:04:52 -0700 (PDT)
In-Reply-To: <AANLkTilJrzCr73GBdsGFgxQl4Gn7FAGj3Aytx1IrzYpS@mail.gmail.com>
References: <4C0D498A.4030709@mentor.com>
	<AANLkTilJrzCr73GBdsGFgxQl4Gn7FAGj3Aytx1IrzYpS@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jun 2010 07:04:52 -0700
Message-ID: <AANLkTin7X57KGxU-ukNtonkw1Ks5oTcBGUdPxCHMGoWF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Add linux-libc-headers-native, make it default 	dep for native
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
X-List-Received-Date: Tue, 08 Jun 2010 14:10:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 7, 2010 at 11:36 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/6/7 Tom Rini <tom_rini@mentor.com>:
>> On some host distributions the provided linux kernel headers are too old
>> to compile utilities we need[1]. =A0Given that we need these utilities t=
o
>> run things on the target the best solution is to provide
>> linux-libc-headers-native. =A0Rather than get things into an inconsisten=
t
>> state, we make linux-libc-headers-native be a default dependency.
>>
>> [1]: A prime example of this would be mtd-utils-native and UBI
>
> I'd say this is heading in the totally wrong direction.
>
> Target code should not depend on host headers.
> And if you need the target headers, you should depend on and use
> linux-libc-headers.
>
> I guess mtd-utils-native is used to make an mtd image for the target
> and as such I would expect it to use the target headers.

no. mtd-utils-native itself is a host utility so to build it we need tools
and development files for the host not the target.

>
> What would be the difference between linux-libc-headers and
> linux-libc-headers-native in the first place?

one is for target (e.g. arm) and another one would be your build system
(e.g. x86)

> (and if there is a difference, I think a better package name would be
> linux-libc-headers-cross).

cross is for something which runs on host and generates code for target


>
> Btw if say mtd-utils-native needs kernel headers to access host
> functionality using headers for a different kernel version seems to be
> a no-no either.
>
> Just my eur 0.02
>
> Frans.
>
> PS: which distributions/distribution versions/kernel versions do have
> this problem?
> Ubuntu 8.04 (which has a 2.6.24 kernel) does not seem to exhibit this pro=
blem).
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


