Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OfThs-0006fL-6g
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Aug 2010 10:15:42 +0200
Received: by iwn34 with SMTP id 34so2986056iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Aug 2010 01:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=62a1IVVANPIPXIGm+Ap1MIjuNYfigyFdCBW6UBAnyxs=;
	b=FlIc+6LopOQCPuRfoG0QfOGk823lqpDblRM0CzefqRbb7/Md2IFH2hlRGy7iL8yxRs
	DSUnW6DP0bd7JvYO8eSRf5Z0KD35wdS4EzgE20aCgc+VAQRoAaISfzl+DusBUi4BPkzG
	N4sTQiP08dG6Swu/HpqiDVglFUqcHYfrbcC94=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=mGhlZdzL5rZYhBwIFpdHbspjBFVcKV1uK8/jEDZHAzR2Ys8597o+swjxfhs+3C/6Ub
	dusbb3Ea+AukQJpPB0ukuTG+zB0UN7j6nj4rh5/a7DYdL5ffgevXkGKvCH4jp7XEtVHj
	LJBhT4VMDWDV7DA8bvqxaQOtJi4qFOmCisr5U=
Received: by 10.231.119.229 with SMTP id a37mr4692137ibr.169.1280650517229; 
	Sun, 01 Aug 2010 01:15:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.199 with HTTP; Sun, 1 Aug 2010 01:14:57 -0700 (PDT)
In-Reply-To: <1280617140.1297.71.camel@rex>
References: <4C523E6D.8040109@mentor.com>
	<AANLkTiketBU=4fc1w37V-34Ge1HHRbxxB8hCdX2w+vRh@mail.gmail.com> 
	<1280617140.1297.71.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Aug 2010 01:14:57 -0700
Message-ID: <AANLkTi=UT11mxOQb+5f60EnQ5yoGaxjUMqMUdGtX663b@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v4] Make multi-machine toolchains to co-exist (revised again)
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
X-List-Received-Date: Sun, 01 Aug 2010 08:15:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 31, 2010 at 3:59 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Thu, 2010-07-29 at 23:36 -0700, Khem Raj wrote:
>> On Thu, Jul 29, 2010 at 7:52 PM, Tom Rini <tom_rini@mentor.com> wrote:
>> > Hey all,
>> >
>> > As one of the folks who suggested something else, here's my take.
>> >
>> > We modify the prefix for cross stuff to dump everything into
>> > MULTIMACH_TARGET_SYS in the sysroot.
>> >
>> > Pro: It should work for all the cases
>> > Con: We're back to having a 'special' directory of cross stuff
>> > Pro: It's separate but still valid for $ORIGIN mangling, which is the
>> > other problem we had before.
>> >
>> > I've got a qemuarm console-image and then beagleboard console-image build
>> > going now and that's going to take time.
>> >
>> > Signed-off-by: Tom Rini <tom_rini@mentor.com>
>>
>> hah indecently I have been testing similar patch per our discussions on IRC
>> but trying to get program-transform-name to generate unique compiler names
>> which can coexist in <native sysroot>/usr/bin meanwhile I work on that this
>> portion looks ok to go in.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> I've been trying to catch up with this issue and where OE is at now I'm
> back. Could someone summarise where we're at please as reading through
> the email threads which keep changing subject hasn't really educated me
> much :/ Did changing the triplet work out or not?

Yes it worked out to a certain extent but there was few rough edges left. I did
not pursue it more as it seemed not so desired approach.

>
> In Poky I've got the putting the toolchain into:
>
> native-sysroot/usr/bin/<package-triplet>/${TARGET_SYS}-foo

Something similar is what the v4 of the patch proposed. A difference is
that it puts the toolchain in native-sysroot/usr/${BASE_PACKAGE_ARCH}/

Koen has been trying it out and so far he has had good results.

Thanks
-Khem


