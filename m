Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RzsgU-0003wp-0c
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 17:35:22 +0100
Received: by qadz30 with SMTP id z30so5072262qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 08:27:02 -0800 (PST)
Received-SPF: pass (google.com: domain of kergoth@gmail.com designates
	10.229.75.138 as permitted sender) client-ip=10.229.75.138; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of kergoth@gmail.com
	designates 10.229.75.138 as permitted sender)
	smtp.mail=kergoth@gmail.com;
	dkim=pass header.i=kergoth@gmail.com
Received: from mr.google.com ([10.229.75.138])
	by 10.229.75.138 with SMTP id y10mr19974778qcj.110.1329841622336
	(num_hops = 1); Tue, 21 Feb 2012 08:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=ol4JrMZya98JMniY6zS9GrSALPrHfppCR4VFqhST4R0=;
	b=U/4tsKTZ6Gn3nty7YraffG92lgiEsP29rvRFyVXQG97BjlYCvEbHqQMDlAZ71Ua5RO
	V6sBfxnIQztJ1/enjP1Cr4D8ZCiWHxp1GMibzfIxOXGlh+ttETy1x+CT0wD/4XJEfiL3
	tcShmxFxZj/011mlRqzSb3TNRgWu4VnXKxNZ4=
Received: by 10.229.75.138 with SMTP id y10mr16905615qcj.110.1329841622244;
	Tue, 21 Feb 2012 08:27:02 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.224.145 with HTTP; Tue, 21 Feb 2012 08:26:42 -0800 (PST)
In-Reply-To: <CAOHjBZvHtGh1v0LSUkDA=o9F0cHxD1TZ8CtrOQdzeXy8yZk-Dg@mail.gmail.com>
References: <CAOHjBZvHtGh1v0LSUkDA=o9F0cHxD1TZ8CtrOQdzeXy8yZk-Dg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 21 Feb 2012 09:26:42 -0700
X-Google-Sender-Auth: MCgGl_iKYziANlPe-vy0Z3VnITY
Message-ID: <CABcZAN=c1Hi9B5WL96XaDQScypRO4ETF9GtKKdPdZ=Gxqmfq5A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: CONFIG_SITE usage
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
X-List-Received-Date: Tue, 21 Feb 2012 16:35:22 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 21, 2012 at 3:48 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> I'm in trouble trying to set CONFIG_SITE to allow my build process to load
> cache from a given file. I've understood CONFIG_SITE can be set from .bb
> file, but I'm wondering if it could be set on local.conf or distro/machine
> conf file to be inherited by all packages.

CONFIG_SITE is automatically set for all autotools recipes. Read
siteinfo.bbclass and autotools.bbclass.
-- 
Christopher Larson


