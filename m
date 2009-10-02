Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1Mtly1-0003WI-Bu
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 19:30:56 +0200
Received: by fxm3 with SMTP id 3so1349566fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2009 10:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=nFkujeIlV19KBhTv+Rhxn4x72sXmBMUv7eyCMQHdMsM=;
	b=WCJZnb3maQYZvZG3ghcCqjuvbSKdwqONYzzz927l1ZG98MtqP1xsYbO4/1ZF/g3zjs
	Vm3WKPNSKHkGFQwR1ecQgeeCvG4Zd6Od/w5HuDW+AFVklV9YrKtHnfFuwps+7jPMfFAd
	1IsuGSxwMbhClRU4Ick+1X4djpz6qJ7tAzOm0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DyQob1EyVDq3fSi0HlHHRmh3z4eXO6oOSXUJp1g5By8QFXXDNYlMVnMTr6i130ZTNf
	IME2tkpdcj8Ha4X1FutviVAAxSkVKqfqypeypTCpicvu6nzaEb2gkOF/b03OJdmqId4S
	xkwQ0wMKdYq4u9WrwX0FURR8fcaT2jdLhXRss=
MIME-Version: 1.0
Received: by 10.204.151.210 with SMTP id d18mr1381395bkw.203.1254504607526; 
	Fri, 02 Oct 2009 10:30:07 -0700 (PDT)
In-Reply-To: <f96d234e0910020715ne75ab7dwf3add069038e0608@mail.gmail.com>
References: <91283b620910011337m7c24ace5v8f263e4dcabe06a@mail.gmail.com>
	<f96d234e0910020715ne75ab7dwf3add069038e0608@mail.gmail.com>
Date: Fri, 2 Oct 2009 18:30:07 +0100
Message-ID: <91283b620910021030r5bb8368fo1167d2d5ba592c3d@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: stuart68@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Kernel Configuration - what affect the way ethernet port functions
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
X-List-Received-Date: Fri, 02 Oct 2009 17:30:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Cliff,

I have done this using the standard set up, but when I get my IP, netmask,
network, gateway and broadcast addresses.

So my interfaces file simply sets eth0 to be set up to use DHCP.

When I check how it is configured using ifconfig eth0 I get

IP 192.168.0.11
NetMask 255.255.255.0
Gateway 192.168.0.1
Broadcast 0.0.0.0

I am expecting broadcast to be 192.168.0.255. If I set broadcast using
ifconfig eth0 broadcast 192.168.0.255 it gets set correctly, but mt ethernet
access does not work.

Only when I configure the eth0 interface using static and set all network
configuration manually within the interfaces file does it work, btu I should
not and do not want to do this for my application I need it to use DHCP.

My thinking after trying various settings was that there may be some
hardware configuration of the LAN91C11 device that I am not aware of. I have
no datasheet for this part.

If there is another area that can set the broadcast to 0.0.0.0 please let me
know or if you know of some other setting that I can try.

Thanks,
Stuart


2009/10/2 Cliff Brake <cliff.brake@gmail.com>

> On Thu, Oct 1, 2009 at 4:37 PM, Stuart Gray <stuart68@gmail.com> wrote:
> > Hi,
> >
> > Is there anything in the kernel set up apart from including the smsc911
> > module by default that would affect the way that the port is set up when
> it
> > is a DHCP Client i.e. it receives its IP Address from a router.
> >
> > I am getting the broadcast address set to 0.0.0.0.
> >
> > If this is not kernel related then are there any flags that require to be
> > set that control hos the smsc91C11 part functions?
>
> I don't know for sure I understand your question, but perhaps you need
> to set up /etc/network/interfaces to configure the ethernet port?
>
> Cliff
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

