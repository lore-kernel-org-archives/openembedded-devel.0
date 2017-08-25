Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id A5D2D7847E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 18:15:16 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id b8so2859903pgn.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QTWvyER498mqmBMtjznriBLZoaXcYZq5UO7eqhuN2O8=;
	b=qZNTeUftzDwvbYgPDfY/VSB4+E/ftDxOdFf53R5Gbhk9TOFUa5F/cguLqrx2F32+/U
	n/00cL46vjNN3teLxoM7+C8RzcDfzfsfmMPASlCyXnUkKhJn6EPadbNsIoPZb5KPWqVe
	oPSZBXP+u/kuCU7ESXGDsxNZJyJ4ag7vvjbEFUJVqax/NlFK2M77bMRXjIcpd57XkYnD
	5FH/6SHj+IlagZ/z6+YrhA1IDsg3+NDDgkGRPudzhtJA5Fc2JhAeuX7sqOWwo5uJw+p/
	XynHU8HoSYfU/0o1r19L9MozowdsUSmSuX00iy6SP86w5jtFO4A5RC/K1f6lmbGzuaXw
	OegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QTWvyER498mqmBMtjznriBLZoaXcYZq5UO7eqhuN2O8=;
	b=RjF4SW8L6phMvwiLsO1zO1ihaYcUbZkc6gzrwtH74OBxVXzl6KUIAlUBx+bXt71evO
	jXuVhxN2r9m0WCwEIZBXU/5LZYRPXR6/sSQTvlsmZ1LYE5U4/qOdYSxSkGcmUBSS7Dho
	3Bjf6QMczU78DYofmJ84ZFGQASAXTYdKOyRgqTm9VYaFFKzC5/++qHuR7q5jxTN4f0Jt
	+PUxq7PUSgpF6ju/0REdSSiCeCSvIJXgHURgHW3QrWR3Q8X+g9BQUwORI5EPtrl4ITFV
	XaFefgKp84HzKVDJrHAx93xjiLCBfzwlEWpRDwdSxC2VWsK/p22fh/ae3YJElOpGMKPk
	vjDg==
X-Gm-Message-State: AHYfb5jhc8pTjj/ayAk8QM9wgD//groTLDynKeT2OLRMfl0jQWLtQAJQ
	T1whGaekS8dZs6IuXo1CJcpnenNCRA==
X-Received: by 10.98.202.73 with SMTP id n70mr10939864pfg.168.1503684917766;
	Fri, 25 Aug 2017 11:15:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Fri, 25 Aug 2017 11:14:47 -0700 (PDT)
In-Reply-To: <CA+chaQdw5eRR40rkOsq8VMkLVyvG_mf=3jGgppeZ8SCQ0jxy=Q@mail.gmail.com>
References: <20170821210259.20276-1-Martin.Jansa@gmail.com>
	<20170821210259.20276-5-Martin.Jansa@gmail.com>
	<CAMKF1sor29cpSkBMq4wm_OECGZvMLK5J1QWNu6Smqf9KqPBetA@mail.gmail.com>
	<CA+chaQdw5eRR40rkOsq8VMkLVyvG_mf=3jGgppeZ8SCQ0jxy=Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Aug 2017 11:14:47 -0700
Message-ID: <CAMKF1srQvTMq5Z5B=4gE62LRPMQi+1Azc5dZyn2+hiT1nSdCXQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCHv2 5/7] qt: upgrade to latest revision in 5.9 branch
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
X-List-Received-Date: Fri, 25 Aug 2017 18:15:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 25, 2017 at 10:28 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> It looks like you're building 5.9.0 not 5.9.2 from the patch where you're
> replying, can you try if you can reproduce it with 5.9.2 as well? Maybe it
> was already fixed upstream.

is 5.9.2 in master-next ? if yes then I am on master-next as of today

