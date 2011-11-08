Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RNrMC-0002iN-D5
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 20:29:16 +0100
Received: by qyk9 with SMTP id 9so1137626qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Nov 2011 11:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=hG4fURSlbwOQWecqY0hOO26r2RmL+vlo6fphX8sJezc=;
	b=I5wnlOccQI82TZ09kT+AEnPATgicmHddFTcg+UyOa40MAuQ+lTff6KLmdtFjq3JFbn
	fal4HIIMrWS4WMEOBXkDy63hPiUcsDpdoPMwyK7laZZKCmOkfstTAXlWcrntPqerPtP3
	QJIUj1VUF3XF71EldWYGo4xHdJy1aTqPbAcPc=
MIME-Version: 1.0
Received: by 10.229.52.143 with SMTP id i15mr4011847qcg.188.1320780181372;
	Tue, 08 Nov 2011 11:23:01 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Tue, 8 Nov 2011 11:23:01 -0800 (PST)
In-Reply-To: <CAPOJ94PUaBtZkRHE_v_x4raOQZnBtHp9bt6mvoMjZGmPTQ=-jQ@mail.gmail.com>
References: <CAPOJ94PUaBtZkRHE_v_x4raOQZnBtHp9bt6mvoMjZGmPTQ=-jQ@mail.gmail.com>
Date: Tue, 8 Nov 2011 12:23:01 -0700
Message-ID: <CA+M6bXkfk40ztOn+WFocLFGzLRU6PE4z5Qf_9=NAnhO_U4QFSg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: forcing dependency on genext2fs-native
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
X-List-Received-Date: Tue, 08 Nov 2011 19:29:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 8, 2011 at 11:25 AM, Peter Bigot <bigotp@acm.org> wrote:
> I've added a DEPENDS +=3D "genext2fs-native" for a recipe in meta-ti,
> but the corresponding package is not getting built. =A0bitbake -DDD
> says:
>
> DEBUG: Added dependency genext2fs-native for
> /prj/oe/angstrom/sources/meta-ti/recipes-misc/images/cloud9-gfx-image.bb
> DEBUG: providers for genext2fs-native are: ['genext2fs-native']
> DEBUG: sorted providers for genext2fs-native are:
> ['virtual:native:/prj/oe/angstrom/sources/openembedded-core/meta/recipes-=
devtools/genext2fs/genext2fs_1.4.1.bb']
> DEBUG: adding virtual:native:/prj/oe/angstrom/sources/openembedded-core/m=
eta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb
> to satisfy genext2fs-native
>
> I'm guessing the "virtual:native:" means somebody thinks genext2fs
> should already be installed on the host. =A0It's not available on
> Fedora, so this decision is wrong. =A0I haven't been able to figure out
> what's causing this to happen.

No, it means that the "virtual:native" (coming from BBCLASSEXTEND in
the recipe file) is being selected to provide "genext2fs-native"
(since in many cases we don't have a separate -native recipe, we just
use BBCLASSEXTEND).  What's probably happening is that you need
genext2fs to exist for a specific task and just "DEPENDS +=3D
genext2fs-native" really means "make do_configure depend on
genext2fs-native being in the sysroot".  Did you modify
cloud9-gfx-image?  It should already get the DEPENDS right for
populating the image.

--=20
Tom


