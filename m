Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 54A3D6E362
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:44:17 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id i7so1049990oag.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=GDzZf/bCkthoal6X7hhxhT2RYoEqTgzFnizQFgUuv4M=;
	b=dPTvcefswXR/NyUhTxv02irZV6672VVKhdXfU0V9RUXM11ACTFBNeO9bHkM152f6V4
	lW5P1WJ1COI88M/Nf4ksT0r50UJVf+tHrptMhhGGuer8MfW1G2BnOBmJtyaBHW9Y99VN
	7gJhAfHByKUdOzIZ9/rbNwfUFtnGOdlWQhGScpq4aftFV9OLCEVBziWF2wBr9emdu7Tq
	On7yX1445rv+/MOvalMtgnI5ALCMz/XMjCX/lG9HVyF18GZKKQPD0EbDfU5D5DKDcX/I
	O41ywPTnJMyfLiMyEucoJwwUa+bkLdbyiHof0/dfnnpp06kO40u5umGw5/HeWyhtLpbh
	Ifhg==
MIME-Version: 1.0
X-Received: by 10.60.56.70 with SMTP id y6mr1404955oep.32.1389786258330; Wed,
	15 Jan 2014 03:44:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 15 Jan 2014 03:44:18 -0800 (PST)
In-Reply-To: <1389785832-3120-3-git-send-email-ross.burton@intel.com>
References: <1389785832-3120-1-git-send-email-ross.burton@intel.com>
	<1389785832-3120-3-git-send-email-ross.burton@intel.com>
Date: Wed, 15 Jan 2014 09:44:18 -0200
X-Google-Sender-Auth: osgWk2H53-g4uDsC8-xmxQFJnUA
Message-ID: <CAP9ODKpbqja_JCZbkELd547_6Kbe8pz83WziLATR0=+J3g1akw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 3/5] libssh: don't do out-of-tree builds manually
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
X-List-Received-Date: Wed, 15 Jan 2014 11:44:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 15, 2014 at 9:37 AM, Ross Burton <ross.burton@intel.com> wrote:

> cmake.bbclass as of oe-core 783fb88 defaults to out-of-tree builds.  Use
> that
> functionality instead of OECMAKE_BUILDPATH/_SOURCEPATH which are no longer
> used.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

