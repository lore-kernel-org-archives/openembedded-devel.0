Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTJj0-0000Ec-9J
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2011 21:47:22 +0100
Received: by ghy10 with SMTP id 10so1841527ghy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 12:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=njDoB7UGq64dTj2iAKBeUKIKW8OqfAPjQWvROBrmJpk=;
	b=tgRe2UnTROXuaB9GALyOjeb7dF3ETOvzzUi0uqYVbSxtU8Ntv/A6by5AEORrFkRxUh
	03XAEz/wVxPA2nf6wUxL/9OdrGvED3kilLpe71K9xlicYjlqzvvqjSx2yud9Cx3DJG6o
	6XRLfr+83sp0Y1g905bSf1V/ebS65TrQqPiZo=
Received: by 10.152.134.77 with SMTP id pi13mr15946205lab.21.1322080848088;
	Wed, 23 Nov 2011 12:40:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 12:40:17 -0800 (PST)
In-Reply-To: <CAAQYJAucXepsfHvxSkJyvsEnv4Eid6yu3NxPgMfk5QrNb4t=mw@mail.gmail.com>
References: <4EAC296D.8040403@telia.com>
	<CA+M6bXnq6jfhyZ+6nRB3GDqoRv3oa=m-xcht8xrAYV_7aeVzkA@mail.gmail.com>
	<CAAQYJAucXepsfHvxSkJyvsEnv4Eid6yu3NxPgMfk5QrNb4t=mw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 12:40:17 -0800
Message-ID: <CAMKF1srmkneQQ8UaD3z=N53jDQNyzWTCA2sxTEs3ZOSns3c5KA@mail.gmail.com>
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
X-List-Received-Date: Wed, 23 Nov 2011 20:47:22 -0000
Content-Type: text/plain; charset=UTF-8
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
>> options are the same between mkfs.jffs2 and sumtool. =C2=A0At least the
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
> IMAGE_CMD_jffs2 =3D and this can =C2=A0not be overriden
> We would just need a weak assignment in image_types.bbclass or maybe a ne=
w
> image type like IMAGE_CMD_jffs2-summary and related commands.
>

I would say port patches to oe-core for it.

> Regards
>
> Andrea
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


