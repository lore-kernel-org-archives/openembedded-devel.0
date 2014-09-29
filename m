Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 448BF605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 15:11:26 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id c41so5846457yho.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=wYseriHk86T6xiPUzr77jYgWa+F8kQLb6fgAZGfyZTA=;
	b=Ez9cL20DNQXF9C6qhoCiYM8OaPzgQ+wcP8SCaytN+Vcw6Jo7UNMy3gn6ErsnR0MVLM
	NfXEJ+q85f/URa8mqQxMNBVaYSDbnUYepBuJuNMgqT+3InE/tJgPeABE5UjWIVA6SBq8
	wp24JsTmqkGSRm8Mpx1KbvzkhmP1awXnJMqk7tgc0L0egcP4DhVkahBZ0W7TlgsEu6sm
	RNfiqm/MBLOYS/w17m9qgD+671Rs9X/eLNzI5qoSRpzFwW/RScRbkZNl8iKJ6fx6WO3g
	zaRVuZ56xTgO9MiSFCbd7AxxsqjqkAksIOPFr0ySzwwKUWszYku2+Us65ABZVfLYIHJl
	Gy/g==
MIME-Version: 1.0
X-Received: by 10.236.190.133 with SMTP id e5mr170515yhn.13.1412003487678;
	Mon, 29 Sep 2014 08:11:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Mon, 29 Sep 2014 08:11:27 -0700 (PDT)
In-Reply-To: <1411637549-5623-1-git-send-email-dv@pseudoterminal.org>
References: <1411637549-5623-1-git-send-email-dv@pseudoterminal.org>
Date: Mon, 29 Sep 2014 12:11:27 -0300
X-Google-Sender-Auth: TWq7Z29JsUR7ywIzCDZ6EWMLBdY
Message-ID: <CAP9ODKr3HJ3xa96dYpNicHi6ZfZmU_tChpOn4JYL44Vy8q7=aA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: Add missing impl side painting patch
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
X-List-Received-Date: Mon, 29 Sep 2014 15:11:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 25, 2014 at 6:32 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>

I pushed it but I amended the commit log to:

commit e988a2c5010d74ce3557c37ea045ce710d70c7d7 (HEAD, master)
Author: Carlos Rafael Giani <dv@pseudoterminal.org>
Date:   Thu Sep 25 11:32:29 2014 +0200

    chromium: Add missing impl side painting patch

    Disable rasterization whitelist, unlocking impl side painting. It is
    still in an experimental stage, but promises better performance so it
    needs to be enabled by PACKAGECONFIG.

    Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

