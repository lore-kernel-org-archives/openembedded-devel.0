Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RKGk5-0000TZ-47
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 23:47:06 +0200
Received: by qyg14 with SMTP id 14so6051052qyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 14:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Q3kwVDL9msbGVkRlWAkn1HqDySWNcQsD/iWCOB3CWbQ=;
	b=HawBxftJFwi7G6PKuXynqkjpbv/yoKAGYZkDka79YPOQ4XmQbWp6cVQSZudju3eC86
	eeqaJ0pf9vfeKNsl6iB6+NhpvXeo/cZ0YMQAmB+7QJo+J8RUVL98eZmol/VxdAullLUP
	b6GMgwNt+m2EFdQADybzZW+mnFdDh9KBL89dw=
MIME-Version: 1.0
Received: by 10.229.177.40 with SMTP id bg40mr1902013qcb.152.1319924460444;
	Sat, 29 Oct 2011 14:41:00 -0700 (PDT)
Received: by 10.229.94.72 with HTTP; Sat, 29 Oct 2011 14:41:00 -0700 (PDT)
In-Reply-To: <CAAQYJAucXepsfHvxSkJyvsEnv4Eid6yu3NxPgMfk5QrNb4t=mw@mail.gmail.com>
References: <4EAC296D.8040403@telia.com>
	<CA+M6bXnq6jfhyZ+6nRB3GDqoRv3oa=m-xcht8xrAYV_7aeVzkA@mail.gmail.com>
	<CAAQYJAucXepsfHvxSkJyvsEnv4Eid6yu3NxPgMfk5QrNb4t=mw@mail.gmail.com>
Date: Sat, 29 Oct 2011 14:41:00 -0700
Message-ID: <CA+M6bXn_Ja5DSxt-NBtR1u2GCVBNDADECQZ-xu7n-AKNNvEdSg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Adding sumtool to a JFFS2 build to speed up first boot
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
X-List-Received-Date: Sat, 29 Oct 2011 21:47:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 29, 2011 at 2:27 PM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> On Sat, Oct 29, 2011 at 7:14 PM, Tom Rini <tom.rini@gmail.com> wrote:
>
>> On Sat, Oct 29, 2011 at 9:27 AM, Ulf Samuelsson
>> <ulf_samuelsson@telia.com> wrote:
>> > Trying to solve another problem I came up with
>> > changing IMAGE_CMD_jffs2 defined in conf/bitbake.conf
>> > by redefining it in conf/local.conf.
>> >
>> > During that process I noticed the "sumtool" utility
>> > which works on the jffs2 image, doing some
>> > bookkeeping which then does not have to be
>> > done on the target.
>> >
>> > I unserstand, this can speed up loading significantly.
>> > Any reason not using this in OE?
>>
>> Last time I looked at this, the reason was that you had to re-jigger
>> the IMAGE_CMD a bit and you also have to take care as not all of the
>> options are the same between mkfs.jffs2 and sumtool. =A0At least the
>> first part might be easier with oe-core and the reworked image class.
>> The latter part is just annoying.
>>
>> --
>> Tom
>>
>> FWIW we are defining our jffs2-summary in
> http://cgit.openembedded.org/meta-handheld/tree/conf/machine/include/zaur=
us.inc
>
> This works beautifully in oe-dev but not using oe-core for it sets
> IMAGE_CMD_jffs2 =3D and this can =A0not be overriden
> We would just need a weak assignment in image_types.bbclass or maybe a ne=
w
> image type like IMAGE_CMD_jffs2-summary and related commands.

It's been a while since I peeked at this, but there's never a reason
not to sumtool as at worst case the first kernel mount will decide it
needs to do this work again anyhow if something was somehow wrong.

--=20
Tom


