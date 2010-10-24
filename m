Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9vDy-0003lY-6x
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 09:42:39 +0200
Received: by iwn5 with SMTP id 5so1552240iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 00:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=v7NJXF+m4CjzYv62wsHkxQkHBoB3HpTYC2oB44smf14=;
	b=hloEzolRNAd0M4nKDWDuOzQUGCQ2lGev+P63PX7kpPrsFq9O64H4rjMNRvihKHXE8/
	pwCKRnGGL7NBB79JN+NLNMw5L1qgis94SuKdvUY1XLQcWUUt7PbOwuuSz2iVLEwuYJRw
	SJjdNUx+ZsFw5a3yPSqsqcO9B0QXR9Gg/OkSo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=kOCCnRYpehlTQ3y4iLmwKtn/tus8F5L+oD1oNbjDIB4RsDrMkJbefQ59H6Tfdd0qP9
	zkidhWCAxh+s4+HzGtsQO/3MqaZsk4Fi27523v5fvD2Bdi/gjm6zY7Ghd67SdCUfkD2D
	WH6Du1KeDn92P2l9uVnJO7wAoZE2Z28G4b9bk=
MIME-Version: 1.0
Received: by 10.42.172.194 with SMTP id o2mr3579030icz.432.1287906117326; Sun,
	24 Oct 2010 00:41:57 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 24 Oct 2010 00:41:57 -0700 (PDT)
In-Reply-To: <AANLkTinR7OQFF7fzSmFnkuN+0y6b3jEV6s3N_OrNqckt@mail.gmail.com>
References: <1287848486-14980-1-git-send-email-fransmeulenbroeks@gmail.com>
	<i9v396$cn4$1@dough.gmane.org>
	<AANLkTinENJ300R25P65JHJR5wX0jLvd0+TfvSOYKC7+K@mail.gmail.com>
	<AANLkTinR7OQFF7fzSmFnkuN+0y6b3jEV6s3N_OrNqckt@mail.gmail.com>
Date: Sun, 24 Oct 2010 09:41:57 +0200
Message-ID: <AANLkTin4LJ8+iRa6V+qnzGDsgDRW-duUezN4+eyCvjxK@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] u-boot-sakoman_git.bb: updated SRCREV to head to make it building again
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
X-List-Received-Date: Sun, 24 Oct 2010 07:42:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/23 Steve Sakoman <sakoman@gmail.com>:
> On Sat, Oct 23, 2010 at 10:36 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2010/10/23 Koen Kooi <k.kooi@student.utwente.nl>:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On 23-10-10 17:41, Frans Meulenbroeks wrote:
>>>> SRCREV was "ccd0c67858c6e2807c695e2c8f545284cb871866", but that is not in the
>>>> omap4s-exp branch any more. Guess it was gone after a merge. To make things
>>>> building I moved the the head of the branch
>>>> SRCREV = "8b931e51f46acffd61096553ae89dfb3ee30d398"
>>>
>>> That branch is rebased frequently, so this won't help much. The tarball
>>> snapshot for the current revision is available on the angstrom source
>>> mirror, so if you are using angstrom and a recent bitbake you won't get
>>> bothered by the rebasing.
>>> Having said all that, we should find a working repo for panda uboot and
>>> use that. AIUI denx git should work soon.
>>>
>>> regards,
>>>
>>> Koen
>>
>> Guess that is why it was autorev, but on oct 12 you pinned it to the
>> SRCREV that I could not fetch.
>> A solution could be to pin on a rev that is a merge with the denx git.
>> Not sure what the status is of the panda code in the u-boot git.
>> I see quite some patches from Steve (but no idea how much of them are
>> accepted/integrated by Wolfgang.
>
> Using the upstream v2010.09 tag should give you a reasonable u-boot.
>
> The exp in my my omap4-exp branch stands for "experimental", so it
> probably is not a good place to pull from unless you are willing to
> deal with frequent rebases and occasional breakage.
>
> Steve

I figured it would, but as that might have a more severe impact and I
have not pandaboard to test on, it was too much risk to make that
move.
Either someone else need to do this, or as an alternative we could
move to e.g. SRCREV 	b18815752f3d6db27877606e4e069e3f6cfe3a19 which is
a merge from Wolfgang from 4 days ago, which I expect not to
disappear.

Basically my concern was to create a buildable recipe (which I needed
in order to be able to verify whether my james-image build for panda)
(I'll push the james recipes soon, still maturing them)

Have fun! Frans


