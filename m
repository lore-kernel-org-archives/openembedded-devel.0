Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OqpFz-0000Wj-Ly
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 17:29:49 +0200
Received: by yxk30 with SMTP id 30so3230950yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 08:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=x5vDf6HIkf2rEYpd/95QilncXo42bmk7C8PHl5Emo50=;
	b=SGvOUJrU9T3gjHZhGLF3ah6dXyKqkZttIh1T/xMAYWqxUMPlfXGUGBEWwwtdxcinGJ
	8mYJmmeRPMTQh08wDHGLAekWdYCMHvN2nZ6/w2gyeNw2/vBJ4skiHNoIZ7t94hV9Wbjl
	uoHMJ2wsM1Zg/04lnG++VgohNf6wrenIUdgpI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=sIVmtvguCvWRqAuWY5yPxwBqxdErDTLefIr7txhnWhCpDff0HWtdZASzwZS8zhs055
	pl80x8kN27kU6uxGQvPykbgB798UlTI3AsA8/B/R3oDPOkoGhPu1haO04oPgIxpR9l3X
	auRHX8JttmLr/NcWG5qMbomX7AGGX89WfEtA8=
Received: by 10.100.33.18 with SMTP id g18mr8535519ang.68.1283354952583; Wed,
	01 Sep 2010 08:29:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Wed, 1 Sep 2010 08:28:52 -0700 (PDT)
In-Reply-To: <AANLkTi=U6qLKy-Oxk_05YF4p+9BJxx0d5=O3cRr4OiZQ@mail.gmail.com>
References: <1283352730-17975-1-git-send-email-clarson@kergoth.com>
	<AANLkTi=U6qLKy-Oxk_05YF4p+9BJxx0d5=O3cRr4OiZQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Sep 2010 08:28:52 -0700
Message-ID: <AANLkTim4MZ_jPZDnGzV7wKgeC_aQFN_uj2Pjxks2Ms8g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] do_unpack, do_patch: shift some responsibility around, clean things up
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
X-List-Received-Date: Wed, 01 Sep 2010 15:29:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 1, 2010 at 7:57 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Wed, Sep 1, 2010 at 7:52 AM, Chris Larson <clarson@kergoth.com> wrote:
>
>> - Move unpack functions from classes into oe.patch
>
>
> Why do I never notice the typos until after sending it to the list? =A0Th=
is
> should be oe.unpack, of course.

Looks good.

Acked-by: Khem Raj <raj.khem@gmail.com>

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


