Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RWrq5-0007MZ-SL
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 16:49:22 +0100
Received: by qcqw6 with SMTP id w6so758394qcq.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Dec 2011 07:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=A4uzmlXoqjMADtr1v946nDhcviNC4WG1EBuzd3bJmeY=;
	b=p8JKdH5301FY4QDPuFX3g1XedYGrxHOjOMbqEAPMK6/te6IlgoHCcXkjhw62OzoMaf
	iVBO0u1OMJb9Ge4eDv6VLIJbu5B7rpPtJgevXcI1oCMb0PS/Qj9S7fR9kc3EcM++H2K3
	HaBscp2ltiaGaF237kNNHFiAB5SI28MqOAB1A=
MIME-Version: 1.0
Received: by 10.229.238.135 with SMTP id ks7mr567097qcb.264.1322926956558;
	Sat, 03 Dec 2011 07:42:36 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sat, 3 Dec 2011 07:42:36 -0800 (PST)
In-Reply-To: <jba6p6$bep$1@dough.gmane.org>
References: <jba6p6$bep$1@dough.gmane.org>
Date: Sat, 3 Dec 2011 08:42:36 -0700
Message-ID: <CA+M6bXk94ukVFEva8Ab-RbvNe3pWuYkJWZkk-WS8CpKca83F4Q@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] rpath problem for llvm libs?
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
X-List-Received-Date: Sat, 03 Dec 2011 15:49:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 2, 2011 at 2:46 AM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> I installed openjdk + openjdk-shark on my target and I get:
>
> root@beaglebone:~# java
> dl failure on line 696Error: failed
> /usr/lib/jvm/java-6-openjdk/jre/lib/arm/shark/libjvm.so, because
> libLLVMARMCodeGen.so: cannot open shared object file: No such file or dir=
ectory
>
> The 'fix' I used:
>
> root@beaglebone:~# for i in /usr/lib/llvm2.9/libLLVM*.so ; do ln -sf $i
> /usr/lib ; done
>
> root@beaglebone:~# java
> Usage: java [-options] class [args...]
> =A0 =A0 =A0 =A0 =A0 (to execute a class)
>
> I came up with a number of workarounds, but I'm not sure which is best:
>
> 1) do the for ; ln thing in a postinst
> 2) have llvm install into ${libdir} instead of ${libdir}${LLVM_RELEASE}
> 3) Use u-a for the libs
> 4) add rpaths
> 5) convince people java is evil and have them switch to C
>
> I have a preference for 5), but I suspect Henning would like a different
> solution :)

Well, what's Fedora or Debian/Ubuntu look like here?

--=20
Tom


