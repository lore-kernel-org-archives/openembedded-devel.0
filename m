Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PdaNO-0007kd-RU
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 04:30:59 +0100
Received: by pvd12 with SMTP id 12so364885pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 19:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=lZqYcD+Se6aIHztv1vkWHqr+pr44U8JWhylc9/1n8Rs=;
	b=pwoq4zDwqLgG6BJ87ezryCLV9XQa5V/A7+aT/pkAUc5MJNWSAcolhdn5+nOye03epx
	CTCQVYEg9H+vXbBCEPgYptDEbiZ3jKos3hhaPw/84lJP/O0/Gbg00iVGgBR1bKF8CjlC
	MT3qqq/3EhJJAQgaiYVutF8LFP1s6qjbhL+Zc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=KZGMH6TgvvMpEni1iB91uCNYTUe8XtuuH1NDRawSQkPPoccNKL9pWCK99tAdk3YG7k
	6/ECYzeb1XVCiN5J2G0GiyiWNbCgVzCtGgGubX5BBQdW0t5BolLaFvZvyJ774llpspOL
	Iv/IyiqxzcM8mK986XdZGCcqVV4WZ1xLguovc=
Received: by 10.142.233.5 with SMTP id f5mr286429wfh.233.1294975820033;
	Thu, 13 Jan 2011 19:30:20 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v19sm1001620wfh.12.2011.01.13.19.30.18
	(version=SSLv3 cipher=RC4-MD5); Thu, 13 Jan 2011 19:30:19 -0800 (PST)
Message-ID: <4D2FC347.7000505@gmail.com>
Date: Thu, 13 Jan 2011 19:30:15 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D2F694C.7000806@mentor.com>
	<1294953331-16540-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1294953331-16540-1-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH v2] strace 4.5.20: stable since 04/14/2010 so remove DP=-1
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
X-List-Received-Date: Fri, 14 Jan 2011 03:30:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/13/2011 1:15 PM, Eric Bénard wrote:
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> ---
> v2: don't increase PR

I hope its build tested on some arches which were not using it
Acked-by: Khem Raj <raj.khem@gmail.com>


>
>   recipes/strace/strace_4.5.20.bb |    4 ----
>   1 files changed, 0 insertions(+), 4 deletions(-)
>
> diff --git a/recipes/strace/strace_4.5.20.bb b/recipes/strace/strace_4.5.20.bb
> index 89c5fd3..6146554 100644
> --- a/recipes/strace/strace_4.5.20.bb
> +++ b/recipes/strace/strace_4.5.20.bb
> @@ -3,10 +3,6 @@ SECTION = "console/utils"
>   LICENSE = "BSD"
>   PR = "r1"
>
> -DEFAULT_PREFERENCE = "-1"
> -DEFAULT_PREFERENCE_mips = "1"
> -DEFAULT_PREFERENCE_mipsel = "1"
> -
>   SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
>             file://mips-nolargefile.patch \
>             "



