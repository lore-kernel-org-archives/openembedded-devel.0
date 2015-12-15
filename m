Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id A0FBC6FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 12:31:48 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id wq6so4207805pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 04:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=h3ufZT7Pqj67r/igZ32/QxjwWXoUqhB0iGocJdcqgnE=;
	b=yY0ptiCK/PWuj/YfkQw/ZlTN8b1Jb2QVF+sjbxSS3iTOa1BjemyhZtIPtYykcoNBXu
	s/3gEEhWhnw9Myel29wAAMVrR7VR92PQ8eBXb1IYMc14oTxx7Q9DsUxgLM5yodSFzu2n
	k1gpY78Ak5apFQoHhqSa2bPG3acn17F1//5jCwhF+pDt8YsV8ATWznLB9hEaRKlJEpnw
	JwBU856QQDrNZijbSGKAHSQgYIPEKwjxLxLt8mcpTSzi9iUjXdEIhi21hzsHiuLtQtIz
	hQHRGMxlXPFBa4NL0odooUy6NXEzxwM2oFZ5LOqElcEVC8z7gxx0/zV4aW1RZR+Uat/x
	AaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=h3ufZT7Pqj67r/igZ32/QxjwWXoUqhB0iGocJdcqgnE=;
	b=f+s1njxxlxeAWF6ced7z8VkbM4EyHSX2CSuzcZTzW1YIVFOT5yRpBExLHliLSJVrrX
	bhYUzq3dzaiRRWqwO791oNQuOr8gBh4bCZDvmTaleVyHeCYYq43rWWiISx3lgOZxJn7R
	lvSmgmiDWXSaC/muh354Ft8Mk4b7nXUUlZQRfwiEwksGAwQMlc2zerR176AYznW3a4AM
	4yxl4qbbRJiFDi+PBZe0WsF9RIB42vzKogpHNsv/rfVmQf9bZg8Q3UN4c3XZSPMT83DZ
	RGeZySgITDVlxy/3YRpUS7Sxe+Jk+/rU520HEOQApfGOSXoSn5BxvM60HHOuw83WmTKX
	1JDw==
X-Gm-Message-State: ALoCoQkVv0p0zFtrR88sYXNl4+OC/w/yT8DoEI4L5z2DUkAiSXr8c85UItsdGdgssbMXwdnbUmSX65crW+lwkFwn0JajR/oOLA==
X-Received: by 10.67.1.103 with SMTP id bf7mr53748532pad.147.1450182709199;
	Tue, 15 Dec 2015 04:31:49 -0800 (PST)
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com.
	[209.85.192.176]) by smtp.gmail.com with ESMTPSA id
	dz6sm2164780pab.19.2015.12.15.04.31.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Dec 2015 04:31:47 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f176.google.com with SMTP id u66so4140148pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 04:31:47 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.16.84 with SMTP id y81mr31672551pfi.98.1450182707316;
	Tue, 15 Dec 2015 04:31:47 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Tue, 15 Dec 2015 04:31:47 -0800 (PST)
In-Reply-To: <97430B74-EFAB-4C2E-BB83-D8695FF14CB8@gmail.com>
References: <97430B74-EFAB-4C2E-BB83-D8695FF14CB8@gmail.com>
Date: Tue, 15 Dec 2015 10:31:47 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpFa5V__us5s+9WY7GHcyvzXT-5U_wzzp8cNmwW5UzYhw@mail.gmail.com>
Message-ID: <CAP9ODKpFa5V__us5s+9WY7GHcyvzXT-5U_wzzp8cNmwW5UzYhw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] openjdk-8: fix rewrite QA warnings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Dec 2015 12:31:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 12, 2015 at 7:36 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
> Fix bitbake warnings from variable renaming like
>
>     Variable key FILES_${PN} (${bindir}/* ${sbindir}/* ${libexecdir}/* ${=
libdir}/lib*${SOLIBS} ${sysconfdir} ${sharedstatedir} ${localstatedir} ${ba=
se_bindir}/* ${base_sbindir}/* ${base_libdir}/*${SOLIBS} ${base_prefix}/lib=
/udev/rules.d ${prefix}/lib/udev/rules.d ${datadir}/${BPN} ${libdir}/${BPN}=
/* ${datadir}/pixmaps ${datadir}/applications ${datadir}/idl ${datadir}/omf=
 ${datadir}/sounds ${libdir}/bonobo/servers) replaces original key FILES_op=
enjre-8 (    ${JRE_HOME}/bin/[a-z]*     ${JRE_HOME}/lib/[a-z]*     ${JRE_HO=
ME}/LICENSE     ${JRE_HOME}/release ).
>
> It is caused by using FILES_${PN} and FILES_{JDKPN} or FILES_${JREPN},
> respectively. Moving FILES_{JDKPN} to openjdk-8_%.bb and FILES_${JREPN} t=
o
> openjre-8_%.bb to allow consequently use FILES_${PN}.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>

Looking at the proposed change, it seems it would be better to squash
the JDK and JRE installation to a single recipe and do the proper
split using the packaging.

Do you think this is reasonable?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

