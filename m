Received: from mail-ob0-f170.google.com ([209.85.214.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U4EzM-000779-AN
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Feb 2013 19:17:24 +0100
Received: by mail-ob0-f170.google.com with SMTP id wc20so4949696obb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Feb 2013 10:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=A1+16/u5mWnIEQpWe0hJU2UD5/7/ra3iQOebemqcnnc=;
	b=zSVVB0lwwNiuAjdKZwXHrx7OPF2o6RwZ7TWfyD+JMov1sfDVUAIFZism7urLfUM80/
	6QemruPFntvf6m3JzcNWLGaHlULol8RYcLdw/ZC/2qCd8djTDu8mMJ6NOTJwk/WyQbyq
	folt6DW5dFZUIkaEtsPyKINKOg9wNYQGiJ8NHoZ8by1VRF9HPWD/VGyZGEjPy6su5gOE
	SgB/TuwaWbLPPIjBiHlMtoCBjbKslC7ww/nDjuVU8U6Y967LHFMiX2JUE3dYL+09F3ST
	4RP55pRhZHIbdD4sL8GoK9W2IOjyy2lBuc+yierNHmXzQYPXOkB7MZazUb0LUtO9kPii
	0t7A==
MIME-Version: 1.0
X-Received: by 10.60.169.135 with SMTP id ae7mr6854054oec.82.1360432888440;
	Sat, 09 Feb 2013 10:01:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Sat, 9 Feb 2013 10:01:28 -0800 (PST)
In-Reply-To: <20130209185808.4fe5cfe7@e6520eb>
References: <CAP9ODKpr-Hg6h5mANx0s-p=TUzfaKhwmrKQMRK1wRpDdEHCXeA@mail.gmail.com>
	<CAP9ODKoiG+bjZgXZvOkvYTiFqr0HEQWrevdn8PVkP3ZnzXC0zA@mail.gmail.com>
	<20130209185808.4fe5cfe7@e6520eb>
Date: Sat, 9 Feb 2013 16:01:28 -0200
X-Google-Sender-Auth: XzerBXLwAw9dm-jPAEn4VVI4M-c
Message-ID: <CAP9ODKoK3Z=YRfmhyS0trzOAOyU=u4mbWfp6QTxx3Wkq9HJOVw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [for-danny] Changes for cherry-pick
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
X-List-Received-Date: Sat, 09 Feb 2013 18:17:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 9, 2013 at 3:58 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi Otavio,
>
> Le Sat, 9 Feb 2013 15:40:09 -0200,
> Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
>> On Tue, Feb 5, 2013 at 12:29 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>> > Hello Eric,
>> >
>> > Please evaluate following changes for backport to danny (in order):
>> >
>> > * 430922f xf86-video-geode: Update to 2.11.14
>> >
>> > * 6956575 samba: split winbind into winbind and libwinbind
>> >
>> > * 47e9480 samba: remove empty /sbin
>> >
>> > * 1ec00cd samba: added gnu-configize for AArch64 support
>> >
>> > * 86c8f45 samba: Fix build on Fedora 17
>> >
>> > * a623fd9 samba: disable avahi and build without acl
>> >
>> > * 18e5661 samba: add new package libwbclient to avoid libsmbclient
>> > dragging in samba
>>
>> ping?
>>
> the request is still in build test on my buildserver for
> different targets and will be pushed shortly after if no build problem
> occurs.
>
> Please allow at least 1 week before sending a request and sending a
> ping, since the systemd problem in december I launch several builds
> before integrating the patches in order to avoid problems (or at least
> to reduce the risk of breaking the stable branches).

Ok; maybe you could send a notice when you picked them for testing? So
we know it is being processed.

Anyway, thanks by handling it.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


