Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id EA7DC7FC47;
	Mon, 20 Jan 2020 16:01:14 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id f5so27630501ilq.5;
	Mon, 20 Jan 2020 08:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VeGQpvCAS4U3ALy7iQzDtPik6nBW1bsQiN1ArGbfFtI=;
	b=TK1R+Syi/zIfd/C8hQt58YK+C5dnqnriJDKzoteGro5fxbvFiqDJ6uDDsiFbpDysuU
	kJz7/Osb6ixPgEnaDx7xObWLCLq/ee5WhyekJHcJbk/kiqOGBWtikArcryclOpScqv1Q
	ogNwh75eRup5PBiyAKaYwwb8G35qRFWeVHr+CdyAwBSQUREyRgKmbLWIb0RZLYoOMolD
	WcCLatfb6gRTtG5kS1VDsaYJjGiOONmTmUOhPQL/F2PL1KLCEm+zk/GG5ptzSJlMtbMt
	ObRvIIKbFSiuk87oy4hOojv7Qjw51HtBOv7L1zGGxqkuSDPZwgtTseAk64hDYg5MHDFw
	zwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VeGQpvCAS4U3ALy7iQzDtPik6nBW1bsQiN1ArGbfFtI=;
	b=XMnRh0nVAaC0ArvVd1J++X45rLOJS0uMGdQ/dgpUnEhySnoE/pNUC0I9a0EcUWbbRf
	sszM1YyYvPnXx3uDGpMkiyHK9faNX0zCb+ZIvtvsJcdhxkRj+LBf5wFbzvuor0rv6kxs
	EPyo+RYldBkjwI0uza2+EBUMXtE4ZsjKHYxw/UqU8AgKQ1plhA863k1I1adbSpORup4W
	yuCnbeifbNQA0BlLltgZ1rUwiXOtS/kiIwB6NnW9BqsT472oR8FM0DsJCR8TskVrUEYl
	6ZfTA+9ZESxvjVZb9nsJtZVATMs6+pZZ4su/ew2+0IA4GV7eBPZPtLyz9CEMhfm2jePP
	Cbyw==
X-Gm-Message-State: APjAAAX4m6C+vqUbpgPe5nOc8jkl428yllaasEllDnlbm7c1EM4D9Zk7
	4STl0jF9BLQuArkGtqCpVucu568Aig4PV6lLZZYcEO5m
X-Google-Smtp-Source: APXvYqyB6jAR9mkUNO7z2ePIYusZalC8OyF6AcRviy9r2FvgxdZVr4xbcINamHwyrb7w+6kiNzQEzWbvNiIs10PvsSs=
X-Received: by 2002:a05:6e02:10d1:: with SMTP id
	s17mr11741071ilj.198.1579536075623; 
	Mon, 20 Jan 2020 08:01:15 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
In-Reply-To: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 20 Jan 2020 08:01:04 -0800
Message-ID: <CANx9H-C0cVwTCjiix4mSxZFfJc9iZS0ec4L4kQqXkaGFGn_+VA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] python2-less meta-openembedded build results
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
X-List-Received-Date: Mon, 20 Jan 2020 16:01:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 20, 2020 at 7:52 AM Khem Raj <raj.khem@gmail.com> wrote:

> Hi all
>
> Recently py2 is removed from oe-core, So I did quick patches to get a
> world build going.


Thank you for doing this.

And
> here are initial failures, please help out with recipes your can or
> care for. Eventually, the remaining
> ones we can blacklist for 3.1 release.


meta-python2 was specifically created to be the home for py2 legacy
components. Everyone, please help with that migration. But PLEASE make sure
whatever lands in meta-python2 RUNS, not just builds. We have a window to
make sure meta-python2 is in good shape, but it will take the efforts of
many in the community to make sure that happens.


>
> http://errors.yoctoproject.org/Errors/Build/97185/
>
> I will post more arches as they become available. If you want to try
> the same for machines/distros you can try yoe/mut for meta-oe
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=yoe/mut
>
> Thank you
> -Khem
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

