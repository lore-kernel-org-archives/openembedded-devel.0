Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PgLPq-0003WL-QP
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 19:08:54 +0100
Received: by gyh20 with SMTP id 20so683357gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 10:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=urchXZ/mqBaXCko49otEoZa8Q6+ialVjF8eIFbO5S8o=;
	b=gSP40hHpdRsnW4G5/pZf2wkN5XLmLrUWN9vI6ekZUDk3UkAy44MB0Da9U+aN8R02YP
	fug74szyrYZDtia+8UHdqXCM3cUVzG3vXrclpWaqqSdkcky+mx0+51sP3FHCEroACO4Q
	SThdhZp4VGPgIOhaRUSbHvwGL0xz/PDBpEIdk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=CYSrxHsgifvEpvpZFdvVZ2Y8Ro5VKc8CZi03npbt4I9NlOL0fl2I4GZ0xyYxjKlrOo
	ormOLJrM9HSdDL7wMLprg59QVzHbhoykJnMr5eGuU49itQ+roFvsxi2/71zbsrJr0JJk
	AbLbLW0tnRR25eGag2qP5tsFy3Z1bgztvLGN4=
Received: by 10.91.163.27 with SMTP id q27mr1143702ago.139.1295633292256; Fri,
	21 Jan 2011 10:08:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Fri, 21 Jan 2011 10:07:45 -0800 (PST)
In-Reply-To: <4D39B7F4.6050403@eukrea.com>
References: <1295598581-12927-1-git-send-email-raj.khem@gmail.com>
	<4D394AC0.90300@eukrea.com>
	<AANLkTi=Jdmsr8sYYpOMTOqdpoi9iHiyFBcAAqnfoaMAN@mail.gmail.com>
	<4D39B7F4.6050403@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Jan 2011 10:07:45 -0800
Message-ID: <AANLkTikL-v3XhM4vc47Sx6Aa8w=fSizAFHOT=3WiEypO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3] busybox_1.18.2.bb: slugos needs a modified version of usb.sh script
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
X-List-Received-Date: Fri, 21 Jan 2011 18:08:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 21, 2011 at 8:44 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> On 21/01/2011 17:33, Khem Raj wrote:
>>
>> On Fri, Jan 21, 2011 at 12:58 AM, Eric B=C3=A9nard<eric@eukrea.com> =C2=
=A0wrote:
>>>
>>> Hi Khem,
>>>
>>> On 21/01/2011 09:29, Khem Raj wrote:
>>>>
>>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>> ---
>>>> =C2=A0recipes/busybox/busybox-1.18.2/slugos/usb.sh | =C2=A0 33
>>>> ++++++++++++++++++++++++++
>>>
>>> Can't it become the generic script ? What makes it slugos specific ? (I
>>> didn't make a diff vs the other one so the question may be stupid ;-)
>>>
>>
>> you should have diffed them. uevents are stored in different directory o=
n
>> slugos
>>
> you could also put this in the commit log to prevent this diff to discove=
r
> what is the change :-)
>

will do

>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


