Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OHuIx-0004Fn-Ae
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 May 2010 09:48:33 +0200
Received: by gwj15 with SMTP id 15so666984gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 May 2010 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=AG065By97R3sTdAZAUxcKL3AnDZQPzHEsr1j1CZA32g=;
	b=pRoVr3Or2tZ7tjsTxTZejT0kkc1PvBz1X8DrQrSNQc8a4yoIEsvUv3fqsSEymTtuzC
	GcfCbYWmLiKPBhTYJJEffsrE22tS5i3PB+xTvEo3rfkiQkERCGkgn/n7cQM3veGgV5Pm
	oh2XYdH5H9/J2Tl1b70YiW91JpUl2OzFfRDoU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Of5SpTjKDtnjRL1QgrpXiYM7p7bnNmLsK2X73kOHXIKN5x6sZu+tmlZUcGYr7Zs3yV
	eSQIzpkguRnr4tC2PImKtiPCWSBrxAefeBwBem/C6m0zg2uTL/4SRC5siBEOWOsn0pTI
	Z8GfRdcXd0kWUeWQATuaOKGcqV5u4Sy2QTHVc=
MIME-Version: 1.0
Received: by 10.101.10.36 with SMTP id n36mr14299424ani.114.1275032661149; 
	Fri, 28 May 2010 00:44:21 -0700 (PDT)
Received: by 10.100.132.11 with HTTP; Fri, 28 May 2010 00:44:21 -0700 (PDT)
In-Reply-To: <htnnq0$75p$1@dough.gmane.org>
References: <20100528052720.GA15949@gmail.com> <htnnq0$75p$1@dough.gmane.org>
Date: Fri, 28 May 2010 09:44:21 +0200
Message-ID: <AANLkTilIn7VbqhAFxA5AX2TsWeBHOBNIY0Xf2LL6Z7EE@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL, BAYES_00, SPF_PASS,
	URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: <package>-static name conflict with some recipes
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
X-List-Received-Date: Fri, 28 May 2010 07:48:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

>><package>-dev-static instead of <package>-static
>>IMO that will avoid the conflict and also clarify the package content a bit


These at least won't give any build problem (tested, there is no
$PN-*). Absolutely not -dev, just compiled aganst klibc statically.

./kexec-tools/kexec-tools-klibc-static_1.101.bb
./kexec-tools/kexec-tools-klibc-static_2.0.1.bb
./zaurus-utils/nandlogical-klibc-static_1.0.0.bb
./klibc/klibc-utils-static_1.5.15+1.5.16.bb
./klibc/klibc-utils-static_1.5.18.bb
./klibc/klibc-utils-static_1.5.15.bb
./klibc/klibc-utils-static_1.5.bb
./klibc/klibc-utils-static_1.5.17.bb

AFAIK there is no way to understand if e.g. kexec-static is built
against klibc or *libc...
Do you mean rename the package e.g. kexec-tools-klibc and only package
the -static bits?


These instead will surely give headhaches...

./dialog/dialog-static_1.1-20080819.bb
./busybox/busybox-static_1.2.1.bb
./busybox/busybox-static_1.11.3.bb

./skype/skype-static_2.0.0.72.bb
./udev/udev-static-devices.bb
./udev/udev-static_124.bb

I experienced strange tasks commistion building udev-static:
do_install task was taken from udev!
Renaming to udev-compat-static fixed the things. WIP.


Regards

Andrea


