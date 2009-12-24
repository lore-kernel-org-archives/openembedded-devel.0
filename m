Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNd3G-0002ti-7W
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 03:03:45 +0100
Received: by ywh26 with SMTP id 26so7735616ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2009 18:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=DDjKm+0ZnxFOd6b0MD6AbIJeFxooU1vLnOmFeiO52Ec=;
	b=miB0RJvDnPfQ0fL+C1HYqpb5le66Y2Srifc3N2GQ8P1Hc2j+8IY+5NMiYIjHfMWfhE
	RQakwTdMpizF66U2Lzac1kTjw5Dp7+gr24WbS3yn2dNm38U9ub6JPOxdfeUnv3WqymuX
	wgKlM2e2rDO4+tWti3oQeNJgJrQ9L0eciSX8g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=nOC+AVhO8aHPSS0fGLUL8yc8h5Ijnff5V2OETXCoWjOm6tt2z5RqBAhSpL4GcQ4jee
	Z9RhXhlllbVFKtOvCAbXdQJklQz26Rzgk9sDnZQ3bXTKZVxorCFvIeJLIzbulWPGQVrf
	SM2OChFmKYTCY+bbHsAjNVOaajKh2Jy9T7qvE=
Received: by 10.150.126.27 with SMTP id y27mr7926871ybc.309.1261620106902;
	Wed, 23 Dec 2009 18:01:46 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.101])
	by mx.google.com with ESMTPS id 20sm6777323iwn.1.2009.12.23.18.01.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Dec 2009 18:01:46 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5e34zgkmn1qzu@guohr-laptop-ubuntu>
	<20091224012752.GA25454@rhein.zuhause.netz>
Date: Thu, 24 Dec 2009 10:01:40 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5e6k2rwmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <20091224012752.GA25454@rhein.zuhause.netz>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: how can I upload my OE building failure information and log to tinderbox of OE
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
X-List-Received-Date: Thu, 24 Dec 2009 02:03:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Do I have to register an OSSTATS_BUILDER name?

OESTATS_BUILDER =3D "youruploadername"

=E5=9C=A8 Thu, 24 Dec 2009 09:27:52 +0800=EF=BC=8CHenning Heinold  =

<heinold@inf.fu-berlin.de> =E5=86=99=E9=81=93:

> Hi,
>
> the magic is the following putting into your local.conf
>
> INHERIT +=3D "oestats-client"
> OESTATS_SERVER =3D "tinderbox.openembedded.net"
> OESTATS_BUILDER =3D "youruploadername"
>
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


