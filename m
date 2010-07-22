Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1ObxUs-0003Xk-Mi
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 17:16:02 +0200
Received: by fxm12 with SMTP id 12so4425351fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 08:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=hykzD8IgRx/BLsL2XpiPbpvonc8YCEkvrFmuz5kVtb8=;
	b=q3lZTviJmFx0PsQzefQaYz/DHYpNGCDo2AAJeGWlqTZ5uZKEfSjhfNtQ0sdkVgQsJK
	t9TzD2zIhejGIPACW1HthMkRgktwnODhPNQPVyBsf+4795ygjt0kZr+uynLsvu9TkN8g
	ov2G2CL5Wg/kT4tNhN5PvsfaFALKnyH0tnEks=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=IF3XhuujSbWuHJPErRhXlAxIdGnG0+zJmzd/u7gYDw687NPjafvP5wvqNeoOY4jpmq
	RFcXAE4RCJ6paMcBx2AaqOWOBa+3oAdFMJ5vwaUV7oXwJ495eNhEWadOk5RtcyUTmdVp
	yC59U9MC7sRKDxnL32Em6cPi/b36gavXyPzLk=
MIME-Version: 1.0
Received: by 10.223.113.144 with SMTP id a16mr2044979faq.41.1279811728467; 
	Thu, 22 Jul 2010 08:15:28 -0700 (PDT)
Received: by 10.223.117.204 with HTTP; Thu, 22 Jul 2010 08:15:28 -0700 (PDT)
In-Reply-To: <20100721142016.GH2189@jama>
References: <i216cf$pju$1@dough.gmane.org> <4C46DCE3.1080207@zafena.se>
	<20100721142016.GH2189@jama>
Date: Thu, 22 Jul 2010 17:15:28 +0200
Message-ID: <AANLkTikeJTj01x057Rur8H0haeDehcVVPqaQzDLq2dd6@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Openjdk shark and cacao VMs not working - shark fixed
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
X-List-Received-Date: Thu, 22 Jul 2010 15:16:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 21, 2010 at 4:20 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> FYI:
>
> Tested on om-gta02 (armv4t) and only -zero seems to work (built from
> yesterday oe.dev, waiting for todays fixes to built).
>
> SHR root@gojama ~ $ javac -zero Linpack.java
> Warning: no leading - on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
> Warning: missing VM type on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
> Warning: no leading - on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
> Warning: missing VM type on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'

With current version jvm.cfg warnings are gone, but cacao and shark still fails
SHR root@gojama ~ $ java -zero Linpack
Mflops/s: 1.691  Time: 0.41 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
SHR root@gojama ~ $ java -cacao Linpack
LOG: [0x40190000] md_signal_handler_sigill: Unknown illegal
instruction 0xed1c5a06 at 0x441c2790
LOG: [0x40190000] Aborting...
Aborted
SHR root@gojama ~ $ java -shark Linpack
dl failure on line 696Error: failed
/usr/lib/jvm/java-6-openjdk/jre/lib/arm/shark/libjvm.so, because
/usr/lib/libLLVMCodeGen.so: symbol powf, version GLIBCXX_3.4 not
defined in file libstdc++.so.6 with link time reference

Let me know if you want more info.


