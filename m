Received: from na3sys009aog101.obsmtp.com ([74.125.149.67])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PzBiB-0003Gb-VJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 18:37:44 +0100
Received: from source ([209.85.220.177]) (using TLSv1) by
	na3sys009aob101.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTX5R/mtuVNKSW1yTZi55gcd1xqB1IhUE@postini.com;
	Mon, 14 Mar 2011 10:36:05 PDT
Received: by mail-vx0-f177.google.com with SMTP id 2so5177688vxd.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 10:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=NXR+WOSQJCflwB6ZP+eduKlBacSl9ZOOhpXe/X1CYrY=;
	b=cY+0ort7y0/0nQ2F5d27+ZqVwSYawV6hkR4Ej8zXGH/kSrBOYYD42CWkNEv2jGhn0L
	T0K7gyLUB/6HgcH1CANH96uVPUfZKcoGcyB9cgZlOhq4KH0XXiMIgLONA2e/JNzmhjft
	YAcpcqMfPyarZaPTzP1HO4payxhPcuZMWYOdU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=U60NIrHU8gNjA69szDRvbBPpqDyidIbIcAPlAPoIgSjt/bXZ6jnjk9jrBUhmOy7BBO
	0YIpKnZcJSawEhrKdB7wK5aBABtIX2o+yo9DUf17lVI1dQzKBAdyFlpqAIuP6OVB+NJv
	bhN1qdz/J1cyrklCGgBJ4v/67gFjACEY91vOM=
MIME-Version: 1.0
Received: by 10.52.0.229 with SMTP id 5mr18239043vdh.271.1300124158065; Mon,
	14 Mar 2011 10:35:58 -0700 (PDT)
Received: by 10.52.168.225 with HTTP; Mon, 14 Mar 2011 10:35:57 -0700 (PDT)
In-Reply-To: <4D7E4A0A.2000805@mentor.com>
References: <1300111886-4102-1-git-send-email-bengardiner@nanometrics.ca>
	<4D7E3BB2.6060104@mentor.com>
	<AANLkTiknm8aEyOyS5jt237F6-PZrjCm9wJZKvWFYii6s@mail.gmail.com>
	<4D7E4A0A.2000805@mentor.com>
Date: Mon, 14 Mar 2011 13:35:57 -0400
Message-ID: <AANLkTin3kE-B-dO6d-er9+EhpBN=_KduXFtf7MPfCX36@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Tom Rini <tom_rini@mentor.com>
Cc: arago-devel@gforge.ti.com, Tom Rini <trini@embeddedalley.com>,
	Koen Kooi <koen@openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf : make IMAGE_CMD_ubifs also produce .rootfs.ubifs
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
X-List-Received-Date: Mon, 14 Mar 2011 17:37:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2011 at 1:02 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 03/14/2011 09:26 AM, Ben Gardiner wrote:
>>
>> Hi Tom,
>>
>> Thanks for the rapid reply.
>>
>> On Mon, Mar 14, 2011 at 12:00 PM, Tom Rini<tom_rini@mentor.com> =A0wrote=
:
>>>
>>> On 03/14/2011 07:11 AM, Ben Gardiner wrote:
>>>>
>>>> The ubifs image filenames produced by the ubi and ubifs commands diffe=
r.
>>>>
>>>> IMAGE_CMD_ubi produces an interim ubifs image
>>>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ; whereas IMAGE_CMD_ubi=
fs
>>>> produces a final ubifs image
>>>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img
>>>>
>>>> This results in the undesirable behaviour then when a user specifies
>>>> IMAGE_FSTYPES contains ubifs (as opposed to ubi) they get a broken lin=
k
>>>> ${DEPLOY_DIR_IMAGE}/${ROOTFS_IMAGE}-${MACHINE}.ubifs pointing to the
>>>> non-existant ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs
>>>>
>>>> Fix the discrepancy by making the IMAGE_CMD_ubifs also produce the
>>>> .rootfs.ubifs target like the IMAGE_CMD_ubi does and preserve the old
>>>> .ubifs.img filename as a link for backwards compatibility.
>>>
>>> So, wait. =A0What's the problem here? =A0If you do IMAGE_FSTYPES=3D"ubi=
fs" you
>>> get the interim image which isn't useful normally but is
>>> useful if you're doing volume management outside of the provided build
>>> targets. It's not however a valid rootfs target since it can't be
>>> used as is. =A0I think what's missing here is just a comment to the eff=
ect
>>> that most people do not want 'ubifs' and they do want 'ubi' as
>>> we provide ubifs for advanced usages.
>>
>> The other way around: If I do IMAGE_FSTYPES=3D"ubifs" then I don't get
>> the interim .rootfs.ubifs image I get instead a .ubifs.img; the
>> .ubifs.img extension is different than the extensions produced by the
>> other IMAGE_CMD's.
>
> Right. =A0The others are a valid rootfs but the ubi isn't because it need=
s
> that container.

