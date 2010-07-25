Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Od2OV-0000nF-Vd
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 16:41:36 +0200
Received: by iwn34 with SMTP id 34so2015759iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 07:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=81hFWfsqzeSICx7LikGp/c7txmMsTuymsCtbGWSwUv0=;
	b=csonlmMR3Xvd/GOUgg3ggrzhYz/nht7rQcqEJj7QRZ1nA6o5IvVZbLIwKYZshbbfxu
	zmqqqWsc5zAVdWq6vNnnqNMGMLuusmBlYgyJCarxtiIh3/FDTttlF1eXvSAzpDg/mgvs
	yCh2eyJ4OqJKiBx5xzEkbfS6OCaife7hH9BAc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Sg1hJBNGt7Gci8ERi3P6neliMW+CdIAC7UgA6TDQjjtolOvhqlljKRvt0ml15FqYjp
	x3mFIr4A33fZvzRJIRgb8Is8qpge0Y/pEIHzgtKcxE6ec8emPGb20+seEYhl7Lf/T9/A
	aENOqzFV2aq7OxI5i6b0P9sH14dsNGjypwoYE=
Received: by 10.231.32.198 with SMTP id e6mr7086964ibd.86.1280068882280; Sun, 
	25 Jul 2010 07:41:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Sun, 25 Jul 2010 07:41:02 -0700 (PDT)
In-Reply-To: <i2harj$e6t$1@dough.gmane.org>
References: <1279963975-3736-1-git-send-email-raj.khem@gmail.com> 
	<i2fjoo$iiu$1@dough.gmane.org> <20100724212502.GA4218@gmail.com> 
	<i2gsqi$8sv$1@dough.gmane.org> <i2h6dv$1ni$1@dough.gmane.org> 
	<i2harj$e6t$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Jul 2010 07:41:02 -0700
Message-ID: <AANLkTik9ZnjaXvx6vxnjzxx013ms+cDjVv1FvsK31r5u@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] Make multi-machine toolchains to co-exist.
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
X-List-Received-Date: Sun, 25 Jul 2010 14:41:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 25, 2010 at 5:31 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 25-07-10 13:16, Koen Kooi wrote:
>> On 25-07-10 10:32, Koen Kooi wrote:
>>> On 24-07-10 23:25, Khem Raj wrote:
>>>> On (24/07/10 22:51), Koen Kooi wrote:
>>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>>> Hash: SHA1
>>>>>
>>>>> On 24-07-10 11:32, Khem Raj wrote:
>>>>>> Hi
>>>>>>
>>>>>> Following three patches are for making multi-machine toolchains co-exist with
>>>>>> new cross staging for toolchain.
>>>>>>
>>>>>> It changes the toolchain triplet from TARGET_ARCH-VENDOR-OS to TARGET_SUB_ARCH-VENDOR-OS
>>>>>>
>>>>>> which means that a toolchain for armv7 is called armv7-oe-linux-gnueabi-*
>>>>>> and for armv5te its called armv5te-oe-linux-gnueabi-*
>>>>>>
>>>>>> They can coexist in same native sysroot. The symlinks would mean that
>>>>>> gcc will not accidently mix the assemblers or linkers.
>>>>>>
>>>>>> I have booted a minimal-image on qemuarm successfully. The build for
>>>>>> beagleboard in same sysroot is underway.
>>>>>>
>>>>>> Please give it a shot in your environments (especially Koen's env)
>>>>>
>>>>> MACHINE=beagleboard bitbake nano ; MACHINE=hawkboard bitbake nano work,
>>>>> going to try a bigger build now.
>>
>>>> You will need 4th patch which is attached here, for the sdk recipes.
>>
>>> OK, applied that as well, 'MACHINE=beagleboard bitbake console-image ;
>>> MACHINE=hawkboard bitbake console-image' works as well.
>>> Let's see what xbmc does :)
>>
>> xbmc builds, but mplayer and gstreamer-ti fail.
>>
>> The fix for mplayer is simple, change configure:2106 from
>> arm|armv4t|armv5te) to arm*).
>>
>> The gstreamer-ti one is a bit harder to fix:
>>
>> | checking host system type... Invalid configuration
>> `beagleboard-angstrom-linux-gnueabi': machine `beagleboard-angstrom' not
>> recognized
>> | configure: error: /bin/sh ./config.sub
>> beagleboard-angstrom-linux-gnueabi failed
>>
>> That recipe is machine specific, so for TARGET_ARCH == MACHINE_ARCH we
>> probably need to change things. Does anyone have a sample on how to do that?
>
> And cacao:
>
> | configure: error: armv7a systems are not supported at this time
> | ERROR: Function do_configure failed

yes I was expecting that kind of problems. openssl also has similar issues.

another idea that struck me was that we could change the target triplet to drop
TARGET_VENDOR and replace it with TARGET_SUB_ARCH and TARGET_SUBARCH
could be anything
we could even make it same as MACHINE_ARCH which means you will build
toolchain per machine
and they will live together.

then the tool names will be something like arm-v7-linux-gnueabi-*
powerpc-e500-linux-gnu
mips-mips2-linux etc. instead of *-angstrom-*- or *-oe-*-

or arm-beagleboad-linux-gnueabi-* etc if we go with MACHINE_ARCH

that would keep all recipe configury happy as the arch detected from
config.guess will be what
we had (arm, mips, mipsel powerpc etc) so no changes needed but we
will have to drop the brand

does it sound good ? bad?

>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMTC6zMkyGM64RGpERAgwBAJ4o3TMs0vvc/rHEBlg+T5zuRw4J1gCfXwga
> oHSk52zHn97qye6wkmyCnp8=
> =7Es1
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


