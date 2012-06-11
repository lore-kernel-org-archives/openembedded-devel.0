Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1SdzkY-0007l4-Hi
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2012 10:13:22 +0200
Received: by eekd49 with SMTP id d49so1879411eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2012 01:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=fMNhdanJSm0WTZIgCq7Bc3FHJzuBm5di9CXJ9kFvQus=;
	b=rrmtRTuOu7QnH37c3gGowZL7VZE1sF7oJ1hgtJ+RSGXrBZrNhBKTr3fjUHjhiVroaU
	BMpF44cE5FOcbvlh4VcO411XpY4WkPp4xci16zZCOdZdcdrQbWbMkA6Rn/2LskOR0BTb
	/IZv/cARVg244PeG/QR7nZBSj/2iYEeIjmKKZ4HufW/PWjrkE+Y/nML5vVjheICDuWad
	PU4JSYYrntBlKesHW2JwUYjxPTQdnHomanmC2KioUvsMYwAGZTPXFCdyjznMAJhIviHI
	YYWyEa1/If8STu1NnZ1KggE4J5+E4n9fZ3xBk+WhtHVIErKs8l1LHMQX+8W9MPTo2W+b
	clQg==
Received: by 10.14.98.201 with SMTP id v49mr5816790eef.210.1339401769124;
	Mon, 11 Jun 2012 01:02:49 -0700 (PDT)
Received: from [10.54.74.16] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id e45sm49572048eeb.6.2012.06.11.01.02.47
	(version=SSLv3 cipher=OTHER); Mon, 11 Jun 2012 01:02:47 -0700 (PDT)
Message-ID: <4FD5A560.10707@gmail.com>
Date: Mon, 11 Jun 2012 09:59:28 +0200
From: =?UTF-8?B?TWFydGluIEVydHPDpXM=?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.4) Gecko/20120502 Thunderbird/10.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4FCC5A7B.8040204@gmail.com>
	<CAMKF1spW20v28PG+Te=5nfiGR0upuRqTRTr7G3w3SZTeR1zi7w@mail.gmail.com>
	<4FCE2F51.3030003@gmail.com>
	<CAMKF1sqdnyayLoU0Fdhxgy07uUdHDiB3D6pF5gpZpjb8HFFx7w@mail.gmail.com>
	<4FCEF69C.1070907@gmail.com> <4FD3CD4D.1090909@gmail.com>
In-Reply-To: <4FD3CD4D.1090909@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: gcc-crosssdk-initial can not compile. Get message: this target does not support --with-float
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jun 2012 08:13:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixed it. Thanks.

- Martin

On 06/10/12 00:25, Khem Raj wrote:
> On 6/5/2012 11:20 PM, Martin Ertsås wrote:
> > The configure log is at: http://pastebin.com/93h1rw7G while the
> > compile log, which is what actually failes, is at:
> > http://pastebin.com/2iXYrCDa
>
>
> can you try this patch please
>
> http://patchwork.openembedded.org/patch/29589/
>
> and report if it fixes the problem.
>
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



