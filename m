Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Np4Yg-0005bB-Iz
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 19:53:38 +0100
Received: by iwn4 with SMTP id 4so6752533iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Mar 2010 10:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qGbOa6EtqvHYHxvzfyBjFi3E1FdAhpGw8CoYogOVMpQ=;
	b=hHcz4C05aWSUfwditdsIWlSYU5dwTW4yplegcvg9BSXNjAHa9KNrYeeeD6nmUFTOpT
	jOC0lgmuvDDg9/lmaFCcshjCYTvfOp0Fx/YLphMPZ3364+U2c6IoFMgy12kJQt+Az/+p
	cDRMqphXcV1Ma2W7wJqNEr3SYoiDdm8x5IELw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XJtZ4LHhevp9mIRZSmAKpQd/y0UzRnrndV8c8r5QGmcOOX+PoK2+ddlypSFvu5lhBn
	UJXrGnFDzBXudn75uQEBQBcY4yyexK4jaVuL2Qj1Qk86X//V6dQR93jSLZWwc/qUwH7j
	eshE5fbW4yvqOvmJzXc62+TXbXwLAP4kAZT1s=
MIME-Version: 1.0
Received: by 10.231.158.205 with SMTP id g13mr92382ibx.30.1268160635886; Tue, 
	09 Mar 2010 10:50:35 -0800 (PST)
In-Reply-To: <201003091648.15596.khimov@altell.ru>
References: <201003082201.30147.roman@khimov.ru>
	<201003091648.15596.khimov@altell.ru>
Date: Tue, 9 Mar 2010 10:50:35 -0800
Message-ID: <19c1b8a91003091050g2558abb9he0a5633205ba2dc8@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] qemu 0.12.3, cleanup
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
X-List-Received-Date: Tue, 09 Mar 2010 18:53:38 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 9, 2010 at 5:48 AM, Roman Khimov <khimov@altell.ru> wrote:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB =
08 =CD=C1=D2=D4=C1 2010 22:01:20 =C1=D7=D4=CF=D2 Roman I Khimov
> =CE=C1=D0=C9=D3=C1=CC:
>> Comments are welcome.
>
> More ACK's are welcome also, since this touches sanity and qemu.

sanity: remove /proc/sys/vm/mmap_min_addr check
will older kernels like 2.6.21 etc. work well with newer qemu and wont
require this check?

Acked-by: Khem Raj <raj.khem@gmail.com>


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


