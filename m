Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 96F087318E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 14:10:56 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160816141056022_0484
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 14:10:56 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [216.191.234.70] (port=22642 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bZf6n-0004Oc-OO for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2016 10:12:49 -0400
Date: Tue, 16 Aug 2016 10:10:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.20.1608160948160.7531@ca624034.mitel.com>
Message-ID: <alpine.LFD.2.20.1608161009530.8065@ca624034.mitel.com>
References: <alpine.LFD.2.20.1608160948160.7531@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: [PATCH] toscoterm: In presence of "_append", convert "+=" to "="
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
X-List-Received-Date: Tue, 16 Aug 2016 14:10:56 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Aug 2016, Robert P. J. Day wrote:

>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
> index 6b31fd6..7593a65 100644
> --- a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
> +++ b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
> @@ -24,4 +24,4 @@ do_install() {
>      oe_runmake PREFIX="${prefix}" DESTDIR="${D}" install
>  }
>
> -RDEPENDS_${PN}_append_libc-glibc += "glibc-gconv-ibm437"
> +RDEPENDS_${PN}_append_libc-glibc = "glibc-gconv-ibm437"

  obviously, toss this patch since it has that same weirdness i just
described -- possibly a weird interaction between _append and += when
there is no leading space.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


