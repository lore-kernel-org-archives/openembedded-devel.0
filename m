Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PElH7-0001Ci-CU
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 17:05:54 +0100
Received: by yxe42 with SMTP id 42so2812436yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 09:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=8hB6EO8dyA3e9BoL5N8HSKbMVteqLzjF6jUQR4x4YL0=;
	b=UpPc7+z6290SKu1wTGhwUoFoD8HCiMnzIEwqdnV53S2RfkcWEHYC4carVj6Ma5S82N
	YvL472aYKE3/V/K/JXE0zX8TqE5SWu20G5inBiZSVIMvxHB4HOoAqT1ZDa69d7OtSTih
	0bVT4CxtFzKNOPyqNny61tAD3jiwcyo0Jomb4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=BfoTFSACbNF6zljPbgQO4IWGrz2d4suPzIXkBQvvRzR7LjsvWFd9fJYzLI/lyMfW64
	CCDo7LS7MvgsPOv0egfYAIAWBMXS9zu0I79vbQI22qdn1H/x6yKb42n9UmuVN+kFSOMR
	T9NvhB/JC1TaGLhIPpnr3iYYSF4Q26b97soOE=
Received: by 10.91.44.12 with SMTP id w12mr2898936agj.64.1289059498631; Sat,
	06 Nov 2010 09:04:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Sat, 6 Nov 2010 09:04:37 -0700 (PDT)
In-Reply-To: <20101026125549.205470@gmx.net>
References: <20101026125549.205470@gmx.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Nov 2010 09:04:37 -0700
Message-ID: <AANLkTinTRS_73dA0Hb3WQQ_GY8PJ2Tc=Ye-VJwBWcZLi@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] fix for older glib-2.0 versions to build with recent autotools
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
X-List-Received-Date: Sat, 06 Nov 2010 16:05:54 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 26, 2010 at 5:55 AM, Alexander Stohr <Alexander.Stohr@gmx.de> wrote:
> the attached patch bundles a single fix for glib-2.0
> for recipes built upon glib tarballs 2.6.4 to 2.20.4.
> later versions have the problem fixed in tarball (e.g. 2.22.1 and newer).
>
> the problem happens when you need to update autotools
> for some other reason (e.g. building some newer package)
> whilst not wanting to update glib at the very same time.
> it manifests by a badly clobbered "fi" in configure step
> and thus a still open nesting level when the script ends.
> the auto tools generated script exposes "fiAC_..." that
> originates from a too extensive use of the "dnl" statemnt.
> that construct is only critical with newer auto tools.
>
> the fix removes those problematic extra keyword.
>

Applied. Next time please follow the patch submission
guidelines described in wiki otherwise I will ignore such
patches which need manual work to be applied.

-Khem


