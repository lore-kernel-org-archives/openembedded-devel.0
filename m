Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LxIgJ-0002fe-0N
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 12:30:56 +0200
Received: by yw-out-1718.google.com with SMTP id 9so651998ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2009 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=k2537Dl6aUj3yGDXwr6lHvBXcRZDR6Hoc8Rjjyfsb3c=;
	b=JD43mz8EdTYsHM2qDmSqgHiMSj2umQzFur31aAokYKRa5lthIwUPXqB1KIl4w5iUxQ
	VfnF0cs2sXHLd+fy9hsYnnvLtEsOINYnf553F5HX3vEgdSSxhIx4O3+/SHfi0DdpSL/7
	WWogpi+tGo4lzBejrQj8KNFcihcK1o/Kx83c8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=i52aBYqYSrTZoiytCCxLqJR3Y2ejiAtGPy8jhl/muX8XDXCPcnNOksJRul+vc2tkHg
	BO5UdzMzyB34JQtpUGFII0K6AmbFUzyTy4Pl4S2oGmm9RMi0fcIrgPlr1n8z3TWnlLE3
	yO6BTkmXHqhRNyvJKPulj32DpayCSksbAubUE=
MIME-Version: 1.0
Received: by 10.90.26.3 with SMTP id 3mr2509894agz.49.1240568771554; Fri, 24 
	Apr 2009 03:26:11 -0700 (PDT)
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF77A@hiob.intern.dresearch.de>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF77A@hiob.intern.dresearch.de>
Date: Fri, 24 Apr 2009 12:26:11 +0200
Message-ID: <c384c5ea0904240326j5f618989ne8558da29e33834b@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: ubifs patch for linux-2.6.24
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
X-List-Received-Date: Fri, 24 Apr 2009 10:30:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Steffen,

On Fri, Apr 24, 2009 at 12:12 PM, Sledz, Steffen <sledz@dresearch.de> wrote=
:
> We need ubifs for our hipox machine which is using linux-2.6.24 currently=
. Because this patch (generated from the official ubifs backport) is not ma=
chine specific i'd like to ask if i should make it SRC_URI instead of SRC_U=
RI_append_hipox (like the squashfs-lzma patch).
>
> Steffen

Yes please; +1 for SRC_URI.

I assume that disabling the filesystem in the (def)config does not, or
barely, affect the kernel, while it is very beneficial for 2.6.24
users.

Regards,
--=20
Leon


