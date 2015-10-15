Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3107D77104
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 13:38:32 +0000 (UTC)
Received: by ioii196 with SMTP id i196so89409436ioi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 06:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=j9XevpY6pq4/lcazg8A4j+JVCFRKhL/kQ5H35WPNUD0=;
	b=mAWqmjhyOYQQtqnhZf/mCnaYEl+wL3YreZ5JfelFWojCCd6m1wkJis1OOFlgL6P8s8
	Q3DVSdqXxWnK1jhL7BGEPHCnVvL9MCQZ/Bfvp8IZeDv4Bfu5ue+2uMGelu12TW3ZzFzq
	hW2kYBBnwwck1azzW5fjEXWWp+TNJnm3B+sUedYzrDPYThxUxXqCwm7Jl8tYM7umiQhU
	IJpzgOklWAT8GtPdJfsKLC4HCl+BTNEFY1Qev7hmx5j8AsfwqJ1IEvlF+IiO853Z8oGn
	M/ll+DPRfOhCbQMN+tOsKBUADtACeu8nBm+/luU17eEBOgdfn9ZAItIzgpTS4fKIHXvr
	rXdQ==
X-Gm-Message-State: ALoCoQkfq4GtunfaOtHPcuVAsdb9rV7I407cPGNe9Hxk+i6gj4w6QWd9NmGDkNe4obB7Ufn8P7gH
X-Received: by 10.107.134.94 with SMTP id i91mr7001623iod.74.1444916312950;
	Thu, 15 Oct 2015 06:38:32 -0700 (PDT)
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com.
	[209.85.223.175]) by smtp.gmail.com with ESMTPSA id
	e36sm5670165ioj.44.2015.10.15.06.38.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Oct 2015 06:38:31 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodv82 with SMTP id v82so89741672iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 06:38:31 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.194 with SMTP id j185mr9818311ioe.37.1444916311163; 
	Thu, 15 Oct 2015 06:38:31 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 15 Oct 2015 06:38:31 -0700 (PDT)
In-Reply-To: <20151015114726.GC2588@jama>
References: <1444903231-16227-1-git-send-email-samuli.piippo@theqtcompany.com>
	<20151015114726.GC2588@jama>
Date: Thu, 15 Oct 2015 10:38:31 -0300
Message-ID: <CAP9ODKo=UmqZCd2CuwgbrKr3DrvxvqPS1Bi+3-YUiVzF3qutGg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: use extra .pri file from linux-oe-g++ mkspec
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
X-List-Received-Date: Thu, 15 Oct 2015 13:38:35 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 15, 2015 at 8:47 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Oct 15, 2015 at 01:00:31PM +0300, Samuli Piippo wrote:
>> Load additional oe-device-extra.pri in the default linux-oe-g++ mkspec to
>> allow simple changing of target dependent values. This is useful for any
>> target that needs to specify e.g., QMAKE_LIBS_EGL or other additional configs.
>
> Looks good, but people using this need to be aware that it will cause
> qtbase and everything depending on it MACHINE_ARCH which is very
> unfortunate considering the time needed to build things like
> qtwebengine/qtwebkit.

However I don't see how any BSP needing to pass extra libraries or
flags would not be machine specific.

One way to avoid this would be to split out the QPA backend for those
to another recipe and this to become machine specific and include the
.pri file.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

