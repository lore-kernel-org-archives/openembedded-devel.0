Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVpYn-0006Jp-2f
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 19:06:41 +0100
Received: by gyh20 with SMTP id 20so2764503gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 10:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=Wywjvu23nDAgdTKbBvwIMhPYb0ebzSqJ7En6vFutBgY=;
	b=GvnQwwArIznzuuUaH+eEuA544isc6sM4EgXrMwoCnvlODzh79IiMAOx/Ht5j+/cJF9
	+xzCewJ6zGicvsZgvBHt/vydsNWnUA+JXxAmGCbHvJ/S9zfuLUZ8RCKiJYh9xZONBQpE
	HHD3Iiv/DIllxnC5IfBKfvbjI4BWAD7TDVHP8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=SQw3+SoIIOlKWDPp64+VqMpZnVSzYuHN5EmTV6UK2aHSJSShG8BIHd1S/d9n+K/YmI
	/4lwxOKL/ybLq+a18oQB3AJuUccSwYAIVIRBXJvVmo/Uix/cbfzLKfSnYjx0D9AhMk2Y
	B77QOlCUp1HeWB5XGNNj3+rcGhtTNov4RXPDY=
Received: by 10.90.97.19 with SMTP id u19mr10375774agb.166.1293127589321; Thu,
	23 Dec 2010 10:06:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 23 Dec 2010 10:06:09 -0800 (PST)
In-Reply-To: <4D13843E.3070304@freyther.de>
References: <4D13843E.3070304@freyther.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Dec 2010 10:06:09 -0800
Message-ID: <AANLkTik=rATXzz-ECuTrL6tTc+yiQnQGoOAMOK+MvFJt@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: curl-native and requiring ldap
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
X-List-Received-Date: Thu, 23 Dec 2010 18:06:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 23, 2010 at 9:17 AM, Holger Freyther <holger+oe@freyther.de> wrote:
> Hi all,
>
> I finally have a machine that is fast enough for OE again. I have a build
> failure in curl-native as it tries to link to -ldap and -lrt. I have seen the
> recipe changed a lot since the last time I looked at it. What is the best way
> to insert --disable-ldap for the native build?

you need to add 'ldap' to CURL_FEATURES accordingly add code in the
anonymous python code
to add it to extra_oeconf

>
> z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


