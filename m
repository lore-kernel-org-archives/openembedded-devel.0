Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ofxrg-0005nP-Hy
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 18:28:28 +0200
Received: by ywe9 with SMTP id 9so1402339ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Aug 2010 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=leaFZZ+35YPGi1OW+vFehbIrCRyHU663gT2WfYcf+2c=;
	b=BW293G8j/XLQYQrJiit+stKG1LAWCD6aBWoP4WuIwgBUfi+d7MMoahiQEwFV/s3bFr
	Om9SR98b3/L2fiwandCwToguny6N6Slj09z+xJCUr4S+N/VAOz6ybMQYDfBVCjfC0mW4
	4aFKFE2yEYL78xvAfPjHxUDTMrwlOqMmi7nVI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=v1ypiZ8hfO6RsD451xcNsUN2yFGukanwoEYiDufmVTJ7h6f37n77k3g5yqnQDaDB3m
	FtqBcqAKc+Uzx7p+lyOFdjhOXVsQJkLQ9f0o2oB7DKHOUIH4Y5oXkoiGL+eY/SWfAvDb
	rIMx4fHc3TOyzkCnfe6dO1HDFzsQNptpGqLiU=
Received: by 10.151.109.13 with SMTP id l13mr1309746ybm.205.1280766442696; 
	Mon, 02 Aug 2010 09:27:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.199 with HTTP; Mon, 2 Aug 2010 09:27:02 -0700 (PDT)
In-Reply-To: <i363dm$17p$1@dough.gmane.org>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com> 
	<i30rie$8aq$1@dough.gmane.org> <i318p1$ec3$1@dough.gmane.org> 
	<i31rhg$4a8$1@dough.gmane.org> <i363dm$17p$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Aug 2010 09:27:02 -0700
Message-ID: <AANLkTinE0=x74yBxHsGCpRLFoQfDF+gHeuHFMG=D+rY_@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/5][v4] Make multi-machine toolchains to co-exist (Alternate approach)
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
X-List-Received-Date: Mon, 02 Aug 2010 16:30:09 -0000
X-List-Received-Date: Mon, 02 Aug 2010 16:30:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 2, 2010 at 2:33 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 31-07-10 20:54, Koen Kooi wrote:
>> On 31-07-10 15:34, Koen Kooi wrote:
>>> On 31-07-10 11:48, Koen Kooi wrote:
>>>> On 31-07-10 07:34, Khem Raj wrote:
>>>>> Hi
>>
>>>>> Following series of patches are for making multi-machine toolchains co-exist with
>>>>> new cross staging for toolchain.
>>
>>>>> It installs the toolchain in <native sysroot>/usr/${BASE_PACKAGE_ARCH}
>>>>> this way we can have multiple toolchains co-existing for different sub-arches and major arches too.
>>
>>>>> I have booted a native-sdk-image on qemuarm successfully. The build for
>>>>> beagleboard minimal image using different versions of toolchain went all fine too.
>>
>>>>> Please test these patches and if seem ok provide some ACKS/NACKS
>>
>>>> Khem, thanks for working on this!
>>
>>>> Firing of a build now :)
>>
>>> 'MACHINE=beagleboard bitbake ffmpeg samba mysql5 gstreamer-ti' completed
>>> succesfully, doing a 'MACHINE=hawkboard bitbake gtk+' now.
>>
>> And that seems to have worked as well. I have kicked of a huge
>> multimachine build on the 16core buildserver at work and will inspect
>> the results on monday. But so far it's looking really good.
>
> The multimachine build finished as well. Before I ack this patch, are we
> going to match the OE layout to the one used in poky?

I think the layout we have is nice because it still keeps the cross
bits somewhat
and lets relocatable class to fudge the rpath and we are in native sysroot.
and <sysroot>/usr/armv5te/bin looks a bit better than
<sysroot>/usr/bin/armv5te/bin

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMVpD2MkyGM64RGpERAsK8AJwMVi7zfHWt07AbegVk0MRvp4oMAgCaApKK
> ADTLyDOwp79gCsVC1tV//mI=
> =f9PZ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


