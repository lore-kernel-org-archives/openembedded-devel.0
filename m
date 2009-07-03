Received: from [74.125.92.146] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jhautbois@gmail.com>) id 1MMi6G-0007Od-Qy
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 14:42:44 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1125594qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jul 2009 05:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pT6fxIdInmO1lKjfxZJmqKhj7KUorJBKhNWbxlnEbRM=;
	b=jkbhmjDrBUxWO2ZvqQv2HKbT7252NyGj3p5eBhHoaKfqHRMJ3jvXWOAKvG/A2Yc4Ao
	XmiUrhLcrtWqkmKvNmZ+2yX7Stl0IWrtVBkpSweCTSprlXjxZLi2L+UIcOj/oW2gmqql
	TFEuozzIsqZPKFXAdlc7fs4vSuQW5Gu2Nbvcw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YBIfb+vgDImt5t4II30/z4k61CksFNfjREFnRteo2Zml8uxxt7Unz42XHwzZa83xdR
	tzbfVjqkT+jJzFFlNO+HuBUjK7bvZ6T9Ek4Ar7Y+dUdxj8CSVittfv3bHJpyeMHcTCOq
	Ir4H6lAr2ig7uqhwX9G72HWfrw4Uw+HPUu+Z4=
MIME-Version: 1.0
Received: by 10.224.6.73 with SMTP id 9mr1845398qay.190.1246624237493; Fri, 03 
	Jul 2009 05:30:37 -0700 (PDT)
In-Reply-To: <1246623479.2136.15.camel@mill.internal.reciva.com>
References: <8cad0aa0907030319m60d8da2awa7a5f1685db0ee9a@mail.gmail.com>
	<1246617033.26610.65.camel@mill.internal.reciva.com>
	<8cad0aa0907030502o2d6c494cq76adf8ea124161b9@mail.gmail.com>
	<1246623479.2136.15.camel@mill.internal.reciva.com>
Date: Fri, 3 Jul 2009 14:30:37 +0200
Message-ID: <8cad0aa0907030530j5223d171la360f1c5a28b213e@mail.gmail.com>
From: Jean-Michel Hautbois <jhautbois@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [GLibc]Version 2.8 and timerfd_* syscalls
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
X-List-Received-Date: Fri, 03 Jul 2009 12:42:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/7/3 Phil Blundell <philb@gnu.org>:
> On Fri, 2009-07-03 at 14:02 +0200, Jean-Michel Hautbois wrote:
>> How can I know which recipes are are in the repository ?
>
> Something like this:
>
> pb@mill:~/oe/org.openembedded.dev$ ls recipes/glibc/glibc_*.bb
> recipes/glibc/glibc_2.2.5.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0recipes/glibc/gli=
bc_2.3.6.bb
> recipes/glibc/glibc_2.3.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0recipes/glibc/gli=
bc_2.4.bb
> recipes/glibc/glibc_2.3.2+cvs20040726.bb =A0recipes/glibc/glibc_2.5.bb
> recipes/glibc/glibc_2.3.3.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0recipes/glibc/gli=
bc_2.6.1.bb
> recipes/glibc/glibc_2.3.3+cvs20041128.bb =A0recipes/glibc/glibc_2.7.bb
> recipes/glibc/glibc_2.3.3+cvs20050221.bb =A0recipes/glibc/glibc_2.9.bb
> recipes/glibc/glibc_2.3.3+cvs20050420.bb =A0recipes/glibc/glibc_cvs.bb
> recipes/glibc/glibc_2.3.5+cvs20050627.bb

OK, thanks.
So, can you explain me why I don't have this one: recipes/glibc/glibc_2.9.b=
b ?
When I am launching a git pull, It says I am up-to-date...

Thx and Regards,
JM


