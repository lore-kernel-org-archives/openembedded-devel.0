Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1QNLR9-00059h-I6
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 10:51:59 +0200
Received: by qwh5 with SMTP id 5so1885678qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 01:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=PMkRP3CT5/Qul3ZkbsmAySq4ZeXuyD1NpEIImRFMh18=;
	b=J/5Z/qi+1S5kELowRixxFuS03j6pRjZo5Ov97L2zhKvuSHrhnrOkOaLJbFhd5oY7Lr
	kDKUP0iUrg8585ZoPfe2zB8HKHd7vlkBBxSiWRDveUvVXFasEC9OxpZM5b0XwlCo5h12
	eFZ9qgBTPbDmID/mQ9B/9GQQPwo5pQERyv1d0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=vbrgtGV/HexoN2yc1EmfSlVl3V2GdZrMEOyySsvDBJ2IQbHL4EYPJsLDCnsy9btyIF
	xncjXqfPhndjA5FDTE0wHVMNZq1fAjWbx+DJseUFZaLWpCr8Jt6eEkJ1nzoZESUeEq1M
	upePYDnVg+jVwV+Oeah0ipFfpiieV/QMMun/I=
Received: by 10.229.67.142 with SMTP id r14mr3095767qci.209.1305881339134;
	Fri, 20 May 2011 01:48:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.192.13 with HTTP; Fri, 20 May 2011 01:48:39 -0700 (PDT)
In-Reply-To: <BANLkTi=sn5n-gdOOFgt6k=PswZHhCe0Mww@mail.gmail.com>
References: <BANLkTi=sn5n-gdOOFgt6k=PswZHhCe0Mww@mail.gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Fri, 20 May 2011 10:48:39 +0200
Message-ID: <BANLkTi=VUCzOWjZ8bnRHqrnLqsRZypRdxQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: vlc failed to build here ( palmpre2, SHR ) -fPIC thing
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
X-List-Received-Date: Fri, 20 May 2011 08:51:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Please does someone has a clue  about this   -fpic flag ?


2011/5/17 Sylvain Par=E9 <sylvain.pare@gmail.com>

> Hello,
>
> I have refreesh my build here so I tried again to build VLC for my palm
> pre2 but It does not succeed here :
>
> libliveMedia.a: relocation R_ARM_MOVW_ABS_NC against `a local symbol' can
> not be used when making a shared object; recompile with -fPIC
> |
> /home/sylvain/dev/SHR-Build/shr-unstable/tmp/sysroots/armv7a-oe-linux-gnu=
eabi/usr/lib/libliveMedia.a:
> could not read symbols: Bad value
> | collect2: ld returned 1 exit status
>
> long version http://pastebin.com/Cvd6pnuj
>
> I have tried several ways to pass -fPIC argument to live555 recipe but
> without any success..
>
> Does some one has a clue ?
>
> Thanks by advance.
>
> Regards,
>
> Sylvain
>
>
>

