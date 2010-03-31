Received: from mail-iw0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nx1iG-0002AZ-LY
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 19:28:22 +0200
Received: by iwn8 with SMTP id 8so325377iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 10:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2j9zfuQtc9WsxkrTniaqkVonMMnNPFfc1Nl32pfifF8=;
	b=jqtuAUSkdlvD6BKir/0bzLgpKVCtmZ0fZekA8VYS5jZWCjoKilfoTBHV6bRAMDFkw1
	Kt9lhP6cqVwv+gNSeJ1NTvFADbv7n0VitDu+k/O83abWNMgEIvQR00Kh4X4MILA9vqbn
	wx12KMGhS9ebqa8FCjNvoJqYv/IsuMUaT3aEE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=SFuiHEu6L5LVNaD/Q4eJKSlSHoI8UajdzdHDMdqdJ2QthoAPGwq6++qNHvdrIhsq3g
	Pnq78nuw30bEwy9RT1GiwbAZEbMkqXIf1a1OMSwip7IEoKXp+Un4k1BzXqzrki2pWgTV
	KGrpFmWP23wkQ88NAI30VaFIwhyDctrHfiUBM=
MIME-Version: 1.0
Received: by 10.231.32.66 with HTTP; Wed, 31 Mar 2010 10:25:03 -0700 (PDT)
In-Reply-To: <1270034881.1681.965.camel@rex>
References: <1270034881.1681.965.camel@rex>
Date: Wed, 31 Mar 2010 10:25:03 -0700
Received: by 10.142.9.33 with SMTP id 33mr871550wfi.0.1270056303557; Wed, 31 
	Mar 2010 10:25:03 -0700 (PDT)
Message-ID: <x2z19c1b8a91003311025w5516e09at69ad3d50134f0380@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc Recipes
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
X-List-Received-Date: Wed, 31 Mar 2010 17:28:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2010 at 4:28 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> I've just been looking over OE's gcc recipes and they really depress
> me :(. People touch them just enough to tweak their specific problem
> with no real thought going into the overall architecture and its a
> sprawling mess. I tackled some of this a while back. Sadly its just
> getting worse again.
>
> I've spent some time looking at them trying to identify what I consider
> to be the main sources of ugliness and how we can try and improve the
> situation. I think it might help to set a high level goal for the gcc
> recipes which would be:
>
> =A0 All configuration for a given gcc version should be contained
> =A0 within the high level version specific .inc file(gcc-X.Y.Z.inc).
>
> We'd therefore be frowning on version specific hacks in say the cross
> recipes only.
>
> It would follow that there would be a clear set of include files and a
> clear include structure and that almost all of the variant gcc recipes
> (gcc-cross-initial, gcc-cross-intermediate, gcc-cross-kernel,
> gcc-cross-sdk, gcc) would be boilerplate includes.
>
> Note that information about flags for the cross builds can be included
> in the main common version specific include file.
>
> To illustrate the kind of thing I mean, have a look at this commit:
>
> http://git.openembedded.net/cgit.cgi/openembedded/commit/?h=3Drpurdie/wor=
k-in-progress&id=3D35481122d7e484fb740ad9440fb4c70cb01de48f
>

in one place you removed DEPENDS that may not be correct. Because
DEPENDS get overwritten in gcc-cross-initial.inc


diff --git a/recipes/gcc/gcc-cross-initial_4.0.0.bb
b/recipes/gcc/gcc-cross-initial_4.0.0.bb
index 976cd96..1639511 100644
--- a/recipes/gcc/gcc-cross-initial_4.0.0.bb
+++ b/recipes/gcc/gcc-cross-initial_4.0.0.bb
@@ -1,6 +1,2 @@
require gcc-cross_${PV}.bb
require gcc-cross-initial.inc
-
-DEPENDS +=3D "gmp-native mpfr-native"
-
-EXTRA_OECONF +=3D "--disable-multilib --disable-libssp --disable-libmudfla=
p"




> The nice thing about this is all of a sudden we have all the flags in
> the same place and it becomes obvious if something is wrong. There are a
> few things that raise an eyebrow there. It also becomes easier to
> abstract some of the gcc-X.Y.Z.inc data into a common include file
> (maybe a gcc-4.3.X.inc for example).

I this this is a good idea. We could even capture some bugs like in
some recipes we use EXTRA_OECONF_BASE +=3D and in some EXTRA_OECONF_BASE
=3D

>
> Does anyone else fancy helping trying to clean this mess up. I'm happy
> to review some cleanup patches?

I plan to do some of this restructuring when I am back from my time
off in end of april.

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


