Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id AF22660053
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 13:14:00 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id p188so32049510lfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3gpogg7qIVmOHlp7Dw87q1FFRRXhesgo+kXPN6FITns=;
	b=0opPGBDmcgscESg4fVncF13npg3YhGWvMklQDtyassJI9FaPAvpaBTeFmKbzOEFr8Y
	pMQh+p0V9N6nWec8pE1oR33ZZAoMttCwLty4Vw49N5f0zantgVFWclwsEabYJISVZ3Tk
	I/G+e3BwUXck5YTmpvrWHgRKnjelJE6tdzMxuqUjxH0IvobWhYE2BKU8Zj0iW0lIR+qb
	qtZqpi7wNDuPBIk80lFsLxfTaDXiyWIsYduDjqotRDNsuY81D1wcgCXpOwvWGQxYjWvy
	WBsKQfa/u/Qo+vBjBqnAI3E+B/3DK3esIsAcWpxz9Nyuv7atlnh5HTb9FHDhmg76AOUd
	wWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3gpogg7qIVmOHlp7Dw87q1FFRRXhesgo+kXPN6FITns=;
	b=cUKhelS7ZNq/hLDaj1DYdIbwBFJqeGvyVfuXfdwRu2STB6T4CKr2nabMpfDX7azn/F
	fViLkbNRYAGEgzTwbkPWpVVC0EBbYLNjoeLcBa8jzJOx08K+/0zIMO2sa30lwWRUzaVS
	aP09TeT6gvyqymOC2M56ntiqKnz6ETKS4gmtcUwK05n7STYHjsDuDEyRFiDUivY7maOa
	8jBoqz4dZUxmaKYWiP2R1AV7JLJp93A+hag8b0j10d6S0izAe2V5ORDTkxB87izC16w3
	aRGvfrcYd23m4p7EG19LsKHao1Xf31QuRo0nf6TlJTnlQ0zPn+dtclTduXKYlo5/Nn25
	wp6Q==
X-Gm-Message-State: AD7BkJKqn8gub5K+LLY9SE0bkXz6nBZuKqfDJRPohlcV/kmQlFNQ63w2moYvs/6j0AwRuPMGDNzpKRBF9aKbAA==
X-Received: by 10.25.127.208 with SMTP id a199mr6606974lfd.46.1459430039536;
	Thu, 31 Mar 2016 06:13:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.11.40 with HTTP; Thu, 31 Mar 2016 06:13:38 -0700 (PDT)
In-Reply-To: <20160331125851.GB2540@jama>
References: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
	<1459423593-4123-6-git-send-email-ricardo.ribalda@gmail.com>
	<20160331125851.GB2540@jama>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 31 Mar 2016 15:13:38 +0200
Message-ID: <CAPybu_0LUWmHUbKN5r3VSkycT9TNT+r1dinJLUTS_Dpdny5UEw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4 5/7] opencv: Use pre-downloaded ipp
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
X-List-Received-Date: Thu, 31 Mar 2016 13:14:01 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin

>>  SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
>>  SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
>> +IPP_MD5 = "808b791a6eac9ed78d32a7666804320e"
>> +SRC_URI[ipp.md5sum] = "${IPP_MD5}"
>> +SRC_URI[ipp.sha256sum] = "4333833e40afaa22c804169e44f9a63e357e21476b765a5683bcb3760107f0da"
>> +
>
> Why don't you add normal git repo https://github.com/Itseez/opencv_3rdparty
> in corresponding branch/revision?

Because this mimics better what is done by the configure script, there
are less things to download, and the unpack of the .tgz is
automagically done

But if you dont like it I can change it.

--
Ricardo Ribalda

