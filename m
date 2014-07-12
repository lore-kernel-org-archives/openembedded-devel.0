Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 408B07035B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jul 2014 05:06:36 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id y20so1659601ier.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 22:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=LDNH0qjOiSOLUDgram4SMVaADgXxBhZ76Z0hfEubBaU=;
	b=KPTyr2fRiylZ5Cxh2+iOgV5vG9bNpjSEq9F5+atLqjKfzGVQjqa1UwNz5heXkHRSkM
	0LGntbSVWrreH492SSX0I6wpxZEoiZ2JkCHkuJStX4YGDN0NnArgOA6MJ6FcPOfscEvg
	FDy51+M6KsecpK8+V8lqvAvopcXOTvnya2SuOirnl5sbkRDjHCEPULUdWonJDiAp6zwh
	QjD0rNfTMJ29+diDYwXN9a1e/9iGiMEMh52sNCNRp75qrptLJ43tnQOWTY1V/PulVgWs
	SVOx1ywn64j7VaXh71kaGTQArZ9kPDBWz1uozH9NRuJfrghOoAyB+u3B5GZdSUuYVtaI
	CSag==
X-Received: by 10.50.25.71 with SMTP id a7mr9726246igg.17.1405141597909; Fri,
	11 Jul 2014 22:06:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Fri, 11 Jul 2014 22:06:07 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407111829140.7344@localhost>
References: <alpine.LFD.2.11.1407111233360.5222@localhost>
	<CA+gsK-qzcd3fa=N1pUw3z46mP8DjP0V7sW3k8z79id2o3AtLsw@mail.gmail.com>
	<alpine.LFD.2.11.1407111829140.7344@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Jul 2014 22:06:07 -0700
Message-ID: <CAMKF1speMwTzKbLKm8hBXQ14ZgqmHSTKNUt-qS1sw14ac9iw4w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: the awkwardness of using core-image.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Jul 2014 05:06:42 -0000
Content-Type: text/plain; charset=UTF-8

>   i know, which is exactly what is so counter-intuitive with the way
> the above is done. you can override those two variables, but not
> CORE_IMAGE_BASE_INSTALL directly, it just seems silly.

why do you want CORE_IMAGE_BASE_INSTALL to be overridable ? unless you
want to construct image of your own
completely from scratch but then why would you want to inherit
properties from core-image class.

