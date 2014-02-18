Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9186EE33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 12:18:18 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id e9so25950559qcy.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 04:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=nUgy9mezAItH93GZmpjWlPC9kccPETYNGHMVhFEp4Vc=;
	b=zygPc9v/L9VgL6612i4xNrcqutXurOjDdUB+K/1qxBkUNxgaHALR8s6lZfRwKCkWAU
	KIUGdQQs7KaespsmH9FNXyL6ET/0TtlfMQgtIPw5s7/QVN3FW51PDIjjnqQXTBWaUn+x
	d6L9oRoKxj+lSNmmiyzl56YTLAyJZGcwJB4NhJ6Ggb8ThVjxaUrS65h1wG5zKJ4vh8Su
	ORUNAGJ7N8B3jR9u87kdvgPvYYgUUBtRCxA3AFXIUJobN34wIu6fIhw0Tn1KI5nljINU
	MpUbv4m+ynXg2IS/SaWcDVYmcPwY9XXeGvZMGTKWZK/PCtlVBaE3cAy8+UdBTBe+eh6u
	bbZg==
X-Received: by 10.140.106.225 with SMTP id e88mr39239756qgf.66.1392725898848; 
	Tue, 18 Feb 2014 04:18:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 18 Feb 2014 04:17:58 -0800 (PST)
In-Reply-To: <20140218114855.GH4067@jama>
References: <CAMCfZKFpTVoRJJ68m+vLdD_Pv-WkocXWKcxh6F0DnwP_sJ4t0Q@mail.gmail.com>
	<20140218114855.GH4067@jama>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 18 Feb 2014 09:17:58 -0300
Message-ID: <CAMCfZKFwMmcmTmQ+EyYwaDJXu0o2kzh+KYwnH4h5Q4R2kuqQ0A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: libao build fails on dora and master
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
X-List-Received-Date: Tue, 18 Feb 2014 12:18:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Martin,

On Tue, Feb 18, 2014 at 8:48 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> > libao compiling is failing because of a dependency on esound.
> > Adding EXTRA_OECONF += "--disable-esd" to recipe fix the issue.
>
> Please add PACKAGECONFIG for esound and send such patch, thanks.

Something link this?

PACKAGECONFIG ??= ""
PACKAGECONFIG[esound] = "--enable-esd,--disable-esd,esound"


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

