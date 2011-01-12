Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pd5RB-0001ak-Bl
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 19:28:51 +0100
Received: by pvd12 with SMTP id 12so122212pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 10:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=M9nIXVg4fzX9e8Hv3GbCpvr/K3DVcuscY1JhYdYCAtY=;
	b=o29Zv7eFtWhR2X8n2tFhuxUc/2peIBlD1iSzeHx+EotP//Rqe+Z8x8ULLKu/Ngdcg3
	Xc3a6MxgYm+hqbQIQZYxh6T2PQ+Aq6p0pKTX7zaO8GBsX3rnMKlr66WO+zAeOyGTbk3A
	Wv2XnTMkU+8IwBybllFmsO4XVJAnOuHqvO1Y4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=bbcNUHx4Zc2OfMxxsxdW5eNBbizzXa+nq3uXk54/n40GDVDNcOrWS5kPqR15locnUR
	7T/4eImr2wxP4d4cwuRvvZ8UuJNMjDxvk9av2tuMUFH9gKk6MWA//nXy5s7Lwp9UBAsq
	oSqZ1HiU4FhRbMtrndwiHyJU99P6fMmW3CZGA=
Received: by 10.142.242.4 with SMTP id p4mr114928wfh.330.1294856894852;
	Wed, 12 Jan 2011 10:28:14 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x18sm1167185wfa.23.2011.01.12.10.28.13
	(version=SSLv3 cipher=RC4-MD5); Wed, 12 Jan 2011 10:28:13 -0800 (PST)
Message-ID: <4D2DF2BA.6040000@gmail.com>
Date: Wed, 12 Jan 2011 10:28:10 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294832897-3343-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1294832897-3343-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] libvpx: force arm mode to be able to link with ffmpeg where arm mode already is forced
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
X-List-Received-Date: Wed, 12 Jan 2011 18:28:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/2011 3:48 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>

hmmm what issues do u see if you build it with thumb mode.

> ---
>   recipes/webm/libvpx.inc |    6 +++++-
>   1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/webm/libvpx.inc b/recipes/webm/libvpx.inc
> index 9913d5b..9d40945 100644
> --- a/recipes/webm/libvpx.inc
> +++ b/recipes/webm/libvpx.inc
> @@ -1,11 +1,15 @@
>   DESCRIPTION = "vpx Multi-Format Codec SDK"
>   LICENSE = "BSD"
>
> -INC_PR = "r5"
> +INC_PR = "r6"
>
>   SRC_URI = "git://review.webmproject.org/libvpx.git;protocol=git;tag=v${PV}"
>   S = "${WORKDIR}/git"
>
> +# ffmpeg links with this and fails
> +# sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'
> +ARM_INSTRUCTION_SET = "arm"
> +
>   CFLAGS += "-fPIC"
>
>   export CC



