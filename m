Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TPZ57-0001rD-Lz
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Oct 2012 15:27:13 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so860659pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Oct 2012 06:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=1FI6Rv+z5ctLNGJLoVDTuJcK8GcRHXGcqAv0wBboi1c=;
	b=wtu3Jgagp0IYw/FlnXtEqx8CA2d0no7IVBz7JpTLn1aoH6hremY+J6EN6niikt6OPk
	wKjKjX2KrQzpqqgKZXMZOxe0/HsJ+NwIvjX7wmnyQB0O9VUSrsA59nXVdksYVloO2aHy
	GgaRSA+xl3o215aopBo7hx0PYXpn6eKDKDkAE2D17xpUqWoiZb+Rf0fCqyVKET4jOG44
	twSmCORQiksN+vuBJ89t+JAqK0vAXkuMafabF2W9Om1GinztMqzvlSw3yNIzDjDa0HRY
	eWU9JY+ceyIpKbGED7TA+58hI2rJMhYVY2gsNdzWLpW1B3DKW1LTZ9kKuWVvjBAk2p4T
	kKVw==
MIME-Version: 1.0
Received: by 10.68.135.168 with SMTP id pt8mr15653149pbb.24.1350738830711;
	Sat, 20 Oct 2012 06:13:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Sat, 20 Oct 2012 06:13:50 -0700 (PDT)
In-Reply-To: <2065132.7T5jEHvO3o@helios>
References: <1350665204-7352-1-git-send-email-paul.eggleton@linux.intel.com>
	<CAP9ODKoZgqVc--zoe4vupRL3QfVtYMv-jFvazUqAXiYWoX1J=A@mail.gmail.com>
	<2065132.7T5jEHvO3o@helios>
Date: Sat, 20 Oct 2012 10:13:50 -0300
X-Google-Sender-Auth: xdKOMjFVQb6r359dHV6ESmgerjQ
Message-ID: <CAP9ODKruOzzkoRVKcCSRUe6Rmnhh+++gDNEYGOf8-GSuw0b5Ug@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] hddtemp: add from OE-Classic and update
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
X-List-Received-Date: Sat, 20 Oct 2012 13:27:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Oct 20, 2012 at 9:22 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Saturday 20 October 2012 08:54:37 Otavio Salvador wrote:
>> I think some patches could be cleaned up. Specially the generated
>> files. Debian includes them in the patch and the packaging guide
>> advices to do it (there're reasons for it) but OE regenerated those so
>> I think it could be dropped.
>
> I'd really rather not touch the content of the patches - hddtemp upstream is
> dead, we're not intending to maintain our own fork and it's easier if we can
> just pull in any new patches as-is from Debian or Fedora (with source
> information, which I did add to the top of each patch).

Right but including generated files is waste of space, unpack time and
patching time. We're rewrite those in do_configure.

>> Another thing, I remember to see this patch before on mailing list.
>> Did you forget to mark it as v2?
>
> No, all the patches I have sent to the list are the same. Sorry for the noise
> but none of them are being picked up by patchwork for some reason and Khem was
> trying to fix that (still doesn't seem to be fixed as I have noted).
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


