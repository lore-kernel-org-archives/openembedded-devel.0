Received: from [209.85.217.227] (helo=mail-gx0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Mtiva-000102-H3
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 16:16:13 +0200
Received: by gxk27 with SMTP id 27so1059611gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2009 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=JwlmVyVrmIqIHYRp5s8aX1zCA+bQ+c8KPzqBlSuy+r0=;
	b=UBoCkhH3yTYK5A3YXLfANRnunAupAmucVqI8d/JnhzRTonR5w8sJX8Hl73cjTDqFgp
	nIW/7kQ35s49bD3aD5uabOvpzD/ogtiTgbqYMtpB1inlL8S5acMjvGCzFDD/Q7Iws4yQ
	kFa7LievDLqMgHL+G5nMOhtD9YIciZfalXafs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=grkIQgQSJkhrfiSEkCqzZsyM1m2fG6qHDLmup4KNPzu+7GURbTgi3HLyuq+795I+QW
	IawuSK7tWeFEjhZoxdtns+wonomTr3+SQfh25sqquwuUxWwGIUBVw9ryiQKVGWbgFWwC
	zS7zN9fvzh/6WV9cZ06fv7QhtWWdTCJJFEjpw=
MIME-Version: 1.0
Received: by 10.150.129.23 with SMTP id b23mr4473745ybd.175.1254492924504; 
	Fri, 02 Oct 2009 07:15:24 -0700 (PDT)
In-Reply-To: <91283b620910011337m7c24ace5v8f263e4dcabe06a@mail.gmail.com>
References: <91283b620910011337m7c24ace5v8f263e4dcabe06a@mail.gmail.com>
Date: Fri, 2 Oct 2009 10:15:23 -0400
Message-ID: <f96d234e0910020715ne75ab7dwf3add069038e0608@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
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
X-List-Received-Date: Fri, 02 Oct 2009 14:16:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 1, 2009 at 4:37 PM, Stuart Gray <stuart68@gmail.com> wrote:
> Hi,
>
> Is there anything in the kernel set up apart from including the smsc911
> module by default that would affect the way that the port is set up when it
> is a DHCP Client i.e. it receives its IP Address from a router.
>
> I am getting the broadcast address set to 0.0.0.0.
>
> If this is not kernel related then are there any flags that require to be
> set that control hos the smsc91C11 part functions?

I don't know for sure I understand your question, but perhaps you need
to set up /etc/network/interfaces to configure the ethernet port?

Cliff


