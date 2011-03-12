Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyCZJ-0004M9-Ff
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 01:20:29 +0100
Received: by pzk35 with SMTP id 35so313713pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 16:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=n8N4kptfcnmAY4K5LObzFusmaaYazFfbeThRZsV8xpI=;
	b=Pt2pw76Jy/p9FnCx1FAas7L1KQCUyA/43TY7cEkzwK3zaswnHSk1vXp255hgw5OzzV
	mOSLDHyYOSfhAs9342aWDUxcwmjLQXR5ZguhQ7xlUZkIYI2AeDlUXJBGjk6Zqs2eiYC+
	ZD4iNMN8XtSE3+i4UOQreE/acBakdJqUslAvQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=rw9/nUBhL4iZ//5KrDm/h0UET2dH/yQw0vNEGYOjkgqoQlZx67zfYfSj3BbDkh6+6L
	9u+WjIHpqr7zN8rLSO61tyux3QYLhX0dZWQ/w25SiawkoWukYGrD+G1mycy8r0OyXeb4
	sOStQqtdzWDseWfe25QBKh9ZsEHF4Y4W0lpmw=
Received: by 10.143.26.26 with SMTP id d26mr8189511wfj.176.1299889130855;
	Fri, 11 Mar 2011 16:18:50 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d35sm6038786wfj.9.2011.03.11.16.18.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 16:18:49 -0800 (PST)
Date: Fri, 11 Mar 2011 16:19:14 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Eric =?utf-8?Q?B=C3=A9nard?= <eric@eukrea.com>
Message-ID: <20110312001914.GI5603@sakrah.homelinux.org>
Mail-Followup-To: Eric =?utf-8?Q?B=C3=A9nard?= <eric@eukrea.com>,
	openembedded-devel@lists.openembedded.org
References: <1299879658-10136-1-git-send-email-eric@eukrea.com>
	<1299879658-10136-2-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1299879658-10136-2-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/3] minimal: prefer qt 4.7.2
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
X-List-Received-Date: Sat, 12 Mar 2011 00:20:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (11/03/11 22:40), Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> Cc: raj.khem@gmail.com

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/distro/minimal.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index caf7826..090a4db 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -115,7 +115,7 @@ require conf/distro/include/preferred-opie-versions-1.2.5.inc
>  
>  PREFERRED_PROVIDER_opkg ?= "opkg"
>  PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
> -PREFERRED_QT_VERSION ?= "4.7.1"
> +PREFERRED_QT_VERSION ?= "4.7.2"
>  PREFERRED_VERSION_qt4-tools-native = "${PREFERRED_QT_VERSION}"
>  PREFERRED_VERSION_qt4-tools-sdk = "${PREFERRED_QT_VERSION}"
>  PREFERRED_VERSION_qt4-embedded = "${PREFERRED_QT_VERSION}"
> -- 
> 1.7.0.4
> 

-- 
-Khem


