Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OXAqj-0005x3-RY
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 12:30:30 +0200
Received: by gwj22 with SMTP id 22so1156146gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=4wqn2nSCRu7WbNIUx5MzEXAq1J92K380cs9dyE/QPz8=;
	b=T4ltJFYEe1/9XMVumesG5IFm1Vl9KowxBVUKbiJcVVRLyzoNUoiSxQLRYTkBrd8nZE
	B7YDh0CxC7rLsO4ZCXU3wF+VbG5cgJKCjFr4VN0uKxuM12FuwLQ9JMbrEM5EGKfHAU5J
	cUniXAK9BAyqRJxPskxpc5s6XSnhMzEbheqUo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=VsYrTwSRutuqj6QAr9Oy86LFy1fqcYiqSEb2gZdkhhgzc2JRNKA+g1h+1km5f8b5TX
	9OyN9licc7ONDLrIABqcwg0ljRfyPaaa14+N/8DDuHKquZvfDGEFmdZAAFmAGKSLaEaK
	f6t+mdUvDrdICCfXJlNlpGZNgBaHIlxpSjILU=
Received: by 10.90.118.19 with SMTP id q19mr7562270agc.88.1278621706220; Thu, 
	08 Jul 2010 13:41:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 8 Jul 2010 13:41:25 -0700 (PDT)
In-Reply-To: <20100708202835.GC23169@mx.loc>
References: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com> 
	<1278444743-4924-4-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTimnWBxCFMLlns8Q8LJ-3BvpWqqTNkqZ8ZlWbQdo@mail.gmail.com> 
	<20100708202835.GC23169@mx.loc>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jul 2010 13:41:25 -0700
Message-ID: <AANLkTik9zItYpxBnFbOi2DlS--2dXbZntdwZ40AnEp19@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
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
X-List-Received-Date: Fri, 09 Jul 2010 10:30:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 8, 2010 at 1:28 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
>
> you said you saw an ICE with current uclibc master. Which arch and which
> versions of the toolchain did you use?

The ICE is because of -Os -mthumb -fno-omit-frame-pointer because now we pa=
ss
CFLAGS into UCLIBC_EXTRA_CFLAGS which is right thing but it unveils this
issue. I have opened a gcc bug for the same
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D44860

and deviced a local work around
to not pass -fno-omit-frame-pointer on arm. I wanted to use thumb override
to localize the workaround even more but thumb is added to OVERRIDES in mac=
hine
confs and bitbake does not pick it up when I apply it on
var_thumb :=3D <....>
var_thumb =3D <....> seems to work ok.

Probably you did not use thumb instruction set when compiling for qemuarm
thats where the ICE happens.

I have to cobble up few recipes but now with your patches I can build boota=
ble
x11-image and native-sdk-images on minimal. I am quite happy with what we h=
ave
thus far.

> FYI, i tested qemuarm, qemumips, qemuppc, qemux86 and (my local)
> qemux86_64 with
> PREFERRED_BINUTILS =3D "2.20.1" =B9)
> PREFERRED_GCC_VERSION =3D "4.5" =B2) =B3)

thats similar to what I have.

>
> and all of built fine for me.
>
> =B9) micro.conf incorrectly picks 2.19.51 per default, should be bumped
> =B2) micro.conf should also default to 4.5
> =B3) It would be great if we could settle on one scheme for
> =A0 binutils/gcc/libc version shorthands:
> =A0 PREFERRED_BINUTILS_VERSION _or_ PREFERRED_GCC, i'd go for
> =A0 PREFERRED_foo_VERSION, uniformly.


