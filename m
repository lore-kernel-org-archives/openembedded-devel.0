Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpcFa-0003sg-IE
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:24:23 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so3830162iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FmQ7+DBPF5zmHYLHA60yNIneMlIcvL7VWRCEuGRLnoc=;
	b=Fv8LZI+Y+0d5z3+uleCjypgyhSpelfgv9jj2f9O1V/cs00VPJFc6xXTOo6uHbDN7gi
	5pUzpLLOSVF6yzgJNEYOyzBtA/k8yfOFJUYbdVD+G9Sba0Ww2UXbcKR1YOzEk0PKU5m/
	kJFNsvOvMdFQ/xznmoySJ/iDJahPQAfekRcaU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HWNoSv+GGy2RuAaG3H7Go7dkHGksSts79PSxv+iOKz7LKRx0vQ5X4Li7O2itNvtRSa
	5d19m7qys8GgU6cfJMwT6GEnNmuJPTPDHDGr3ohpjDz54rx0A+WPgDt4cURpafV9BV6N
	qpTUc43Fnr670HlG3JkadUUi+qbboaFQHbNag=
MIME-Version: 1.0
Received: by 10.231.79.77 with SMTP id o13mr3448769ibk.36.1283066634056; Sun,
	29 Aug 2010 00:23:54 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:23:54 -0700 (PDT)
In-Reply-To: <1283027073-12308-6-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-6-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:23:54 +0200
Message-ID: <AANLkTikibCWS5hYiqzVCXA+PuCEUpuVdpFzUtfMbhfta@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 05/23] meta-toolchain-arago-dvsdk.bb: Exclude from world build.
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
X-List-Received-Date: Sun, 29 Aug 2010 07:24:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/meta/meta-toolchain-arago-dvsdk.bb | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/meta/meta-toolchain-arago-dvsdk.bb b/recipes/meta/me=
ta-toolchain-arago-dvsdk.bb
> index 8e5b233..6deb2bc 100644
> --- a/recipes/meta/meta-toolchain-arago-dvsdk.bb
> +++ b/recipes/meta/meta-toolchain-arago-dvsdk.bb
> @@ -1,3 +1,4 @@
> +EXCLUDE_FROM_WORLD =3D "1"
> =A0TOOLCHAIN_HOST_TASK =3D "task-arago-toolchain-dvsdk-host"
> =A0TOOLCHAIN_TARGET_TASK =3D "task-arago-toolchain-dvsdk-target"
>
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


