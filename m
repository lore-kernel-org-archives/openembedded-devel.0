Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PX47L-0008V7-0F
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Dec 2010 04:51:29 +0100
Received: by pvd12 with SMTP id 12so1655332pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Dec 2010 19:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=+a7xVJ38aLyuJEjUE9aS7tw/PZEpYaKbSJvaOoaOJP0=;
	b=yBgW9UOMyFdhfIpsGC8Yb4lJ9oZJlH3CQfMieqHOvvJenCwpqRNfdPuA1MuiQBv7o2
	YmqDO0XheEP2Btzw9/YVWXwymIU25CwEgdPqXZR2IryJygmrGtuFshEw2tTJ6F6+3aC2
	/Yqk1LbAOUXuzJlevwC9WMGUn6ieUCRde5CUU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=OABbkPmbDfKX7t2ra5T+ZuEVioXIXzTrNcAQx7HBIMq2jT04TPUqCJmQVUyleMQwAd
	+lWYh7S/sRCukedQKy2+gCJ+oq806q3+WeIUIyugYZ3Fo09GpJ+rrl1lnFbxqpWLAA9B
	93UQMyHJ1OipMHsTEYg8SbU09l6C8LM++T5Xs=
Received: by 10.142.164.19 with SMTP id m19mr9487172wfe.425.1293421868114;
	Sun, 26 Dec 2010 19:51:08 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q13sm17040887wfc.5.2010.12.26.19.51.06
	(version=SSLv3 cipher=RC4-MD5); Sun, 26 Dec 2010 19:51:07 -0800 (PST)
Message-ID: <4D180D29.9090902@gmail.com>
Date: Sun, 26 Dec 2010 19:51:05 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293395783-18235-1-git-send-email-khimov@altell.ru>
In-Reply-To: <1293395783-18235-1-git-send-email-khimov@altell.ru>
Subject: Re: [PATCH] openssl: update 1.0.0b to 1.0.0c
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
X-List-Received-Date: Mon, 27 Dec 2010 03:51:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/2010 12:36 PM, Roman I Khimov wrote:
>   * fixes CVE-2010-4180 and CVE-2010-4252
>   * considered as safe upgrade
>
> Signed-off-by: Roman I Khimov<khimov@altell.ru>

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
>   .../include/angstrom-2008-preferred-versions.inc   |    4 +-
>   .../include/angstrom-2010-preferred-versions.inc   |    4 +-
>   .../include/kaeilos-2009-preferred-versions.inc    |    4 +-
>   conf/distro/include/preferred-shr-versions.inc     |    4 +-
>   .../openssl/openssl-1.0.0b/configure-targets.patch |   31 --
>   recipes/openssl/openssl-1.0.0b/debian.patch        |  515 --------------------
>   .../engines-install-in-libdir-ssl.patch            |   53 --
>   recipes/openssl/openssl-1.0.0b/libdeps-first.patch |   27 -
>   recipes/openssl/openssl-1.0.0b/oe-ldflags.patch    |   22 -
>   recipes/openssl/openssl-1.0.0b/shared-libs.patch   |   48 --
>   .../openssl/openssl-1.0.0c/configure-targets.patch |   31 ++
>   recipes/openssl/openssl-1.0.0c/debian.patch        |  515 ++++++++++++++++++++
>   .../engines-install-in-libdir-ssl.patch            |   53 ++
>   recipes/openssl/openssl-1.0.0c/libdeps-first.patch |   27 +
>   recipes/openssl/openssl-1.0.0c/oe-ldflags.patch    |   22 +
>   recipes/openssl/openssl-1.0.0c/shared-libs.patch   |   48 ++
>   recipes/openssl/openssl-native_1.0.0b.bb           |   27 -
>   recipes/openssl/openssl-native_1.0.0c.bb           |   27 +
>   recipes/openssl/openssl_1.0.0b.bb                  |   30 --
>   recipes/openssl/openssl_1.0.0c.bb                  |   30 ++
>   20 files changed, 761 insertions(+), 761 deletions(-)
>   delete mode 100644 recipes/openssl/openssl-1.0.0b/configure-targets.patch
>   delete mode 100644 recipes/openssl/openssl-1.0.0b/debian.patch
>   delete mode 100644 recipes/openssl/openssl-1.0.0b/engines-install-in-libdir-ssl.patch
>   delete mode 100644 recipes/openssl/openssl-1.0.0b/libdeps-first.patch
>   delete mode 100644 recipes/openssl/openssl-1.0.0b/oe-ldflags.patch
>   delete mode 100644 recipes/openssl/openssl-1.0.0b/shared-libs.patch
>   create mode 100644 recipes/openssl/openssl-1.0.0c/configure-targets.patch
>   create mode 100644 recipes/openssl/openssl-1.0.0c/debian.patch
>   create mode 100644 recipes/openssl/openssl-1.0.0c/engines-install-in-libdir-ssl.patch
>   create mode 100644 recipes/openssl/openssl-1.0.0c/libdeps-first.patch
>   create mode 100644 recipes/openssl/openssl-1.0.0c/oe-ldflags.patch
>   create mode 100644 recipes/openssl/openssl-1.0.0c/shared-libs.patch
>   delete mode 100644 recipes/openssl/openssl-native_1.0.0b.bb
>   create mode 100644 recipes/openssl/openssl-native_1.0.0c.bb
>   delete mode 100644 recipes/openssl/openssl_1.0.0b.bb
>   create mode 100644 recipes/openssl/openssl_1.0.0c.bb
>


