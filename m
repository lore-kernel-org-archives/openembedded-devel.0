Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M8goC-00020f-4R
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 22:30:08 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1805238yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 13:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=jOZ+a1Px2UF++lp5v+kIQHa0FDYH4V99HB5yaVkzL5w=;
	b=Z+HcMPeeLKIuSc71IIhj4ldUB9yMscc58AOAJ2KPb76p/D5j63r78Vk9zsxFtPzMHC
	0xyXtNqGzv+s0RsJSH3KsIasux9sENvfqZ4t9lSJ44hNGIXL7xRKp+HRpTE0oSqe+T3l
	7P9EFAR1STf8I7YYe2xqSO8O4IpLL7MZFXkGU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=MgDQmcgbehBkl2zmKry3rVioFVSmMdKBv90g3YVdetBtmBXpVrYRXUtWeE3LlHVDPi
	npsK9tG3Ew7iwnMHcy9Q0DzkS6KQYDb7LpDUpkJFPpQUS7SiohVZIMsssZZmgfYskTO3
	4ghxQbln4ybXE4HHVOi80hqw2N+aYTATrHaRc=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.126.19 with SMTP id y19mr13338217anc.46.1243282925977; 
	Mon, 25 May 2009 13:22:05 -0700 (PDT)
In-Reply-To: <1243281147.4869.64.camel@lenovo.internal.reciva.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<fce2a370905250254p4c51b706q399b14d9b0bb20e5@mail.gmail.com>
	<1243247426.4869.23.camel@lenovo.internal.reciva.com>
	<fce2a370905250355h5edd949cq40bcb52882e1e623@mail.gmail.com>
	<be7a9f3d0905250931wbedccdfg9f8b0a0f562b6aab@mail.gmail.com>
	<1243270407.4869.57.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905250959i19d01ebbr1b3b065f2135e294@mail.gmail.com>
	<1243272731.4869.59.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905251157t7178a81ah22ff6ab699e2c5f2@mail.gmail.com>
	<1243281147.4869.64.camel@lenovo.internal.reciva.com>
Date: Mon, 25 May 2009 17:22:05 -0300
X-Google-Sender-Auth: d53273ec0b2a7e7f
Message-ID: <be7a9f3d0905251322h27b36f0eyc780895bb05b50d7@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 May 2009 20:30:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, May 25, 2009 at 4:52 PM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2009-05-25 at 15:57 -0300, Otavio Salvador wrote:
>> Hello,
>>
>> On Mon, May 25, 2009 at 2:32 PM, Phil Blundell <philb@gnu.org> wrote:
>> > On Mon, 2009-05-25 at 13:59 -0300, Otavio Salvador wrote:
>> >> Hello,
>> >>
>> >> On Mon, May 25, 2009 at 1:53 PM, Phil Blundell <philb@gnu.org> wrote:
>> >> > On Mon, 2009-05-25 at 13:31 -0300, Otavio Salvador wrote:
>> >> [...]
>> >> >> I belive that the right way to fix it is add a binary package only=
 for
>> >> >> udevadm
>> >> >
>> >> > That's pretty much what udev-utils is: it doesn't contain any binar=
ies
>> >> > apart from udevadm.
>> >>
>> >> In this case the binary package is wrong.
>> >
>> > Why so?
>>
>> I think udev-udevadm is more sound for me.
>
> Ah, you mean the package name? =A0Yes, udev-udevadm would probably be
> better if we were doing this again from scratch, but renaming an
> existing package is a fairly disruptive thing to do and I don't think
> the existing one is wrong enough to make it worthwhile.

Well, I think it makes sense. What does not make sense to me is to
install udevtest and udevinfo in a system that doesn't use them.

FILES_udev-utils =3D "${usrbindir}/udevinfo ${sbindir}/udevadm
${usrbindir}/udevtest"

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


