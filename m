Received: from [72.14.220.159] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1LYLtg-0002bq-DI
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Feb 2009 15:53:36 +0100
Received: by fg-out-1718.google.com with SMTP id 13so49517fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Feb 2009 06:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=t+Yr4S7fidgFLiJBxZcq16ehqYd7v00JukovpyiIun8=;
	b=tCCfWImPh/a9SMI0oE3fCya1rs/08xF3jypLGrheGQF+/Ls8OHrMiY6MRSr+eEmuiy
	Q38jaAjXj4jAkgkrWFC1A3Ejyjo3HLG4YGe5rneiqOKYKi7vWcc2n0BHTqNYURAq6/WY
	owKIPSaEfOs5ePlWOPFj5HZjy6yExPY9YZtaU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=Pi8KuOE+tuTvWM6n4/hEEMfk+5mc1PGe8vUk4Yz4qplU9pe4MUn+ry32B5oxCGIkYy
	JMkRVqrpg7O2JO83B8Lmr+Xe0DyP+FxL0vMpo6QPV5t3fcFdFaTtBU47jo1RLHp5lK2Z
	EOdEz8XUW0X4qqlXdSUIS0/ZWXPTf1DaMIrn8=
Received: by 10.86.53.11 with SMTP id b11mr360264fga.23.1234623122098;
	Sat, 14 Feb 2009 06:52:02 -0800 (PST)
Received: from is.home (93-81-0-14.broadband.corbina.ru [93.81.0.14])
	by mx.google.com with ESMTPS id d4sm4489354fga.48.2009.02.14.06.52.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 14 Feb 2009 06:52:00 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Feb 2009 17:51:50 +0300
User-Agent: KMail/1.9.10
References: <200902131728.08634.openembedded@haerwu.biz>
In-Reply-To: <200902131728.08634.openembedded@haerwu.biz>
MIME-Version: 1.0
Message-Id: <200902141751.50621.jay4mail@gmail.com>
Subject: Re: checksums situation
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
X-List-Received-Date: Sat, 14 Feb 2009 14:53:36 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

[skipped]
> What do you think? Which way we should go? Do you have other ideas?

Well, I can suggest scheme that is very like one created in FreeBSD ports
(I just working with it about 8 years).

In recipe directory part and filename part of SRC_URI are stored separate.
E.g. we can continue storing directory part in SRC_URI but introduce new
variable to store filename part (e.g. DISTFILES - we can have more than
one source file per package).

Example:
# Source directories/mirrors:
SRC_URI = "${SOURCEFORGE_MIRROR}/zziplib/ http://somesite/~user/";
# Filename
DISTFILES = "zziplib-${PV}.tar.bz2 zziplib_extra-${PV}.tar.bz2"

Then we can use words in DISTFILES as keys to checking checksums.

But I don't see any good way to store checksums for multiple files in
recipe. We can't use this:

MD5SUM_zziplib-${PV}.tar.bz2="a6538f6c44ceeed0ed7e8e356f444168"

because of possible some special chars in file name.
We can possible use arrays:

MD5SUM["zziplib-${PV}.tar.bz2"]="a6538f6c44ceeed0ed7e8e356f444168"

but seems that no one uses arrays in recipes.

Other way is using some predefined functions via ${@bb.data....}

Or we can store all checksums in separate file per package directory
(like manifest in gentoo or distinfo in FreeBSD).

E.g. distinfo of russian xmms port from FreeBSD:

MD5 (xmms-1.2.11.tar.bz2) = f3e6dbaf0b3f571a532ab575656be506
SHA256 (xmms-1.2.11.tar.bz2) = 7ec15c56632b6c82e61ccddeaefd372359af2f005708a58cdf3951c574b20390
SIZE (xmms-1.2.11.tar.bz2) = 2581032
MD5 (RusXMMS2-csa41.tar.bz2) = 7d89f35c80849dae89b81cbb57026e57
SHA256 (RusXMMS2-csa41.tar.bz2) = e64df1956502e48c09ca60262efb7f1953a76d82a70c801e4797ca81e130e8d0
SIZE (RusXMMS2-csa41.tar.bz2) = 96642

Links:
1. FreeBSD Porter's Handbook: http://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/index.html

-- 
Yuri Bushmelev


