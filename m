Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.11825.1591798765918459711
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=nfhdFjBv;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=0vpq=7x=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49hpyf0Bxgz4J;
	Wed, 10 Jun 2020 16:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1591798762;
	bh=uQtS/mcgpLzFS4UraPqmWtUysI7gvGkspT7yFPQ6LX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nfhdFjBvv+OpJPedaMBoWgzyjwRmEBtnXAplT9cf00kDj1RjzngrO0jmfxXt/N1T2
	 0FbIVb5oZMjsuzBthkHIuIazE7mLeRi4a1DwbeTa8J+P2JyDJaR668/ColbuHSfCY8
	 x16iDWOlxhWaMS7rL7eyxVRjEq2xx1XgwvfPVdZRrnUtJSKiEmPZCRAoZa+pxZ07lW
	 ZS/+HzUpktsqylFbGKwkqmoT3R3nRHTgMEcR5LFMUhNDFa3+UHHvhkkhe/zwuTiYU5
	 oAOcSF3FiIWHNUxAuqblov56NkNUIij5bTK9CGRl9MWmFI1w75DWffdWq5WfZNXy5J
	 SJirWJTD/k7zA+3rvcnAmJ69AbQDv3BOsz5jQ47AJYBsZrMsJPD64m7WPafkWvJ0UI
	 3tsjNII6sgnR1h+d2KbTmZYvAG4aUH1W9ElXEpao2HKfkci6CsKjwW4RJnnk+AJhig
	 kMS/Pn9e/+dB8oD8QrJP92qLStggSuQaqNWIgynHNZnjxXJheKkFp/ZJfL5SBphtpG
	 h9WBl864MVpvYqA9prgyhqx+g7+rnbnToa+1ZROTk3+xvLpgqKyurklr/xUlyE+eVf
	 lOFNRkOLtWQOvRdE3+/UwNmszDM++hYSjAfZvArTkXX0D+qATjSE+SnRd77My+f5D7
	 zw0adeu2iUuvxN3U9IhZY4vQ=
Date: Wed, 10 Jun 2020 17:19:20 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][dunfell][PATCH] gpsd: mark CLEANBROKEN
Message-ID: <20200610141920.GA24380@localhost>
References: <20200610070254.9851-2-bunk@stusta.de>
 <28d6cdd6-fdbb-9351-da8f-0abf83318a6b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <28d6cdd6-fdbb-9351-da8f-0abf83318a6b@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 10, 2020 at 07:14:48AM -0700, akuster808 wrote:
> On 6/10/20 12:02 AM, Adrian Bunk wrote:
> > From: Sean Nyekjaer <sean@geanix.com>
> >
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
> > index f74ebda5f..05fbed622 100644
> > --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
> > +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
> > @@ -23,6 +23,8 @@ SYSTEMD_OESCONS = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'f
> >  export STAGING_INCDIR
> >  export STAGING_LIBDIR
> >  
> > +CLEANBROKEN = "1"
> 
> So this affects the version in dunfell?
>...

Yes.

cu
Adrian
