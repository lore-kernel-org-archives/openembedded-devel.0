Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8FDE0731B0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 07:34:49 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id c2so13675857pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 00:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=VGweH3ymq0ersqV357nel6f+fF1kbCkZ+U6zse+Clo0=;
	b=fmG9nyHTIbyr/tP8qwnZh8DstD5xLq9zCm1HGiKlh8JvbKbVyuylxHB7teAVtqfJDe
	AlUZhSi7c7rbZef6/+HSd1/X5v29iK/qo0bLUL82az2v4O70uIuye9nQFhY1Ga1One+8
	8pgQ2jmw7+5HSUsvT5pIwN3hh+k4M2NeM4TVzxnCE8beEvLD9I85kxCkMZyGvk2x2lJZ
	UWccOK6exU/35ym6+QKyiCBrMvHEliirb4IgWvZrnCp0fIaKtLBpKH+GhtN9rCaiLKQJ
	SafgY3BwBCcaHgqvsdQU2my2Pjz+p8FE7dcn7RUdJ1IskAJ8lbP5WEeHSHDN2AmrGuHy
	f6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=VGweH3ymq0ersqV357nel6f+fF1kbCkZ+U6zse+Clo0=;
	b=RPxxCfGSzzP3uVW0iq7YpV2jzKc/jbLAAQtOtHgKKwEPuneymIkEvpF10VFxsyLrqO
	eI2Zd8lguslj2m23igVuiGOsPzzkCYbQoy/YgJUMZDFpwduqE7N4ckbxzXb0A0hcICGg
	RtVwQcfa78TmbyKzk+BM2QMdYHXBeQ1ojnWiASE9bVL3tKotN0OQhNmbLnK6pVafsSEf
	kpj6Qlk47ywD2dQPqLg51XKEN8RCzj1QB072QoropS5BE5G/DLWxLUnwNgSmiwP6qfAY
	Jo121SmHxigWn4JZ4t2gm2tqnGAotsaeckboVHOdqS+wmyeqZX1/YCUFHCsJd5o0Azu4
	zMqQ==
X-Gm-Message-State: ALyK8tLo4LB1+phUtcJy9eHp774RN0HO26pQvilqc6v68ys2QAaUkOX/j8oSxE+CVgg82g==
X-Received: by 10.98.85.66 with SMTP id j63mr4264378pfb.90.1465371289586;
	Wed, 08 Jun 2016 00:34:49 -0700 (PDT)
Received: from [10.169.1.195] ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	ty10sm32405346pab.27.2016.06.08.00.34.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Jun 2016 00:34:45 -0700 (PDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAP9ODKoFrSmbEk48XwA-LoS+sEk6RBoAKe_-UUQh_9r+BN=R_w@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5757CA88.3050405@gmail.com>
Date: Wed, 8 Jun 2016 00:34:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoFrSmbEk48XwA-LoS+sEk6RBoAKe_-UUQh_9r+BN=R_w@mail.gmail.com>
Subject: Re: [for-krogoth] Fix build error in some hosts
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
X-List-Received-Date: Wed, 08 Jun 2016 07:34:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/06/2016 01:19 PM, Otavio Salvador wrote:
> Hello,
>
> There are two fixes for rrdtool which are simple and improve the
> stability of it on some hosts. Those are:
>
> daf619e rrdtool: only unset PERLHOSTLIB in do_configure
I have this queued up in my next branch I am working on.

http://cgit.openembedded.org/meta-openembedded-contrib/commit/?h=akuster/krogoth-next&id=5a86a71b50f92ce70d41b040bc6b46064a4e9677

> be3d4c0 rrdtool: fix do_configure failure on some hosts
is already in krogoth

http://cgit.openembedded.org/meta-openembedded/commit/?h=krogoth-next&id=7743d7e0b1482725057c7c2cb3b512a63e174ce0
>
> Could those be queued for stable?
yep.

thanks,
Armin
>


