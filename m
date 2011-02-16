Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpqcJ-0004Ku-7X
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:17:03 +0100
Received: by bwz10 with SMTP id 10so2004626bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=i+7zh+ZcRAVLS1M/PlPrlhEsC0R240ZOH3MzKNN5B48=;
	b=AXj8XgMARWfafFrrNNk2XlBpEwG6IrzSOXK12eJUsl+uDsYQ0bcjw7wJSmeJy3p1+C
	65YMPmgDnRmfsWA4hf24m5lKL8vEZqwcPC6jpFaT8KCjoaPD9aiKvaTi+5Bu2+Dfd9ux
	edD1cewOR/0T5WLcciVSsek+biqTXcnufqa+Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=diK93Vq3bom1cxsR8d+PvykOt7MDUmbBrHn7/0UNU4No2/nj0ngFlCwOlbUGa7Nzdc
	njtrnfZedHvrXP4Xn/NEn0I+baP5sMvcROSFyc30Jxryu/WQyHGIueS/wsYw9X8gG0Gp
	wBmLdr1F93+2G5CkI3eN7emsQCZXDUOnfOt0g=
MIME-Version: 1.0
Received: by 10.204.124.6 with SMTP id s6mr981274bkr.51.1297898151043; Wed, 16
	Feb 2011 15:15:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Wed, 16 Feb 2011 15:15:51 -0800 (PST)
In-Reply-To: <20110216230953.GT14525@sakrah.homelinux.org>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-9-git-send-email-otavio@ossystems.com.br>
	<20110216230953.GT14525@sakrah.homelinux.org>
Date: Wed, 16 Feb 2011 23:15:51 +0000
X-Google-Sender-Auth: l_-cB6CfQnP7f5UNdyBog86ntOE
Message-ID: <AANLkTikZ1DpDSnj0gPwZVA4uZHTB1uR3B5dM+haW_VWh@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 09/13] sdk.bbclass: cache ${libdir} as ${target_libdir}
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
X-List-Received-Date: Wed, 16 Feb 2011 23:17:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2011 at 23:09, Khem Raj <raj.khem@gmail.com> wrote:
...
>> +target_libdir :=3D "${libdir}"
>
> could you explain more why this is needed

Used on the qt-native-sdk change.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


