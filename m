Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id C709665DAF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 19:58:40 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id z11so2719817lbi.26
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 12:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=QhW9if6oUIzMvyq9hgrqfiaF1HQ4M3u7wm6/AoMW+W4=;
	b=Tt/gMm3B2CGunvs9Ro23j5OoB/VaZ//PKepyx5Qsnxh7dA6RnbHhfb9Gnu3fc3PsKX
	6Bkzy10G93kl+FyOnK+S5XQXT1oL9RYIgcI8GAstdZUlHv/OLcgoxrkEsskjJZdNPBlG
	S5pLKDBpe7FNKV7dqSIFbJuZREiBg8UepTVoWXb9ZIpk2ddMJsehogrpl0iy9dItu1B4
	aLgdgimL/SxB9CJ09BTz/MhplGqXsHje9BJthrGifDSCBjaCIJIY/cBCq82TIXLZVjBY
	IjOegCBYISUzbck/GB6jmAnHNTEAP79DQtaDxZOFfcH7Z+SoRH7Do0COv7J2HwDwNFAW
	01qA==
MIME-Version: 1.0
X-Received: by 10.112.139.166 with SMTP id qz6mr10665474lbb.13.1398542320653; 
	Sat, 26 Apr 2014 12:58:40 -0700 (PDT)
Received: by 10.112.53.73 with HTTP; Sat, 26 Apr 2014 12:58:40 -0700 (PDT)
In-Reply-To: <CAMKF1soU-HAwBs1z8Y7T=r6PCOgdJsHNm=E1kgomveWLAsqxmA@mail.gmail.com>
References: <ljcuj9$fuc$1@ger.gmane.org>
	<CAPbeDCmCodtS+O8tBJwjGyhr0FsiWCd9Sffv9JGsU+p6J1EE2w@mail.gmail.com>
	<CAMKF1soU-HAwBs1z8Y7T=r6PCOgdJsHNm=E1kgomveWLAsqxmA@mail.gmail.com>
Date: Sat, 26 Apr 2014 21:58:40 +0200
Message-ID: <CAPbeDC=Vm7Zq50R32-h3UAZLYvRCpwY2pFjYPJBfFzVQzaq-SQ@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5]remove -reduce-relocations on arm platform
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
X-List-Received-Date: Sat, 26 Apr 2014 19:58:43 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 26, 2014 at 9:44 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Apr 25, 2014 at 6:02 AM, Jacob Kroon <jacob.kroon@gmail.com>
> wrote:
> > I'm building for Wandboard, ARM Cortex-A9, but I haven't had any problems
> > building qtbase.
> > Is this more of a runtime bug ?
>
> are you using Linaro toolchain ?
>

No, I've been using the vanilla gcc toolchain that is built by OE, without
meta-linaro. But I may not have exercised Qt5 enough in my application to
have noticed this bug.

