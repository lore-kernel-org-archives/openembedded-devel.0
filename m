Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PcV7H-00071F-I1
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 04:41:51 +0100
Received: by pvd12 with SMTP id 12so3638706pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jan 2011 19:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=Io+tFJMC3Yya/K/wa/eJIEn8O6EVaB3uTBPCKzKMa3U=;
	b=GWCrY1ttWTO0yBAlcAkVhh85oc4T6dBNBQTZrE2uCTdJR8fL+06RP0CJefy9l9TX+W
	YuxhEQsEAGYOHdb2I3z8XfYFDmwDGVGMiqkvP41WAI+pqBzOktrhUUyLpy4TdMrp+XSX
	qbE1sTB3APdiTls2WbnByTy3ArhGPJDEK11a8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=GxGZl7ytfyPZ0t/LJjHQUrPA2buedk/IHsiUzC1wwElGJxXNvYj1/Rc2RZ5m5v2sfq
	UJ1TrHwHDf63ux0koDnUF2bUdSI1vEHdDo9zNVpxu4nHg0BL5kZoemzgdXbd6NPUmtXM
	WTEgXrnJAkhckTLcuhyc1nP7LT0DXYqHazVqM=
Received: by 10.143.40.1 with SMTP id s1mr5176734wfj.379.1294717280760;
	Mon, 10 Jan 2011 19:41:20 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id o1sm8579027wfl.2.2011.01.10.19.41.19
	(version=SSLv3 cipher=RC4-MD5); Mon, 10 Jan 2011 19:41:20 -0800 (PST)
Message-ID: <4D2BD15D.3010500@gmail.com>
Date: Mon, 10 Jan 2011 19:41:17 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294695225-16321-1-git-send-email-eric@eukrea.com>
	<1294695225-16321-2-git-send-email-eric@eukrea.com>
In-Reply-To: <1294695225-16321-2-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH] tslib-git: update to git master
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
X-List-Received-Date: Tue, 11 Jan 2011 03:41:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/10/2011 1:33 PM, Eric Bénard wrote:
> * 5243db505b109df3001f doesn't exist so fetch is failing.
> error: pathspec '5243db505b109df3001f' did not match any file(s) known to git.
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>   recipes/tslib/tslib_git.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/tslib/tslib_git.bb b/recipes/tslib/tslib_git.bb
> index 9b177d7..7c37395 100644
> --- a/recipes/tslib/tslib_git.bb
> +++ b/recipes/tslib/tslib_git.bb
> @@ -1,8 +1,8 @@
>   SRC_URI = "git://github.com/kergoth/tslib.git;protocol=git"
>   S = "${WORKDIR}/git"
> -SRCREV = "5243db505b109df3001f"
> +SRCREV = "860d69cadedef0dec8ba6259ab5850691d3402e7"
>   PV = "1.0+gitr${SRCPV}"
> -PR = "${INC_PR}.3"
> +PR = "${INC_PR}.4"
>
>   DEFAULT_PREFERENCE = "-1"
>



