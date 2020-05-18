Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.1392.1589821988622163911
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 10:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=S6iWmjCi;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=l5hx=7a=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Qlvk2HhMz4H;
	Mon, 18 May 2020 19:13:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589821986;
	bh=hdNCPXM9mLNU9brPxYbLDJ6N1pBmtUTArYf2nqBxMjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S6iWmjCiGE9GsE3qS7n5TJ6H1+APu3zdoY0szpIvg/HH8ySW70PD2yuS4krAqmhBo
	 4ldxRdo2DVAbcGC3/nRfWyRY1P01mT/8yQ5xH7mi7np0/QxMIwB0cx0jt202uDoeww
	 kKPDsbyRZPnI4kyPA57NTizrgVpXD4v2Kmgb8r+GgPpQFmVefExnn3/KhAiwdmUPI+
	 nYcvBG2YJrVT2dBxzrYiR8iVfMyZnMtTXGsMAaSIM3fxAK8Ywc9VytfCvnN3e9iqSh
	 QV22VdoSuh7CeLsB6TdNkWMbMy7M759lx7r00w8Sfdg7QvcfhcE14YjV1U1KJIvojD
	 QJOQyDRuYf8QqR4mcsNnXbFItkf/OW3fWUECIyPvbbhyfIeTo/XfkuJje55SBVK8Jt
	 FE/DpP2H+uVkzAqv8nMBJUocaD4C12BJUq7pO7hY3oKK2AZIRCgBRJvBTzKYQowJzp
	 4xEyqYsO21jhYZvqzmK7wmqRhCKPwvGcc/uVTe4Qo9rq1abnKWS7ntzNLAzPuUn2jj
	 WGRGt+I9JDQ0y9HOhLB3tT35YOBViGkkoHkakv9zuKiupDGAec3ns7BSguEg2qGa4b
	 ZB6+Px9NF0dxrO17R+drGtyF6z7wxVkY8OTOjPC0rqgtQ7CAMFbgVWeONBI00wItaj
	 qpCuB2X+VY++ND4BIga/kKxs=
Date: Mon, 18 May 2020 20:13:04 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [dunfell 00/57] Patch review
Message-ID: <20200518171304.GA1884@localhost>
References: <cover.1589813083.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 18, 2020 at 07:49:05AM -0700, akuster wrote:
>...
> Adrian Bunk (1):
>   mraa: Replace -fcommon with fix
>...

I'd drop that one:
Cleanup patch that replaces a harmless workaround with a trivial fix.
 
cu
Adrian
