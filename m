Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web09.1310.1607655180460814238
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Dec 2020 18:53:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U2aW6fK/;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id l7so3558186qvt.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Dec 2020 18:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P1jmMGGMplT+jiQYsm7UYFGw/uO0dWWYXOGmWJajrFU=;
        b=U2aW6fK/fWSP2f4TpM+7EKYzXTSb9rmvZpW/AYDdb2z38R5/V/XDpKbl06rGtW+2Mg
         sFBy8epfqHsuZS1NKJuciJehnhjJIt6JK1QI5FKlrKqmCBTKgzy8skivNhEO3PIZIjKm
         IHIxeTLGUnMDgANSceP4hEXZrLQwCVHitMe3FltBLEXEyEnHNAAjrPSK4br/PoDm66Hv
         2HgeIKkjsKfrf7oT8b4b/4vc4XkOyu5Q0xxmvIWRPUqHlA+iuGoVQNAbpRfurKskFqYS
         oEFk3fKBdN8av9LyKAFNr8a2aJ9LI8TM2SLUTSB+iHIT2y9RufkL3PzI/o+esH8zGql2
         gBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P1jmMGGMplT+jiQYsm7UYFGw/uO0dWWYXOGmWJajrFU=;
        b=N98DIhKvOVLy7EnsTncu724XrEG+hGCTmAKn4KA0d3XfwvJjnq41Ky/MnLTM3A4SDl
         mzL7UtFVzmwRiwHYQx+Ia2I3DGiVZJno6G+UtqcpqaF8xtuxMtcqYrCGZGZ/9ic0M8pM
         kyVZBFHGq3Vq7xaWa1DhaKSh79bRJsivrsE0ap+Jg6g4tesO9e7P14XE3laNC80DQOjI
         RN3wxKx27BYE43jdoQz0/MoE2CQ8yOmmITNYa7V5cO2QNVpJCXBoSLcVQppPdwl/c0EH
         MJu4FUwOLLAG9UnJUNTnZtV05qul4/kC8rikqg7dHYGe0B/4+fx770dPlQrVuPMWh+zT
         RWzg==
X-Gm-Message-State: AOAM533XhhR4mS8iSomFub/0Rph3cIyS22Oy0vpEM66Dtf6ZuvCmPeXH
	bpZY48jyElQivrqwj4DoQlRIx022Gu+JfA==
X-Google-Smtp-Source: ABdhPJxkZ0OGWisnk8kD6QwWpgQKfp8etPBMTQoNZgd1QlWgpV1Of4+0+lKiRSjzSZPXjnZGQ6Plkw==
X-Received: by 2002:a05:6214:10c6:: with SMTP id r6mr12839437qvs.44.1607655179701;
        Thu, 10 Dec 2020 18:52:59 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id o4sm5338021qta.26.2020.12.10.18.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 18:52:58 -0800 (PST)
Date: Thu, 10 Dec 2020 21:52:56 -0500
From: "Trevor Woerner" <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH v3 2/3] glmark2: update to latest
Message-ID: <20201211025256.GB25551@localhost>
References: <20201204040829.38707-1-twoerner@gmail.com>
 <20201204040829.38707-2-twoerner@gmail.com>
 <CAMKF1srUKMu4BKER5xBhc5Kw5tOoqPE3PgGHYWAiLx7u0yEHig@mail.gmail.com>
 <CAMKF1sq4bSW23uEmcuD8+W_+yvi0dKKpTh_-aApasRPb=heHGA@mail.gmail.com>
 <CAHUNapQMNV5Ei_2MKYyaWKyD6xQ6_U_sZbwRdaGCwBcWWnc-tw@mail.gmail.com>
 <CAMKF1spwyen8hwQ7iwJ36kS=WGRZUy6sOS0EDvUX29GCH2uTPA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spwyen8hwQ7iwJ36kS=WGRZUy6sOS0EDvUX29GCH2uTPA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu 2020-12-10 @ 12:34:17 PM, Khem Raj wrote:
> On Thu, Dec 10, 2020 at 11:39 AM Trevor Woerner <twoerner@gmail.com> wrote:
> >
> > On Tue, Dec 8, 2020 at 6:55 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> while I have applied v3, please send a v4 addressing this change.
> >
> >
> > I had wanted to try going in a different direction, one that didn't need the DISTRO_FEATURE thing.
> 
> all I wanted was to fix PV as a followup

Ah sorry, an update to 2/3. Okay, coming shortly.

Can we drop 3/3? I'd like to give it another go without the "dispmanx"
DISTRO_FEATURES.
