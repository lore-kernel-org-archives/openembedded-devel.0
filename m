Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rs1vX-0005J7-Di
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 01:50:28 +0100
Received: by lahc1 with SMTP id c1so2495311lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 16:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0AsQcPoQUNiM4DppKDz0bcv+GaJZlUMwVKfMjcQI43s=;
	b=gR0VDN0n1oo6tTt+3eQPsjvBTp7rFkaT5+bp9UIUsRuipbfKnYE9hw4XYx0lZ6WMc2
	8Na3sOBZzHviy09NY7OaSgUrfcLvfpJXBZDNqI8p5Y+6AAl/3r0J3oignPAdbOC7fMat
	u1c5EjT03gCsWh/L5jApOQnkqj8BZfE5xReZs=
MIME-Version: 1.0
Received: by 10.152.103.169 with SMTP id fx9mr10234509lab.10.1327970554349;
	Mon, 30 Jan 2012 16:42:34 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Mon, 30 Jan 2012 16:42:34 -0800 (PST)
In-Reply-To: <1327954536-29427-1-git-send-email-tworaz666@gmail.com>
References: <1327954536-29427-1-git-send-email-tworaz666@gmail.com>
Date: Tue, 31 Jan 2012 01:42:34 +0100
Message-ID: <CALbNGRRL0MXsU52uBFknfeWa9=oEF2NXvZnfyggBY-1Qbes2aA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH] Add recipe for xarchiver 0.5.2.
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
X-List-Received-Date: Tue, 31 Jan 2012 00:50:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 30, 2012 at 9:15 PM, Peter Tworek <tworaz666@gmail.com> wrote:

> +RRECOMMENDS = "lzop zip"
This should be RRECOMMENDS_${PN}

Just had a run test. If I open a tar.bz2 file, the contents remain
empty. For test I installed tar on my machine and it works fine then.
Can you add 'tar' ( or is there somebody with a better recommendation?
) to RRECOMMENDS_{PN}?

Andreas


