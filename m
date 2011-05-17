Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMRqe-0005gF-U0
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 23:30:36 +0200
Received: by eye27 with SMTP id 27so283239eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 14:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=u8T+FN5apnb/ugH+6vb4sEEfu+1j5cGSfkoZSoPN+L8=;
	b=nk6e+/RLUcwoGGd1sUZsVWzxSHa6O44x8wq16IjuP1ZE1tDgcv679OLIW3HYUM54Ll
	lVtxOqC1A5iRyGHoWni+FWccF236xFYCqaFuicov1+5lIJUWFFVavlJiD6PPl1n8H7RC
	CaNMzg0jm4s7AutPmZNa2LyqNIlnVyHC2XaEM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=akUrNutG3rP3LpWM/bGNEgd/e6h35Lbx+QOmcaf39dMBj7tI5ibrrbSkMkUC6FcMQF
	/lPAb9R3tOiFM8Pj5bbwdoA6EgNA3sO8nSFgBEyJrCiFdaNpfH1daV2RPXPqh5MDQkUV
	WbIy4BOKw1GqyT38MjjGivIROmyAEyuNn6v5M=
Received: by 10.14.7.198 with SMTP id 46mr393427eep.108.1305667663337; Tue, 17
	May 2011 14:27:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Tue, 17 May 2011 14:27:13 -0700 (PDT)
In-Reply-To: <1305665458.18415.96.camel@lenovo.internal.reciva.com>
References: <1305663890-20372-1-git-send-email-raj.khem@gmail.com>
	<1305665458.18415.96.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 May 2011 14:27:13 -0700
Message-ID: <BANLkTinEYRWaqvat00GmNNmoG=eDY5VPjw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] uclibc_git.bb: inherit gitpkgv to get PV
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
X-List-Received-Date: Tue, 17 May 2011 21:30:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 1:50 PM, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2011-05-17 at 13:24 -0700, raj.khem@gmail.com wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> use GITPKGVTAG for PV
>> Cleanup unused UCLIBC_BASE
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta-oe/recipes-core/uclibc/uclibc_git.bb | =C2=A0 =C2=A06 +++---
>> =C2=A01 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-oe/recipes-core/uclibc/uclibc_git.bb b/meta-oe/recipes=
-core/uclibc/uclibc_git.bb
>> index cbc8ab8..05eea00 100644
>> --- a/meta-oe/recipes-core/uclibc/uclibc_git.bb
>> +++ b/meta-oe/recipes-core/uclibc/uclibc_git.bb
>> @@ -6,17 +6,17 @@
>> =C2=A0# UCLIBC_BASE can be set in a distro file, but whether this works =
depends
>> =C2=A0# on whether the base patches apply to the selected (SRCDATE) svn =
release.
>
> I guess that comment should also be removed if UCLIBC_BASE is unused

thanks. Will do that in V2 soon

> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


