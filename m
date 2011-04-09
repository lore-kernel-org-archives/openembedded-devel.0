Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q8ci3-00018p-PH
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 20:16:40 +0200
Received: by wwb17 with SMTP id 17so4616734wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Apr 2011 11:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=lyRwJmEkJR8zY/zmuoNpDv7lHiUL9YnKqf/uMAeOBLk=;
	b=jkC0VlxoPeUr3HZFzwmQ2cTAEm4VDtLZgT92SZRpve1Ea+Ta8CXWsqNp0iG7fhuwBh
	KbMVWLzIfyJXAxyEnSGYu2JebTzvqhFVt8JKN7lbP6UIPa23hZCYtI2F1eexrYgQoNTM
	6Mk5zipQFhwanrGrXUq/HsTfEZPf0NGmvJuoQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=SZXSpj+M+AffcDBLqQbAqPc5I+9WII024/R9ZEp8iAIBLRxSATDmU74nHJbvcJJ47l
	Fbrbw7/ESJ5OCfhv8Cmk0XjrScxFWx+AGA6HMZaKB8OQUdsSzG3NUSgK3lzRr9YOzm2r
	viQhkPtbYMhzN1J387juoJpoLbEi2Ov3/fQmY=
MIME-Version: 1.0
Received: by 10.216.167.65 with SMTP id h43mr1031338wel.17.1302372862045; Sat,
	09 Apr 2011 11:14:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.46.207 with HTTP; Sat, 9 Apr 2011 11:14:21 -0700 (PDT)
In-Reply-To: <4DA0A13A.1090406@mentor.com>
References: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
	<1301660208-31105-3-git-send-email-otavio@ossystems.com.br>
	<in4lhs$326$1@dough.gmane.org>
	<AANLkTimRF7Q3=XeF1EOHgPNAGfJwnp5PmjHGyjUhTyef@mail.gmail.com>
	<CC5D751E-FF84-40C2-B184-4C813C49F5E4@dominion.thruhere.net>
	<AANLkTimS+CcrB7cHUF+ao=XwD0aXeFqt4r1N4erHoKFs@mail.gmail.com>
	<1302330816.15056.15.camel@leto>
	<1302340789.3131.7.camel@lenovo.internal.reciva.com>
	<BANLkTinKJf85aenJia6nrVBaOdANdM44oA@mail.gmail.com>
	<4DA0A13A.1090406@mentor.com>
Date: Sat, 9 Apr 2011 15:14:21 -0300
X-Google-Sender-Auth: xaBFHmzlQFW4CLpmxHXDL1PNCf8
Message-ID: <BANLkTimKawBSB=aAAdYL5dKUxPJM=-XTGQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/6] xorg-xserver-common.inc: drop .la files from packages
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
X-List-Received-Date: Sat, 09 Apr 2011 18:16:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 9, 2011 at 15:11, Tom Rini <tom_rini@mentor.com> wrote:
> On 04/09/2011 10:36 AM, Otavio Salvador wrote:
>> On Sat, Apr 9, 2011 at 06:19, Phil Blundell <philb@gnu.org> wrote:
>>> What would be the use case for having them there? =A0Nothing ever links
>>> against them. =A0I think Otavio is right, they're better off deleted.
>>
>> AFAIK .la files are used for in project linking not when linking with
>> system or sdk libraries. So I'd prefer to remove them.
>
> .la files have a defined purpose in a development area. =A0Until / unless
> we move to globally killing .la files (see Richard talking about this on
> the poky list a few weeks ago), we should ship these in the -dev
> package. =A0If they're broken that probably means something isn't
> inherit'ing the right class that should be fixing them.

Mind to point me some reference about this topic?

For me it doesn't matter et all but I want do not ship those into
regular packages et all.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


