Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TUKQl-0001iZ-Nl
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 17:49:15 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1568848dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2012 09:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=dAPX0G6dwpig/WX+9/eIukAKqFtUHA7o4AT1U1Zp9v8=;
	b=eQe+ciBZxpI+VgzUVLchDk5qa97OrBwEWYnkZT6yRkaNcI7P7gVCT5HIKIRS//ior4
	WTsZykWhLJbXZ4UPELdV6HewBFm2/f1IjG+vR7m5fH2kIU8LbXz6JxfD5RP6l/L2kAMs
	87pAzTKlT8/r4EE1BJRS1vPCgzkhUO84U2R1HDXHHEUQbw1xJhNHnIFcrbh1w9eOG8U9
	X9E7i2gvR12/XcJGdEC5bhPfXRcwPdRN0FZp9KkP/mTQQWybJfoVMIdmBnrYMgfdhxUN
	1wUUFRjqIrt0ofZSBIp6uRanmZb7/l7jbtL24WiwV6W6iPj1zX+2JZCjChPLjAMm9JPJ
	HskA==
MIME-Version: 1.0
Received: by 10.68.224.161 with SMTP id rd1mr7956440pbc.49.1351874135340; Fri,
	02 Nov 2012 09:35:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Fri, 2 Nov 2012 09:35:35 -0700 (PDT)
In-Reply-To: <k708fu$3tt$1@ger.gmane.org>
References: <CAP9ODKqaFOHjP0RR5xTPi4WP4dX+22uUQW1sdbGS3twD0Bpz=w@mail.gmail.com>
	<k708fu$3tt$1@ger.gmane.org>
Date: Fri, 2 Nov 2012 14:35:35 -0200
X-Google-Sender-Auth: HMMlzwl2ecm0Susy983UHsFXoT8
Message-ID: <CAP9ODKq=1KMnnKmuhnheLzxRD8x3yF=yjeLh3SVStHNbrz5bpA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Use of meta-systemd and have images using only udev
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
X-List-Received-Date: Fri, 02 Nov 2012 16:49:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 2, 2012 at 8:49 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 31-10-12 20:26, Otavio Salvador schreef:
> > Hello,
> >
> > I'd like to share the distro among some images; some will use systemd
> > and others only udev.
> >
> > I noticed systemd package builds a udev package but it seems not
> > supported to run standalone. Did someone try it?
>
> You only need to add an initscript, udev will run fine without systemd as
> init.
>

It sort of worked. I will prepare a patch to make it easy.

This is important for me to avoid different packages for images so I want
to keep on udev (from systemd) and using systemd when need.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

