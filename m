Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RtTPO-0006KE-RR
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 01:23:15 +0100
Received: by pbbb4 with SMTP id b4so2968142pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2012 16:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=sv7xyDeoh7EhKUwFadrecnPQY8otMfkEqy8UbwNg9Oo=;
	b=OoqXiw1q0g5PpV6rPg0IjYIEoCimhuV3lJVhWr4s662pk8rOLSluHqpuimtYi2etjt
	dWOirt+79UaKE4FhTXET99QdUrvVSPfmWIXumtTYkaeD3L6rRaEj92SbETaoERY1pDCg
	YbVJfE8Pmz/J+GCsYriA14HxyEdRMJ7hvmYUo=
MIME-Version: 1.0
Received: by 10.68.218.228 with SMTP id pj4mr20902121pbc.114.1328314516065;
	Fri, 03 Feb 2012 16:15:16 -0800 (PST)
Received: by 10.143.147.17 with HTTP; Fri, 3 Feb 2012 16:15:15 -0800 (PST)
In-Reply-To: <CAP9ODKoaqi96Bzktk=TC0dXmz6YV1v-1vAAgaqc+qE02Rpd81Q@mail.gmail.com>
References: <20120201080441.DA76610333@opal>
	<20120203131451.GJ3893@jama.jama.net>
	<CAP9ODKqdXtrAqUY=1XHE4QDpRPyNbOV5ZswKihCWbSWU9+L05w@mail.gmail.com>
	<20120203154742.GM3893@jama.jama.net>
	<CAP9ODKoaqi96Bzktk=TC0dXmz6YV1v-1vAAgaqc+qE02Rpd81Q@mail.gmail.com>
Date: Sat, 4 Feb 2012 01:15:15 +0100
Message-ID: <CAAQYJAvfYLRcYw7fKVogjkwuST-b4oYMCH4_VZG6P8Xy5QgjgQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Otavio Salvador : systemd.bbclass: depends on systemd
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
X-List-Received-Date: Sat, 04 Feb 2012 00:23:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 3, 2012 at 5:58 PM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
> On Fri, Feb 3, 2012 at 13:47, Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
>> > I understand your use case but it seems in this case you ought to
>> override
>> > it in a bbappend. It doesn't seems right as this is the exception, not
>> the
>> > rule. If we don't depends on it, we can end with the binaries being no=
t
>> > available in case a rootfs generation.
>>
>> Which recipes really depend on systemd during build? I know about
>> polkit, something else?
>
>
> At this moment I know about polkit, I didn't check newer udev but I think
> it ought to depends on it as well.
>
> --
> Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O=
.S. Systems
> E-mail: otavio@ossystems.com.br =A0http://www.ossystems.com.br
> Mobile: +55 53 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Unfortunately the patch has a bad side-effect:

http://paste.debian.net/154741/

(I removed /systemd to show the culprit)

Sadly enough freedesktop git is down, so I've been obliged to revert that p=
atch.

Andrea


