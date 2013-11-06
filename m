Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id B4D9F6CEB9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 13:06:28 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id c11so4782297wgh.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Nov 2013 05:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eIaRyAje36ZvabcduemP0AkF+h9ruAJdkRl/gPgMTlw=;
	b=j0aMblQo6GFQ/7ea3NSxbstcfmZyMsprbvvP/FnIF0K8CDn0UcVsZ2oSzuPz6SJcGy
	/8AY+G3vjCZ3PXzYB1kPBkfI+crvK2YTN/PMZRZwW1Co9eVxeqDmDBDUSWlcF3GS6SGL
	cckXPMjHehwe4v2s4WFiVe3cMG/kWeoYvp67c0CovWdfzkGwC78/bdaPiArAkCRXjyZq
	XmmjksSBxzqmJqAuGt/0LNu8XebHtNlyodlBqz2lDtFvlAtf08/WV3l6POnKz+PsfFNa
	Lwn66mboS3Y3UWUny6qkzfqWsLfz9/7maJ0ZWCUeShLUNjLx/0IPRfUiAQoxCC3wvrrW
	vXsw==
MIME-Version: 1.0
X-Received: by 10.180.211.7 with SMTP id my7mr2378709wic.17.1383743189210;
	Wed, 06 Nov 2013 05:06:29 -0800 (PST)
Received: by 10.194.179.198 with HTTP; Wed, 6 Nov 2013 05:06:29 -0800 (PST)
In-Reply-To: <1383716430-18050-1-git-send-email-Zongchun.Yu@freescale.com>
References: <1383716430-18050-1-git-send-email-Zongchun.Yu@freescale.com>
Date: Wed, 6 Nov 2013 13:06:29 +0000
Message-ID: <CA+chaQcpPKUwM6LfuKvvStDLvRYBEeBuPmHnxXuJdEee=zv3tA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Zongchun Yu <Zongchun.Yu@freescale.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] tcpdump, tcpreplay:relocate tcpdump and add tcpreplay recipe
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
X-List-Received-Date: Wed, 06 Nov 2013 13:06:30 -0000
Content-Type: text/plain; charset=UTF-8

Please use -M to get smaller diff.



On Wed, Nov 6, 2013 at 5:40 AM, <Zongchun.Yu@freescale.com> wrote:

> From: Zongchun Yu <Zongchun.Yu@freescale.com>
>
> *mv tcpdump from meta-oe to meta-networking
> *add tcpreplay - a suite of GPLv3 licensed tools for UNIX operating
> systems which gives you the ability to use previously captured traffic
> in libpcap format to test a variety of network devices.
>
>

