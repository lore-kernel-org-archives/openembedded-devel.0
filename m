Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TWT1G-0000ya-RU
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Nov 2012 15:23:46 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so42107lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Nov 2012 06:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=9BH5bqouE7dKWoB1b3toadvWTOOouFL4AH+gBkrWVG0=;
	b=CMT7aP4zTw3wI8VxVutkCD74motRWS8gAPTLuNBxFo7P25upamxUzztomKFsFzVuKO
	aV1Xw2WKN/RIDNMd5zQ2uWtznoRo/D0opVAsLclh4SxHYLGYt2PTFxYmQ4+2+eBLJJn4
	kVONW3IYcSWyV7vijRz+x50RG/rd3iY1ncoQwZNhcyhceeTkadzyv4nKV0yk5B8RrvS+
	Asv7R3cvJhg/efszx+VfoIbhW8JYWiYiWY8n9SN8h2CMdfIcIU+QG50HnEs0G6//hehs
	QVAxXfGC2Lf5OH58bUDp0eKMIh1bUQ4MVDIR1tcg1iPUYPUWVu9GefY+I7S6iFdSa2uD
	buVQ==
Received: by 10.152.131.200 with SMTP id oo8mr7587802lab.34.1352383799076;
	Thu, 08 Nov 2012 06:09:59 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.1.49 with HTTP; Thu, 8 Nov 2012 06:09:38 -0800 (PST)
In-Reply-To: <CABuzA3PSXijNc_arax7faz0RAJbHW6A7yjk_BDLfqq3Oojurdg@mail.gmail.com>
References: <CABuzA3PSXijNc_arax7faz0RAJbHW6A7yjk_BDLfqq3Oojurdg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 8 Nov 2012 07:09:38 -0700
X-Google-Sender-Auth: o-oLEjdKCWL1cYv5H_W5dHY2GNU
Message-ID: <CABcZAN=uQC5WEF6zg4N74=yibNoPUPwboAybi9mc+iKcrVPzzQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: devshell - setting up additional environment variable
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
X-List-Received-Date: Thu, 08 Nov 2012 14:23:47 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 8, 2012 at 3:03 AM, John Stirling
<ap.john.stirling@gmail.com> wrote:
> Can someone advise best way to set up additional environment variables
> automatically when invoking devshell -
>
> We used to define a do_devshell_prepend() function but that doesn't seem to
> work any more.


See OE_TERMINAL_EXPORTS -
https://github.com/openembedded/oe-core/blob/master/meta/classes/terminal.bbclass#L7
-- 
Christopher Larson


