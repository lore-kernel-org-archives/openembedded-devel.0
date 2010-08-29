Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpbyE-0001W4-Vm
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:06:27 +0200
Received: by iwn2 with SMTP id 2so3823337iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3Pf+tSPHy/Ptc8ab8ov1oXNl8nA1GX2JILGKX45i2ok=;
	b=f5KaTfnL62p3RQd+eIBEwxedJMPyqs0ADxE4tOfDZi38kqkRKdxwKRBOUCyNNHuXuH
	4E4PWlQY3MidgWjKns1PqfcJOh7IpWzh0yjLZx9sr4ACmMkk+StTe3fbsJYnUdPK327M
	TLYL9rzTBFIz1fqFcnRW/RlZ+xw3+4LPI+510=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Q7hJCsnDajNOL8afjwqzLFFKkXZTJsg2VnZ7cbwx+1ky5BivJuvieMo+C1AVhUSb3Q
	DJbSp5ogGPmsvfMbmFZLos7PCNpYwHcGe+aap4HsFWBZ+GNRMDtYoWqHNivFALokrybG
	74jR5KcOqCnIhiojY/n6TN+nX6cifnAsH4mqM=
MIME-Version: 1.0
Received: by 10.231.40.9 with SMTP id i9mr3505858ibe.5.1283065557960; Sun, 29
	Aug 2010 00:05:57 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:05:57 -0700 (PDT)
In-Reply-To: <1283027073-12308-11-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-11-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:05:57 +0200
Message-ID: <AANLkTik_RDZLBt9jxKQ0nwpx4bY6Vr6wUnJABoENojvn@mail.gmail.com>
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
Subject: Re: [PATCH 10/23] task-gpe.bb: virtual/xserver can not be RDEPEND'ed on it can be DEPEND'ed upon
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
X-List-Received-Date: Sun, 29 Aug 2010 07:06:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

and apologies for the two missing characters in the previous commits,
they were missing in my cut buffer

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/tasks/task-gpe.bb | =A0 =A06 ++++--
> =A01 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/tasks/task-gpe.bb b/recipes/tasks/task-gpe.bb
> index 785f018..92efb3a 100644
> --- a/recipes/tasks/task-gpe.bb
> +++ b/recipes/tasks/task-gpe.bb
> @@ -18,7 +18,9 @@ PACKAGES =3D "\
> =A0 =A0 gpe-task-sectest"
>
> =A0RDEPENDS_gpe-base-depends =3D "\
> - =A0 =A0diet-x11 \
> + =A0 =A0diet-x11"
> +
> +DEPENDS_gpe-base-depends =3D "\
> =A0 =A0 virtual/xserver"
>
> =A0RDEPENDS_gpe-task-base =3D "\
> @@ -102,7 +104,7 @@ RDEPENDS_gpe-task-games =3D "\
> =A0 =A0 xdemineur"
>
> =A0RDEPENDS_gpe-task-connectivity =3D "\
> - =A0 =A0gpe-mini-browser"
> + =A0 =A0gpe-mini-browser2"
> =A0# =A0 =A0gaim
> =A0# =A0 =A0linphone-hh
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


