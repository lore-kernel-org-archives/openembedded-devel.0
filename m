Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NRtll-0000xU-TO
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 21:43:21 +0100
Received: by yxe1 with SMTP id 1so14377209yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 12:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Ik34IOItyC2/AtyThCs4g69y2Wv6JDKvBvjhAV2zFCM=;
	b=i1vU4VgXGP5CoyUJiX5CPMr2WEe0HW40CG/uaQOsmuluc7UlozKBBHeb+JCS402qq6
	OggwKRajC3NiKm21iaY3KQd7/uXgSLeiCqkMDpEfXRrOCqzo06x/5xcNtMbZx8B+WC7G
	GGRR1KVkMedn0hlf8qHLKrIezEaiNJXNIbsMg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TGzPq/3ZCLBQjq9WPNasxiNdvcot3KR8+hUmOMFAK6ryNhWjJNnSRSp9OOQap5C6/M
	3spqCNK1zgGJth3UTAUAwfO96tQmLQgY7AsMX5oE2+ydQitqsxdjccL4Vdt21i0eOTSK
	RbuXOGPYXhqpbwQel47aJydklmSn9kELYNjM0=
MIME-Version: 1.0
Received: by 10.101.141.11 with SMTP id t11mr25299144ann.18.1262637673404; 
	Mon, 04 Jan 2010 12:41:13 -0800 (PST)
In-Reply-To: <hhtj8l$acs$1@ger.gmane.org>
References: <ac9c93b11001030833v6236cb2ew11627fb47a6d7fa8@mail.gmail.com>
	<1262552980.2553.104.camel@lenovo.internal.reciva.com>
	<ac9c93b11001032331g641d1015hb7191696fdf5bb65@mail.gmail.com>
	<1262620565.8748.246.camel@dax.rpnet.com>
	<ac9c93b11001041214w71476fedrcfa5a9cfb7137ebc@mail.gmail.com>
	<hhtj8l$acs$1@ger.gmane.org>
Date: Mon, 4 Jan 2010 21:41:13 +0100
Message-ID: <ac9c93b11001041241m29cb8c57rb11b358257e486e1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: qmake issue
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
X-List-Received-Date: Mon, 04 Jan 2010 20:43:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/4 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 04-01-10 21:14, Frans Meulenbroeks wrote:
>> 2010/1/4 Richard Purdie <rpurdie@rpsys.net>:
>>> On Mon, 2010-01-04 at 08:31 +0100, Frans Meulenbroeks wrote:
>>>> Yeah figured out after a brief discussion on #oe that they probably
>>>> didn't need to be staged.
>>>>
>>>> Actually the recipe does not contain any staging, so this is a side
>>>> effect of the new automated staging.
>>>> It could well be that other, =A0non qmake recipes also suffer from thi=
s.
>>>>
>>>> The fix for mythtv is probably to have an empty do_stage()
>>>>
>>>> However as a general rule the -L and -I flags to staging should be
>>>> last, not first.
>>>> And, ideally, when building a recipe the old contents from that
>>>> package in staging should be removed first.
>>>> By removing that we avoid the problem that if rX adds a file A to
>>>> staging and rY does not do so any more, the file A still remains in
>>>> staging (although perhaps incompatible with what rY made.
>>>
>>> If packaged staging is enabled this should happen already...
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>> Ehm, I use angstrom unstable head on the beagleboard.I've been told on
>> #oe that angstrom used pacakged staging.
>> I've removed my tmp dir and rebuild from scratch on dec 30, 2009,
>> including mythtv.
>> Yesterday I rebuild the latest version of mythtv, and it linked
>> against the myth lib in staging (produced by the same recipe).
>> As the lib was changed between those versions it gave a linking error.
>> After removing the lib from staging manually and rebuilding mythtv
>> builds properly.
>> To me this seems there is still a problem.
>
> Packaged-staging only works if you have built opkg-native, otherwise it
> won't remove things from staging. The problem is that you can't to
> 'bitbake opkg-native' twice, so the angstrom buildscripts now do:
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/commit/?h=3Dorg.op=
enembedded.dev&id=3D6fb8200b0002fad7ed4b67b7b5a01a54bc3db91c
>
> regards,
>
> Koen


Ah ok, understood, Should opkg-native then not be build in the
beginning of the build process?
I would like to see it build automatically next time I rm my tmp dir...


Frans


