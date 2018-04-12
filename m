Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id ACBB574517
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 15:24:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1523546670; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=ltocDuuxe3O/v4u3dNXwOannZcsX0iTuVe3xFeH8OY4=;
	b=PdNVR85Air4sy7kkKilnObi0RYBmCQne06/7SiYz+Cxt/H0qknLUlmlVwJuquM4DPVf6Rg+X
	Co11OL9GkEQ9wWW4sOBK08/VoX3Z37V37kubnuAQXAYh7u/zNyWMhS76dzuuu+YDWXLQ+Dbh
	5IfKCaT5xug0B0E1pdaazEgGw6o=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mxa.mailgun.org with ESMTP id 5acf7a2d.7f72d4759b30-smtp-out-n02;
	Thu, 12 Apr 2018 15:24:29 -0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id u62-v6so7511213ita.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 08:24:29 -0700 (PDT)
X-Gm-Message-State: ALQs6tBJqwYJfWgPmDwXw2q2y/mc+w2eOT80XuWudsqoRjJ22UWb7tWR
	f9lRfO7gb+DfSAoJLUAax9qnJsUi/j/76tsaJd0=
X-Google-Smtp-Source: AIpwx4+moEbNV6cUnXUKOINDne6sHVdhuEdRkbyTuW+ObgMnmOf8O0rkfz00CvTurqQ7ulYi699u8IKjhrLp75y9H2s=
X-Received: by 2002:a24:7cc:: with SMTP id
	f195-v6mr1617848itf.46.1523546669089; 
	Thu, 12 Apr 2018 08:24:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.140.6 with HTTP; Thu, 12 Apr 2018 08:24:28 -0700 (PDT)
In-Reply-To: <CABF_=yjBxXZQUYgfHhr94_Kkkxnrs4UV8CJBRe30N3wRp-+eaw@mail.gmail.com>
References: <CABF_=yiRrqZTGPkMEQNvm5f=LsUQTPKtbqrCrKHjBfbWuv29zQ@mail.gmail.com>
	<CADNbA1qZLO+GbkVcedsqrVV7_-ggr-xsijZ4hZomnmmTAAPPeA@mail.gmail.com>
	<CABF_=yjBxXZQUYgfHhr94_Kkkxnrs4UV8CJBRe30N3wRp-+eaw@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Thu, 12 Apr 2018 11:24:28 -0400
X-Gmail-Original-Message-ID: <CADNbA1rcENxDEY4-i7=bsPVS4nYU092rdo=OGjYcbbwyF3pcpw@mail.gmail.com>
Message-ID: <CADNbA1rcENxDEY4-i7=bsPVS4nYU092rdo=OGjYcbbwyF3pcpw@mail.gmail.com>
To: jan vermaete <jan.vermaete@gmail.com>
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
X-List-Received-Date: Thu, 12 Apr 2018 15:24:29 -0000
Content-Type: text/plain; charset="UTF-8"

No worries.  Does this resolve the original github issue you created?

On Thu, Apr 12, 2018 at 11:09 AM, jan vermaete <jan.vermaete@gmail.com>
wrote:

> my mistake...
> Thanks for the info
>
> On Thu, Apr 12, 2018 at 4:12 PM, Derek Straka <derek@asterius.io> wrote:
> > There is a usage of hashlib (provided by ${PYTHON_PN}-crypt) in _make.py.
> >
> > derek@sparta:/tmp$ dpkg -c
> > upstream/build/tmp/deploy/ipk/core2-64/python-crypt_2.7.14-
> r1_core2-64.ipk
> > drwxrwxrwx root/root         0 2018-03-24 09:28 ./
> > drwxr-xr-x root/root         0 2018-03-24 09:28 ./usr/
> > drwxr-xr-x root/root         0 2018-03-24 09:28 ./usr/lib/
> > drwxr-xr-x root/root         0 2018-03-24 09:28 ./usr/lib/python2.7/
> > -rw-r--r-- root/root      7842 2018-03-24 09:28
> > ./usr/lib/python2.7/hashlib.py
> > -rw-r--r-- root/root      6891 2018-03-24 09:28
> > ./usr/lib/python2.7/hashlib.pyc
> > drwxr-xr-x root/root         0 2018-03-24 09:28
> > ./usr/lib/python2.7/lib-dynload/
> > -rwxr-xr-x root/root     25184 2018-03-24 09:28
> > ./usr/lib/python2.7/lib-dynload/_hashlib.so
> > -rwxr-xr-x root/root      6520 2018-03-24 09:28
> > ./usr/lib/python2.7/lib-dynload/crypt.so
> > -rw-r--r-- root/root       358 2018-03-24 09:28
> ./usr/lib/python2.7/md5.py
> > -rw-r--r-- root/root       376 2018-03-24 09:28
> ./usr/lib/python2.7/md5.pyc
> > -rw-r--r-- root/root       393 2018-03-24 09:28
> ./usr/lib/python2.7/sha.py
> > -rw-r--r-- root/root       419 2018-03-24 09:28
> ./usr/lib/python2.7/sha.pyc
> >
> > derek@sparta:/tmp$ grep -r hashlib attrs/
> > attrs/src/attr/_make.py:import hashlib
> > attrs/src/attr/_make.py:    sha1 = hashlib.sha1()
> > attrs/src/attr/_make.py:    sha1 = hashlib.sha1()
> > attrs/src/attr/_make.py:    sha1 = hashlib.sha1()
> >
> > On Thu, Apr 12, 2018 at 9:33 AM, jan vermaete <jan.vermaete@gmail.com>
> > wrote:
> >>
> >> I'm afraid this patch just revert the file to the previous state.
> >> As far as I can see, there is no need at all to have something of
> >> crypto nor crypotgraphy needed for this python package.
> >>
> >> --
> >> Jan Vermaete
> >> "For every complex problem there is an answer that is clear, simple,
> >> and wrong." - H.L. Mencken
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
>
>
>
> --
> Jan Vermaete
> "For every complex problem there is an answer that is clear, simple,
> and wrong." - H.L. Mencken
>

