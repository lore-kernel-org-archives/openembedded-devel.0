Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NrUHf-0003Fr-LV
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 11:46:04 +0100
Received: by fxm27 with SMTP id 27so339874fxm.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 03:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=3Qbw9K0ww2zY9Ofc/EyP386MjoGvOsZca8Zbh0p6G64=;
	b=JuIaKm/rAAWpL2HFb3mVCcqFYdbrIbcsLZD6lE7tnUiP9LB4/XPk3Y2edri2RnAONF
	CvsiCM27Vn+wVwUYfcmtkADGITsDVHd19FHgqwJ5cfwORsYuCZDfa9q5y4IrfaB6idFS
	I3t0Hzf8mZcfYqiF02RFv56JzrDlWyU24X0Hg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=fRvgUe0LsKs0XwD9U+y7u47NcFoLaIkQGnqYtULDbgBT1B+8d9/pFik4Q4SYG4g2ou
	9sgVRHFFcLEjE1tG+rvC5nsfEgoGs4LlIUrAfuMTtcQTjZktt55hbAhWtIAxM1MZTPOI
	wd4Z+6QWy6sB2zQLBPtgYjlGoX27O49o9abyM=
Received: by 10.87.73.13 with SMTP id a13mr908235fgl.44.1268736177325;
	Tue, 16 Mar 2010 03:42:57 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm3807577fxm.14.2010.03.16.03.42.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Mar 2010 03:42:57 -0700 (PDT)
Date: Tue, 16 Mar 2010 11:42:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100316104251.GD29306@jama>
References: <1268732997.3990.6.camel@mattotaupa>
	<ac9c93b11003160258m2433be87s9794def341e14fc1@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11003160258m2433be87s9794def341e14fc1@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ffmpeg: Stage `avconfig.h` which is built at compile time.
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
X-List-Received-Date: Tue, 16 Mar 2010 10:46:04 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Mar 16, 2010 at 10:58:39AM +0100, Frans Meulenbroeks wrote:
> 2010/3/16 Paul Menzel <paulepanter@users.sourceforge.net>:
> > This header is needed for `libvalhalla`.
> >
> > Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> > ---
> > Could someone please test this with `ffmpeg_0.4.9-pre1.bb` as it includes `ffmpeg.inc` too.
> > ---
> >  recipes/ffmpeg/ffmpeg.inc |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> >
> > diff --git a/recipes/ffmpeg/ffmpeg.inc b/recipes/ffmpeg/ffmpeg.inc
> > index cd330f8..437a822 100644
> > --- a/recipes/ffmpeg/ffmpeg.inc
> > +++ b/recipes/ffmpeg/ffmpeg.inc
> > @@ -61,6 +61,8 @@ do_stage() {
> >            install -m 0644 ${S}/libavutil/$h        ${STAGING_INCDIR}/ffmpeg/$h
> >            install -m 0644 ${S}/libavutil/$h        ${STAGING_INCDIR}/libavutil/$h
> >         done
> > +        install -m 0644 ${B}/libavutil/avconfig.h ${STAGING_INCDIR}/ffmpeg/
> > +        install -m 0644 ${B}/libavutil/avconfig.h ${STAGING_INCDIR}/libavutil/
> >
> >         install -d ${STAGING_INCDIR}/libswscale/
> >         install -m 0644 ${S}/libswscale/*.h ${STAGING_INCDIR}/ffmpeg/
> > --
> > 1.7.0
> >
> 
> It might be better to try to move to the new default staging (by
> removing the do_stage and testing whether it installs the required
> things in staging).

I agree it would be better, but right now it fixes mplayer build, so I
would like to push it as-is + INC_PR bump.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


