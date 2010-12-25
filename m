Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PWXpy-0006m2-Ft
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 18:23:22 +0100
Received: by pvd12 with SMTP id 12so1515249pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Dec 2010 09:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=LbhjFPiKDnhFtAzjiZ2p273+jYqOkZkKQxqmUWfBJs0=;
	b=bRL2d55casA/TihcmjPQDnjincLzvAI1i/czce5ZtVYJNwZAQDCG8Ze2uit4J5wmIO
	P0NQr1IivDr2ij2VG4WdWu1in9IeNnAulIQjeXahdrXTXUp5yrjtRvP4lLH0m/w2MQyY
	3PTdF5rUR85UpHi+YX7ToVi1FA7DFZc0FoXB8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=OYoJhEkLV9YrMr8i1kBChUE060qfnBVuUxFBy3mz71sIcVf8Bt6Ee55+9n+RikVbHV
	xxlM0yPbHRweOnXpT3cKesH2Rd3N1ucbGQZY6N8SyPy9slzblNj1pEFRsMPJt94V2Obs
	Mm2cJPkWu6VSKJii3G+24DO/ltwnZywJgUqMo=
Received: by 10.142.128.6 with SMTP id a6mr7082142wfd.290.1293297789534;
	Sat, 25 Dec 2010 09:23:09 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w22sm14383990wfd.19.2010.12.25.09.23.07
	(version=SSLv3 cipher=RC4-MD5); Sat, 25 Dec 2010 09:23:08 -0800 (PST)
Message-ID: <4D162876.1000401@gmail.com>
Date: Sat, 25 Dec 2010 09:23:02 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>
In-Reply-To: <1293274109-15695-1-git-send-email-khimov@altell.ru>
Subject: Re: [PATCH 1/5] perl: fix PERLCONFIGTARGET for multimach builds, move cpan vars
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
X-List-Received-Date: Sat, 25 Dec 2010 17:23:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/2010 2:48 AM, Roman I Khimov wrote:
> Multimachine builds race staging Config_heavy-target.pl to native directory.
> Solve that by changing PERLCONFIGTARGET variable semantics, now it will
> contain $TARGET_SYS. Change perl patch and stage functions accordingly.
>
> Also, move PERLCONFIGTARGET and other target-specific variable settings from
> cpan to cpan-base as I think they're also useful for cpan_build and anywhere
> else cpan-base is needed.
>
> Signed-off-by: Roman I Khimov<khimov@altell.ru>
> ---
>   classes/cpan-base.bbclass                          |   14 ++++++++++++--
>   classes/cpan.bbclass                               |   10 ----------
>   classes/cpan_build.bbclass                         |    4 ++--
>   .../perl/perl-5.10.1/perl-configpm-switch.patch    |    6 +++---
>   recipes/perl/perl-5.8.8/perl-configpm-switch.patch |    6 +++---
>   recipes/perl/perl-native_5.10.1.bb                 |    2 +-
>   recipes/perl/perl-native_5.8.8.bb                  |    2 +-
>   recipes/perl/perl_5.10.1.bb                        |    4 ++--
>   recipes/perl/perl_5.8.8.bb                         |    2 +-
>   9 files changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/classes/cpan-base.bbclass b/classes/cpan-base.bbclass
> index a04f61c..53621ed 100644
> --- a/classes/cpan-base.bbclass
> +++ b/classes/cpan-base.bbclass
> @@ -32,11 +32,21 @@ def perl_get_libdirs(d):
>
>   def is_target(d):
>       if not bb.data.inherits_class('native', d):
> -        return "yes"
> -    return "no"
> +        return bb.data.expand('${TARGET_SYS}', d)
> +    return ""

not that its wrong but I think you could also use MULTIMACH_ARCH instead 
of TARGET_SYS here



