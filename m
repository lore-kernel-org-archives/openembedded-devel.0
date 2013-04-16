Received: from mail-vc0-f182.google.com ([209.85.220.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1USDuj-0001Bp-9G
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 23:59:45 +0200
Received: by mail-vc0-f182.google.com with SMTP id ht10so820143vcb.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 14:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=pG0U8KaRycTKA9ey8ylEP3EDI1ceiyaL5enj3JKjfsE=;
	b=uDTa8aNBR88tS10DaOc7/+CENl15RtQTkwGPAOO/HJHzu8u9R2RZGJszW2GQnmearA
	HaEZk3e5++/ea/gl74IHm2PdhNoaqKevz+SowtwrAMP66tJgqc1qNsvmDIKQd1komggM
	jZ776a6k1gZjajkTs6Pcw7hgbeCs8smSB/srNXv04xlC2s0c3sSilSHqMa0HqYU9s6qN
	Jbw0ocRPgUp12HqDNvdxOhPeT76ifzNWGA4PZRK/iZtY68b1kOOcfMoN29GKlSUwJebf
	qItRIMHIjINgOkGr9rKVpcYJ/vLokxO0fBrGOOcZGTRd/9fhwaLgR2Cc+/fN2ihJiE8E
	pyaQ==
MIME-Version: 1.0
X-Received: by 10.220.19.8 with SMTP id y8mr2980708vca.31.1366148534157; Tue,
	16 Apr 2013 14:42:14 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Tue, 16 Apr 2013 14:42:14 -0700 (PDT)
In-Reply-To: <1365873228-29369-1-git-send-email-otavio@ossystems.com.br>
References: <1365873228-29369-1-git-send-email-otavio@ossystems.com.br>
Date: Tue, 16 Apr 2013 23:42:14 +0200
Message-ID: <CALbNGRQDZ2djJk12or5zChv4YY3WqM7JNmfb6gpUVwBcdf9KVg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-xfce PATCH] xfce4-session: Add x-session-manager alternative
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
X-List-Received-Date: Tue, 16 Apr 2013 22:00:01 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 13, 2013 at 7:13 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
> index 6ad834d..d00e466 100644
> --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
> @@ -4,9 +4,9 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
>  DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf"
>  RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth consolekit upower"
> -PR = "r2"
> +PR = "r3"
>
> -inherit xfce
> +inherit xfce update-alternatives
>
>  SRC_URI[md5sum] = "4768e1a41a0287af6aad18b329a0f230"
>  SRC_URI[sha256sum] = "bb8aa9a74c3d382840596fb4875144d66c7f3f47c8e9ee81d31e3428a72c46ce"
> @@ -15,6 +15,9 @@ SRC_URI += "file://0001-Handle-multiple-interactive-session-save-bug-5379.patch
>              file://0003-configure.in-hard-code-path-to-iceauth.patch \
>  "
>
> +ALTERNATIVE_${PN} = "x-session-manager"
> +ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
> +
>  # protect from frightening message that xfce might not work correctly
>  pkg_postinst_${PN} () {
>      echo 127.0.0.1    ${MACHINE} >> /etc/hosts
> --
> 1.8.1
>
Hi Otavio,

As pure xfce user I never had a thought about this. I have no time to
test but I think it looks fine and should go in. Not sure if it still
applies...

Andreas


