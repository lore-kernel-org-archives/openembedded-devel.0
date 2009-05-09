Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M2pKD-0007R5-Jw
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 18:22:57 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1234920ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 May 2009 09:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=VYNYzvX/rTvKAsApW47BbTWMTqTVhArYE/0Hqa+csQo=;
	b=qN+ylEDlx6LF0EfnTCpStJLwXZi/xhdQcZ/W3DM3kB1eHg1AN5aPM3+5O5bmLuMf/X
	uTRoV7ONPq+OauqK+KxxcMbmcbYtDVy8ZPYMRBpHhe+nqJdDsW8icDRdkLvT+brKBS4q
	C3kuriz5ycjPkZjLhaf0QIzAm71k7t5eP6xY8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=S4CcjUJ1gRTZJKYRVmq7ahLLDcuEfWyMEQSXJOMBaOmfhOtmNVlv9AV5bcb02Hd8hT
	Uo7bRgI//WoXvfcr7I/J+3Ley2BvqEt1jBwcboZzz87x6zB+nrHd+Haf64/hDQOmVfQ/
	ZBmj/O0GYRDLjREJWjZqcf8KUSf0Pw+Tr56jg=
MIME-Version: 1.0
Received: by 10.151.75.12 with SMTP id c12mr7332596ybl.176.1241885797815; Sat, 
	09 May 2009 09:16:37 -0700 (PDT)
In-Reply-To: <1241830239-5594-12-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-11-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-12-git-send-email-otavio@ossystems.com.br>
Date: Sat, 9 May 2009 12:16:37 -0400
Message-ID: <f96d234e0905090916r6274adc9i25dec70503bacc7a@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 11/23] cups: split backends and models
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
X-List-Received-Date: Sat, 09 May 2009 16:22:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Fri, May 8, 2009 at 8:50 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> -DEPENDS = "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
> -PR = "r1"
> +DEPENDS = "gnutls jpeg dbus dbus-glib libpng zlib install-native fakeroot-native"
> +PR = "r2"

Patches looks good, and I like splitting cups up.  I don't see a cups
maintainer in MAINTAINERS, so I'd say do what seems best.

Does install-native still exist in dev?  It seems we are now using
coreutils-native for install (ref below).

Thanks,
Cliff

commit d5631dc0546cd152d41529b528ec2635bd103a28
Author: Roman I Khimov <khimov@altell.ru>
Date:   Thu Apr 30 00:05:37 2009 +0400

    remove install-native package

    Sane 'install' program is provided by coreutils-native now.

    Acked-by: Otavio Salvador <otavio@ossystems.com.br>

commit deb50c8b70a08632e779db9ee60d3f2d655fd3aa
Author: Roman I Khimov <khimov@altell.ru>
Date:   Wed Apr 29 23:57:54 2009 +0400

    coreutils-native: make mandatory dep for all packages

    Gives us guaranteed sane GNU coreutils on any host. Should greatly ease
    support for various non-GNU host systems and allow to safely
remove some other
    native packages like 'install-native'.

    Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
=======================
Cliff Brake
http://bec-systems.com


