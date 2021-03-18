Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.311.1616089500202964756
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 10:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NczmsFl5;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id v8so1671335plz.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 10:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rq+00ctePqvC/KWCveYMEeNFGAJ7IFxoMX0tS6INmyQ=;
        b=NczmsFl5je6BPyokKgeTWro2XMQKGC5xTGUJvyt9ugnsVZmaMKTTqpR+dY/SCVDYuJ
         a0+lSNXumO3EC3G+7N/T/OLpueUbMq1d/WQp70Q1gv3E+J9jBRkm03DphfsQmpydkaU+
         /pOGhJSEjxW/c8xw95qdUau1/rgFWaanM9GJXiTXv8qGB4wbiEB31VeX3SX6KqCOV8An
         /aESWi3kVVa9VNt7lOSFZxakcJZjlKe6Jrd0byoGDRehRI+aWml/5dpnu5kfzp7pNEEd
         i6iEHqelcmbhLliyosQh6myia30iwzApn8+jSZzmv4fiZnjcCG1TdAG4OetarscCHuU8
         5/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rq+00ctePqvC/KWCveYMEeNFGAJ7IFxoMX0tS6INmyQ=;
        b=f4L6Pe2gzU7qDGxF9Eo8iRrDPasQqmQo0LGadCmhNBPyVO1U5nSdGUoAkedqezskFT
         O+GKGFGGfg8ZmlB1dkfhXcLTzQdNbxLLWAGTmGkyjXcu4Wpy4UQY1RlapZ0tzFgyU2eo
         18sJt25N0cHB9CcE/wEzs6OCB8KIVneww4E4GH+qAvWzq89fl/m/zILpmZvraf461hUL
         pLPh3iKXX8b2jTkMnjhIcnZ5D7JvRwTcbOY/mPtVjbv33ZynJUH2mhSZs7Al6G0IaUbi
         wQZ86Nf+Bbi0G7udMvxl97H9ZBqVaxdy4innnuV9ezaol2OF4kDCl6/aXvtKD/d7KcF1
         ZfVw==
X-Gm-Message-State: AOAM533Fp9wynNgUDvQWTZoINeLMvPBrfxJ5F2lazLVRN+XOobM4y4QU
	FcE2rKWP+3rTXXBMNOvm928=
X-Google-Smtp-Source: ABdhPJz4nC4oAP5eqxKVd6byG6p2AQ4Ue+vuH2VyrHpVniUvF8pG4mfoMm26hF8w4h5/UT6AbxBA1g==
X-Received: by 2002:a17:90b:100e:: with SMTP id gm14mr5532059pjb.217.1616089499554;
        Thu, 18 Mar 2021 10:44:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.localdomain ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id f15sm2719260pgg.84.2021.03.18.10.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 10:44:59 -0700 (PDT)
Date: Thu, 18 Mar 2021 10:44:57 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Trevor Woerner <twoerner@gmail.com>
Subject: Re: [oe] [meta-oe] mpv can't find x11 components
Message-ID: <20210318174457.gm2no6omtd6qgzma@apollo.localdomain>
References: <CAMRc=McUB0dbu=GoQz_mrt0=V3=iYawp=WJi6Z5-_fW3i4dLPQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRc=McUB0dbu=GoQz_mrt0=V3=iYawp=WJi6Z5-_fW3i4dLPQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 18, 2021 at 11:47:30AM +0100, Bartosz Golaszewski wrote:
> I'm trying to add mpv to an image using the minimal-x-session. The
> build fails with the following error at do_configure():
> 
> | Checking for X11
>      : no ('x11 >= 1.0.0 xscrnsaver >= 1.0.0 xext >= 1.0.0 xinerama >=
> 1.0.0 xrandr >= 1.2.0' not found)
> | You manually enabled the feature 'x11', but the autodetection check failed.
> 
> If I build the core-image-x11 image, mpv builds just fine so I assume
> I'm missing something in my custom image (or rather some dependency
> isn't pulled in by the recipe).
> 
> Any idea on what could be missing?
> 

do you have x11 in DISTRO_FEATURES looking at config.log file might
reveal more on missing dependencies.

> Bart

> 
> 
> 

