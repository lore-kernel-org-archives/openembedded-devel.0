Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1P3Dtx-0001FK-RF
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 22:14:18 +0200
Received: by qyk8 with SMTP id 8so5327750qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 13:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=zoU4paDsf/m9wVNxoUFwJpuBiuNllzMF22hQBaY8ryk=;
	b=B3h/ZoPuNRM44upx2Hi5xDzEZ1CCQHrW+GDa71c774gCumh9JlozJPynqIiem0HTkf
	kUnzRDxwXBkS1Ck/BwOfgn+MoBL+0kPoTgr6+gW763BFVOERcMOaWfEU9Lee2yx2K3bo
	VleIWERmXTb1E5DzTqwL40F/mfrELcb+76GWY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=jbUGGN+5QL+qvWyAwisvq0dqD6GVo6ky7RxKmHrOhpZrs+apVZnHWAcKpMeupH1q0u
	FzFCMmcP+Mb5fnGLt900Qw/dLdnfB/YhrHHWqVWOx4YUCtR+P0DNbUjVLVEekgLn6o2+
	jqx2beaql20mS9yccClQbJwTaJD5Rf1W9l1B4=
MIME-Version: 1.0
Received: by 10.224.201.8 with SMTP id ey8mr4562635qab.266.1286309625540; Tue,
	05 Oct 2010 13:13:45 -0700 (PDT)
Received: by 10.229.32.83 with HTTP; Tue, 5 Oct 2010 13:13:45 -0700 (PDT)
In-Reply-To: <4CAB48A1.6050807@freyther.de>
References: <4CAB2FBD.6060401@freyther.de>
	<AANLkTikFS-A1T_tiu5_4ajBk=BKJU3Q=O4wqP2XcTxwf@mail.gmail.com>
	<4CAB48A1.6050807@freyther.de>
Date: Wed, 6 Oct 2010 00:13:45 +0400
Message-ID: <AANLkTinnQ75Ytjz+dhQxfsqFVsGNw4CJbTViNEZz=eAP@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Holger Freyther <holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: dbaryshkov@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Latest qt4-sdk-tools* patch is wrong
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
X-List-Received-Date: Tue, 05 Oct 2010 20:14:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 5, 2010 at 7:47 PM, Holger Freyther <holger+oe@freyther.de> wrote:
> On 10/05/2010 11:39 PM, Dmitry Eremin-Solenikov wrote:
>
>>
>> Commited fixes for this.
>
> thanks. Could you please describe the error you were seeing for your LFLAGS patch?
>

Prehistory: I'm building OE on the Debian lenny box with nearly no
development packages
installed (no X11 headers, etc.). qt4 configure script was trying to
build xlib test.
Compilation went OK (as there are X11 headers in the chroot). However
during linkage,
came a problem: xlib.o required libX11 which in turn required
libxcb.so (with some symbols
that were not available in the version in /usr/lib on my lenny) and
libpthread-stubs.so.
As configuration test did not pass rpath-link to gcc, linker failed to
resolve libxcb.so from
OE sysroot and thus failed link stage with undefined symbols.

I ain't sure that this description is very clear, but I hope this
helps. At least I know for sure
how to reproduce the problem.


-- 
With best wishes
Dmitry


