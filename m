Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 048F26DBF7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2013 14:11:21 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o6so4402573oag.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2013 06:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=3dWlNd2gnTrYDX6IDhrz6n2ZieKDGUiNGqguqa+UGa4=;
	b=bxUZGjC5NFVZCsiRVMgTlxcwsM+uJgbdDcOBNIyUZ0mr/TccJ9rYKPcN2+TQJGvNZg
	9iUq1o0yCPWzkh/IGwkzZsim5iKvDZM6aPY5Hg+Yp1rfXVWFIgryNtjNuH8ZvXPdn9/b
	PTK3SvOLaOmkbVFXsFuCg5ZwGb8sp7nAPaSTmvU5Xd1zYrO4ucemOWKsmRJW4rXaAy9j
	k/LLQ3jsux+ZiN2IMrIKTB02M3U/F1FpYxY0vqYcb/1DddLC9zpwmyjMOJOMO6EAhJr0
	8CBg+jHSvlI0VNKd+zQ2A93XmP+W9OyG+WKlcsI/K8vM/hUMetA5sfUuZPtEIqooYY8s
	tBsA==
MIME-Version: 1.0
X-Received: by 10.60.135.130 with SMTP id ps2mr5553673oeb.46.1385388681135;
	Mon, 25 Nov 2013 06:11:21 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 25 Nov 2013 06:11:21 -0800 (PST)
In-Reply-To: <1385366403-5491-1-git-send-email-b40527@freescale.com>
References: <1385366403-5491-1-git-send-email-b40527@freescale.com>
Date: Mon, 25 Nov 2013 12:11:21 -0200
X-Google-Sender-Auth: UPJ9jRz2y1aiQlUDCYC8WSl7RWQ
Message-ID: <CAP9ODKo9KDmcMMG3ay8E-nTzpyyRK_tAa3Aq5-MhfF4pO-+rOQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>
Subject: Re: [meta-oe][meta-networking][PATCHv2] tcpdump, tcpreplay:relocate tcpdump and add tcpreplay recipe
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
X-List-Received-Date: Mon, 25 Nov 2013 14:11:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 25, 2013 at 6:00 AM,  <b40527@freescale.com> wrote:
> From: Zongchun Yu <Zongchun.Yu@freescale.com>
>
> *mv tcpdump from meta-oe to meta-networking
> *add tcpreplay - a suite of GPLv3 licensed tools for UNIX operating
> systems which gives you the ability to use previously captured traffic
> in libpcap format to test a variety of network devices.
>
> Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>

Please split the patch in two, one for the move for meta-networking
and another to add the tcpreplay utility.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

