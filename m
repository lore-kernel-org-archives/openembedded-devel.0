Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id F2719731D5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:53:29 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id 78so202530864pfw.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 02:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=YOTzgxl7XwSmqsHAN0IqPf1k8cBuI7k32xneVkXgqNg=;
	b=xD0UlU17EDy+cFoAeECxCOgnuEaPGRJ6JbwdUo2T6Hw1UJXVRxavQ+r7uESmKKMk1A
	1csM5OqLydZT14it3QcM/pxMng0EuQ/BPbHu15ETOlKOFI2+zwr8LRdx7u68N1TLmrn/
	537ggYt0hvLhGpiHd8XO871wrEsoJquLcDXgEC23R2gZ1f1doCPS22N9JrBebMOYE/7g
	sGlhGeXJSUcFM8cnfHDISFaRzx8KcrWeWWxlIbDI1pE2no73fdBh0UPPj2jZvyrANg8d
	LKOWnfHcw9nvyATXpmEZXDy5+E4dVSyPqhz/uej2qu60AOXiK0TBWvLWX0VGgUst6nQs
	iC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=YOTzgxl7XwSmqsHAN0IqPf1k8cBuI7k32xneVkXgqNg=;
	b=H06hm9ZsJk+2U0gbsWDArQqcLzaC9tLnJNKQxZnT/T/pAhIWUxcX1hxXR5C9Qpa3S+
	7AaiSKtyIabCCx42ptoypyFwgxh4MMSeuk8Cal/J4EZn6Y73IFImq0w012pBB8YR4CRT
	/QNhC1UL3hJQfeH04VCht8HkKGNWWd4U7scGOCFwVaI7h7/FEu/t/qj2tS47GZeNx7gM
	yVWEs/HXJI3iyKhySReFAnoAkOJK0u1qbqZGKuzC6Wc90aqZr40GnSk7klMfAKINScnw
	aTdOp3G5OfDz6O+ccPbEW+GXV0fei9b/wJuTT2NEzgUCIWqllOFrDislx8EsLUboBbPk
	4QSw==
X-Gm-Message-State: ALoCoQnaVdCC+BupWhhyg0C2ws//j0z2OXS9xXJP+5F5Tfpq3ABuIVTThFXrgsGbJN2QOoMC4HUYpyegXS2W9AMbfD1xA5zzLA==
X-Received: by 10.98.1.138 with SMTP id 132mr94158904pfb.0.1451904809899;
	Mon, 04 Jan 2016 02:53:29 -0800 (PST)
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com.
	[209.85.220.49]) by smtp.gmail.com with ESMTPSA id
	g68sm120152928pfg.9.2016.01.04.02.53.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 02:53:28 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f49.google.com with SMTP id uo6so175914078pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 02:53:27 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.221.228 with SMTP id qh4mr124752434pac.68.1451904807554; 
	Mon, 04 Jan 2016 02:53:27 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Mon, 4 Jan 2016 02:53:27 -0800 (PST)
In-Reply-To: <5686D91E.3030400@gmail.com>
References: <1451677511-7346-1-git-send-email-twoerner@gmail.com>
	<1451677511-7346-4-git-send-email-twoerner@gmail.com>
	<5686D91E.3030400@gmail.com>
Date: Mon, 4 Jan 2016 08:53:27 -0200
X-Gmail-Original-Message-ID: <CAP9ODKp7UDLQUeZAca+ZbBc1H279yL5OXy2t_U7vjdnD8gMkow@mail.gmail.com>
Message-ID: <CAP9ODKp7UDLQUeZAca+ZbBc1H279yL5OXy2t_U7vjdnD8gMkow@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][RFC PATCH v1 3/4] chromium_40.0.2214.91: API keys update
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
X-List-Received-Date: Mon, 04 Jan 2016 10:53:30 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 1, 2016 at 5:53 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> Oops, looks like this patch got messed up. My git rebase foo isn't as
> good as it should be ;-)

Please rebase and prepare a v2 of this.

I applied the first two patches of this serie.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

