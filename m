Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pp1vQ-0001Em-4k
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 18:09:24 +0100
Received: by qwi2 with SMTP id 2so3109385qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 09:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=k+ZUmpnZcgt/4IpMF8TicPIThC3vNkUk/9Udt+V6kI0=;
	b=p3AYxWNRb+1BaoYZWW3yBMTUR6LHwCLtLdGgLSq9wyO+rVaHBSEmHiwcqOSOiytx0r
	IRqFxThY0QnzzDY4MeTBD4fsA112Iz0Zoh1669tzt1bKvSADrTzMBr4/ShZqkleJ4B/Q
	UFnzzpQCsyat+ZYXW30JT9PcO/p9+VacBJb0Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fLP8x1yJeVEWlZHbOKvDtb5ihPnfWGIvX3wEmaB5XeceZgxgYV3hnZdxFCL+lsxIHM
	C9MDwyGXML1V9KHuTBI7pwjSxN9JYJqLC12Xk39T3uu8k9zwjuEfJeh134Iy2AyxBzyJ
	AZ0AWbPVHREEexjgml/IDxqy4c7xeML96e9SI=
MIME-Version: 1.0
Received: by 10.229.6.207 with SMTP id a15mr2999072qca.298.1297703293974; Mon,
	14 Feb 2011 09:08:13 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Mon, 14 Feb 2011 09:08:13 -0800 (PST)
In-Reply-To: <AANLkTi=XjCgstGxtHd2jTmp5Kmm8wyQzOjJrxnnAhJU9@mail.gmail.com>
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
	<AANLkTi=XjCgstGxtHd2jTmp5Kmm8wyQzOjJrxnnAhJU9@mail.gmail.com>
Date: Mon, 14 Feb 2011 18:08:13 +0100
Message-ID: <AANLkTikjvqTZcOiYHRsXdE9otGaJTavGKZ8iWtuN7GVu@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Mon, 14 Feb 2011 17:09:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/14/11, Otavio Salvador <otavio@ossystems.com.br> wrote:

> I agree that this ought to be split but I think that it should be done
> by vendor:
> realtek, ralink and so on.

What would be the point of such split?

I have split it by buses, because currently having full support for
PCMCIA devices on my Jornada 720, I have to install 13MB of PCI
firmwares and 8.5MB of USB firmwares, which I will never use (because
I have neither PCI nor USB bus on it) just to have available the 200kB
of PCMCIA firmwares.

Most of the firmwares in the repository are for removable devices - we
(as the OE/distrubution maintainers) are by definition not able to
know whose products will the user plug in.

bye,
Filip Zyzniewski


