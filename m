Return-Path: <net147@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id A4D9165D56
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 02:30:27 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id m20so4434650qcx.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 19:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=QbQ3cj3ooaVievvM6LCxVdv+6DbVH02ELHxgNopByTE=;
	b=VzMi6x06PkY6VS57cZ94ii7COq+kHf5TKjPGnj6bqPi1LY4UKEso2XjbmnolFJZhmu
	E9RWjwQWHOW5CeOHgS78E//GhC9zCEpIJ9IF1HIQ89oIQkJnBogmRnijT4YMAwkh3HS6
	mGpqUhKDIDZ5fh/eSot3VbQbwFPmgcDOUXzJImpRT79xOgLibmzEx8ir2ErSgLXCHtgk
	aCTNjV/8XT6l7/m5HSeTQQ0HxkaC+ZUdAJGYOXrGR8K8UYcbKbYXPN1+j8rBVf0SL4hA
	mFqiAqnkZheWhqHTCCiPFR5KrddpiAqBmk5AXB3CaGS1VdoD1PAnW/LJYHfBbI6Enrxo
	lCFw==
MIME-Version: 1.0
X-Received: by 10.224.112.69 with SMTP id v5mr1423051qap.28.1413167428888;
	Sun, 12 Oct 2014 19:30:28 -0700 (PDT)
Received: by 10.96.4.133 with HTTP; Sun, 12 Oct 2014 19:30:28 -0700 (PDT)
In-Reply-To: <F50ED7964AF8784493DDA71A307917F96F0F63@BEXBE01.christ.local>
References: <F50ED7964AF8784493DDA71A307917F96F0F63@BEXBE01.christ.local>
Date: Mon, 13 Oct 2014 13:30:28 +1100
Message-ID: <CANwerB0v4XbEzvD+9j-iGy-nrN1AF3_qFYii8b75U-qBwa6aLg@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Peter Fink <pfink@christ-elektronik.de>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] How to build Qt5 with 'designer' module?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Oct 2014 02:30:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On 9 October 2014 18:13, Fink, Peter <pfink@christ-elektronik.de> wrote:
> I=E2=80=99m trying to build a Qt application with the toolchain generated=
 by openembedded (meta-toolchain-qt5).
>
> The application needs the designer-module, which I thought was included i=
n the qttools package, but now I get the following error:
>
> =E2=80=9CProject Error: Unknown module(s) in QT: designer.=E2=80=9D
>
> What do I have to include to get the designer module?
>
> Another thing I run into was the missing syncqt.pl script in the toolchai=
n as I need qftp. A link syncqt -> syncqt.pl was present.
> Is it missing by accident or for a reason?
>
> I was using Qt. 5.3.1 02861e677ab....

You can try backporting the following patches:
http://patchwork.openembedded.org/patch/81599/
http://patchwork.openembedded.org/patch/81603/

Regards,
Jonathan

