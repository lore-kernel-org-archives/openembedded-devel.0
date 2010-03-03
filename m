Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NmoYC-0004hY-7M
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 14:23:44 +0100
Received: by gwj17 with SMTP id 17so596434gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 05:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RMUc5vnZBK4Lul01B7iJ8+y+NanrTNzUO5OYoLpk6Qw=;
	b=wUAlMoIgiQeoLYT5yrJ1vSOzUk7T5CZOY402/Roo6b7iwPwAy2PW4YpidtZ+L4dq0G
	3NCEJrxVDX9Mah8a2G1adZDmnEJAvs/0F2Pqr6icgFphbByHPGjYQuXR0wv5SrRD4F/R
	X7Bo5YJihqp+cC7GC2tCPGOGQNB2pxfEVoMiA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HuM4QGS3b7cZjIg5L3L4pa3LGTgOkVkySv4QgaPWvGVEix7cR8XakyUsgndmSvIegl
	4eDBNUS+JKlcOzD8g3HzyKvspMwW4Zb0fvWGtbMTJacE5mWyBV9FnQWauxae3GLPv22k
	P+MsrcJuGzkI2Y5hye586cERXyIbf0Dl8anW8=
MIME-Version: 1.0
Received: by 10.100.244.24 with SMTP id r24mr2695208anh.118.1267622452166; 
	Wed, 03 Mar 2010 05:20:52 -0800 (PST)
In-Reply-To: <1267622195-13602-1-git-send-email-ospite@studenti.unina.it>
References: <1267622195-13602-1-git-send-email-ospite@studenti.unina.it>
Date: Wed, 3 Mar 2010 14:20:52 +0100
Message-ID: <ac9c93b11003030520k1ba50c5fp6879caa5acb36e5c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sanity.bbclass: Fix a typo in required_utilities.
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
X-List-Received-Date: Wed, 03 Mar 2010 13:23:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/3 Antonio Ospite <ospite@studenti.unina.it>:
> A missing space in required_utilities makes OE ask to install md5sumsqemu=
.
> Prepend the needed whitespace when appending to required_utilities.
>
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> ---
> =A0classes/sanity.bbclass | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
> index a78e8ed..ad5389e 100644
> --- a/classes/sanity.bbclass
> +++ b/classes/sanity.bbclass
> @@ -95,7 +95,7 @@ def check_sanity(e):
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0missing =
=3D missing + "gcc-3.x (needed for qemu-native),"
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if "qemu-native" in assume_provided:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 required_utilities +=3D "qe=
mu"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 required_utilities +=3D " q=
emu"
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0try:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if os.path.exists("/proc/s=
ys/vm/mmap_min_addr"):
> --
> 1.7.0
>
>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


