Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3810565C7C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 19:18:24 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id l13so145751iga.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 12:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=jieVqKN3WwLoQJPimAHQ9CGEMMuA+efPtXR+NTESYbY=;
	b=BPleexK1utf2WSeSCObxvGB2rO3RC/8ZrenqlebdE3qJcEhaXVdzEA5I9hhrIeF9iL
	CCT4Lr0tfBmoAOBaa1jB6+9UARyLgtWGgCT/JeYsU/a8GPEP37bVvX1dyVht0M487WMl
	9M40cgRuN01xK21FdqZ0V7dHOMaw3othA10Zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=jieVqKN3WwLoQJPimAHQ9CGEMMuA+efPtXR+NTESYbY=;
	b=Snl4JtyF9KOdI80UHAsUos06QtcwyQ8ulCvMiRRf1BuGCwzjbOmQhW87+7cm78fuLP
	UfEzTj3iZ5376IiYu9uyeiTXTPraoOOQz88RO4yWrpEvsqizTAanOkJJhnslSn8QUWin
	s6SM5YwsEqGmJO0N2axfJsGf7qiR2u+/NSQ8luyUX3ql3Ya2LDQhXTaKYZY9oYmex9qX
	Jxi+9B4Q8KUVhPCRkLGp45sgxLh8vTYSl+FAnyrG3f187NXKWlI2JQn3lkyQP/Iv4ljd
	NMrWHdicTRsQ+amZHl9hiO2/PpNaIIaWbBRKXurha1IT+HADNJIup0OTqp8353FBpEYh
	D4fw==
X-Gm-Message-State: ALoCoQmeBvPm8ChLA4KmhgRo0lxTyjAKEtZB58r51CdDlaYeNDiUeQUpmnUT/bQWTZid40ae6i/m
MIME-Version: 1.0
X-Received: by 10.42.174.2 with SMTP id t2mr2762205icz.23.1405106305797; Fri,
	11 Jul 2014 12:18:25 -0700 (PDT)
Received: by 10.50.225.73 with HTTP; Fri, 11 Jul 2014 12:18:25 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407111423001.4101@localhost>
References: <alpine.LFD.2.11.1407111114310.25692@localhost>
	<CA+gsK-q9aK49C5s7H3uzXxYnWSsU3pBmWzip-kOiaTuJhJgvTw@mail.gmail.com>
	<alpine.LFD.2.11.1407111423001.4101@localhost>
Date: Fri, 11 Jul 2014 12:18:25 -0700
Message-ID: <CA+gsK-rVuoY-KJGb4-mjUNWqNETPH5O+3jWrGV4gqzMp4f72GA@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: a bit of pedantry about core images
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
X-List-Received-Date: Fri, 11 Jul 2014 19:18:26 -0000
Content-Type: text/plain; charset=UTF-8

>
>
>   i realized what i had done the instant i hit "SEND". so ...
>
> IMAGE_INSTALL ?= "\
>       ${CORE_IMAGE_BASE_INSTALL} \
>       ${CORE_IMAGE_EXTRA_INSTALL} \
>       "
>
> does that look right? any objections?
>
> Looks good to me.

> IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}" ${CORE_IMAGE_EXTRA_INSTALL}

Need to fix that one too:

IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL} ${CORE_IMAGE_EXTRA_INSTALL}"


Do it and test it. Submit a patch. I am not the maintainer though.

Cheers,
:rjs

