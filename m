Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4FDC1731B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 13:29:40 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id c10so52838432pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=1/auRwaeDa6fs8dSmhy73mU8/IF/eR5n/cC7Gqk/spQ=;
	b=qRkkBaxwk0C94e0PU7j5FtPUVm78C/LclwryRwcSdK42oZLcJMcxmmy+rvkhWEiOAV
	90A6u/Z7SGFOdOg45Srar9OXaNBwVsjXN9lskv11s7fLZzAIfH/Ev7VtBLzIYfgrHVsX
	ZowPQn0ac46XNNhzmmcju9zVMGQfcKmXhA5G8aSXHXhkQcxfrB+crx/bGHc6AE1W0jm8
	hX8cZweUWSDLGbKnNC5Sc6rDnZiImtWjtdD0l9+hxGbL83D2xE6Vc2dMooFyikv28xio
	hfJHf3084XZUVwD8ETYdWrXEJHxk2YMg7tVB90sMj55HiD3z7dcI6c+Lv09Uspsb3YSp
	Q9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=1/auRwaeDa6fs8dSmhy73mU8/IF/eR5n/cC7Gqk/spQ=;
	b=bCOGYe1Z+TBhGahfIVaUJW8vSF7K3bdzJcuYn6xd9y4bgTKD+8MjITwHRT1OILqlPt
	RVllKhld6+EqivI0i3kNzaA7njT+RoBiuR4SIAZ8ND05UL3aPObk4SaybOXHmxXzfB/r
	fmSAehMBM0qSYT5x9j6Q2hXKSFS4+jzzXEO2jUWcCM9NClkaRChkoHKg2Rsp1IbiJnl0
	hZHH44FV5M3usEBd5Ks4nje+XfrggD3Fv7KbVNkotKumf5MVbO4bS2vW5juxJ9hfVs69
	G/V2ZAk0b2CI3yNM6lM802DrZYlXwoY8QODMLsFe3cdlB6xEPkfngIOsxP4IcDKblzXu
	NJCQ==
X-Gm-Message-State: AG10YORdFVm1hSne1g8fjQrat42NGd09EjDcE+tzuPWuM1ZNTYrPyKfylUqmMQcKT+E8vw==
X-Received: by 10.98.15.145 with SMTP id 17mr17907088pfp.19.1455888581872;
	Fri, 19 Feb 2016 05:29:41 -0800 (PST)
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com.
	[209.85.192.175]) by smtp.gmail.com with ESMTPSA id
	xu1sm18049935pab.31.2016.02.19.05.29.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 05:29:40 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f175.google.com with SMTP id e127so51328893pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:29:40 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.12.221 with SMTP id 90mr17961410pfm.95.1455888579823;
	Fri, 19 Feb 2016 05:29:39 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Fri, 19 Feb 2016 05:29:39 -0800 (PST)
In-Reply-To: <CAAPZna3WT_cz9YpCaE0iueYXCYxNd0ONRCu0=yuHLcrqUdoKaw@mail.gmail.com>
References: <CAAPZna3WT_cz9YpCaE0iueYXCYxNd0ONRCu0=yuHLcrqUdoKaw@mail.gmail.com>
Date: Fri, 19 Feb 2016 11:29:39 -0200
X-Gmail-Original-Message-ID: <CAP9ODKprnnfvxjxwYc=1aZijpuD5b4oxVXdGtJPtObiCGx6ybQ@mail.gmail.com>
Message-ID: <CAP9ODKprnnfvxjxwYc=1aZijpuD5b4oxVXdGtJPtObiCGx6ybQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] Python Flask recipes
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
X-List-Received-Date: Fri, 19 Feb 2016 13:29:41 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

On Thu, Feb 18, 2016 at 4:33 PM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> So, do I send recipes from meta-python-flask to meta-python or we move all
> python-flask recipes from meta-python to meta-python-flask, using a layer
> only for Flask web framework?

I am in favor of keeping Flask on its own layer as it allows for more
control on those recipes (e.g: upgrade them) without messing up with
meta-oe stable branches.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

