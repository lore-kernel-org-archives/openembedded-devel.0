Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1P5ksm-0003cO-S6
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 21:51:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 08A268C5C73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 15:50:44 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07420-09 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 12 Oct 2010 15:50:43 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 014B48C5C61
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 15:50:39 -0400 (EDT)
Message-ID: <4CB4BC0E.7040901@cbnco.com>
Date: Tue, 12 Oct 2010 15:50:38 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1286545200-15699-1-git-send-email-msmith@cbnco.com>
In-Reply-To: <1286545200-15699-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH resend 1/4] make 3.82: set DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Tue, 12 Oct 2010 19:51:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

ping

Michael Smith wrote:
> This version has introduced several backwards incompatibilities and some
> packages are known not to build with 3.82. In particular:
> 
> - glibc-initial fails in do_install when prefix="".
> - eglibc manual/Makefile has not yet been patched (see 3a06f50f)
> 
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  recipes/make/make_3.82.bb |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/make/make_3.82.bb b/recipes/make/make_3.82.bb
> index 3cdc0a0..86c58d6 100644
> --- a/recipes/make/make_3.82.bb
> +++ b/recipes/make/make_3.82.bb
> @@ -1,5 +1,8 @@
>  require make.inc
>  
> +# Stock eglibc fails to build with make 3.82.
> +DEFAULT_PREFERENCE = "-1"
> +
>  BBCLASSEXTEND = "native"
>  SRC_URI[md5sum] = "1a11100f3c63fcf5753818e59d63088f"
>  SRC_URI[sha256sum] = "e2c1a73f179c40c71e2fe8abf8a8a0688b8499538512984da4a76958d0402966"



