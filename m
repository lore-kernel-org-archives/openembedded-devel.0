Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PW9vm-0002jg-Kb
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 16:51:46 +0100
Received: by wyb40 with SMTP id 40so7282383wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Dec 2010 07:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=iBLmf0ZHC55zHkpE4Hi71WCVUVJ2tb2XWHD6cHv7cNE=;
	b=OmT3XArvzSumFZEO9VQLG9Fs2j7IuTNP++Qeahiu6BXFFJ+X3TtthQyQJeVJjChKDV
	e1CjDTpnq811q6WNDWRD1cfKVSIVgLa1xW61DFDUHA2KWDYsxlfHnVUu2hpCEucUpAUA
	8kulWtUB3cZkcEZQsm+Xg0ONR/ccVG48jO1+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=HOTuRKbdiSNmCEKTgdGNpxyAZtOmBwtSzIuvHoGm8OJoo5MRf5/VweFGQwVmNPA4iJ
	I+it7QXpHItmWcKViFrQHVhPm1/fFK/gRSSdmFpamDZ0a55itIIgVz03eb6O3izUi1vv
	vyyDK27dU4NhC41V5th5FRohfj1VXJ7HFWSdI=
Received: by 10.216.35.83 with SMTP id t61mr3583543wea.1.1293205896629; Fri,
	24 Dec 2010 07:51:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.67.67 with HTTP; Fri, 24 Dec 2010 07:51:16 -0800 (PST)
In-Reply-To: <AANLkTinucpseeTTp=KHr_UVRp25RuRkxWcEaued564Ld@mail.gmail.com>
References: <AANLkTi=YRSMBzSihPEddjSNR+B7UFGWcAr_P9AgGs3eQ@mail.gmail.com>
	<AANLkTinucpseeTTp=KHr_UVRp25RuRkxWcEaued564Ld@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Fri, 24 Dec 2010 08:51:16 -0700
Message-ID: <AANLkTi=QJoEEiWNPJ+RLvpmStbnM9S825tWtX-beCG-O@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: avoid addtask?
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
X-List-Received-Date: Fri, 24 Dec 2010 15:51:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 24, 2010 at 8:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Dec 24, 2010 at 12:33 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> I was wondering whether it is better to avoid addtask where easily possi=
ble.
>>
>
> If the tasks are logically inline in existing tasks then it would be
> ok. Although I dont know the big O notation of
> runqueue algorithm to ascertain the gain.

Personally, I'd rather recipes stuck 100% to setting variables and
including files and inheriting classes, as simple and declarative as
possible, rather than changing behavior.  It shouldn't be their
responsibility.  I'd rather see the classes define tasks for common
things and let the recipes create the definitions for those tasks than
actually add their own, personally.

>> E.g. from one recipe:
>>
>> do_postpatch() {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf patches && rm -rf .pc && mv -f debian/=
patches patches
>> && quilt push -av
>> }
>> addtask postpatch after do_patch before do_configure
>>
>>
>> Wouldn't it be simpler and probably even a little bit faster just to say=
:
>>
>> do_configure_prepend() {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf patches && rm -rf .pc && mv -f debian/=
patches patches
>> && quilt push -av
>> }
>>
>
> Well this seems more like a patching task then configure to me.

I agree, this should likely just replace the patch task with its own
implementation.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


