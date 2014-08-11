Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id CA67F609AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 20:36:55 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id y10so11331798pdj.35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 13:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=edgKBG2L2vD61NhyB1NjyNkODTdJAFNZN19qIo2Eew4=;
	b=UaP8znJXSZyiQZRCRW9IQdwbOFrCaq56krD/3mQadNEH7P5qWw6R1oexDpZ/Q/wAd8
	jUEQtnnYKg+lhbTfil7BXHRm7AcTHPC4O2VSMd800FdLTckGBGZu0PrqyD/u4vkQHY1r
	ybL5mfivbn5P57nQBw8Rjpyt2AUg+cmtUZeKfTZs8oapsXI72T6XBasi2AF5e25yAUxQ
	kgy6kv+raGKezHeHL5ytfNDUO3Z25lTAvANWr7pEf6sWGcBNatqSIY8KT9oXi9pI6gys
	QC0RcOykqI/uBuAerNPmpM9TsIMY/6TY4MDPei0LaWxnfv/6WGoTfb8090VclTrtjx1B
	Jekg==
X-Received: by 10.67.13.176 with SMTP id ez16mr160060pad.54.1407789416851;
	Mon, 11 Aug 2014 13:36:56 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:c:9380:601:43f:1873:7fc8:4937])
	by mx.google.com with ESMTPSA id
	pk15sm18874365pdb.49.2014.08.11.13.36.54 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 13:36:55 -0700 (PDT)
Message-ID: <53E92964.802@gmail.com>
Date: Mon, 11 Aug 2014 13:36:52 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	Martin Jansa <martin.jansa@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAP9ODKoPbC6qvtDq938R_1VZ4f27MrJJDMvOxKV88C2My519rw@mail.gmail.com>
In-Reply-To: <CAP9ODKoPbC6qvtDq938R_1VZ4f27MrJJDMvOxKV88C2My519rw@mail.gmail.com>
Subject: Re: Daisy pending backports
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
X-List-Received-Date: Mon, 11 Aug 2014 20:36:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/11/14, 1:08 PM, Otavio Salvador wrote:
> Hello,
>
> here goes the pending backports I am aware of:
>
> commit 9c762b824cbf7ecd9ce7f7859d22ff89c59fa28d
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Mon Aug 4 15:38:34 2014 -0300
>
>      evtest: Stop using Cgit based archive
>
>      The Cgit based archive may change depending on the order of images,
>      timestamp and like causing checksum to change.
>
>      This patch uses the same 1.25 version but fetching it using Git, so no
>      code changes are done.
>
>      Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>      Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>      Acked-by: Cliff Brake <cbrake@bec-systems.com>
>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> This one has been acked by all Daisy maintainers so please merge this.
>
>
> commit 1fe211750e11420095dd29e08eba4bb615d9ffca
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Tue Jul 1 10:56:02 2014 -0300
>
>      opencv: Disable 'gtk' backend if X11 is not available
>
>      Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
         Acked-by: Armin Kuster <akuster808@gmail.com>
>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> This one is new and Cliff and Armin need to review it.
>
>


