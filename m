Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjHUo-0006jH-Vk
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 23:43:16 +0100
Received: by mail-wi0-f173.google.com with SMTP id hn17so54897wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 14:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=4pjdtV+rRq9JozkKafPkdMDx9Adq91e2ax93klah54s=;
	b=Ksh/fAiBM1ro6tL3FuPibYdKdec2F+f8cblawcEawguhTYoANSI1F+OY2MCTtfw6ta
	S4EGUJCGREAwjqXYMzENFRwdL14VFLXabuBu+NvTHlDMVOpga+VTToRHu3XlW9COgBCP
	CJLCO+BBl0G8QagQyf8j16nhbBqd1ZtVojQnQ67vKpV+Im7770BsQM+Ogb6YRi15kr5X
	9/WxMExvla7EVW35Ohu8s3NYqZoVS4ZpwBwY46QLY/rn8gJ3M86bb/LXt5o9VrWjPR3D
	n4rmsu75v0RONV1FYgfetCHMP5iP4MmXRrHbSvFmKWddOYLhd/AGEn5Wmv22dn75dOkZ
	bQ+w==
MIME-Version: 1.0
Received: by 10.180.90.106 with SMTP id bv10mr5878132wib.12.1355437719656;
	Thu, 13 Dec 2012 14:28:39 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Thu, 13 Dec 2012 14:28:39 -0800 (PST)
In-Reply-To: <20121213145944.4d30ad48@eb-e6520>
References: <CAOd_LFwmq3uoDBn=i9pPvcoJKHspOsnmENKazWp9cNJ5cOm9rA@mail.gmail.com>
	<CAJTo0LbRh1p4Q+Eq=O9xkg-0b9XymEP8m+Da3FDBQGLvqf_h7w@mail.gmail.com>
	<20121213145944.4d30ad48@eb-e6520>
Date: Thu, 13 Dec 2012 23:28:39 +0100
Message-ID: <CA+chaQei7JioiD6AUhAYcgGqd9207L579c_ZjTDkfDB_3-hjrg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: current bbappend issues
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
X-List-Received-Date: Thu, 13 Dec 2012 22:43:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2012 at 2:59 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi,
>
> Le Thu, 13 Dec 2012 13:43:47 +0000,
> "Burton, Ross" <ross.burton@intel.com> a =C3=A9crit :
>
>> On 13 December 2012 13:17, Cliff Brake <cliff.brake@gmail.com> wrote:
>> > ERROR: No recipes available for:
>> >   /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-oe/recipe=
s-qt/qt4/qt4-embedded_4.8.3.bbappend
>> >   /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-systemd/o=
e-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
>> >   /scratch/oe/oe-build-core-3/sources/meta-ti/recipes-graphics/mesa/me=
sa-dri_8.0.4.bbappend
>> >   /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-oe/recipe=
s-qt/qt4/qt4-x11-free_4.8.3.bbappend
>> > ERROR: Command execution failed: Exited with 1
>>
>> You can fix that locally by reverting the revert of the qt4 fixes...
>> (cherry-pick 421a73c9c3bea13e029cd0505711ef02753949bb).
>>
>> Agreed - meta-oe master needs more maintainers so that it keeps
>> current with oe-core master.
>>
> I can help in addition to danny's maintenance for simple patches like
> this.

FWIW I'm also willing to help with this.

Cheers,


