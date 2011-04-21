Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QCjGT-0001Fd-8C
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Apr 2011 04:05:05 +0200
Received: by vxd7 with SMTP id 7so1137944vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 19:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=PgaFXlU9a+aCYwFR2UGes++wwBY1proQkMgrA0EOoIQ=;
	b=os0LsCqG9yoWPJii4pU0uVGdZaRljoJWQfjAOaeg0YLqePVm+6PX3Kx4k2AMT6uewl
	bkQNOpsV0h4VsalE52hmOHutmdL6eyIukEsRGkcfRmfWqb6GrF0yPSGdbja4rt/fIsKe
	vqerHZrOvUrWDjj2p9CEKto18pqISP7xYw2Ak=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=Ax4YedRoVJ/tXhvBJIVL9O2qOwmBryxN8jHufiF8/amQfXJXyOcuiB2cGm9z3ZlznN
	1cGuuwuZoJr3BfOjn58zp8LMC5ZnLX/zhMlMYoLqEJ3qbuhHHS7Mkxjw72KY76dxd4yL
	BzIweJ7hb9OFHCVDzlMBgAts3KSxTH/v9x+S4=
Received: by 10.52.182.105 with SMTP id ed9mr360815vdc.38.1303351361084; Wed,
	20 Apr 2011 19:02:41 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.156.226 with HTTP; Wed, 20 Apr 2011 19:02:21 -0700 (PDT)
In-Reply-To: <4DAF8E5C.3040705@appliedminds.com>
References: <4DAF8E5C.3040705@appliedminds.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 20 Apr 2011 19:02:21 -0700
X-Google-Sender-Auth: iisbdn3POLNnJiJSVQPeNUpT4vY
Message-ID: <BANLkTin4pume54zSryqBAZb-Bh0LqRWjbA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: opencv_2.2.bb recipe doesn't install libopencv_core.so
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
X-List-Received-Date: Thu, 21 Apr 2011 02:05:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2011 at 6:54 PM, James Sarrett
<jsarrett@appliedminds.com> wrote:
> I'm trying to bitbake OpenCV for a BeagleBoard-xM, and having limited
> success. =C2=A0OpenCV builds and installs fine into /usr/lib, but it does=
n't
> create (sym?-)links for the base shared objects. =C2=A0In other words, af=
ter
> install there is a /usr/lib/libopencv_<opencvpart>.so.2.2 but no
> corresponding /usr/lib/libopencv_<opencvpart>.so or .a. =C2=A0this causes=
 the
> OpenCV samples to fail to build on the target (they install as source)
> because the cflags and libs returned by pkg-config are inconsistent.
> pkg-config assumes no version numbers (-llibopencv_core etc.).

Install the libopencv-dev package on the target if you want to build
against it...
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


