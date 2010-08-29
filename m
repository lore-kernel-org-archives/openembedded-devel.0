Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpmWD-0005S0-Bo
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 20:22:14 +0200
Received: by iwn2 with SMTP id 2so4168588iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 11:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=CxqDA/DTCDv5rGymEtPJPKK20jbvi6jI0NtkOslJp38=;
	b=Scs/RUuLDJTyKwdscuorNtuahOLWZ7bELQenJPca5buJA67aqmvsmcRc11ARxcHsMB
	IGDETCMfDeiUuCV5cpeB4TafYYjuVcj7bZzAHjY7Dq7/oBOyk4Wq8yefqWDktA1AS1wH
	Y0OXQ1lUgKAGokD2rGPziU75XEmm5g6EjOS9Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=g0/Vd6bvtxm78OB/ZTZHXGOpmj1+GCSpZsYhgECLnUc7yc4X+3tUxkfqNxB9cS1SB5
	vldeROn3o8urpzBxrCxEKkM2K2fAasNsGx84INskm2FXE8CiQwMldMFycEQoIiUyO1dg
	Mv3kAr9pOnSA0kdfo+Ck01uO1kYls/+EKsCis=
Received: by 10.231.190.203 with SMTP id dj11mr4205880ibb.93.1283106064577;
	Sun, 29 Aug 2010 11:21:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Sun, 29 Aug 2010 11:20:24 -0700 (PDT)
In-Reply-To: <i5dap0$v2$2@dough.gmane.org>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-6-git-send-email-raj.khem@gmail.com>
	<i5dap0$v2$2@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 11:20:24 -0700
Message-ID: <AANLkTimnfsHbd0sWxGLBfawD9w5M4OLGWbH_gN6_9T-h@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 05/23] meta-toolchain-arago-dvsdk.bb: Exclude from world build.
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
X-List-Received-Date: Sun, 29 Aug 2010 18:22:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 29, 2010 at 2:54 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 28-08-10 22:24, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =A0recipes/meta/meta-toolchain-arago-dvsdk.bb | =A0 =A01 +
>> =A01 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/meta/meta-toolchain-arago-dvsdk.bb b/recipes/meta/m=
eta-toolchain-arago-dvsdk.bb
>> index 8e5b233..6deb2bc 100644
>> --- a/recipes/meta/meta-toolchain-arago-dvsdk.bb
>> +++ b/recipes/meta/meta-toolchain-arago-dvsdk.bb
>> @@ -1,3 +1,4 @@
>> +EXCLUDE_FROM_WORLD =3D "1"
>> =A0TOOLCHAIN_HOST_TASK =3D "task-arago-toolchain-dvsdk-host"
>> =A0TOOLCHAIN_TARGET_TASK =3D "task-arago-toolchain-dvsdk-target"
>>
>
> NAK, you're not saying why this needs to get excluded from world, it
> seems to build fine over here.

Does not parse for me.

NOTE: Runtime target 'ti-xdctools-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-xdctools-sdk']
NOTE: Runtime target 'task-arago-toolchain-dvsdk-host' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['task-arago-toolchain-dvsdk-host', 'ti-xdctools-sdk']
ERROR: Required build target 'meta-toolchain-arago-dvsdk' has no
buildable providers.
Missing or unbuildable dependency chain was:
['meta-toolchain-arago-dvsdk', 'task-arago-toolchain-dvsdk-host',
'ti-xdctools-sdk']

What provides ti-xdctools-sdk in your case ?

hmm if you see sdk.bbclass then you will see that it demands the
recipes inheriting from it to be
excluded from build it being sdk I just excluded it.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMei5gMkyGM64RGpERAtn8AJ9f73BbHxsaMB//KfFcL2PVjBuq3ACfU/Fm
> wcSPTERL/9JjMXlzY38bmyY=3D
> =3DjouZ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


