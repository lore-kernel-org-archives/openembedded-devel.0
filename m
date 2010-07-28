Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OeAOC-0004zv-J9
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 19:25:57 +0200
Received: by iwn34 with SMTP id 34so5053249iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=RVRbmj4WxzwMhb59SeM1rt3JLRSj1WvjMo1RgurIn2k=;
	b=OmmpXIK4vzGPwDpFG2wt4iwcvGrG0Rmac2yr4r4VFGOLh0iq9g1AwAEUlp3F2kmeq8
	YvlfIWOV+2yDEKjBFd2AO3/mlYhNCHiKnHTI4LKqDqktW7fQX8WzJpvKzh3a8aKoj8kT
	Dy30dbcf4LKNORjyCqNxztEvUyNu6RK1DeWVE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=kxfkA0Z1zY9LTNAhLAH1PU0JFa/QXVLt1R2vMe4NvU6rurOUhYxAXx3XeV2QxoAMAR
	1n+D5+0iJfQ4fB9Xbl4a5QBKKcj4ALJwlrOrXj9Ech8Uic1cQuu/ysIN7s+qqtupn2dk
	SOM3YVZRXyccdu0y+o8VvQdeb6zAtB6mLSph8=
Received: by 10.231.170.208 with SMTP id e16mr12652019ibz.44.1280337939389; 
	Wed, 28 Jul 2010 10:25:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Wed, 28 Jul 2010 10:25:19 -0700 (PDT)
In-Reply-To: <i2okvc$6j7$1@dough.gmane.org>
References: <1280213315-5513-1-git-send-email-raj.khem@gmail.com> 
	<i2okvc$6j7$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Jul 2010 10:25:19 -0700
Message-ID: <AANLkTin_ROfw2Gv6-6MD=VQrXZ2t6BRb3_yNyJOCEhCX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/8][v3] Make multi-machine toolchains to co-exist (revised again)
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
X-List-Received-Date: Wed, 28 Jul 2010 17:25:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 28, 2010 at 12:07 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 27-07-10 08:48, Khem Raj wrote:
>> Hi
>>
>> Following series of patches are for making multi-machine toolchains co-exist with
>> new cross staging for toolchain.
>>
>> It changes the toolchain triplet from ${TARGET_ARCH}-${VENDOR}-${OS} to
>> ${TARGET_ARCH}-${CPU_SUB_TARGET}_${VENDOR}-OS
>>
>> which means that a toolchain for armv7 is called arm-v7a_oe-linux-gnueabi-*
>> and for armv5te its called arm-v5te_oe-linux-gnueabi-*
>>
>> They can coexist in same native sysroot. The symlinks would mean that
>> gcc will not accidently mix the assemblers or linkers.
>>
>> MULTIMACH-* is not needed anymore as the TARGET_SYS is distinct enough
>> to serve same purpose.
>>
>> I have booted a minimal-image on qemuarm qemuppc and qemumips successfully. The build for
>> beagleboard native-sdk-image completed too.
>
> I tried v3 and it's close, but when building gstreamer-ti:
>
> | checking host system type... Invalid configuration
> `beagleboard-angstrom-linux-gnueabi': machine `beagleboard-angstrom' not
> recognized
>
> Any idea how I can have it stage in the machine sysroot but not get a
> weird TARGET_PREFIX?

I will try to see whats going on.

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMT9csMkyGM64RGpERAgufAJ0aKRM+G56NH8Vf8fej71ELTVKq/ACfWGNU
> gCqhPDOE0Pzfz0eiwKyt2Vw=
> =0j2v
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


