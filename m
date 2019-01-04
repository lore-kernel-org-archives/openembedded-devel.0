Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id C58D979EF8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jan 2019 16:53:59 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id x201so11139473ybg.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2019 08:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DBVW41+d9zyzF3XM8D0FKhXh+IYHIIXD6YhF3TURVt4=;
	b=eAkXT5gPYATQi70GC/vwB3PDKbVfk+TuICfXlPPZ+uN3fWNvI5wsiywAHgXvyWbT1t
	a4UWf9ydv+YyWrrY35fS/rWSxmAIpZt+Yxzf6dPWufLSWwv1eG1xXd2reLCcs4DB3REA
	omac7+X7IZHqZsEBsjff5bfsMEy8V8IqzaiphMEDNmPNr3NTAHowo2LfCh98CAOlZY84
	MqXbUJ4hz+CbFPwJ9qlmTtMUlE5IV+OK9wlEC3WE2zhXmp9HXGLE7ARow6q71ZRwCZYK
	bNvciPV8+jAkQ/hE4xyCcHxKIFz9Zf3bz24dwc7seZqnTJExHEyomjeniRlGvMnhCpVQ
	oLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DBVW41+d9zyzF3XM8D0FKhXh+IYHIIXD6YhF3TURVt4=;
	b=K7MvBco4FZn3+gSjjsJKJNGyufEk8pKoyrToysFs+h+2lyJc2wspFFM6Wn2WcQbzT/
	M6Ey1gAorI+cUaxz0uUR76PXUPwDh9WT2K/q85JTgY9vV/99qlhEYsowizZE4RFd/Vri
	ewE/yzG9ya/69ed1RC5msv6D9gdO5HIoupNTz/p441OKX1f5yxmy/UZT6WR1PYKcQwjR
	W5griygqsv079ZPAivP0jqhVZh6KDeBNDe0FCg6l+o4HPmu4gBw4y8OqWFT/8LxYSSH+
	wuy61zYA+pSivzpjmN/Fi/RTMPJfu53XZSERIkiYOYhURb+NJVEsUAJ1zWyP8B3pzutR
	73vw==
X-Gm-Message-State: AJcUuke31OZWCW2oNx4I5VoG9ZRbcB070p8VV3DSS/mLULYuIAHDl1WQ
	sxRdH/SiUaAxrk+5akWYd+N5NKPMLiVEyIkKzlY=
X-Google-Smtp-Source: ALg8bN7Ph0KP73xipi5HcYI/noleiU8n8+3GpEMSZTV0+eVm40E7SAPPgDTY3HZI9Kc2AvT21TAaSOizxdsEWwQsEo8=
X-Received: by 2002:a25:cc4a:: with SMTP id l71mr5440993ybf.10.1546620840440; 
	Fri, 04 Jan 2019 08:54:00 -0800 (PST)
MIME-Version: 1.0
References: <20190104164210.20675-1-thc.fr13nd@gmail.com>
In-Reply-To: <20190104164210.20675-1-thc.fr13nd@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 4 Jan 2019 17:53:47 +0100
Message-ID: <CALbNGRQEPtv++=pRKW9V2p_CSY_vqkt2U1XwAc2cYNrSoZwy8w@mail.gmail.com>
To: thc <thc.fr13nd@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] fix networkmanager apppend
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
X-List-Received-Date: Fri, 04 Jan 2019 16:54:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 4, 2019 at 5:42 PM thc <thc.fr13nd@gmail.com> wrote:
>
> Fix following warning:
>   WARNING:
>    networkmanager-1.14.4-r0 do_configure:
>    QA Issue: networkmanager:
>      invalid PACKAGECONFIG: bluez5glib [invalid-packageconfig]
>
>   if conf/local.conf:
>    PACKAGECONFIG_append_pn-networkmanager = " ifupdown wifi bluez5"
>   bluez5 is not compiled into nm
>
>   appending variable should use a prepending space, see
>   https://www.yoctoproject.org/docs/2.0/ref-manual/ref-manual.html
> ---
>  .../recipes-connectivity/networkmanager/networkmanager_%.bbappend       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Thanks (I was the one who introduced this bug...)

Please add "Signed-off-by" to your commit message

Andreas

