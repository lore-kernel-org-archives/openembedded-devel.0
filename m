Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NNs0b-0008Mc-93
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 19:02:00 +0100
Received: by iwn32 with SMTP id 32so5445891iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 10:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qikKW942NSiLBzi86H+1i4w4qFkDKXoRxYPaeBQTDsU=;
	b=WOppxy3lUGaIiTIDrzHec7njjQrnrvrAwMDI4ExUY73sYvzHzZRv/o5yvPgFl9TxRP
	k6A+/1jW9oV9q2Kq6hz3/2cue8kGyN3i20Ka38VTqi+489PvMbBtLuiG9VzjsV7P3SE1
	f8zaMuWNej5fDRPCKhzVyAsX2Yg3BuivPvzSc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wNBJG2qts2VaWbw86vlQZReT51ySlXWfKwEEuAo6uXQhRDtUECJQ/VD3e55/WAcvRC
	J3pHIGF3Yrb+ltSAdsGPdjGXAqptxwWix8icp97rX/aTtdMDt4R5m/twshurHPc80nSy
	4sTC5vZ0Nnh7HgF4l0OzswAN5UPqxNfVHzfeQ=
MIME-Version: 1.0
Received: by 10.231.6.79 with SMTP id 15mr727791iby.36.1261677602931; Thu, 24 
	Dec 2009 10:00:02 -0800 (PST)
In-Reply-To: <ad82c8890912232356p7e47a2edk9ca0389467dae654@mail.gmail.com>
References: <ad82c8890912232356p7e47a2edk9ca0389467dae654@mail.gmail.com>
Date: Thu, 24 Dec 2009 10:00:02 -0800
Message-ID: <19c1b8a90912241000od60c483g5cbf30e96cb06445@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: how to convert em-x270.jffs2 to em-x270.img on compulab board
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
X-List-Received-Date: Thu, 24 Dec 2009 18:02:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2009 at 11:56 PM, vivek tambakad
<vivektambakad@gmail.com> wrote:
> Hi,
> =C2=A0 =C2=A0 I build x11-image for compulab board .I got =C2=A0em-x270.j=
ffs2 for compulab
> board(EM-X270).
> since updater application on compulab board will support em-x270.img

what kind of updater application is this.

> images.so how to convert
> em-x270.jffs2 to em-x270.img,so that i can port .img file to nand flash.

if you are already booted into linux then you can use mtd-utils to
write jffs2 into nand

>
> with regards
> vivek tambakad
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


