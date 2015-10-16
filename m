Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9A5B177161
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 21:03:13 +0000 (UTC)
Received: by iow1 with SMTP id 1so137802274iow.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 14:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=SZ1yVzkx9F7qF/g6xzdp8mHgSKxCglMgGums8FJqn5c=;
	b=IpHYTi8TudLrUWMSNQLfvJw4O0VID+wnxwGZAlRW5SRDR4eTi/YipWOZ3wnyFfiFHo
	gVtSM14oD6K1AM7Vy+WXLbtOdSzRc9Oa0YXLPcYMNVpnFtIP/PPGN8fKMZAxgk/abRJ/
	CanYfYnjZcx9OcX6/e1beFpdR0JhQ4erXav5k0cq7ZJxa9jphuQsvZd0oXWSswmzpnTK
	9wjF5pKwBQ4OZnXPPAro9arEkYivipSTEdZe8wU6Rzq6QTz9hFRp5lr1xIpdaF0vNVFr
	LFmwe5UXcSzedQbI3Jw4TxnZIilDnl9/gZ82yd57hcXBek06a5wrn8cIxkTbUWDPE39Y
	t7qw==
X-Gm-Message-State: ALoCoQkP5f8zYyxJ4vu0DNRRtzhvmh4N7L2Ne08Vta0YqUSsUvwvxO0QdhVv+J8w3FyLFJOj+mdq
X-Received: by 10.107.47.219 with SMTP id v88mr19456802iov.134.1445029394151; 
	Fri, 16 Oct 2015 14:03:14 -0700 (PDT)
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com.
	[209.85.223.171])
	by smtp.gmail.com with ESMTPSA id t7sm2718184igz.10.2015.10.16.14.03.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Oct 2015 14:03:12 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofl186 with SMTP id l186so137142668iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 14:03:12 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.194 with SMTP id j185mr18730781ioe.37.1445029392347; 
	Fri, 16 Oct 2015 14:03:12 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 16 Oct 2015 14:03:12 -0700 (PDT)
In-Reply-To: <EF7FAD29-F71D-47BE-A5CD-4468EAB38461@gmail.com>
References: <EF7FAD29-F71D-47BE-A5CD-4468EAB38461@gmail.com>
Date: Fri, 16 Oct 2015 18:03:12 -0300
Message-ID: <CAP9ODKqHvTygdGk04APf9ftVuWKSsp5qDtN81uE+FFeRxFQ69w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 3/5] openjdk-6: remove
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
X-List-Received-Date: Fri, 16 Oct 2015 21:03:15 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 16, 2015 at 2:29 PM, Jens Rehsack <rehsack@gmail.com> wrote:
>
> Since OpenJDK-6 is not maintained anymore, it's more reasonable to move to OpenJDK-8 instead
> of sticking at unmaintained, upstream not supported VM version.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>

I fully agree in removing this as it is not maintained upstream
anymore and anyone wishing to keep using it can locally revert this
patch and carry it locally.

If no one gives a valid argument to keep it, I intend to push:

fb2fd6f openjdk7: remove broken/unsupported VM's
7b3d021 icedtea7: allow modern Linux being used, either
3001905 openjdk-6: remove

on Monday.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

