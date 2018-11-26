Return-Path: <jan.vermaete@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1156C0CB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 20:50:13 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id a11so17971377otr.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 12:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/ObHA8ss5RMia4tSf6bUAwxdKm1VreRb2j0F1Cz4aaY=;
	b=MjjGGc4heujEJpEIghzX9NLY3pRsv6DPbT3coBH7wYsOmBF9LXfBo3rNdFMFA1mr+u
	GD3hXoGD6v6xZFiOE+/Wq1jjvk27dcubcMGP/1NXBxyMnLHYi+HxtIaTDf/m0dJgamLf
	C7uosvwgQ0TDEsv0O4sXq5AGXTcDPgMzFmDgrCKNP2uhWlZxNqi9TFOupwRfRbSxgZRL
	cAyEyX8F/ZTKhBDw+MMyU179c0qcRGmwzviWlnkWYdm9PXMpTmgGdSOeF700gUe9sitJ
	89z7kMDgWvEZd/NIt5AZE1ZtO9FA+ukLNjBhBU0tUlX4Bc9KO/ZBM5U6WqMNQ0rNtIjD
	x+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/ObHA8ss5RMia4tSf6bUAwxdKm1VreRb2j0F1Cz4aaY=;
	b=Nhq2fTkSyvYUB8LIOJpF+5AoLaG3I1QmCy1Ly96p0+o4aoHpLxANKBIv6+Da0HGofT
	rz6qfVKuwQXVQndp3Hu2iX5SXFNzv8XJbVpl2SWXAYIHmWOR2ycMR4gRjcao3vHav/8v
	CMDRVcXYKdpYMLFcqAers+GXG4HwmV3N73vno2s1iE+5zpJpnetjOS+kn12sVJspCLek
	g1oMc1ZSNhzEP6IIHAZyUXPBdtfjHgsxkAMXFYjS+RcwBrsBhNGsRJBHtsSDewnF832T
	yank8KwAWOI+jsd7kj15Mv+0AthWGTwPZF3M07YPyUSgm5urzx6CJ+ZEu/nq+cSOAhXC
	d5qA==
X-Gm-Message-State: AA+aEWaPmDVVIw3LsXgG23BcWfpcjtBgLPNTJQyRdp4MgHPIbqHT5u9x
	QK2Xyu8CVH+Nqk+KDvkZB0okw6MIP1m0tKp2OmFwuVUq
X-Google-Smtp-Source: AFSGD/UBRSSX2Ks+vOnqfstpT8lED00GV+e5gkcxjv3AYMdIyyHufPPv4OjFL9/0dqHBGtTpVLmwXG8OvzRaLjmONWE=
X-Received: by 2002:a9d:27e3:: with SMTP id c90mr15495670otb.21.1543265413913; 
	Mon, 26 Nov 2018 12:50:13 -0800 (PST)
MIME-Version: 1.0
References: <CABF_=yiRrqZTGPkMEQNvm5f=LsUQTPKtbqrCrKHjBfbWuv29zQ@mail.gmail.com>
	<CADNbA1qZLO+GbkVcedsqrVV7_-ggr-xsijZ4hZomnmmTAAPPeA@mail.gmail.com>
	<CABF_=yjBxXZQUYgfHhr94_Kkkxnrs4UV8CJBRe30N3wRp-+eaw@mail.gmail.com>
	<CADNbA1rcENxDEY4-i7=bsPVS4nYU092rdo=OGjYcbbwyF3pcpw@mail.gmail.com>
In-Reply-To: <CADNbA1rcENxDEY4-i7=bsPVS4nYU092rdo=OGjYcbbwyF3pcpw@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Mon, 26 Nov 2018 21:49:50 +0100
Message-ID: <CABF_=ygJedq8-jSqHmpJbqBk0=dGaL_qKMA4xa4XH2401P1BAg@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-attrs: Adjust the RDEPENDS to include crypt rather than cryptography
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2018 20:50:13 -0000
Content-Type: text/plain; charset="UTF-8"

At the Thud branch of meta-python, I see the python3-attrs
(meta-python/recipes-devtools/python/python3-attrs_18.1.0.bb) recipe is
still depending on '${PYTHON_PN}-cryptography'.
I think depending on '${PYTHON_PN}-crypto' is enough.

