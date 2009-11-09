Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N7YgY-00064R-SV
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Nov 2009 19:09:53 +0100
Received: by fxm1 with SMTP id 1so1196347fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2009 10:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6OeCB3xP5sjXJMRoUcmfo3xybRecotoCHI43E/Rwy8M=;
	b=NHHf6T/RenuARX2teSHVonLSc4iL/5Kf1UPYTuoDGw1aLnEkEPyZflFSY8h44O7O3a
	RwDXEk6+MydKn4XkWmCqkdXx+QyF7EHgVHL2eXxtwU+GYxgu3JJ5e2Mkh/7sC8Wn8uQW
	g6hw5hSgnz75R702x/TG//s4M67szvmfONDZc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MDpBTYQNIYdH8L7PDOespPbhQbB2bo7/l39vcmFUC/kLzEZfC/CW3TJu5VCbbo/Hzh
	3xCjZkTk98NVyJQ1fuf5pDwxt8c1pfd7JYRJwjp91sk0DXSdiMJoSADFflAMIK/P8aVJ
	0Woy8HqFBMTFeH5HFink1bwSumzHPdWeYwr0w=
MIME-Version: 1.0
Received: by 10.239.130.29 with SMTP id 29mr862031hbh.135.1257789641955; Mon, 
	09 Nov 2009 10:00:41 -0800 (PST)
In-Reply-To: <1257433258-3265-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
References: <200911051440.42702.holger+oe@freyther.de>
	<1257433258-3265-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
Date: Mon, 9 Nov 2009 19:00:41 +0100
Message-ID: <c384c5ea0911091000k1d1150a6i2b7a8be084751775@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] boost-1.33.1: Corrected GNU_HASH QA error.
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
X-List-Received-Date: Mon, 09 Nov 2009 18:09:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Nov 5, 2009 at 4:00 PM, Przemyslaw Wesolek
<przemyslaw.wesolek@cs.put.poznan.pl> wrote:
> boost 1.33.1 recipe ignores LDFLAGS set by OE, including --hash-style.
> In result package_qa task issues error.
>
> This patch fixes the recipe by appending OE's specifics to compiler
> flags.
>
> This only affects 1.33, as newer versions of boost don't use boost.inc.
>
> Signed-off-by: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
> ---
> =A0recipes/boost/boost.inc =A0 =A0 =A0 | =A0 =A03 +++
> =A0recipes/boost/boost_1.33.1.bb | =A0 =A02 +-
> =A02 files changed, 4 insertions(+), 1 deletions(-)
>
Seems OK to me.

Acked-by: Leon Woestenberg <leon@sidebranch.com>

--=20
Leon


