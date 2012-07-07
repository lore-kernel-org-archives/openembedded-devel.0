Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Sna1r-0003NY-Qt
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jul 2012 20:46:51 +0200
Received: by vcbfl15 with SMTP id fl15so6684483vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jul 2012 11:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=zMfoDpYps4px5rE/ugBhCslZGA6M2o0zOOIMWbszcRk=;
	b=uYiuBJ+P98q1RobwyX9QcgsuCdKbyM0TSl04xfXFBAr2yrh3ncWtxEceVqHAQSlBGs
	WiyIIL3sZnB70bCImwYeEI6KvLo0mFdhpjb07yBOVD+qLEVnkAJo5l1eQ9ElijB4KCW+
	9NDLRhA8ZZu54aGhQT3ASYQOa8dRf8kildeLEWa1c2R3vMXr01MV8wmIlK6YX96xxHgK
	eCfFUHEz9hO3oyEPutT2W7SNLqKL4LXexOPHPwFWB1I+tXZ8qQ6A21xf/rMqx+KqAEOc
	3crvhsWJlQ+hy3dSSwh//cUTkwX7/GpFRuee6CV3giZG6Jd5QOL7lB0rX1lRIpBeHLWS
	iYkw==
MIME-Version: 1.0
Received: by 10.221.10.73 with SMTP id oz9mr16404192vcb.33.1341686144251; Sat,
	07 Jul 2012 11:35:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.60.138 with HTTP; Sat, 7 Jul 2012 11:35:44 -0700 (PDT)
In-Reply-To: <1341543150-25096-4-git-send-email-elvis.dowson@gmail.com>
References: <1341543150-25096-1-git-send-email-elvis.dowson@gmail.com>
	<1341543150-25096-4-git-send-email-elvis.dowson@gmail.com>
Date: Sat, 7 Jul 2012 15:35:44 -0300
X-Google-Sender-Auth: W7aBhIb5FAD2_34kCVSbalg5XA4
Message-ID: <CAP9ODKpYqMe59PHWFkWdMY38F7ZJ=_Me96JZewPM4dQwUVoDhQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-openembedded 4/4] lighttpd: Set SYSTEMD_PACKAGES as lighttpd-systemd.
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
X-List-Received-Date: Sat, 07 Jul 2012 18:46:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Jul 5, 2012 at 11:52 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> This commit fixes WARNING:
> /tool/yocto/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb:
> it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
>
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
>  .../lighttpd/lighttpd_1.4.31.bbappend              |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
> index 1341405..b02f35c 100644
> --- a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
> +++ b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
> @@ -6,5 +6,5 @@ inherit systemd
>
>  SRC_URI += "file://lighttpd.service"
>
> -SYSTEMD_PACKAGES = "${PN}"
> +SYSTEMD_PACKAGES = "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} = "lighttpd.service"
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


