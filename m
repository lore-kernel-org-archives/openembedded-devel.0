Received: from [209.85.217.20] (helo=mail-gx0-f20.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KmvXz-0005nf-6J
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Oct 2008 21:15:11 +0200
Received: by gxk13 with SMTP id 13so5366628gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2008 12:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=E8PYWDbLri9IaH1w1ZVky3HHIJfdzBWyG8uO33o/oXk=;
	b=ET9FF62IRHeVEmY+fXxAzfB3i7RTwdCID5/2a9WXJNYe62JeF4iZxMvHQfSg6FX6nz
	3Xw7gR107iHFof/bo1H35NnHO9f9NjoxRDtDav9JxiWaoYteJ5L9hfZOVWgKsX5YFXRz
	R3vFaGuUyqbgBXjNcaHvculKpnRdYMOlwqA2I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=AQwVToxgEi2uvGhjTFOMxzRjPIUSkLHoB+quFeSercfFxxhY8FscCwvDRE7qH0IQvl
	rx4NO8UKD5YMRLyrC2c+P8++zf0WjJ2jtRaXWgQCMcAly/dsz7WEl3hJZESW4S5aKFCd
	2QtRImovZith2YBwIZu5wp4IGMtI+YgKE9JP4=
Received: by 10.100.8.4 with SMTP id 4mr5401624anh.38.1223320238389;
	Mon, 06 Oct 2008 12:10:38 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Mon, 6 Oct 2008 12:10:38 -0700 (PDT)
Message-ID: <c384c5ea0810061210l65b4178ay812a9681a4e86dda@mail.gmail.com>
Date: Mon, 6 Oct 2008 21:10:38 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gc35ba$voi$1@ger.gmane.org>
MIME-Version: 1.0
References: <gc35ba$voi$1@ger.gmane.org>
Subject: Re: Heads up: staging changes are going to land
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
X-List-Received-Date: Mon, 06 Oct 2008 19:15:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Koen,

this change in that patch:

+CROSS_DIR = "${TMPDIR}/cross/${BASE_PACKAGE_ARCH}"

makes my OE PATH look like this:

<...>/build/tmp/cross/ppce300c3/bin

but my cross toolchain did not end up there, instead it ended up in
the usual place: <...>/build/tmp/cross/bin/

so I am getting:

NOTE: make -j5 -e MAKEFLAGS= include/linux/version.h CC=ccache
powerpc-angstrom-linux-gcc  LD=powerpc-angstrom-linux-ld
powerpc-angstrom-linux-gcc: No such file or directory

So obviously for me the CROSS_DIR is not respected somehow for the toolchain.

Any ideas where it could leak away?

I did a scratch build against HEAD using the latest stable bitbake
tree checkout, for MACHINE=mpc8313erdb.

Some other details might still exist at
http://tinderbox.openembedded.net/builders/likewise/

Regards,

Leon.


