Received: from [209.85.146.179] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dhbaird@gmail.com>) id 1KD63Z-0001aM-Jp
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jun 2008 01:11:41 +0200
Received: by wa-out-1112.google.com with SMTP id j37so971871waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jun 2008 16:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=cNB/J1pflHaOP0JrTEnUdmtDj3U057V710tJelYuUWY=;
	b=cF/T87/JIOh9Jsj6ykXm2P9EyxhHUPrrozqCnLqlJde5Bt6z5+in1+65mjXz14XYk4
	J3tYRr+pJSZaphlaYWi39TGFNnZKPqbUpdSFwrEGLFgcBMnU/QxvNwLJdGOkWgwqgwon
	ElTXdUqgCSw3LykIWW8fpOsbfghYjGp52on/4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=w5jG1UzdH9D25XreLRzajfw+lIFpQYx2jUz/me32AmRTSWbhEYMK0I29Lr8nJCCF2h
	lP+jSWPGip3XWSn0WLgeTKsLGUab/h0QNPFK/i/kkV+AEe0hfag0GW07pTbNUXDH//Sx
	Ob5n09f67KFFO9YFBKbwZ1C4/wulokb4mT1R0=
Received: by 10.114.124.1 with SMTP id w1mr3439784wac.73.1214780932641;
	Sun, 29 Jun 2008 16:08:52 -0700 (PDT)
Received: by 10.114.182.8 with HTTP; Sun, 29 Jun 2008 16:08:52 -0700 (PDT)
Message-ID: <440abda90806291608g2b4bdfbp71ed039b167e9aa9@mail.gmail.com>
Date: Sun, 29 Jun 2008 17:08:52 -0600
From: "David Baird" <dhbaird@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4861533F.7020906@balister.org>
MIME-Version: 1.0
References: <4861533F.7020906@balister.org>
Subject: Re: Building a rootfs, without building a kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 29 Jun 2008 23:11:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2008/6/24 Philip Balister <philip@balister.org>:
> I am trying to build a powerpc root file system for a xilinx ml403 board.
> Since we do not have a working kernel build for this machine, I tried
> commenting out the PREFERRED_PROVIDER for virtual/linux. The build then
> tries to build linux-rt. I tried ASSUME_PROVIDED for the kernel when the
> preferred provider is not commented out and it still tries to build the
> kernel.
>
> Looking at the dependency graphs seems to suggest the requirement comes from
> the do_rootfs task.
>
> Does anyone know how to build an image, without building a kernel for a
> machine?

I have been using this pattern in my BBMASK:

    BBMASK = "(linux-ml403-slab-2.6.x_git[.].*)"

and then I made up my own task and image .bb files to establish what
files I want in my rootfs.  I would also appreciate suggestions on a
better way to do what to do this.


