Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OauEm-0005fP-Dp
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 19:34:45 +0200
Received: by iwn34 with SMTP id 34so4914305iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=V+CpVqWkxBcT3rYAec1sf8yu8IOXHji3vvuj1T796O8=;
	b=Tw/Wifuc6Coe+xVjNeygx69f3S2Jp9ZrdIyIXQS9D/79zdPqFEY14zvxzVzt3jB4y1
	4L4jSsc58TDYYT73Fx7whwPMvebhGlmMGqNWdspOhqNJmn+PFjmoVoBeof1/r+nlTEeY
	KdSD+g24hiKMUMI1FQ9C2MM1Fv4J1OZGlmwlo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=B/EaWejTtt9eqRBP2lTalkFsIq7vdu07am40xGmaoB58vUVkJ0MVvS3YWYdkzT0AYJ
	qGtr0mpLvNqaleM14wbej0ufpr2u8LV1h6co5B+Rj/GX20RFvDI2HvO8SlCoWzhSFgaj
	tHCj8Yj77VUGnaFxP8LMtlelw9BMJfOel1hFA=
Received: by 10.42.1.202 with SMTP id 10mr1854661ich.63.1279560876281; Mon, 19 
	Jul 2010 10:34:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.35.8 with HTTP; Mon, 19 Jul 2010 10:34:16 -0700 (PDT)
In-Reply-To: <1279557977.2345.2174.camel@mill.internal.reciva.com>
References: <1279527857-12295-1-git-send-email-raj.khem@gmail.com> 
	<1279549587.2345.2154.camel@mill.internal.reciva.com>
	<AANLkTikuwarIRXUIOX1L2A2LBD7D-Rhglsd-Rur8QaOO@mail.gmail.com> 
	<1279557977.2345.2174.camel@mill.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Jul 2010 10:34:16 -0700
Message-ID: <AANLkTin4_6ZH6kF7EYJXVhZJh6WIeLXli17LFMPrhTtX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sane-toolchain.inc: THUMB_INTERWORK should not be defined for armv4 and add armv4 to ARM EABI supporting architectures.
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
X-List-Received-Date: Mon, 19 Jul 2010 17:34:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2010 at 9:46 AM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2010-07-19 at 09:29 -0700, Khem Raj wrote:
>> On Mon, Jul 19, 2010 at 7:26 AM, Phil Blundell <philb@gnu.org> wrote:
>> > On Mon, 2010-07-19 at 01:24 -0700, Khem Raj wrote:
>> >> -THUMB_INTERWORK =3D "yes"
>> >> +# armv4 does not have thumb instruction set therefore no interworkin=
g instructions
>> >> +# so if machine is based on armv4 we dont have choice.
>> >> +
>> >> +THUMB_INTERWORK_armv4 =3D "no"
>> >> +THUMB_INTERWORK ?=3D "yes"
>> >
>> > I don't think this is necessary or desirable. =A0If you are building f=
or
>> > v4 then the BX instructions ought to be fixed up during final link.
>>
>> Yes with --fix-v4bx/--fix-v4bx-interworking its possible.
>>
>>
>> Is
>> > there a particular problem that you're trying to solve?
>> >
>>
>> Not any particular case but some versions of compiler do not pass
>> flags to --fix-v4bx-interworking ld.
>
> True. =A0But this is sane-toolchain we're talking about, and the version
> that it selects by default (4.4.4) does get this right. =A0So I don't
> think it's going to be a big deal in practice.

yes disregard that hunk.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


