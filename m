Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RYPhc-0003tO-9d
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 23:11:01 +0100
Received: by dake40 with SMTP id e40so942715dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2011 14:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=wnfeEf9RQA7bduKBxk4oFAf9NvAyd7baxbFjSwvwpDE=;
	b=L/1VW5YZUraQbRKraOvqSrRQf2SXYrPEj8PPrvWpdkHJueBIFCfyRuoaPcvgELUxkP
	NMYZoOMRWA6aVTHtgemSzmcEdz2KjQ4oz9DNZ6CkwMoobvoTvZBJTsfS0cNWJgvDYPw6
	olWTSVIlkGryAS+zxznOUgQP4kPqhD9TCQ43I=
MIME-Version: 1.0
Received: by 10.68.72.104 with SMTP id c8mr9287748pbv.34.1323295449798; Wed,
	07 Dec 2011 14:04:09 -0800 (PST)
Received: by 10.142.139.19 with HTTP; Wed, 7 Dec 2011 14:04:09 -0800 (PST)
In-Reply-To: <CAMKF1srmkneQQ8UaD3z=N53jDQNyzWTCA2sxTEs3ZOSns3c5KA@mail.gmail.com>
References: <4EAC296D.8040403@telia.com>
	<CA+M6bXnq6jfhyZ+6nRB3GDqoRv3oa=m-xcht8xrAYV_7aeVzkA@mail.gmail.com>
	<CAAQYJAucXepsfHvxSkJyvsEnv4Eid6yu3NxPgMfk5QrNb4t=mw@mail.gmail.com>
	<CAMKF1srmkneQQ8UaD3z=N53jDQNyzWTCA2sxTEs3ZOSns3c5KA@mail.gmail.com>
Date: Wed, 7 Dec 2011 23:04:09 +0100
Message-ID: <CAAQYJAuEvxc1ZwoxUB4GY5v4EPxUi3B4iCiFWWBpVM6mkX=5CA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
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
X-List-Received-Date: Wed, 07 Dec 2011 22:11:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2011 at 9:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Oct 29, 2011 at 2:27 PM, Andrea Adami <andrea.adami@gmail.com> wr=
ote:
>> On Sat, Oct 29, 2011 at 7:14 PM, Tom Rini <tom.rini@gmail.com> wrote:
>>
>>> On Sat, Oct 29, 2011 at 9:27 AM, Ulf Samuelsson
>>> <ulf_samuelsson@telia.com> wrote:
>>> > Trying to solve another problem I came up with
>>> > changing IMAGE_CMD_jffs2 defined in conf/bitbake.conf
>>> > by redefining it in conf/local.conf.
>>> >
>>> > During that process I noticed the "sumtool" utility
>>> > which works on the jffs2 image, doing some
>>> > bookkeeping which then does not have to be
>>> > done on the target.
>>> >
>>> > I unserstand, this can speed up loading significantly.
>>> > Any reason not using this in OE?
>>>
>>> Last time I looked at this, the reason was that you had to re-jigger
>>> the IMAGE_CMD a bit and you also have to take care as not all of the
>>> options are the same between mkfs.jffs2 and sumtool. =A0At least the
>>> first part might be easier with oe-core and the reworked image class.
>>> The latter part is just annoying.
>>>
>>> --
>>> Tom
>>>
>>> FWIW we are defining our jffs2-summary in
>> http://cgit.openembedded.org/meta-handheld/tree/conf/machine/include/zau=
rus.inc
>>
>> This works beautifully in oe-dev but not using oe-core for it sets
>> IMAGE_CMD_jffs2 =3D and this can =A0not be overriden
>> We would just need a weak assignment in image_types.bbclass or maybe a n=
ew
>> image type like IMAGE_CMD_jffs2-summary and related commands.
>>
>
> I would say port patches to oe-core for it.

Done, patch sent to oe-core

Regards
Andrea

>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


