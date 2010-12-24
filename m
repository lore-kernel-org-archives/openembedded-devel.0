Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PW9TH-000295-CK
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 16:22:19 +0100
Received: by gwaa12 with SMTP id a12so675383gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Dec 2010 07:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=6NM8udv4+DKYsQngB7c407n+GTDPyAifEFOvHlfeO8Y=;
	b=D/vCVjJPGV/zwnQvPWE2k2xgnPDjM8qN6fwO0fJcU8RNqBW1NaaZ8HjldHt0Ey3ak+
	0Sc6uigTFuGcpuSwlr6gltpMXCFvOEVw9ucJ1f10yZViIXE5/TNqlRchLCOggJIFQQDR
	u2OfKCBSiZALGa+BSoYsGsIkLbWJ7Tmg8hALY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=wNh34TNguvaUAHwmLE/rzoi9JG6sUs7jWIo5FHNHV8zfN70psGf05IROao+ocnCgQu
	SehqNMxpvyLLD47s6K8J6eZ/JDtae6tcjNMLH8v2f7imyUDr+p9Kwt2DAPLlBhWWjX98
	FhcouZPgU9Nt1K4PNw9BXEW4t8KSS+WEeRciM=
Received: by 10.91.163.27 with SMTP id q27mr909616ago.139.1293204125129; Fri,
	24 Dec 2010 07:22:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 24 Dec 2010 07:21:45 -0800 (PST)
In-Reply-To: <AANLkTi=YRSMBzSihPEddjSNR+B7UFGWcAr_P9AgGs3eQ@mail.gmail.com>
References: <AANLkTi=YRSMBzSihPEddjSNR+B7UFGWcAr_P9AgGs3eQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Dec 2010 07:21:45 -0800
Message-ID: <AANLkTinucpseeTTp=KHr_UVRp25RuRkxWcEaued564Ld@mail.gmail.com>
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
X-List-Received-Date: Fri, 24 Dec 2010 15:22:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 24, 2010 at 12:33 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> I was wondering whether it is better to avoid addtask where easily possib=
le.
>

If the tasks are logically inline in existing tasks then it would be
ok. Although I dont know the big O notation of
runqueue algorithm to ascertain the gain.

> E.g. from one recipe:
>
> do_postpatch() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf patches && rm -rf .pc && mv -f debian/p=
atches patches
> && quilt push -av
> }
> addtask postpatch after do_patch before do_configure
>
>
> Wouldn't it be simpler and probably even a little bit faster just to say:
>
> do_configure_prepend() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf patches && rm -rf .pc && mv -f debian/p=
atches patches
> && quilt push -av
> }
>

Well this seems more like a patching task then configure to me.

> (or if there is already a do_configure_prepend add the line to it)
>
> Currently we have 142 addtasks and some of these are definitely useful
> and desirable but I feel a lot of these could easily be merged into
> the previous or next task.
>
> How do you feel about this?
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


