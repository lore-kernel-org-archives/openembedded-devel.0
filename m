Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIV7D-0003qh-9q
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:39:07 +0100
Received: by ywg8 with SMTP id 8so372497ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 15:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=SDJXr6oaXm/0bwR6kPmoQlqpYvVyXT9OjceMv7qBNSo=;
	b=sjjOxoGTzhGPmTjZHY12xQ43xf8lXRihCpvwEjTPukZJ7QzZdqNy3ljIpAQYQ3yJik
	RkfTMnal+I24JhRzfrb1VS3ci1EZZqPtPfLyNJz2BBJ/kgIbX8aby287wMVUFqz6McoL
	ClCV+rJTWzcWboRI7cJpUry1YgwT2Pu15Sq30=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ktlojw1SgKILJK+0VS0ZtAAAzR3Q4wcFzuuvddVXx15ePQdWs4rfg4MOKSP0j+dNa3
	ZkmD6slQkVAKF4qaBiDyU3bSBnEm7i64MtgIjCnvKM8XViFxDlp3QAje5izXcYr7Gs+3
	2NNKrikmunlzMW1Lx98n5QF0hHMrKx11q+AKw=
Received: by 10.91.12.18 with SMTP id p18mr10507841agi.48.1289950681528; Tue,
	16 Nov 2010 15:38:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 15:37:41 -0800 (PST)
In-Reply-To: <1289419592-23604-2-git-send-email-msmith@cbnco.com>
References: <1289419592-23604-1-git-send-email-msmith@cbnco.com>
	<1289419592-23604-2-git-send-email-msmith@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 15:37:41 -0800
Message-ID: <AANLkTimz4pgYZa4HXfMcPZnPqNLrrSH3xQVMu0tjdam=@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] preferred-xorg-versions: use git release of xf86-input-mutouch
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
X-List-Received-Date: Tue, 16 Nov 2010 23:39:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 10, 2010 at 12:06 PM, Michael Smith <msmith@cbnco.com> wrote:
> The latest source release, 1.2.1, fails to build with X11R7.5.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0.../preferred-xorg-versions-X11R7.5-latest.inc =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +-
> =C2=A0.../include/preferred-xorg-versions-live.inc =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.i=
nc b/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
> index 634265e..39cd4e6 100644
> --- a/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
> +++ b/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
> @@ -78,7 +78,7 @@ PREFERRED_VERSION_xf86-input-jamstudio ?=3D "1.2.0"
> =C2=A0PREFERRED_VERSION_xf86-input-magellan ?=3D "1.2.0"
> =C2=A0PREFERRED_VERSION_xf86-input-magictouch ?=3D "1.0.0.5"
> =C2=A0PREFERRED_VERSION_xf86-input-microtouch ?=3D "1.2.0"
> -PREFERRED_VERSION_xf86-input-mutouch ?=3D "1.2.1"
> +PREFERRED_VERSION_xf86-input-mutouch ?=3D "1.2.1+gitr%"
> =C2=A0PREFERRED_VERSION_xf86-input-palmax ?=3D "1.2.0"
> =C2=A0PREFERRED_VERSION_xf86-input-penmount ?=3D "1.4.0"
> =C2=A0PREFERRED_VERSION_xf86-input-spaceorb ?=3D "1.1.1"
> diff --git a/conf/distro/include/preferred-xorg-versions-live.inc b/conf/=
distro/include/preferred-xorg-versions-live.inc
> index c38580e..d4ad824 100644
> --- a/conf/distro/include/preferred-xorg-versions-live.inc
> +++ b/conf/distro/include/preferred-xorg-versions-live.inc
> @@ -130,7 +130,7 @@ PREFERRED_VERSION_xf86-input-magellan ?=3D "1.2.0"
> =C2=A0PREFERRED_VERSION_xf86-input-magictouch ?=3D "1.0.0.5"
> =C2=A0PREFERRED_VERSION_xf86-input-microtouch ?=3D "1.2.0"
> =C2=A0PREFERRED_VERSION_xf86-input-mouse ?=3D "1.6.0"
> -PREFERRED_VERSION_xf86-input-mutouch ?=3D "1.2.1"
> +PREFERRED_VERSION_xf86-input-mutouch ?=3D "1.2.1+gitr%"
> =C2=A0PREFERRED_VERSION_xf86-input-palmax ?=3D "1.2.0"
> =C2=A0PREFERRED_VERSION_xf86-input-penmount ?=3D "1.4.1"
> =C2=A0PREFERRED_VERSION_xf86-input-spaceorb ?=3D "1.1.1"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


