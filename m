Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7EFB07FA47
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:26:59 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id b15so4234113lfc.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jan 2020 03:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9UoyZu460odfhUeSREFQkMApgrN1FuOJDDrPJ/C60f4=;
	b=fNnYWiTCI5XMptIuVg0Y0YkudqtAxT/cCTRBEkKVjYYniXan/Lqt0APyewnod3rqSS
	58r1LAaEjk3Iyh6Z1mT4Qe13f//RiijGMLM3WbuK4vg2MllE1vmRhM4AkX9fkH/UbwYd
	7XsSft4k5SW5CK2qxo2pD1+n02s0WZ1EDs4FPu7J0T19+zwYSmqiDXWGejoQRc9AoC5O
	RmO5VvAf5hEhPrsWa6Xm05oil0Ax4CViAUxzJXXjUFUxlgl6laQ79wEJDXdBjaJjESh1
	yDexbEsduTqOxTJXHv36ggP9zfyCawZ5qHskMNbv0gUW5+shno5nYlq3MeRib/QgOjVw
	EEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9UoyZu460odfhUeSREFQkMApgrN1FuOJDDrPJ/C60f4=;
	b=N133oPVw+ZSG+oyX1YXsw90JTVJGy0HBJM3UnWpu0WJvH4LR7t3QAyQKNxCeUxQK6I
	m7uXNaP0nXlAxPyk9EZvnSAl1d6N2sdo9jyBr8wEr3p8JgmR9E6BORwS/nvKkaWXfswC
	Qi68cjZzLVmJ9EaHW8lG4ekUgkNsqKXmU4/4WnzP7cdX0bC1qpmMr6lyxeJQsGkJtstg
	AcymSDTZGLD713aC6hZMPMcW34imJ/Md2KLrFllEwZZxBLoN3XIumnQfYiJQHYF12hdY
	PgHntuoEmrxukq8c9tH5wURRVP5/9bhogE5/AQK3rx8EGH6X47bYzp/Bfw/SU6ByiGEx
	VOvA==
X-Gm-Message-State: APjAAAWIYAtX1a62Hp8HBxA6gX9mHl7TRAiQjV1v4GB2oXITsYrFXbpu
	nixwM1YG6C5+f8tDBHooSC5yOYy8
X-Google-Smtp-Source: APXvYqxW5WxoG6VmbXN1LGZWhNEFyljuWn1Q5CHBD6ULPvuGVVpHC7cpBIjGnZjx5u87XkEzg/Kmog==
X-Received: by 2002:a19:3f16:: with SMTP id m22mr5641376lfa.116.1580038019557; 
	Sun, 26 Jan 2020 03:26:59 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	b20sm6300377ljp.20.2020.01.26.03.26.58
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 26 Jan 2020 03:26:58 -0800 (PST)
To: Richard Leitner <richard.leitner@skidata.com>
References: <20200126111035.273501-1-jacob.kroon@gmail.com>
	<20200126112146.GB2043417@pcleri>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <80d30f83-b342-cfb7-9114-86ee61198fd7@gmail.com>
Date: Sun, 26 Jan 2020 12:26:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200126112146.GB2043417@pcleri>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][g0hl1n/wip-jdk8u242ga][PATCH] Fix building openjre-8 242
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
X-List-Received-Date: Sun, 26 Jan 2020 11:26:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/26/20 12:21 PM, Richard Leitner wrote:
> On Sun, Jan 26, 2020 at 12:10:35PM +0100, Jacob Kroon wrote:
>> Hi Richard,
>>
>> I need something like this in order to build on my Fedora 31 host.
>> I'm using master branches of bitbake, oe-core, meta-openembedded.
> 
> Ok, then please just ignore the mail I sent some minutes ago ;-)
> 
>>
>> Good thing is the crash I reported earlier seems to be fixed.
> 
> Great!
> 
> I'll do some tests on my side and give you feedback afterwards.
> 
> Is it OK for you if i rename the "fix-build.patch" to something more
> meaningful?
> 

Yes, feel free to rename/rework anything here to your liking; this was 
just hacked together to get the build going.

Cheers,
Jacob