With 'crypto' i.s.o. 'cryptography' the following packages where not
installed (-18%):
  python3-distutils was removed
  python3-cffi was removed
  python3-asn1crypto was removed
  cpp was removed
  python3-setuptools was removed
  python3-ply was removed
  libmpfr6 was removed
  python3-compile was removed
  cpp-symlinks was removed
  python3-pycparser was removed
  libmpc3 was removed
  python3-plistlib was removed
  python3-cryptography was removed

Br,

On Thu, Apr 12, 2018 at 5:24 PM Derek Straka <derek@asterius.io> wrote:

> No worries.  Does this resolve the original github issue you created?
>
> On Thu, Apr 12, 2018 at 11:09 AM, jan vermaete <jan.vermaete@gmail.com>
> wrote:
>
>> my mistake...
>> Thanks for the info
>>
>> On Thu, Apr 12, 2018 at 4:12 PM, Derek Straka <derek@asterius.io> wrote:
>> > There is a usage of hashlib (provided by ${PYTHON_PN}-crypt) in
>> _make.py.
>> >
>> > derek@sparta:/tmp$ dpkg -c
>> >
>> upstream/build/tmp/deploy/ipk/core2-64/python-crypt_2.7.14-r1_core2-64.ipk
>> > drwxrwxrwx root/root         0 2018-03-24 09:28 ./
>> > drwxr-xr-x root/root         0 2018-03-24 09:28 ./usr/
>> > drwxr-xr-x root/root         0 2018-03-24 09:28 ./usr/lib/
>> > drwxr-xr-x root/root         0 2018-03-24 09:28 ./usr/lib/python2.7/
>> > -rw-r--r-- root/root      7842 2018-03-24 09:28
>> > ./usr/lib/python2.7/hashlib.py
>> > -rw-r--r-- root/root      6891 2018-03-24 09:28
>> > ./usr/lib/python2.7/hashlib.pyc
>> > drwxr-xr-x root/root         0 2018-03-24 09:28
>> > ./usr/lib/python2.7/lib-dynload/
>> > -rwxr-xr-x root/root     25184 2018-03-24 09:28
>> > ./usr/lib/python2.7/lib-dynload/_hashlib.so
>> > -rwxr-xr-x root/root      6520 2018-03-24 09:28
>> > ./usr/lib/python2.7/lib-dynload/crypt.so
>> > -rw-r--r-- root/root       358 2018-03-24 09:28
>> ./usr/lib/python2.7/md5.py
>> > -rw-r--r-- root/root       376 2018-03-24 09:28
>> ./usr/lib/python2.7/md5.pyc
>> > -rw-r--r-- root/root       393 2018-03-24 09:28
>> ./usr/lib/python2.7/sha.py
>> > -rw-r--r-- root/root       419 2018-03-24 09:28
>> ./usr/lib/python2.7/sha.pyc
>> >
>> > derek@sparta:/tmp$ grep -r hashlib attrs/
>> > attrs/src/attr/_make.py:import hashlib
>> > attrs/src/attr/_make.py:    sha1 = hashlib.sha1()
>> > attrs/src/attr/_make.py:    sha1 = hashlib.sha1()
>> > attrs/src/attr/_make.py:    sha1 = hashlib.sha1()
>> >
>> > On Thu, Apr 12, 2018 at 9:33 AM, jan vermaete <jan.vermaete@gmail.com>
>> > wrote:
>> >>
>> >> I'm afraid this patch just revert the file to the previous state.
>> >> As far as I can see, there is no need at all to have something of
>> >> crypto nor crypotgraphy needed for this python package.
>> >>
>> >> --
>> >> Jan Vermaete
>> >> "For every complex problem there is an answer that is clear, simple,
>> >> and wrong." - H.L. Mencken
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> >
>>
>>
>>
>> --
>> Jan Vermaete
>> "For every complex problem there is an answer that is clear, simple,
>> and wrong." - H.L. Mencken
>>
>
>

-- 
Jan Vermaete
"For every complex problem there is an answer that is clear, simple, and
wrong." - H.L. Mencken

