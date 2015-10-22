Return-Path: <gurrieristefano@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id ADC9577106
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 14:23:51 +0000 (UTC)
Received: by iow1 with SMTP id 1so92756798iow.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 07:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=360JsIfZOrDddRMEZhqsjA8wew6WaX+oxKaO+24nitQ=;
	b=dir3rRI0WM2X5HXNgYSZoD0r8sgagjZP95jKPN8pVb30bDy2jJ/YkgetF3uQY6LcnH
	a8PxyZwCN9KhtcWyfATW4WCDhpCUDkji3CKKUvXlwvPQjYEMun1L/UriAvEJCdaEvcmP
	7zYH0kk+bX8abW1cDxPA1444esUsS8Lc7PrW//TAu8PFsFecX2UkIr+KL3FyoGuMN70v
	W4ZjmcZ4w4rNArVi2ryerER/FP2B8f/+zZO/GkRkI60sy1TmasLDd+IvvD0jJfirYOXK
	BRveR1EY8set08iLa/1bSv01O97TE9C7JY8D4FD2xEJUSXK8F5kOQjwiphvWWaS/t2zH
	XZzg==
MIME-Version: 1.0
X-Received: by 10.107.130.196 with SMTP id m65mr16771077ioi.52.1445523831281; 
	Thu, 22 Oct 2015 07:23:51 -0700 (PDT)
Received: by 10.107.137.228 with HTTP; Thu, 22 Oct 2015 07:23:51 -0700 (PDT)
Date: Thu, 22 Oct 2015 16:23:51 +0200
Message-ID: <CAKpvFF1Us5xk3EFTUE1oo5xF14CNZOkJmHN5_uR9o8_CRxSmVQ@mail.gmail.com>
From: Stefano Gurrieri <gurrieristefano@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: qtmultimedia + qt5.3.2 + yocto dizzy
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
X-List-Received-Date: Thu, 22 Oct 2015 14:23:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Goodmorning,
I tried to compile Qt5.3.2 in my Yocto dizzy successfully etc=E2=80=A6
=E2=80=A6 but when I try to run (on my target based on iMX6) a videowidget
application or player application=E2=80=A6 I always have the same error:
defaultServiceProvider::requestService(): no service found for -
"org.qt-project.qt.mediaplayer"
and I can=E2=80=99t to see a video. In /usr/lib/qt5/plugins/mediaservice I=
=E2=80=99ve only
libqtmedia_audioengine.so library. Missing gstreamer multimedia service
plugins?

Could you please help me?

Thanks a lot.

