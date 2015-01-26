Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 45AA560670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 02:21:04 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kx10so8917290pab.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2015 18:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=NH+1B5gyJgjPze1EO4PN00I+8y2zCKofxMIlTryQlCU=;
	b=emBCsSC/RCI3KlWr6Hf4+dJzu1bGUwGLulfaG8ig7DJHYF71cjo9iVRdyjm8MDD3yD
	U3W2DzhBK/tbS6bTEGXy3t7AT7Ky0/G6c1iwhKR6wPJFqGlIRZv7DNyYBJYmWk/Fj/If
	GYAeWXyVD5rnwCvgBzVslFpL+Z7P6/4YZ7ZGc0Da6E9X4WzUtW9aD5VPGMCp8x7rp86r
	DcxCgYJnGiYOH6W8tEV9t92XN4S45dqcv7FN9afqkgfDAx7sbhETl+diTSByaYESogyU
	anAnH9PNWPXBPh3wYNXu9WF0jSEQLtFEYS+NrAlpn4OW+KowKvuVPKgMus836WbUB0dD
	65JQ==
X-Received: by 10.66.120.129 with SMTP id lc1mr31108507pab.86.1422238865065;
	Sun, 25 Jan 2015 18:21:05 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:707b:3366:1172:a58?
	([2601:c:a700:272f:707b:3366:1172:a58])
	by mx.google.com with ESMTPSA id c9sm8360191pdj.52.2015.01.25.18.21.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Jan 2015 18:21:04 -0800 (PST)
Message-ID: <54C5A48C.5000609@gmail.com>
Date: Sun, 25 Jan 2015 18:21:00 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1422236615.git.liezhi.yang@windriver.com>
	<f4602e4bf5592cf3e39c5897c1ea935972614aaa.1422236615.git.liezhi.yang@windriver.com>
In-Reply-To: <f4602e4bf5592cf3e39c5897c1ea935972614aaa.1422236615.git.liezhi.yang@windriver.com>
Subject: Re: [meta-networking] [PATCH 4/5] wireshark: add PACKAGECONFIG for geoip
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
X-List-Received-Date: Mon, 26 Jan 2015 02:21:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Robert,

thanks.

I think there is a fix for this sitting in the patch queue.

also there is an update pending in master-next for 1.12.3

- armin

On 01/25/2015 05:45 PM, Robert Yang wrote:
> Fixed:
> epan/dissectors/packet-ip.c:56:19: fatal error: GeoIP.h: No such file or directory
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   .../recipes-support/wireshark/wireshark_1.12.2.bb  |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
> index 5740730..4fd519e 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
> @@ -36,6 +36,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
>   PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
>   PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
>   PACKAGECONFIG[krb5] = "--with-krb5=yes, --with-krb5=no, krb5"
> +PACKAGECONFIG[geoip] = "--with-geoip, --without-geoip, geoip"
>
>   EXTRA_OECONF = "--with-qt=no --enable-usr-local=no --enable-tshark --with-c-ares=no"
>
>

