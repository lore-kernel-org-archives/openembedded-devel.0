Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M8ded-0006MY-1Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 19:08:03 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1761455ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 10:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=gIBCKZza2mYDpNeH+Ww5mHhfQAAEcj5WC430lkoIEmw=;
	b=PUtlD1EH4NCY7NVqOsFyO5BRf3HwgoMmpXJ9h3/n3Zxy8TbY71zOKfLKzp7RmatXZw
	+/g3fmSvWbTfHcl5yXnfa/RQS0aHIXFyNUvSCEehrg4TLe9Spn17FwyOc8AOAjXaJpdY
	nxI9ES1fE9D0+AbSvWv3K2ZleJkcwSYAR04HA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=w0CtiiN+vXASAhT+Rw0rTiOlP9l/nB4LF2EMaJK0RfV5hkrTWhE+glaqOMJC0zETx1
	+5SXMvRLcJyiX3ePbviO7Vd5E36F/vYDgYuAkPeSfviB5FzckXcfpzuhvyrAyCb08a6F
	toMiq6IwDqbSUG9f3IBQPoMpZbfciZE+PLAYo=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.207.17 with SMTP id e17mr12289906ang.137.1243270797924; 
	Mon, 25 May 2009 09:59:57 -0700 (PDT)
In-Reply-To: <1243270407.4869.57.camel@lenovo.internal.reciva.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243189985-19060-2-git-send-email-ihar.hrachyshka@gmail.com>
	<200905251125.45665.marcin@juszkiewicz.com.pl>
	<fce2a370905250254p4c51b706q399b14d9b0bb20e5@mail.gmail.com>
	<1243247426.4869.23.camel@lenovo.internal.reciva.com>
	<fce2a370905250355h5edd949cq40bcb52882e1e623@mail.gmail.com>
	<be7a9f3d0905250931wbedccdfg9f8b0a0f562b6aab@mail.gmail.com>
	<1243270407.4869.57.camel@lenovo.internal.reciva.com>
Date: Mon, 25 May 2009 13:59:57 -0300
X-Google-Sender-Auth: 7e196049007d6c48
Message-ID: <be7a9f3d0905250959i19d01ebbr1b3b065f2135e294@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] udev: moved udevadm to the main udev package
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
X-List-Received-Date: Mon, 25 May 2009 17:08:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Mon, May 25, 2009 at 1:53 PM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2009-05-25 at 13:31 -0300, Otavio Salvador wrote:
[...]
>> I belive that the right way to fix it is add a binary package only for
>> udevadm
>
> That's pretty much what udev-utils is: it doesn't contain any binaries
> apart from udevadm.

In this case the binary package is wrong.

>> and make udev depends on it and mdev suggests it.
>
> Mdev itself doesn't have any use for udevadm, so having mdev Recommend
> udev-utils wouldn't be the right thing; this would just be a waste of
> space for people who are using mdev without HAL (which, I suspect, is
> actually the majority of mdev users).

Agreed. But AFAIK suggested packages do not get installed by bitbake by default.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


