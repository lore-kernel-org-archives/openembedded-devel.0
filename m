Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5756E5CC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 04:08:30 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id x1so15476161qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Mar 2016 20:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=9qpGkRjqkxXd1VsgTZSZ7nW8OfmaquQOHsXW41g/RmE=;
	b=hQClwxjg45ZKZqJe4cjV1jdkJ77A/q/FkFi09Lp2Hw5dhtYsiHzRp29UVrep3qFWFj
	75TteEZ2vQHTJQEUep+/rlPngGV6hTFIIlcevzF4JsCSppYBaEQ1ykbq2BN4+m/90Bim
	r8WCenD8WEIvfH8Tqki+c7Ti2VZdhjD4NQ8crm1z4Fb+lAVA1xAGwVP++TljRsGxTbIE
	/ZdfShP9/TQ+ZHHGuyvAWMjj+jTfduyNtn5hn2IiioxXAdOObF4xfRE2ieildengWyhB
	w/qUwmyCXqyfDznZwerY1avygtT9PaZ5IVqvpZvBWO8Hnh3lNfnsvnr9/QklfShs/qHl
	z5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=9qpGkRjqkxXd1VsgTZSZ7nW8OfmaquQOHsXW41g/RmE=;
	b=R0PhyFmipJM+i9o9qGmnm8cSbLc9XD+evyIF7HSJn1WCnt1Y6zQep12vHaCIqoCSKa
	hyXqIcBFemZ/T8g/pzRdKyp0fRWheevBRxU4wr9sat0AkP20Zd/2u1E8W9RvfBAa3To5
	VH7ln6zYiaEfSbwcxHlIyp55fwXSSz/cjXzHPgRpSMm3o/QgY+7JHXjQwjxN/w+ocKZc
	UAX/n4tTAe1b78FDb9R4HI6hXWFR2joSy/o22SYfntJYjfWJ2O5HotgAx2xj/CPCKnRk
	XDaG6vS6k9DKuhwhZCFj20Y+n+T4BQcGn+MZ/tjAedl+HvNrsWswSA1gDszpQ/Sg2ttx
	T5jw==
X-Gm-Message-State: AD7BkJI1NF7dasMPsn76cq9ueSJjfmJbSBWs2bGi7MJFwLst5oMYIVo3vqN52IugB2Og/OgIYXwnhilfjgIClA==
MIME-Version: 1.0
X-Received: by 10.55.78.70 with SMTP id c67mr40126471qkb.37.1457496511501;
	Tue, 08 Mar 2016 20:08:31 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Tue, 8 Mar 2016 20:08:31 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Tue, 8 Mar 2016 20:08:31 -0800 (PST)
In-Reply-To: <50B33AC5ED75F74F991980326F1C438D191C80FE@PGSMSX103.gar.corp.intel.com>
References: <50B33AC5ED75F74F991980326F1C438D191C80FE@PGSMSX103.gar.corp.intel.com>
Date: Wed, 9 Mar 2016 11:08:31 +0700
Message-ID: <CAMKF1spNkwJWyb+BodLRr024o=vAjLCYGFgjhJa4u+Dao=j4Zw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Rebecca Chang <rebecca.swee.fun.chang@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [jethro] Additional version supported in stable branch
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
X-List-Received-Date: Wed, 09 Mar 2016 04:08:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mar 9, 2016 10:22 AM, "Chang, Rebecca Swee Fun" <
rebecca.swee.fun.chang@intel.com> wrote:
>
> Dear maintainers,
>
> I would like to collect inputs from all of you whether is it possible to
have 2 versions of libvpx supported in Jethro branch.
>

Not sure about release branch but for master it is ok if its a good case.
You can Mark the new recipe with lower preference than the stable one
> I have recently submitted libvpx v1.5 upgrade to master branch. I do
understand that stable branch is mainly used for security updates/fixes.
> So this is why I'm proposing to support 2 versions instead of upgrading
in Jethro.
>
> The reason behind is, we are enabling video decode/encode feature to
customers but our target BSP components are still based on Jethro.
>
> Please let me know your concern whether this is feasible. Thank you very
much.
>
> Regards,
> Rebecca

