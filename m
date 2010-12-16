Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PT23A-0003v4-5u
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 01:50:28 +0100
Received: by gxk21 with SMTP id 21so1834786gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 16:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=PKmmTE/yc+PxciP/6AY8+HCahb4uKqpYLbdcxP+zZAk=;
	b=cDmS6LkrtNY7lK3L17gBeCkX1Br16VkEXjqhKVMO7fDmAqboYOK4jRxzL93KMemP89
	xoYVrwDNe/nfyz49oTlSSmTzQLK49PgQaZmbt+QvqsTPHQMzVp9+ZYo4y/Gcv3wFXpBs
	IVE8CXZUFgh2a65JraeJeTha0d4JBc3cPE5v4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Sv6GoA+6JnvZdrXRiUamaz3GcFb/eQ6vs9pclFNzKC5BeEAL49tYyUGx0QOpYtmpjm
	bhwwAPKqn4zxgH9qWAL52go4B48BVUpE6L7P0rtghgWaGNoh5bIzMuIHh1Ao5mazyWke
	jUatA/It/W9W32GyYyCl+2q7Z5cGLu8pTUwRk=
Received: by 10.91.163.27 with SMTP id q27mr21811ago.139.1292460529418; Wed,
	15 Dec 2010 16:48:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 15 Dec 2010 16:48:29 -0800 (PST)
In-Reply-To: <4D08B2C8.5010508@opendreambox.org>
References: <1291941859-29257-1-git-send-email-eric@eukrea.com>
	<AANLkTinOcF=bKiZGZz1p4YZHSpW8Hy3LLumvG6VbqWg6@mail.gmail.com>
	<4D08B2C8.5010508@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Dec 2010 16:48:29 -0800
Message-ID: <AANLkTi=rzhtfxbfi8VS_R+W8uZV_qe=Ur1or861LJoPm@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc: introduce version 4.5.2
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
X-List-Received-Date: Thu, 16 Dec 2010 00:50:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2010 at 4:21 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On 12/10/2010 03:54 AM, Khem Raj wrote:
>> On Thu, Dec 9, 2010 at 4:44 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote=
:
>>> - based on gcc-4.5.2-RC-20101208 (svn 167585)
>>> - without linaro patches (which seem to be the root of
>>> problems when compiling at least on armv4 and armv5) :
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0- samba 3.2.15 or 3.3.9 : http://tinderbox.o=
penembedded.net/public/logs/task/8666826.txt
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0- samba 3.5.6 : http://pastebin.com/yuiYX2CM
>>>
>>
>> as discussed on IRC may be we should try to find the faulty patch in
>> current gcc 4.5 linaro patches we have.
>
> I don't think that we need another svn-based pre-release recipe for gcc.
> But I would still prefer to have a recipe for gcc 4.5.2 once it's
> released, because I'd like to be able to pin a stable version with only
> few required patches and Linaro only cares about ARM while I do not.
>

We should avoid creating recipes for every minor release. As we see
minor release only contain bug fixes.
agreed. If you dont care about linaro thats fine. Would you prefer a
gcc which is widely used or just used by you
hence supported only by you. My point it more common we use better we
have the support for it and community as a whole gets benefitted. If
linaro patches dont
harm your case negatively would you still be averse to them ? Do you
have some cases where they created regressions compile time or run
time or degraded the performance ?
that will be interesting.

why do you think gcc-4.5.2 will be more stable then say gcc-4.5.2 +
patches from upstream 4.5 branch

What advantage do you see of having a vanilla gcc without linaro patches ?

> Regards,
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


