Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msmith@cbnco.com>) id 1QEgqC-0006fp-33
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 13:54:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id D5C36BB5B1D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 07:51:35 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05418-08 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 26 Apr 2011 07:51:35 -0400 (EDT)
Received: from juice.ott.cti.com (dmzgw2.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id A8A6BBB5166
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 07:51:35 -0400 (EDT)
Date: Tue, 26 Apr 2011 07:51:35 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1303813776-6345-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Message-ID: <Pine.LNX.4.64.1104260750080.12200@juice.ott.cti.com>
References: <1303813776-6345-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] openssl: enforce libdir=lib
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
X-List-Received-Date: Tue, 26 Apr 2011 11:54:04 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 26 Apr 2011, Enrico Scholz wrote:

> diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
> index 24b517d..a2eaaa3 100644
> --- a/recipes/openssl/openssl.inc
> +++ b/recipes/openssl/openssl.inc
> @@ -97,7 +97,7 @@ do_configure () {
>          if [ "x$useprefix" = "x" ]; then
>                  useprefix=/
>          fi        
> -	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl $target
> +	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --libdir=lib --openssldir=${libdir}/ssl $target

Could you change "lib" to "${libdir}"? For x86_64 builds my libdir is 
/usr/lib64.

Mike


