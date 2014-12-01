Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id E0CCD65D3F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 16:05:01 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id fp1so11167214pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 08:05:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=4vqD7M5MQGhUpIrScCeb2HeaR1+A7+/GBEnqEpwZn/4=;
	b=ISx1p0q5js1QiTBIzKOeYJVhDP1i8ZxuZuQ04IqWIgcWADfk+MteH0dUstOVAqTIj2
	J7T3SkhWQ80Z45rGoHQ/HwoOs0kT+slM6X5eCsijZHdb9imLAPGGL/nIzrteWthljt8j
	X0pDd63dS1ldRmf8rNaf28yFIvpJuysZ6HLhDKmDbtWEMYRCalyzErRtqDC84VdRfQ/Q
	Io18AtDv548ZkKYqvS37rDsmak03IU4ZsMq+RpWaxT9Lkrn9zr5FpLuGqYQYAVPJK1mS
	g0n1b7ofqVEZgidkgurOeQpvHb0Ox8J2UfusT/cAaCX9C9C6Wvn6EcjXMVBKU9FKbOve
	AbUw==
X-Gm-Message-State: ALoCoQl5AazrcmrAn4jaQ5fBUkv+uNNWl4IARbf80T6F4yW4bnd/DpJj4rkxkQly3ys79Vvwq4ar
X-Received: by 10.68.189.33 with SMTP id gf1mr77731562pbc.142.1417449901553;
	Mon, 01 Dec 2014 08:05:01 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:30ed:d4f1:6765:3ec7?
	([2601:c:9380:601:30ed:d4f1:6765:3ec7])
	by mx.google.com with ESMTPSA id
	va2sm18048133pac.15.2014.12.01.08.05.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 08:05:00 -0800 (PST)
Message-ID: <547C91A8.4090306@mvista.com>
Date: Mon, 01 Dec 2014 08:04:56 -0800
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1417436579-26311-1-git-send-email-Martin.Jansa@gmail.com>
	<CAP9ODKrLBUYE3YJM9d4aBa2Jx_WiWvGu5hoDYKNcQttUxQ=UFA@mail.gmail.com>
In-Reply-To: <CAP9ODKrLBUYE3YJM9d4aBa2Jx_WiWvGu5hoDYKNcQttUxQ=UFA@mail.gmail.com>
Subject: Re: [meta-oe][daisy][PATCH] gdal: fix sqlite, expat and libtiff detection
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
X-List-Received-Date: Mon, 01 Dec 2014 16:05:04 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/01/2014 07:25 AM, Otavio Salvador wrote:
> On Mon, Dec 1, 2014 at 10:22 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> * fixes following configure errors like:
>>    checking for SQLite3 library >= 3.0.0... yes
>>    cat: /OE/sysroots/qemux86/usr/lib/include/sqlite3.h: No such file or directory
>>    /OE/work/i586-starfish-linux/gdal/1.10.1-r0/gdal-1.10.1/configure:
>>    line 25411: test: !=: unary operator expected
>>    configure: WARNING: Can not find SQLITE_VERSION macro in sqlite3.h
>>    header to retrieve SQLite version!
>> * and autodetected expat support which sometimes tries to use host
>>    version from /usr/include
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
Acked-by: Armin Kuster <akuster808@gmail.com>

