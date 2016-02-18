Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8DA62731EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 18:33:58 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id x4so34210924lbm.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 10:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=e8KxHEwHWwqlTlMVyvQ+Cez0fB2c1+tHmKyKqNn+46M=;
	b=vtvJ7UPHoiAlI6yxiuyQ1PlpNXxHqxE8tLXAasbPLIcQ0qLj5Ru1e7oeUTtXKJjE1z
	rMu2c39aP4ZUPBsctTFT4ItKpdLMnb4gzLbp2AnEssTUiSqa+oPDUyBekzI6kcfh+Ill
	inWv5LZ1UcMdPXeeGV96yl4xeApew4Y/mt1YMMvRJWq9OwErhBKvzNvAlvTo+08jh4CX
	FFaQ9jZTsPKLKkE2BEvTH0jtfRNhiRmib18UrdmRXB65aTyccVOxm3oF5Legfl/QwoNw
	kt1yYHr1UtWu/eSohSRTrlvcNy/QJoVC/7NbE1OkAHOO1WVunLqRoDtBVOFGk8IRe1rO
	A5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=e8KxHEwHWwqlTlMVyvQ+Cez0fB2c1+tHmKyKqNn+46M=;
	b=k9dSmqk6F94iX77BhL4bSuJ1SZxy5BszHAeLCQQpJwtOZgC9fINON17+cBEWO90J7t
	Ib3J4ilIABRziX1v5rM5RPucp6CZEpuNcfXQAqY+n63QxOs3ZqG5oY2vU6V/dJIUSzzL
	pvFd7tdYI6hmvxZOkn/Wc7Ka8Vib0R3LRLw5gg4SBojBNVFSL5YS/u1T8zf581NLTgQL
	MYZxg8L5Fc0Kv9E5E/NNGk5OVsopD9Sdxg2WbjvwvPSP3BxL03Wjch9E1KPiFiqHR8RR
	IxP4wzn2ltplxTrcmmHOtXHN08W4JihZwvYs4gUS+qXS4opP/cQLQACmgFzFFaehDoA0
	uWPg==
X-Gm-Message-State: AG10YOSMz3MhTlZwvSA67bxy8DZx4SmfKG5tm4FmCwXeei63ltlJZyppp8Nl5t9jRp+97eWHoz9Sd5/F+fEhhw==
X-Received: by 10.112.141.165 with SMTP id rp5mr3809539lbb.9.1455820438123;
	Thu, 18 Feb 2016 10:33:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.88.67 with HTTP; Thu, 18 Feb 2016 10:33:38 -0800 (PST)
X-Originating-IP: [177.127.4.90]
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 18 Feb 2016 16:33:38 -0200
Message-ID: <CAAPZna3WT_cz9YpCaE0iueYXCYxNd0ONRCu0=yuHLcrqUdoKaw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, sven.ebenfeld@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-python] Python Flask recipes
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
X-List-Received-Date: Thu, 18 Feb 2016 18:33:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi all!

I noticed that a few days ago were added some python-flask recipes.

I've been maintaining a layer with python-flask recipes, hosted here
http://code.ossystems.com.br/gitweb?p=meta-python-flask.git;a=summary

There are recipes in meta-python-flask that were added to meta-python
and I want to simplify maintenance and avoid duplicate recipes.

So, do I send recipes from meta-python-flask to meta-python or we move all
python-flask recipes from meta-python to meta-python-flask, using a layer
only for Flask web framework?

