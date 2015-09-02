Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id D655F7703D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 18:25:36 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so20951860igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2015 11:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VZThHFrlNxpGavT14wIoCLwuQFS9TDPHJ2gTiBlXGcs=;
	b=WYOjxmJbpAuX/efTge/U4RzvZcpKIsA9NZRSbfEn8GEmH1ry4syWsk6B2DrdISZ9/f
	5+FX40U7+gnjq9tY4cgrJNfbi8tI36gYPzF/u7PLuuqHq47oCOp+miOzSkesy53foOkB
	ylf82RyKhePMaeqTz0QM2N791yJEeA8O0m0xnIEWmTblxqFzrEeBSjIUxn27/pft8Tgt
	oBMrAAF72jIrFRtEgRAPD6qeFzJtmtqnljtpV139uUacuRXgCm+aevpPmCYRTKU2Q21F
	+TOsQVS450RAt7T/r/vEB5XjSd7CNDSfzr+zX0bAc05r7upMsYjLq2V9mbUwN2DTk7NC
	eFeQ==
X-Received: by 10.50.30.226 with SMTP id v2mr5489059igh.11.1441218336493; Wed,
	02 Sep 2015 11:25:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.202 with HTTP; Wed, 2 Sep 2015 11:25:07 -0700 (PDT)
In-Reply-To: <20150902132330.GC2470@jama>
References: <1441192259-20483-1-git-send-email-ml@communistcode.co.uk>
	<20150902132330.GC2470@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Sep 2015 11:25:07 -0700
Message-ID: <CAMKF1spnATGUXbzt8ymqgPjtqR2tkaeRybMiMG5MfgV-43GDCQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: Re: [PATCH] libjpeg-turbo: fix libturbojpeg packaging
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
X-List-Received-Date: Wed, 02 Sep 2015 18:25:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 2, 2015 at 6:23 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> But more importantly I don't understand how dev-so and other files got
> into libturbojpeg package when it's using:
>
> FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
>
> So I think the problem is somewhere else.

it uses PACKAGES =+ "jpeg-tools libturbojpeg" that could precede the
default packages

