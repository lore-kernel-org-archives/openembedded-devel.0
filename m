Received: from [209.85.200.170] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MGzjJ-0000ap-9z
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 20:19:25 +0200
Received: by wf-out-1314.google.com with SMTP id 25so213073wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2009 11:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=oNUGkfPmxKibNIdUz43lJE8mc5BR0DpVTRz2tY+Z75M=;
	b=Kos8CUl+4JbMeq7b2e3pzDPHAyIe6pIbuIhLBmYRBMt1VDc6eb6bm9pnNzQPv4F1YG
	JAjSP/EWLNTA9UmZZ4IL+gkWd/EQfg735O1hmh5kdKpQ6iIQUC/T1PCna4a9IAMdgXly
	glb/tvFjakEg1wmeweQv2utSm7y8xJ+xN6LLw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=jX398aETRy8n3Ezri4f5a29e9lYk4l7skRyplLV6kBMtdnYdzK/TglOxx8cpU7m3Tj
	c7Ujfuwi9qi9SfO5l3/iSr2GVeei2qLZwH+QE/iVygohCQb5qhb66+kl5JvI7udylpUF
	4rJcoUWCGcGuvXsc2WxFkNuQm+51hcvrm0DBo=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.143.35.4 with SMTP id n4mr457837wfj.73.1245262137835; Wed, 17 
	Jun 2009 11:08:57 -0700 (PDT)
In-Reply-To: <1245261716.27027.18.camel@dax.rpnet.com>
References: <1245258640-1623-1-git-send-email-clarson@mvista.com>
	<1245261716.27027.18.camel@dax.rpnet.com>
Date: Wed, 17 Jun 2009 11:08:57 -0700
X-Google-Sender-Auth: 86ef5576d71d70c2
Message-ID: <b6ebd0a50906171108y275813e6j2d086b1fbf8b1681@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: remove tmp/rootfs after image creation unless you set a variable
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
X-List-Received-Date: Wed, 17 Jun 2009 18:19:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2009 at 11:01 AM, Richard Purdie<rpurdie@rpsys.net> wrote:
> On Wed, 2009-06-17 at 10:10 -0700, Chris Larson wrote:
>> Set IMAGE_KEEPROOTFS to something other than the empty string to keep
>> tmp/rootfs around after image creation, otherwise it will be removed, as=
 it's
>> not a fully functional filesystem, and causes much confusion among users=
 as a
>> result.
>>
>> Signed-off-by: Chris Larson <clarson@mvista.com>
>> ---
>> =C2=A0classes/image.bbclass | =C2=A0 =C2=A01 +
>> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/classes/image.bbclass b/classes/image.bbclass
>> index f0cc3b3..974e734 100644
>> --- a/classes/image.bbclass
>> +++ b/classes/image.bbclass
>> @@ -133,6 +133,7 @@ fakeroot do_rootfs () {
>> =C2=A0 =C2=A0 =C2=A0 ${IMAGE_POSTPROCESS_COMMAND}
>>
>> =C2=A0 =C2=A0 =C2=A0 ${MACHINE_POSTPROCESS_COMMAND}
>> + =C2=A0 =C2=A0 ${@['rm -rf ${IMAGE_ROOTFS}', ''][bool(d.getVar("IMAGE_K=
EEPROOTFS", 1))]}
>> =C2=A0}
>>
>> =C2=A0do_deploy_to[nostamp] =3D "1"
>
> Something I've been thinking about for a while is moving rootfs into
> ${WORKDIR}/. That way you can have concurrent image generation for a
> start and rm_work could be taught to clean it up...

That's a better way of doing it, indeed.  In fact, someone suggested
it on irc, and I promptly went and forgot about it  :)
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


