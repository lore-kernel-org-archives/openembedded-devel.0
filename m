Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 82B0478F37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 14:43:13 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id 101-v6so28335341oth.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=yh/vFHT6+4SYOLHFI7IuMAsDgci9n1jfVz8c1llPNhE=;
	b=bKG9WudagC5tvR6RCJBr8D9Pg3TAo7Q0/wevMXo+tQwwW42tJrWeWIHBCdaRu0ZrZx
	duGhGNjPAxgUW+bJ9oPRfkDDFpljnXdeSAYmRaUrbTWC1z9mfxYf62P22WGxSILfDkE4
	WfXwGYvny4R21JRoiYWkwSPIHwKPdV0AjHm9jEfFIhv2l66VY1rXYLPkveHNK15Dg8pk
	B9iF+Uva7WHXIGA25n10FgGy8qqviGzJZI7WivyLhJ3Vc6VTnlkK6ahPXbbRKhw1RUSS
	JceoB4w3JInMVETm/ocDYd/bZBelhUnhOcK6/yQQ17suylPs5qQWdFoB1gV9AgkVjQOe
	6LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=yh/vFHT6+4SYOLHFI7IuMAsDgci9n1jfVz8c1llPNhE=;
	b=rKKXR4F/iIZ8HJAxVJSZvfBdPSXXGiNYxpJAiadcoJCW7do5c/VfR0IDw8E7o8ohg6
	21/kgYT13631IFoRyc0kSKFu762H0N04Ksr9SsjibLmu5KmbvFN5JjL0jKVgreKIOHBy
	79SVaH7uNp3EdRlpzsfmOGx4QyRJ3CvEK5sX7T98lr0Q0rSDCjq4hMgk7QFTNmaQnqj9
	9nNRDXedm9S/RIO+kvZu3wFoqVSIfWHe6a1QbqGZ6Q82MHZ/bokFM09p/4Y5frP41e0c
	beqacmD3qsl0Hukdnk2tbZP9YfdRHIa/5YF6Gns/VdEYkmhrxq8zBk80OjCGL8PhX5cG
	Mctg==
X-Gm-Message-State: APt69E3qOUmIzfMlJXe6Rm47thmGsr6Nwq097cMXek+yrZj5N4yJhIiS
	NymV5RIFNsetOD7sA+8PSyMEVACk
X-Google-Smtp-Source: ADUXVKJwG0BWoq0jxEO1MilaM5djPJbXI6QagQGDmWQn8g7+a8Y9uSJ1tNcd8SGG8iv/p5Cb5A7Sgg==
X-Received: by 2002:a9d:b54:: with SMTP id p20-v6mr456891otd.143.1528814594084;
	Tue, 12 Jun 2018 07:43:14 -0700 (PDT)
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com.
	[209.85.218.45]) by smtp.gmail.com with ESMTPSA id
	k47-v6sm142644otb.50.2018.06.12.07.43.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 07:43:12 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f45.google.com with SMTP id t133-v6so21299883oif.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 07:43:12 -0700 (PDT)
X-Received: by 2002:aca:f10b:: with SMTP id
	p11-v6mr2278028oih.80.1528814592250; 
	Tue, 12 Jun 2018 07:43:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:58c5:0:0:0:0:0 with HTTP; Tue, 12 Jun 2018 07:43:11
	-0700 (PDT)
In-Reply-To: <20180612143331.2445-4-richard.leitner@skidata.com>
References: <20180612143331.2445-1-richard.leitner@skidata.com>
	<20180612143331.2445-4-richard.leitner@skidata.com>
Date: Tue, 12 Jun 2018 11:43:11 -0300
X-Gmail-Original-Message-ID: <CAP9ODKov3n_o8ot8D6954Lc95uoXVC6vm3y1b2F67sNfmN3qXg@mail.gmail.com>
Message-ID: <CAP9ODKov3n_o8ot8D6954Lc95uoXVC6vm3y1b2F67sNfmN3qXg@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 3/4] README: add maintainer: Richard Leitner
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
X-List-Received-Date: Tue, 12 Jun 2018 14:43:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 12, 2018 at 11:33 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> As discussed on the openembedded-devel ML [1] add myself as a maintainer
> for this layer.
>
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2018-June/118697.html
>
> Cc: Henning Heinold <henning@itconsulting-heinold.de>
> Cc: Mario Domenech Goulart <mario@parenteses.org>
> Cc: Maxin John <maxin.john@intel.com>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

