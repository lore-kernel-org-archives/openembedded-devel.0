Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtKy9-0003av-KF
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 16:50:17 +0200
Received: by ywe9 with SMTP id 9so3721459ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 07:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=HefJrBaeL/sQt5IGT+mwj0gTejlIZ5axWqLMvMgrSwQ=;
	b=dqAXyX/lL1K8IksSoGLKJKi5F//EurcIsA6ro5q9A0Vle9oWkpDEnPh/FoCfyw7fZk
	tDp8Y1nTTogprFYeP0OuNpGT6xXeLiHTkAj03BM5bwqqdI3J2VV0zehsMAQnqQdE8bWn
	FQdfvUKo5Qszlt4ksE5JR4Ujqlaw7+WSN4c84=
Received: by 10.236.173.201 with SMTP id v49mr16072473yhl.244.1313505939671;
	Tue, 16 Aug 2011 07:45:39 -0700 (PDT)
Received: from [172.23.10.27] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id a29sm114796yhj.59.2011.08.16.07.45.38
	(version=SSLv3 cipher=OTHER); Tue, 16 Aug 2011 07:45:38 -0700 (PDT)
Message-ID: <4E4A8290.207@gmail.com>
Date: Tue, 16 Aug 2011 07:45:36 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110809 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1313500918-26444-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1313500918-26444-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.2.1
Subject: Re: [PATCH] openssl-1.0.0d: use openssl.inc from meta-oe
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
X-List-Received-Date: Tue, 16 Aug 2011 14:50:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/16/2011 06:21 AM, Martin JaMa Jansa wrote:
> * full path was using openssl.inc from oe-core which doesn't have
> BBCLASSEXTEND and INC_PR
> 
> Signed-off-by: Martin JaMa Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> --- .../recipes-connectivity/openssl/openssl_1.0.0d.bb |    2 +- 1
> files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
> b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb index
> cd5408d..73c8df5 100644 ---
> a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb +++
> b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb @@ -1,4 +1,4
> @@ -require recipes-connectivity/openssl/openssl.inc +require
> openssl.inc


that leaked from patch I am trying to convert meta-oe recipes into bbappend.
> 
> # For target side versions of openssl enable support for OCF Linux
> driver # if they are available.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5Kgo8ACgkQuwUzVZGdMxS34ACfXmywmrEmY9MCg2Vrt18KY60p
lWEAn0AiFozJ4Qf8liEMRuLHeLTVlU1g
=tc+e
-----END PGP SIGNATURE-----


