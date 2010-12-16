Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PTDzC-0003KW-Od
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 14:35:11 +0100
Received: by wwi17 with SMTP id 17so2179249wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 05:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pkB8eEKLZnh25ZxnpHLJ1MEMvUbV0dcPTG9pnbWHXVM=;
	b=Dfw1KgFDSBm2S6iCsxqG4A/on8As4lfWyb+KbtP39tKoTM3zK1OcS5NStHIedgcB5n
	Um2I4HNd1Q5GAHNXMLyrLW4TsuvJ5i5xXIN/QN+fX61915P/CWamMiIRIR9VPGkVKl7N
	0pGRyKhMXgi1iKCmGXrppGOn/BsQzQBXuDqqM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EXTUxJm9fULiWJQCoG+1j7Tj/UDhCNiFusZERpI5MPeAb83sZ3WUx97hf7171ZeZbq
	fv8Q5qlv9ix0o5RJac3A5jMkrSj0Q9/bv2hVEhI1c3b7Eeh6Zlhs8/POxT1cwHuaurNn
	2YGL96LzNGLuUpZYFHGdt60OEHkrDNTs2T86o=
MIME-Version: 1.0
Received: by 10.216.24.134 with SMTP id x6mr2322002wex.34.1292506408042; Thu,
	16 Dec 2010 05:33:28 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Thu, 16 Dec 2010 05:33:27 -0800 (PST)
In-Reply-To: <4D08D3F5.1060608@mentor.com>
References: <AANLkTimTaZyPywc_B8g4k4QO+gTJq67K=OgcoSe6BpJh@mail.gmail.com>
	<4D08D3F5.1060608@mentor.com>
Date: Thu, 16 Dec 2010 08:33:27 -0500
Message-ID: <AANLkTimuRa8EC=U_CvgiZV1tWySg_AQTwWBQTxdpv7Zn@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing 2010-12-10 (wiki, results, bluez-libs)
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
X-List-Received-Date: Thu, 16 Dec 2010 13:35:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2010 at 9:43 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 12/15/2010 12:51 AM, Frans Meulenbroeks wrote:
>>
>> Dear all,
>>
>> I just wanted to update the testing table with my entries and I
>> noticed two (possibly related) things.
>> - no other entries for 2010-12-10 are there yet (and it is already
>> wednesday)
>
> I haven't updated the stuff we're building since just about everything
> failed due to the gcc issue Khem fixed in
> 2c8570552549da2e11428d08b2bc08849cac39b1. =A0This is why I sometimes wond=
er if
> it would be desirable to cherry-pick a few things in to the testing-next
> branch.

One of my concerns is coordinating with all the people doing testing
if we start committing to the testing-next branch.  How do we know who
restarted builds, etc.  I guess we could assume the cherry-picked
changes would be minor enough that people who have already finished
builds would not need to re-build.

At this point I'm just more inclined if the weekly testing branch
crashes and burns horribly to just throw away that week, and focus on
getting things fixed in the master for next week.  Its not perfect,
but with so many people participating, it seems like we need to keep
it as simple as possible.  But, keep the ideas flowing, and perhaps
something better will emerge.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


