Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 82ACA65CBC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 20:56:31 +0000 (UTC)
Received: by obnw1 with SMTP id w1so72718285obn.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 13:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=1g4l74FUV9JiUUn9YoYn1+XjW6KKVAnpBehQV6OHEUY=;
	b=tTPd/uMmUrlh2X1zWo+USRX15iYQdR6CF105XOuv+vGG+YHQaKk4TDL1gxbz0vczMA
	QJi12LpeUk+K1ioyQmGKHcTQQ+Jcj2enXKNXf3atYi11dxa8BxNf8ss07c2Oo19kGdGr
	FJ4VmNY7jTAu1c0E6Ws+KcD3Xox3RMQ9dtwH6OimrX2KFJBa+a5myyQ647LdmNbJoeIw
	l/VJkZdZ3vMHOPaHjKGtyka9ZH2LDHAihMcdcaI6hQetgaKKT4YIDgn4xdu0dGMi/hSz
	268tPc+hO1d9omRCl7G7z3OfEX3slbpYuZIlbdL0CEM/ssaHPwi+ou6txER6l1bH3zLF
	qncA==
MIME-Version: 1.0
X-Received: by 10.182.246.202 with SMTP id xy10mr15262804obc.64.1437166590870; 
	Fri, 17 Jul 2015 13:56:30 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Fri, 17 Jul 2015 13:56:30 -0700 (PDT)
In-Reply-To: <55A914F9.2010204@gmx.de>
References: <1437050752-12663-1-git-send-email-dominic.sacre@gmx.de>
	<CAJ86T=XoRKBHyH0HmDv9thHr8qSievRt-WwT=qddsUkuyg5qpA@mail.gmail.com>
	<55A914F9.2010204@gmx.de>
Date: Fri, 17 Jul 2015 13:56:30 -0700
Message-ID: <CAJ86T=V63jLD9gbVF6YOU-ixQgpO79y0+JxoiDmmM=prUQrHAA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] fio: Add PACKAGECONFIG for numa, re-enable ARM build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jul 2015 20:56:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2015 at 7:45 AM, Dominic Sacr=C3=A9 <dominic.sacre@gmx.de> =
wrote:
> Hi Andre,
>
> On 2015-07-17 02:46, Andre McCurdy wrote:
>>> +PACKAGECONFIG[numa] =3D ",--disable-numa,numactl"
>>
>> I don't think this change will work.
>>
>> The fio recipe doesn't use autotools, so the --disable-numa option set
>> via PACKAGECONFIG isn't going to have any effect unless you also
>> manually pass EXTRA_OECONF into the build somehow.
>
> Ouch, you're right. The configure script is currently only called
> indirectly (from the Makefile) and without arguments during do_compile.
>
> How about adding this simple do_configure function?
>
> do_configure() {
>     ${B}/configure ${EXTRA_OECONF}
> }

Yes, that looks like the right approach. However you should use
"./configure" instead of "${B}/configure".

The configure script is in the source directory, ie ${S}, not the
build directory, and since do_configure is run from within ${S} by
default you don't need the full path.

>>>  # ARM does not currently support NUMA
>>> -COMPATIBLE_HOST =3D "^((?!arm).*)$"
>>> +PACKAGECONFIG_remove_arm =3D "numa"
>>
>> In general, it would be better to use something like:
>>
>>   PACKAGECONFIG_NUMA =3D "numa"
>>   PACKAGECONFIG_NUMA_arm =3D ""
>>
>>   PACKAGECONFIG ??=3D "${PACKAGECONFIG_NUMA}"
>>
>> _remove can be a little difficult to 'over-ride', so makes things
>> harder if someone did, one day, want to experiment with enabling that
>> option from local.conf or a .bbappend.
>
> Good point. I thought the _remove was ugly, but it didn't occur to me to
> use an additional level of indirection like this.
>
>
> Dominic
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

