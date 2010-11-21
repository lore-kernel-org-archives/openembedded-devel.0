Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKCcw-0000i4-4a
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 17:18:55 +0100
Received: by gwaa11 with SMTP id a11so3824870gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 08:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=hn2NpnQ9+42bP5K30vz9AeqqW6ZpidXdY38z7SJkOCA=;
	b=VNgteGLxan6wBoC2QAQH4Lu8GZrJEMVTUXmLTfeO+eOs0ru9hkteqsBzll0H8zw1x2
	KZZZpF7o+Tj+L4yak9AP/51w1CjRAmdJOcn/oNqE9Fk8ILhYkALcxalNuVUdgdtcRc6I
	0LSTKEsNqh6txJm+L1f8Pi8edTVEvf9mdPAOo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=eCWao+YwBpPAw9r4EmGduEOsVRXN2pT9aKNz0LUvkHSeuRrFlDZoNpJCWxzPGv2Wn3
	Z8XDjVJCU4xGmIvnl4/hdIjPDSt+u52rZNU+1hyiMokNuvEjJcyxS9fokPUxcgysXBtk
	+Z6lijhzW4uNZ3cy8YbmEUmhJu1+h4JFNEn+g=
Received: by 10.91.10.21 with SMTP id n21mr4329202agi.75.1290356261795; Sun,
	21 Nov 2010 08:17:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sun, 21 Nov 2010 08:17:21 -0800 (PST)
In-Reply-To: <4CE9332C.7020701@opendreambox.org>
References: <4CE6FA0C.2090801@balister.org> <4CE9332C.7020701@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Nov 2010 08:17:21 -0800
Message-ID: <AANLkTim-vJEbUXtQtm4TQLbKBBrwG2m_tbao0u4kJuWu@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Revert commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8
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
X-List-Received-Date: Sun, 21 Nov 2010 16:18:55 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 21, 2010 at 6:56 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On 11/19/2010 11:28 PM, Philip Balister wrote:
>> I'd like to revert commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8. With
>> this commit my build that includes angstrom-task-gnome.bb fails in a
>> peculiar way. Basically, my process table is filled with a task. Looks
>> like it is trying to run a pkg-config gtk+ operation. This is with
>> angstrom-2010.x and a custom machine very similar to an overo.
>>
>> I realize this is a vague description, but I do not have time to isolate
>> better at this time.
>>
>> Can we go ahead and revert this for now?
>
> No, please don't.
>
> I'm 100% sure that this patch is the only sane way of handling
> pkg-config files. I hope you agree that it wasn't possible for me to
> test every single package before this got merged.
>

agreed. but we are soon going to make a release. So it compiled (in
whatever way)
and now it doesnt (looking from 36000 ft above).
So either we fix the known regressions caused or backout because we
can not make release in this state for sure.

> Still, the solution for problems popping up now is simple: Make sure
> that required libraries install their pkg-config files themselves.
> Usually, they would already do it, but their install rules are
> overridden by custom do_install or do_stage rules in their bitbake recipe.
>
> As you already mentioned, the package causing the problem is gtk+
> (gtk+-1.2_1.2.10.bb).
>
> The solution in this case is very likely to
> - remove do_stage
> - add ${bindir}/gtk-config to FILES_${PN}-dev
> - bump PR
>

super can you cook up a patch.

> The real problem is gtk-config going crazy when gtk's pkg-config file is
> not installed.
>
> I'd have already submitted a patch, but testing takes a lot of time,
> especially when a recipe takes down the build machine.
>
> Maybe it would be wise for bitbake or OE to set ulimit -u to a sane
> value. Is there a way for a process to count the number of its direct
> and indirect child processes?
>
> Regards,
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


