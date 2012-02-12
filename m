Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rwh7s-0001tb-Mm
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Feb 2012 22:38:30 +0100
Received: by lahc1 with SMTP id c1so3677928lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2012 13:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=7QCHwOfCFhbx/skocK87deLX+OTy87Pj4DRZy3z1IK8=;
	b=XDYBJFbBEpZ2kqWrfkZJRNUMnNplEcGOCb8yvfdNREmp4IEjg6eKdlttkIO2lLAfiy
	EehKvUdwakgRDU8OnXS8Kt4b+JmC0D1TJpK+DEmmomKA+elw4bD9IIkzC5pCsG8T4kmV
	DU/qos5u6Mk0Dn3CYXIAMiR1tOxubAlwnZnnw=
MIME-Version: 1.0
Received: by 10.112.103.8 with SMTP id fs8mr4702935lbb.39.1329082219362; Sun,
	12 Feb 2012 13:30:19 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Sun, 12 Feb 2012 13:30:19 -0800 (PST)
In-Reply-To: <jh6qk3$vck$1@dough.gmane.org>
References: <1328919245-27394-1-git-send-email-schnitzeltony@googlemail.com>
	<jh6qk3$vck$1@dough.gmane.org>
Date: Sun, 12 Feb 2012 22:30:19 +0100
Message-ID: <CALbNGRSpaCQ+0rWxMOrurUVArmmVou6-KsYDSnsPujj+faMVng@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce] xfce4-session: move static libraries to ${PN}-staticdev to avoid QA warnings
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
X-List-Received-Date: Sun, 12 Feb 2012 21:38:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2012 at 11:37 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 11-02-12 01:14, Andreas M=FCller schreef:
>>
>> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com> ---
>> .../xfce4-session/xfce4-session_4.8.2.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A04 =
++--
>
> Which of the other patches listed in
> http://patches.openembedded.org/project/oe/list/?q=3Dmeta-xfce should I p=
ush
> as well?
>
> regards,
>
> Koen
20803: [meta-xfce,3/3,v2] xfce4-panel: Remove static version of panel
plugins: OK but needs a PR Bump. Who takes care?
20697: [meta-xfce,3/3] xfce4-panel: Disable building of static
libraries: Peter: can you please mark this one as superseded in
patchwork?
20695: [meta-xfce,2/3] xfce4-settings: Update to latest stable version
4.8.3: New recipe starts on PR =3D "r1". Who takes care?
20699: [meta-xfce,1/3] xfconf: Update to latest stable version 4.8.1:
This can't go in like this. Peter: can you please mark this one as
superseded or rejected in patchwork?
20691: [meta-xfce] xfce4-power-manager: Add initial recipe for version
1.0.10: This one can go in.

Andreas


