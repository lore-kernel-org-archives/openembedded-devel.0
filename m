Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OozLr-0004qk-4d
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 15:52:16 +0200
Received: by wwb31 with SMTP id 31so3120386wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 06:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=eTn+uxtt0BLaVqeazrGPuhH4h1kUfPPGQ+EFk16oKrw=;
	b=BHisbYc1Nn5gWN+d46fHSENxufjpuTajKHszHTBzOO/UQfA2xEepsLzJxMV33kK2YP
	5DdmGKjoo9pIXunNc4LsptGcYoIVJsXrr5RAbGxooE2nCDPRrDXjzas2MmjWTTrcVTE+
	CW35vCIkRzuKhgPG8MgfSYuVcxeS47mCKFV2I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=CvGGP93I9i33SDgehPoU2863QGjRcJKIpI3QC3g42YxBvQI1HWsMuUSJR48SYcgTqS
	lsLSO0CCi4tLylaoEnQp1Kki8yyMrjUSuJsBVFXkP7pHFNbJDgs4hxkAMNDXdwj9RWKj
	+I4T8XzDu+w+ln0n5yNj45CIJWh8rP8maehQM=
MIME-Version: 1.0
Received: by 10.227.147.142 with SMTP id l14mr463114wbv.105.1282917062519;
	Fri, 27 Aug 2010 06:51:02 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Fri, 27 Aug 2010 06:51:02 -0700 (PDT)
In-Reply-To: <4C771A94.1020802@mlbassoc.com>
References: <4C771A94.1020802@mlbassoc.com>
Date: Fri, 27 Aug 2010 09:51:02 -0400
Message-ID: <AANLkTimhME5XnoVz+a6vrnDyvZBeoK9Yy9st0MVAQ2H3@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Testing build failure
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
X-List-Received-Date: Fri, 27 Aug 2010 13:52:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2010 at 9:53 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> MACHINE=3Dbeagleboard
> DISTRO=3Dangstrom-2010.x
> IMAGE=3Dbeagleboard-linuxtag2010-demo-image
> HOST=3DFedora 12 32-bit
> fails to build ti-dsplink
> =A0-- because ti-cgt6x installed tools incorrectly
>
> Cliff - how did this build for you on Ubuntu/64-bit? =A0Can you send me
> the logs for ti-dsplink and ti-cgt6x?

Hi Gary,

I was using the angstrom-2008.1 distro -- not sure if that matters.
It looks like 2010.x is not ready for general use based on comments in
inc files.

I ran into an issue with one of the TI components where I had a '.' in
my directory path that it did not like.

I assume you have manually downloaded the binaries from TI and have
placed them in your sources/downloads directory?

My logs are:
http://bec-systems.com/oe/ti-cgt6x-1_6_1_9-r4.tar.gz
http://bec-systems.com/oe/ti-dsplink-1_1_64-r88h.tar.gz

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


