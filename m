Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N7YT3-0003Dt-HP
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Nov 2009 18:55:56 +0100
Received: by bwz9 with SMTP id 9so3471073bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2009 09:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=W3jmYoCzufzBgyi14hbFqFNuGxQHxRqctxWCQcQ4abA=;
	b=ejc6EJnvswZE8BBGNGZ70mt7L09229cZ3vhC4h5K8HsiNHvnrF24CHaV727ClRR39l
	b6i6N+LD0GLPvttcwsYC0dUd+wVr2ypSn+aWntiP+/HsscOPJyZWbbcblBJv1ImQl6bj
	xvmEtJBO4U/sxYUQmMsSjvdAViPUEAtg7hHjw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=EMnM0HTkxMZIjpwMfJmQe2wWAFB3VVh7u6/DDiUUMgYEa7pQw0QIKrLoegwZbTptVu
	0JF8SqEJQV9Ne8ttU4k9ZYd8xopcjHiMNt1DF8pXT+R2KhYFWHUEH4aE/ypIiL7oJg/9
	oxInuZwbuanLk41iHf+lBsH3u5tRiFuQLzqno=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.138.6 with SMTP id n6mr801483hbn.77.1257786047534; Mon, 09 
	Nov 2009 09:00:47 -0800 (PST)
In-Reply-To: <20091109155414.GA13145@zlo.nu>
References: <20091104125439.GA20450@zlo.nu>
	<be7a9f3d0911051703p33a3f0e1p223219ead98055eb@mail.gmail.com>
	<20091109155414.GA13145@zlo.nu>
Date: Mon, 9 Nov 2009 15:00:47 -0200
X-Google-Sender-Auth: a40d1a5ce5225af7
Message-ID: <be7a9f3d0911090900s1d2ca377u96751e5fd5670e66@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Add dhcp 3.1.2p1 and fix unneeded bash dependency in 3.0.*
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
X-List-Received-Date: Mon, 09 Nov 2009 17:55:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Marc,

On Mon, Nov 9, 2009 at 1:54 PM, Marc Olzheim <zlo@zlo.nu> wrote:
> Ok, thanks for the tip, here's the new patch.
>

Thanks by looking at it again; the only missing things to us to commit it are:

 - use a patch for .inc move
 - use a patch for the new version
 - export both using git format-patch and mail them

Doing the last allow us to give the credit to you and keep tracking
who did what in the project; this help a lot and allow us to ping
people in case of problems or radical changes that might affect your
usage.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


