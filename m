Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE68721BB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 18:11:13 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id ft15so10190557pdb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 10:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ftUhY1y8dGLBUG/D7b7p02iYUR65k1kKtrwaCrGhEgU=;
	b=PkUpIEAz/HYq4ztLeilJhWZeLNlII9kEI4cAT6IHNBEH6yEYBcyr4MKUjrGdkPRI9b
	OHvLcxY1X8nt+bNJ8c9bRnq6tQLMhNkk+t5jwT1/mNa1bRNP8RGCe/9SUlEpPTYQ8wYR
	v66ImRu3cc/lw0lQPvu8Ol+Z8HdTxMXLwSkL6yvQxB9Qh7eOUMZTzAIWvtCz7i2R60vo
	03CxJoE+qO42XNgIYp77spM18uZ3Tr8oj2HqquIiLyM0jTWqzlJps947Bwz/0sOv5SPs
	0dTqQ83wioz0sh4nQtfL32DuenDuj27aESHI3S6Qd8IIsneLiMrL0qMLIBA0icaPRhR3
	hmHw==
X-Received: by 10.66.235.135 with SMTP id um7mr35697920pac.94.1416852674459;
	Mon, 24 Nov 2014 10:11:14 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:7446:a71b:cca3:2f0?
	([2601:c:9380:601:7446:a71b:cca3:2f0])
	by mx.google.com with ESMTPSA id b9sm791538pbu.95.2014.11.24.10.11.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Nov 2014 10:11:13 -0800 (PST)
Message-ID: <547374BE.9060308@gmail.com>
Date: Mon, 24 Nov 2014 10:11:10 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: pierluigi.passaro@phoenixsoftware.it
References: <54711D99.3090003@phoenixsoftware.it>
In-Reply-To: <54711D99.3090003@phoenixsoftware.it>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: curl compilation broken on dizzy
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
X-List-Received-Date: Mon, 24 Nov 2014 18:11:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Pierluigi,

this should be fixed now.

please try again.

regards,
Armin

On 11/22/2014 03:34 PM, Pierluigi Passaro wrote:
> Hi all,
> I'm experiencing some problems compiling curl on dizzy.
> As far as I can see, the backporting of CVE-2014-3613 and CVE-2014-3620
> introduced patches few bytes smaller than those available on master
> branch: it looks like some CR characters are missing.
> The compilation on dizzy is ok using the patches from master branch.
>
> Could anyone sync the patches with those available on master branch?
>
> Thanks
> Regards
> Pierluigi

