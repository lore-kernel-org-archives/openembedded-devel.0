Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RvARQ-0002CQ-UN
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 17:32:20 +0100
Received: by eekd41 with SMTP id d41so203172eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 08:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=PpqKda+2ouFBasAx/TpdnvlITfBPG7P8Sv3q+T4MZQk=;
	b=iS8MqHOKQADZ+IitUNFVq31Squ+STCcbRwBZQ7fXeWL452+bgUmXf+Nh8moxMeQu2k
	Iaofn1zOofwp9JBRfSnWR7cKDg1sx5G6OGeWJggB7MxlcJy/Bw6u2mEyytvJxPK2S+Ti
	sfbhotMSNUoBGQ7/C0YojRBXjvKc4VJ95C3us=
MIME-Version: 1.0
Received: by 10.213.113.143 with SMTP id a15mr2972236ebq.50.1328718257522;
	Wed, 08 Feb 2012 08:24:17 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 08:24:17 -0800 (PST)
In-Reply-To: <1328705404-24406-1-git-send-email-koen@dominion.thruhere.net>
References: <1328705404-24406-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 8 Feb 2012 14:24:17 -0200
X-Google-Sender-Auth: UnssTWBAk-qwM5yGgmsJtzOIDuo
Message-ID: <CAP9ODKrAap_fWH_YRTn26ujwt-DwfO7enzprODPJk7iH=Z+AfA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe] systemd: split out libraries from ${PN}
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
X-List-Received-Date: Wed, 08 Feb 2012 16:32:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 8, 2012 at 10:50, Koen Kooi <koen@dominion.thruhere.net> wrote:

> ...

@@ -93,6 +98,11 @@ FILES_${PN} += " ${base_bindir}/* \
>                 ${bindir}/systemd* \
>                 ${libdir}/tmpfiles.d/*.conf \
>                 ${libdir}/systemd \
> +                ${libdir}/binfmt.d \
> +                ${libdir}/modules-load.d \
> +                ${libdir}/sysctl.d \
> +                ${localstatedir} \
> +                ${libexecdir} \
>                "
>

Those changes seems to be unrelated. Can you split it in two patches?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

