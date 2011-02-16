Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpqNm-0003FO-IM
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:02:02 +0100
Received: by gyd8 with SMTP id 8so839906gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=daHwoO/z1Lg4X1/XyNWj+duvCIYYVH8eeh95H3h+FB8=;
	b=uoet+3Y5S3wu6rP1qwzLcajMOB5rDdp2YnqzWQKvZsAe2cBKP8GLuI8QzX2IQq8soY
	K/RJ8wg20Xe3tAWBnSCT1Q7xNrO2rlJgv7I/KXacxtX976hESFkeOFqYSiLUbFLHZe9Z
	ISevk3hj7BqbKGDuDW6BaK4jWJyHf9DOa6yos=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=SB39fayT0MXiuDGZFNFfPeAoFT2ojrMq7pU+EPrbqCJcvNbISuiKEzBWJuspuGGyTR
	vYv99pG8sfnwRwLF1L1HLZwLhUNX9ZFvJR9J7siNr/P7txEghhpObpQKw4vDqiqshOOk
	G4/lb8siEWOQJ8SnBAAJO8AJDjhbIxWYOwhec=
Received: by 10.150.68.27 with SMTP id q27mr1430200yba.420.1297897245365;
	Wed, 16 Feb 2011 15:00:45 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p2sm176526ybh.3.2011.02.16.15.00.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 15:00:44 -0800 (PST)
Date: Wed, 16 Feb 2011 15:00:47 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216230047.GN14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>
	<1297852433-31160-9-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1297852433-31160-9-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 09/10] slugos: prefer busybox 1.18.3
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
X-List-Received-Date: Wed, 16 Feb 2011 23:02:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (16/02/11 11:33), Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> Cc: Mike Westerhof <mike@mwester.net>

built ok with nslu2be/slugos

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/distro/include/preferred-slugos-versions.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
> index 4b0edb8..cde3eb0 100644
> --- a/conf/distro/include/preferred-slugos-versions.inc
> +++ b/conf/distro/include/preferred-slugos-versions.inc
> @@ -26,7 +26,7 @@ PREFERRED_VERSION_autoconf			?= "2.65"
>  PREFERRED_VERSION_autoconf-native		?= "2.65"
>  PREFERRED_VERSION_automake			?= "1.11.1"
>  PREFERRED_VERSION_automake-native		?= "1.11.1"
> -PREFERRED_VERSION_busybox			?= "1.18.2"
> +PREFERRED_VERSION_busybox			?= "1.18.3"
>  PREFERRED_VERSION_dbus				?= "1.4.1"
>  PREFERRED_VERSION_glib-2.0			?= "2.26.1"
>  PREFERRED_VERSION_glib-2.0-native		?= "2.26.1"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


