Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OaDYG-0002X0-6Z
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 22:00:03 +0200
Received: by gwj22 with SMTP id 22so1710172gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jul 2010 12:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1+ETyVMRICQuGjhydDP+FsP0EwUITFyYQzivoLoYofA=;
	b=a01CKhYDJ5I2KGkBoZEicAa1BkDCWnrYFoY2NJKYWfgqyvk7mIpbrNgeycQ/E4x80O
	QNCvpU37oXce3abPr6pJRY8hUwxJsYCk42UhHKrhH0RNvd5vW4GQWyT1DRwdSL6BCeqf
	x70+8HwkPgemsnq5B4QgX+pPyFOK9shjrNsXg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=eXH6gfkCvpdLxl6+i+KPTO7aL4SxiUs9A6cqrPdYu9cqT22pS9YE/F0iu3lyUBWkCW
	gbcjYdUByZP3GwPNmT6byiPPR60Je8NXkKgRkSyHl3mxq2W/8WatkLlzjiYhSgL5HWaH
	wwPJXMBmMyCG9o3o8OjmMcPyS8J3wtNJ0vvpk=
MIME-Version: 1.0
Received: by 10.100.112.20 with SMTP id k20mr2874625anc.234.1279396792631; 
	Sat, 17 Jul 2010 12:59:52 -0700 (PDT)
Received: by 10.100.127.11 with HTTP; Sat, 17 Jul 2010 12:59:52 -0700 (PDT)
In-Reply-To: <4C417DA8.8050101@freyther.de>
References: <AANLkTimwFjLODTbT6WEEhthhjwYMiMQ4nt5RtXniNgZb@mail.gmail.com>
	<4C417DA8.8050101@freyther.de>
Date: Sat, 17 Jul 2010 12:59:52 -0700
Message-ID: <AANLkTimLRtZd_b0eDcCng2gQvZzWCSvqSHRAX9WX1Ar7@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: spca5xx does not build
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
X-List-Received-Date: Sat, 17 Jul 2010 20:00:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

i tried editing the make file its self where it says but when I
rebuilt it it just un tared it again and rewrote my change. Do I need
to figure out how to make it use that in the bb file itself? Sorry for
the basic questions just unsure

On Sat, Jul 17, 2010 at 2:53 AM, Holger Freyther <holger+oe@freyther.de> wr=
ote:
>
>> | make[1]: Entering directory
>> `/home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnueabi/kerne=
l'
>> | scripts/Makefile.build:49: *** CFLAGS was changed in
>> "/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/spca5xx-2=
0060501-r81/spca5xx-20060501/Makefile".
>> Fix it to use EXTRA_CFLAGS. =A0Stop.
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


