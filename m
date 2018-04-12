Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id D435074706
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 14:12:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1523542367; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=SdWLIwT1lQ+vUjaqF8WO8KJZbAnguZ6jL5XW0hkERD4=;
	b=fAXjNUs7v57nNVSlslFSrAr9DiNSpce3lbTXRpDOXwb0sQnT0Vq47v76izKixQEZuI0XKTIZ
	20zYYb43oAKQsNRz1EHXz3Z3IuVwVyCUnpDqxnoMVQ32seHhIEDn7TGxsZn320NN0g+k1rY5
	rNDTsz1G1iBXF1yVhA7wPLRQMPM=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mxa.mailgun.org with ESMTP id 5acf695e.7fcf9f313370-smtp-out-n02;
	Thu, 12 Apr 2018 14:12:46 -0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id b20so6469132iof.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 07:12:46 -0700 (PDT)
X-Gm-Message-State: ALQs6tA7RFdtVXD+s1aFOv4WSPlwA0GR2qvNJHlQ5qXgVI+KxlOCvCQ6
	binN5iUEhWYc23kIaVfihw2/eYbXbfKtV0kWejA=
X-Google-Smtp-Source: AIpwx49EXyqVt33u7j85fY1mV24cbu15YZNoytEdfMYO034ZChFlUV7GfKSh9gN0fuaJlmZXQNmybgrExaEvCkE1ieA=
X-Received: by 10.107.198.136 with SMTP id w130mr9040659iof.131.1523542366140; 
	Thu, 12 Apr 2018 07:12:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.140.6 with HTTP; Thu, 12 Apr 2018 07:12:45 -0700 (PDT)
In-Reply-To: <CABF_=yiRrqZTGPkMEQNvm5f=LsUQTPKtbqrCrKHjBfbWuv29zQ@mail.gmail.com>
References: <CABF_=yiRrqZTGPkMEQNvm5f=LsUQTPKtbqrCrKHjBfbWuv29zQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Thu, 12 Apr 2018 10:12:45 -0400
X-Gmail-Original-Message-ID: <CADNbA1qZLO+GbkVcedsqrVV7_-ggr-xsijZ4hZomnmmTAAPPeA@mail.gmail.com>
Message-ID: <CADNbA1qZLO+GbkVcedsqrVV7_-ggr-xsijZ4hZomnmmTAAPPeA@mail.gmail.com>
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
X-List-Received-Date: Thu, 12 Apr 2018 14:12:47 -0000
Content-Type: text/plain; charset="UTF-8"

There is a usage of hashlib (provided by ${PYTHON_PN}-crypt) in _make.py.

derek@sparta:/tmp$ dpkg -c
upstream/build/tmp/deploy/ipk/core2-64/python-crypt_2.7.14-r1_core2-64.ipk
drwxrwxrwx root/root         0 2018-03-24 09:28 ./
drwxr-xr-x root/root         0 2018-03-24 09:28 ./usr/
drwxr-xr-x root/root         0 2018-03-24 09:28 ./usr/lib/
drwxr-xr-x root/root         0 2018-03-24 09:28 ./usr/lib/python2.7/
-rw-r--r-- root/root      7842 2018-03-24 09:28
./usr/lib/python2.7/hashlib.py
-rw-r--r-- root/root      6891 2018-03-24 09:28
./usr/lib/python2.7/hashlib.pyc
drwxr-xr-x root/root         0 2018-03-24 09:28
./usr/lib/python2.7/lib-dynload/
-rwxr-xr-x root/root     25184 2018-03-24 09:28
./usr/lib/python2.7/lib-dynload/_hashlib.so
-rwxr-xr-x root/root      6520 2018-03-24 09:28
./usr/lib/python2.7/lib-dynload/crypt.so
-rw-r--r-- root/root       358 2018-03-24 09:28 ./usr/lib/python2.7/md5.py
-rw-r--r-- root/root       376 2018-03-24 09:28 ./usr/lib/python2.7/md5.pyc
-rw-r--r-- root/root       393 2018-03-24 09:28 ./usr/lib/python2.7/sha.py
-rw-r--r-- root/root       419 2018-03-24 09:28 ./usr/lib/python2.7/sha.pyc

derek@sparta:/tmp$ grep -r hashlib attrs/
attrs/src/attr/_make.py:import hashlib
attrs/src/attr/_make.py:    sha1 = hashlib.sha1()
attrs/src/attr/_make.py:    sha1 = hashlib.sha1()
attrs/src/attr/_make.py:    sha1 = hashlib.sha1()

On Thu, Apr 12, 2018 at 9:33 AM, jan vermaete <jan.vermaete@gmail.com>
wrote:

> I'm afraid this patch just revert the file to the previous state.
> As far as I can see, there is no need at all to have something of
> crypto nor crypotgraphy needed for this python package.
>
> --
> Jan Vermaete
> "For every complex problem there is an answer that is clear, simple,
> and wrong." - H.L. Mencken
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

