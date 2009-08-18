Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MdSgh-0004oa-0n
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 19:41:36 +0200
Received: by qyk35 with SMTP id 35so2848856qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=R2EBSZG5SOBO0XmOcXGL9cDgLUnta+BdQdrAyXtIPiY=;
	b=o8piH5RE8WT8fvs8sw2FRijjwStcdTDIwgmY6iwwwn/80ctrTeJ9NRLia6tWxwpo8A
	2SGwgfsimxEABT6fBtGgKiIjaXk0tXwUCVqtgeOz5NPGF24ydv5o6nm7mGTB5Qn5YpV9
	bzXHOtJaHlHemcIKSP2U1z5UdlV4jIjQnMjZQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=crU2TnkyOGsZ7xC0hPKbb1v8lZ8I1c7YbOSwVLxTKY1zp3Czb6XGgTFcxqN2GY2A63
	Wfbd+0jKPgoK0ob6BZGTft1kyubJTX36A2ZIhI68kPjZmoMX26/wNEf07O6YQCJueNTh
	6TzEEpaY+yqX1I44r40PHqav2K1OHuAGBHwTA=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.54.137 with SMTP id q9mr2600242qcg.56.1250616267679; Tue, 
	18 Aug 2009 10:24:27 -0700 (PDT)
In-Reply-To: <1250260162-9541-1-git-send-email-oe-devel@rolf.leggewie.biz>
References: <1250260162-9541-1-git-send-email-oe-devel@rolf.leggewie.biz>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 18 Aug 2009 10:24:01 -0700
X-Google-Sender-Auth: a17a373c99ceafe9
Message-ID: <b6ebd0a50908181024p6ad06490q108638a35c0dca82@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] base.bbclass: introduce OE source mirror network as last resort for do_fetch
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
X-List-Received-Date: Tue, 18 Aug 2009 17:41:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2009 at 7:29 AM, Rolf
Leggewie<oe-devel@rolf.leggewie.biz> wrote:
> Updating recipes and checksums.ini for vanishing upstream hosts or simple
> restructuring can quickly become a chore for OE devs if taken seriously.
> The OE user experience suffers severely when at any given point in time 4
> to 5 recipes on average fail do_fetch for a simple image.
>
> The solution is for OE to provide its own caching of upstream sources.
> mirrors.openembedded.org is a swarm of possibly incomplete source mirrors
> provided by the community and load-balanced via DNS round robin. =C2=A0Th=
ey
> act as a first line of defense and lower bandwidth load on melo which
> hosts sources.openembedded.org. =C2=A0The melo mirror aims to have a comp=
lete
> copy of free-to-publish sources used by the current org.oe.dev branch.
>
> Some distributions have provided source mirrors in the past for their
> users. I think it's time for a general and all-encompassing solution.
>
> The infrastructure is being currently put in place. =C2=A0This patch will
> turn on the OE sources mirror network by default.

Looks like a good idea to me.  404s cause a great deal of difficulty
for the userbase.

Acked-by: Chris Larson <clarson@kergoth.com>
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


