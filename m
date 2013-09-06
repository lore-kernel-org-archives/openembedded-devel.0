Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id D4E3C615F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2013 21:32:23 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id u14so3237762lbd.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2013 14:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=RunyA6cYDoqRdfy4nzY4xzpgqzE6zmKsSdtmNld8mQg=;
	b=QBVNye5w+UDNoSMcHuEkwaJfDqzIuah2EdGOQFKDMJpW1jZ3MmAAcQPBAFTMhQWxnc
	jWs3frlsNGvTpiKrX3CIB6ZSVfFwsNbLaT5BDX287m4RSIoM42Xc0TAUGG0XtyOvziAv
	tazWepmGubJCrvkEeyIaBUbvsezyn71HTnQsA3M8JK/uD8Ch/W3gn1LHNAyExAL97TGL
	7aPfbs/icunG4IXHD8cz2ZT212LdG5FtT6chVw/3/RpWGIQ/KVmRGVaeSkMasmF9QMpF
	Oq5mBjSfVLqFmF0B2MXQJjGxVir7oAPb6tPlNah47YhO5i5AwU0oQAlcyHlXIIuh5zHC
	1P8g==
X-Gm-Message-State: ALoCoQkJQnb3FJ0NVQmJik446KK26ndR7n64hydZLMd+5+cxym5Lxcrt/377guaKaRNowKOAfTbn
MIME-Version: 1.0
X-Received: by 10.152.22.198 with SMTP id g6mr3893728laf.5.1378503144718; Fri,
	06 Sep 2013 14:32:24 -0700 (PDT)
Received: by 10.112.160.73 with HTTP; Fri, 6 Sep 2013 14:32:24 -0700 (PDT)
In-Reply-To: <l0d9bb$ik4$1@ger.gmane.org>
References: <1378476045-17681-1-git-send-email-fathi.boudra@linaro.org>
	<l0d9bb$ik4$1@ger.gmane.org>
Date: Sat, 7 Sep 2013 00:32:24 +0300
Message-ID: <CAGNsrLDmTC1T00o8fHu0OTJh5cak4v=QNvGPCKFN4wP-=XLj1w@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/1] fping: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Sep 2013 21:32:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 6 September 2013 22:10, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 06-09-13 16:00, Fathi Boudra schreef:
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org> ---
>> meta-networking/recipes-support/fping/fping_3.5.bb | 25
>> ++++++++++++++++++++++ 1 file changed, 25 insertions(+) create mode
>> 100644 meta-networking/recipes-support/fping/fping_3.5.bb
>>
>> diff --git a/meta-networking/recipes-support/fping/fping_3.5.bb
>> b/meta-networking/recipes-support/fping/fping_3.5.bb new file mode
>> 100644 index 0000000..de41797 --- /dev/null +++
>> b/meta-networking/recipes-support/fping/fping_3.5.bb @@ -0,0 +1,25 @@
>> +SUMMARY = "sends ICMP ECHO_REQUEST packets to network hosts"
>> +DESCRIPTION = "fping is a ping like program which uses the Internet
>> Control \ +Message Protocol (ICMP) echo request to determine if a target
>> host is \ +responding. fping differs from ping in that you can specify
>> any number of \ +targets on the command line, or specify a file
>> containing the lists of \ +targets to ping.  Instead of sending to one
>> target until it times out or \ +replies, fping will send out a ping
>> packet and move on to the next target \ +in a round-robin fashion."
>> +HOMEPAGE = "http://www.fping.org/" +SECTION = "console/tools" +LICENSE =
>> "BSD" +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=09d77789fe32be35acde9637a5ee39b1" +PR = "r0"
>
> Drop the PR but, it's the default

ack

>> + +SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz"
>> +SRC_URI[md5sum] = "2e17cb655aa4eb59b5a4a38a89e746ed" +SRC_URI[sha256sum]
>> = "09b8960e235341bae6000085d38106357eae656a79e0119bd27e816c9003656a" + +S
>> = "${WORKDIR}/fping-${PV}" + +inherit autotools + +EXTRA_OECONF =
>> "--enable-ipv4 --enable-ipv6"
>
> That should probably be using PACKAGECONFIG for ipv6

ack

>> + +COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
>
> What breaks on powerpc and mips?

nothing. it can be dropped.

Thanks for the review, I'm preparing V2.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFSKii1MkyGM64RGpERAs1+AJwMTAC9o0rwoWGF55P9slUU1sqbaQCfa8MZ
> C7SlRH3oOn6+Sh/YxSiSrWA=
> =wkli
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

