Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 47D647178A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2015 19:37:02 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id q200so4188242ykb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2015 11:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=of1Khs0pLVEVVIHnvtfAQS+H21RP8EQp1t30E+2SEg8=;
	b=Ef3aXmfVsMRvOk503M2E6jPKOGNFN54cOUelAyHkooPtA+HaPNwmxU6mIWT1mMQdY9
	ANSUtNDnbTjXxGuvRm91v885SHkAhVEetwQX8Pq8a2LfcLLggwsQxUILxaYVncFqS88g
	EpP0Wb9o+ibDtT3ZmalREp9qmu8rKGzI1gkzT0/dIkW/bPjxVss07/X/vpJ4oJZdYZ23
	AqnugZxqg0H1kLoF0XsUL5yYSUppJCSa/AMbh77amCVxZts50+p5CreskLpsKYMQHH2l
	vVzgeP7/rzeW9px+KTteY7njWqw50ksachlN8MvZcS9JtTyv6B5v/MEn1ivc4tGCO0Lf
	14fw==
MIME-Version: 1.0
X-Received: by 10.170.47.210 with SMTP id 201mr21933435ykp.30.1421696221760;
	Mon, 19 Jan 2015 11:37:01 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Mon, 19 Jan 2015 11:37:01 -0800 (PST)
In-Reply-To: <D0E2AB9D.8D80%csmiley@icontrol.com>
References: <54B220B0.8070609@gmail.com> <54B222F2.4070802@gmail.com>
	<loom.20150113T130012-516@post.gmane.org>
	<20150113132422.GJ18240@mail.itconsulting-heinold.de>
	<CAP9ODKocqaD+cXFba28jxXyd75aRmWnpwNY3NNx1wVY4Q3wVuA@mail.gmail.com>
	<loom.20150115T002923-253@post.gmane.org>
	<CAP9ODKpZzfTV41SDZjacbMi9=_BKkA7AoTgU+az4+7oUDreB3Q@mail.gmail.com>
	<CAEHkU3WoztGsMLVriJWqFCSuYboaQAFf8G_y1EtYHiyrh3i0UQ@mail.gmail.com>
	<CAEHkU3VmOOfi+nmyB2gERxghmb7n0uNXaNhiQ1zbaYtH33vAaw@mail.gmail.com>
	<CAEHkU3UwSPmDXcXVeZpTWWjxvQ3DxJts7_Ci964f=Lrv8xNH0Q@mail.gmail.com>
	<CAP9ODKrmQ2hLL-NFUqrB_sa24wB+WyzTPsdkssYgkknFKNO65A@mail.gmail.com>
	<D0E2AB9D.8D80%csmiley@icontrol.com>
Date: Mon, 19 Jan 2015 17:37:01 -0200
X-Google-Sender-Auth: 1faX7Sf5tjBvdOa4xMmnh3FbaIc
Message-ID: <CAP9ODKot2QXtFRknUGA=tVr-UqLBjT6F6BqiQYVB185ezhBi-Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Colin Smiley <csmiley@icontrol.com>
Cc: Henning Heinold <heinold@inf.fu-berlin.de>,
	Alex de Cabo <alejandro.de-cabo-garcia@congatec.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Query on meta-java layer openjdk-7-jre build
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
X-List-Received-Date: Mon, 19 Jan 2015 19:37:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2015 at 4:43 PM, Colin Smiley <csmiley@icontrol.com> wrote:
> If this is what is causing the meta-java qemu problems, wouldn=E2=80=99t =
this have
> to be ported back to daisy as well? Daisy is the latest branch meta-java
> says it supports (it=E2=80=99s the one I=E2=80=99ve been using, anyway).

Yes, potentially.

I am not using Daisy too often in new customers so I need someone to
put time and test the backport more carefully. I've been pushing and
updating most of them to Dizzy (few exceptions exist, of course).

Just a remark. We didn't branch Dizzy because 'master' works well with it.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

