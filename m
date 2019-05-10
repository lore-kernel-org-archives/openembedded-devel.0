Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9249D7E0D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 16:55:03 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id w1so3110175ljw.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 09:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uRgXdSgv0f7x6170a9tJzXNxPsN2DmokjCWvUAKnchY=;
	b=bv/yma2vp84bPK0BhMaXsMhZjIZAllVfy12uJYr9KR3G8vmYuqJ6BR88VehsMR//L1
	3fO5Qi5peU560vVwc5KTdCrYf4bJb4o1LY9bIoXtDr7m7kzxkOtw9ik0ma4Nl2O/zJF6
	faWHjT+QNyR2xJx4o/jiWiSSGAiJNaoPL9WPbbupzR7xAZryglHOQcItZHCVQZ4qajL0
	2yRx4SL3tsnpK09vmCsyWfx3FwnTQ3RCwPNUhnpxzpveBoM/5Mow+AEi1IjyB7x18BMl
	Bqt0tAo6oEo1bKKkxvkCFu/wYlO5CUt90pQX7ihLkupgXapq59x/smTeMQ1bmqqvj3Ii
	IOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uRgXdSgv0f7x6170a9tJzXNxPsN2DmokjCWvUAKnchY=;
	b=UVQIvkvS+OgOCO/PldVl1uTfzsslgV+6LdnuKFliNjNNv0HLBmtzOsJvtRtBTJIR9e
	//DOR0TLFT+V1l65RWLQKwmbSs4e80S7ZpWpm6JHoa+D65o4clCj52yVBj+uVrDWoWSP
	4T4bKTJ9SqN0pNUj6VBfNXE5cOKrxBbmWS7HgNBrCNbpr8D80nWTj+IFswVcxvxK+Utc
	StgxcNUvhcRu0CHhx1wD1HH8xVEppzDJbOqmgR/jWnjcw4aQ1rfKj3/ZzEDpNQO595q6
	Ha1MdjaTtptNZ8eJ2aaElWLKj2pFarMxqV4yIgYPNWbZJJfJ9VPlcou4bNC/zLIiyGdc
	olsQ==
X-Gm-Message-State: APjAAAXdH2TO8tuT6UdK9Qb4vGbDfibtlobXPkEpBASlaAV4SQgpqDYn
	rBDU7Xfc7iSxLfe6uQzEx9qmrG6DGtGJ0ZB8nGKzgA==
X-Google-Smtp-Source: APXvYqyOXT7hRPU0QPrFolXzh9lOstxhTT0IHy2VFW/DKaeuWZwDMJQ2SJwGn24N5fcIVajoo4cP+6C3ubHPEhKgbck=
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr6452601ljg.145.1557507304457; 
	Fri, 10 May 2019 09:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190430060855.60494-1-sean@geanix.com>
	<CAP71WjyBr94m0gH4MBG7CEpQcS01UP9ia1Ay9S6zueJdeT-Jcg@mail.gmail.com>
	<8EC4636E-7D85-4364-8864-23BF2DC610DB@geanix.com>
In-Reply-To: <8EC4636E-7D85-4364-8864-23BF2DC610DB@geanix.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 10 May 2019 18:54:53 +0200
Message-ID: <CAP71Wjyy03gd62DqgZqod_sncQgBH2FPO1CfViJcQBXCNQhOKg@mail.gmail.com>
To: =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] cannelloni: new package, CAN to ethernet proxy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2019 16:55:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2019 at 6:49 PM Sean Nyekj=C3=A6r <sean@geanix.com> wrote:
>
>
>
> > On 10 May 2019, at 15.08, Nicolas Dechesne <nicolas.dechesne@linaro.org=
> wrote:
> >
> > On Tue, Apr 30, 2019 at 8:09 AM Sean Nyekjaer via Openembedded-devel
> > <openembedded-devel@lists.openembedded.org> wrote:
> >>
> >> Tool for sending SocketCAN messages
> >> over Ethernet tunnel.
> >>
> >> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> >> ---
> >> Changes in v2:
> >> - Added PV
> >>
> >> .../cannelloni/cannelloni_git.bb                | 17 +++++++++++++++++
> >> 1 file changed, 17 insertions(+)
> >> create mode 100644 meta-oe/recipes-connectivity/cannelloni/cannelloni_=
git.bb
> >>
> >> diff --git a/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb=
 b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
> >> new file mode 100644
> >> index 000000000..df75e6342
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
> >> @@ -0,0 +1,17 @@
> >> +SUMMARY =3D "a SocketCAN over Ethernet tunnel"
> >> +HOMEPAGE =3D "https://github.com/mguentner/cannelloni"
> >> +LICENSE =3D "GPLv2"
> >> +
> >> +SRC_URI =3D "git://github.com/mguentner/cannelloni.git;protocol=3Dhtt=
ps"
> >> +SRCREV =3D "44080bb021d1a143e6906f2ec4610513c4e1cece"
> >> +
> >> +PV =3D "20160414+${SRCPV}"
> >> +
> >> +LIC_FILES_CHKSUM =3D "file://gpl-2.0.txt;md5=3Db234ee4d69f5fce4486a80=
fdaf4a4263"
> >> +
> >> +inherit cmake
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +PACKAGECONFIG ??=3D "lksctp-tools"
> >> +PACKAGECONFIG[lksctp-tools] =3D "-DSCTP_SUPPORT=3Dtrue, -DSCTP_SUPPOR=
T=3Dfalse, lksctp-tools"
> >
> > lksctp-tools recipe is in meta-networking, so we've added an implicit
> > dependency on meta-networking by taking this patch. should we disable
> > lksctp-tools support by default?
> I completely missed that. :-D
> It seems to be the correct solution, to disable it by default...
> Will you send a patch?

I would prefer the other solution Khem proposed, and move it to
meta-networking.. what do you think?

>
> /Sean
> >
> >> --
> >> 2.21.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

