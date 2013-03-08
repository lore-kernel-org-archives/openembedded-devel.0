Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UDvgA-00032t-9a
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Mar 2013 12:41:42 +0100
Received: by mail-vc0-f175.google.com with SMTP id p1so838822vcq.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Mar 2013 03:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=vaTcJqt8JaJ7kP0p/M4GEmH+OlcFDfOjnpvlWU/V1tk=;
	b=rd1vMCzET5vZvMMTD+QOJy5JvAFJHwnxJMPNENbL780e1WTmcHiNZ4v0H2pqPR32ZM
	wMFHBrBDqPIab3a2+QbSj5BngCyaIwnpUxDqOCY1G9kwbMZVDw6kRcTvzASlHgpfQh0r
	WUGjrQ5LSCcz8pn/iGehcpVkzbGM0ljgp+ufimsMovucAJCSp8ScfT/JZolfmDWPxdfs
	SqhQOCndkTMUJ7dfrsI9ljiHK0lc0ppwzdsUVkung+pScubDf4M7kP4n/I850w4/Oam3
	uYMu7SuF08VBNjzRqcoZxOstRTX2NbYzv3W47RcpPxfvEW8YE7DE5hr8f6xlNz5o6nG0
	4mFA==
MIME-Version: 1.0
X-Received: by 10.220.150.11 with SMTP id w11mr720565vcv.63.1362741904409;
	Fri, 08 Mar 2013 03:25:04 -0800 (PST)
Received: by 10.52.185.168 with HTTP; Fri, 8 Mar 2013 03:25:04 -0800 (PST)
In-Reply-To: <1362521704-25965-1-git-send-email-Martin.Jansa@gmail.com>
References: <1362521704-25965-1-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 8 Mar 2013 12:25:04 +0100
Message-ID: <CALbNGRT+RDine-AZQx+K8oaf25mncrHvvbYq5FMNS7TnXQU0Pw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv2] poppler: upgrade to 0.18.4
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
X-List-Received-Date: Fri, 08 Mar 2013 11:41:42 -0000
X-List-Received-Date: Fri, 08 Mar 2013 11:41:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 5, 2013 at 11:15 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * 0.18.0 was failing to build after libpng was upgraded to 1.6 in oe-core
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/poppler/poppler_0.18.0.bb | 12 ------------
>  meta-oe/recipes-support/poppler/poppler_0.18.4.bb | 10 ++++++++++
>  2 files changed, 10 insertions(+), 12 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/poppler/poppler_0.18.0.bb
>  create mode 100644 meta-oe/recipes-support/poppler/poppler_0.18.4.bb
>
Maybe it is a temporary problem but I get

ERROR: Fetcher failure: Fetch command failed with exit code 4, no output
ERROR: Function failed: Fetcher failure for URL:
'http://poppler.freedesktop.org/poppler-0.18.4.tar.gz'. Unable to
fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/poppler/0.18.4-r0/temp/log.do_fetch.20883
ERROR: Task 4 (/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.18.4.bb,
do_fetch) failed with exit code '1'

Andreas


