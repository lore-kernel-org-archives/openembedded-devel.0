Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8E93760CFC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Nov 2014 01:58:27 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id eu11so7245334pac.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Nov 2014 17:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=KzmOQF/lcCKFtF8lVo37KoEmM0oJ5eztBL+GOJbnsnI=;
	b=hw/J9O3QJL5JyMPKI+tlNRzBLj0AZL/Vl0z7oOgE13zVFInVCR84zRi5L75FA/Cxda
	8tVu0rUzmYuCE6JijWFbFGowfe+WGt/9hV/z9V8h8SDpN0MPC9tPXvi3eN3l357dARfF
	AjON4gvbWc5XYyhDaJTXjiFKX75q1Ik5GJAcODGanFhGLmZfNfwnFTDcqapplhkEB1Ll
	Lm/cBjGh5+/WDolGCjHk+dlvrIIXR/E0SmQK/iNg7tylsdW8ojmy4iFVZ7j18SedwxCi
	T04/2lQD1gQKNlq81rmJN5W1brrctgdhPW9bxSGODa80C1Gsbm9dX0kKG1wljB1yKU94
	GpyA==
X-Received: by 10.68.220.169 with SMTP id px9mr20565045pbc.146.1416707907984; 
	Sat, 22 Nov 2014 17:58:27 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:2124:41b2:89f4:734c?
	([2601:c:9380:601:2124:41b2:89f4:734c])
	by mx.google.com with ESMTPSA id rh3sm5990828pbc.53.2014.11.22.17.58.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Nov 2014 17:58:26 -0800 (PST)
Message-ID: <54713F40.8090304@gmail.com>
Date: Sat, 22 Nov 2014 17:58:24 -0800
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
X-List-Received-Date: Sun, 23 Nov 2014 01:58:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Pierluigi,

Thanks for the info. I am aware of the issue and notified those that can 
correct the situation early today. Being that this is the weekend, not 
sure how fast this will be correct.

My apologies for the inconvenience.

- Armin

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

