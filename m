Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpqHa-0002WA-2e
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 23:55:38 +0100
Received: by pzk12 with SMTP id 12so260867pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 14:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=U2d6znye0pXrayxVZ8np00/Wy9GT/IjI4yFws4MxxO8=;
	b=xdKVflyxuAujOnEsLmWVdWFlOUkugyVrbUJlmxKBF6oW7y1ZmgWHZAy1JRy3aqdXjv
	Z2Suc/xp3E0DOJHcUbB8wv65gvrNQq6J0SOHkusXGVZ167C8WuE/yYJU3JUgYybPhu0D
	BLOPWICyq4wBhWVZ176GjvvP6FDZ7XB8ewytg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=spveBwAkVChq2SXv2M/T0hx4PXJoQDK1I3PMPEBsZp96w5cUlCnAfebGehWK79ZSH6
	67/wJO2+qjUzHT3Zr9Qbk51j7v23MN0z+E8qvZCQkOx2hBxaSUCPCd1WV5lsKSspX/Vs
	toxpvotKDjkUVtR336pwxKnJHm0S7pJfYlKgE=
Received: by 10.142.43.12 with SMTP id q12mr868794wfq.226.1297896864185;
	Wed, 16 Feb 2011 14:54:24 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x35sm333679wfd.1.2011.02.16.14.54.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 14:54:22 -0800 (PST)
Date: Wed, 16 Feb 2011 14:54:26 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216225426.GH14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>
	<1297852433-31160-2-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1297852433-31160-2-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 02/10] gnokii-0.6.14: fix download link
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
X-List-Received-Date: Wed, 16 Feb 2011 22:55:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (16/02/11 11:33), Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/gnokii/gnokii_0.6.14.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/gnokii/gnokii_0.6.14.bb b/recipes/gnokii/gnokii_0.6.14.bb
> index 569d9a2..f3e968a 100644
> --- a/recipes/gnokii/gnokii_0.6.14.bb
> +++ b/recipes/gnokii/gnokii_0.6.14.bb
> @@ -1,6 +1,6 @@
>  LICENSE = "GPL"
>  DESCRIPTION = "Cellphone tools and driver software"
> -SRC_URI = "http://www.gnokii.org/download/gnokii/gnokii-${PV}.tar.bz2 \
> +SRC_URI = "http://www.gnokii.org/download/gnokii/0.6.x/gnokii-${PV}.tar.bz2 \
>  	file://configure.patch"
>  
>  DEPENDS = "libxpm gtk+"
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