Ok. I think I see the difference you are trying to point out here --
since the UBIFS 'image' requires a UBI volumeas container it is not a
.rootfs.<type> image like the others. I do not object to this
classification of images; but then I request that the IMAGE_CMD_ubi be
modified to not produce a .rootfs.ubifs interim image for consistency.

>> I agree that =A0they are all valid rootfs images -- what is a difficulty
>> for me is the resulting filename. The symlink 'sugar' provided by
>> bitbake in ${DEPLOY_DIR_IMAGE} points to broken images: it always
>> expects the .rootfs.<type> =A0extension.
>>
>> All other IMAGE_CMD's produce .rootfs.<type>, excecpt for
>> IMAGE_CMD_UBIFS, which produces .ubifs.img
>
> Would it be OK if we just didn't make the broken link, assuming we make t=
he
> full use case work?

Yes, that would be great -- some notes below.

>>>> Signed-off-by: Ben Gardiner<bengardiner@nanometrics.ca>
>>>> CC: Tom Rini<trini@embeddedalley.com>
>>>> CC: Koen Kooi<koen@openembedded.org>
>>>> CC: Denys Dmytriyenko<denis@denix.org>
>>>>
>>>> ---
>>>>
>>>> Please also consider this patch for inclusion into the
>>>> 2011.03-maintenance
>>>> branch and into arago-oe-dev
>>>
>>> Just as a general comment, I don't want combined requests for
>>> 2011.03-maintenance but do feel free to make the request as soon
>>> as it hits a mainline tree (and you've done the relevant testing on
>>> 2011.03-maintenance).
>>
>> My apologies -- it won't happen again.
>>
>>>> The reason I want to be able to address the ubifs image -- and
>>>> not the UBI image -- is because I am trying to produce a UBI image fro=
m
>>>> a
>>>> a different ubinize config file which will contain both rootfs and
>>>> kernel volumes.
>>>>
>>>> I am trying to accomplish this by creating a recipe which depends on t=
he
>>>> rootfs and kernel images we use. This recipe needs to synthesize the
>>>> image
>>>> file path, but without this patch it isn't simple since the link
>>>> ${DEPLOY_DIR_IMAGE}/${ROOTFS_IMAGE}-${MACHINE}.ubifs is broken.
>>>
>>> So, this is a valid use case (which I was spelling out above, before I
>>> got down here). but I think you're using the wrong variables.> =A0There=
 should
>>> be something that maps over to ${IMAGE_NAME}.ubifs.img
>>
>> You nailed the use case. :)
>>
>> There are additional complications (to me) introduced by the fact that
>> the full image filename produced by bitbake has the 'ipk' stuff in it
>> as well so it isn't as simple as synthesizing with .ubifs.img on the
>> end.
>>
>> If you are still opposed to the proposed change; i.e. normalizing
>> IMAGE_CMD_ubifs so that it produces .rootfs.ubifs instead of
>> .ubifs.img. Could I request your help to suggest how I would
>> synthesize the following image name:
>> arago-base-image-glibc-ipk-2010.03-da850-omapl138-evm.ubifs.img
>
> I've got an idea or two, but can you give me the full bitbake -e (off lis=
t
> of course) on the recipe that puts it all together?

Looking forward to hearing your ideas. I'll send you an off-list -e
and recipe shortly.

> We need for this use
> case to work and I just want to try and make it users that 'ubifs' is
> special (and avoid the "I put IMAGES_FSTYPES+=3Dubifs into my local.conf,
> wrote it to flash and it doesn't work!" emails, but maybe that concern is
> just in my head at this point as UBI isn't as new as it used to be).

I understand your apprehension at the prospect of troves of uninformed
users trying to flash ubifs images 'directly' and subsequently
complaining about it on the lists. Being of the other variety of user,
I would definitely appreciate oe maintaining the current behaviour of
producing .rootfs.ubifs images -- note that a ubifs image is still
useful for 'flashing' with 'ubiupdatevol'.

However, my primary use-case of the .ubifs.rootfs link is for
integration into multi-volume UBI image of my design and since you
have so graciously offered to help make that use-case work I have no
further objections to the removal of the .ubifs.rootfs link. All my
other uses are manual and so hunting through DEPLOY_DIR_IMAGE is
acceptable.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


