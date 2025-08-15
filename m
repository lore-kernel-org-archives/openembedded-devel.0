Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B8CCA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 09:39:39 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.8105.1755250777899236503
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 02:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mwGoGZ9b;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-70a9f5625b7so16821466d6.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 02:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755250777; x=1755855577; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3DjSwvurgvIO0gQA6R9QB3ikiyItTu3WT1kAUVce+zU=;
        b=mwGoGZ9buaPqyJTRkREBL2o7A91yDfVMNke+TIt76nHGiwAAytjuL6Ox9n/8HK79/l
         vVyEFSHrl9pbQK5xAy+9fOxWpJC0yOKNQ3VKJW+kaSt2ZQX3SMVsCrla7hYJ0q/0oIV8
         +1F2NdW02oobcDCDJ91kAxHQuYIFKNkv9qplWjyRy/BVV9Dl1g4w9iFkIzdiTNXlT3k3
         OYjhLhIGUdVs0O5u0yZdNc8ZWOQihqYs9G4ue7Vmg8yKKbpx7QXkvY6RDRUPQYY57zH8
         pm9Y2lU+xTUn2bxdM+yXEvdqCGdhDbswba80FdDF39sEnDrNPohGQ/r5v6tXCr+cDjfz
         qUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755250777; x=1755855577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DjSwvurgvIO0gQA6R9QB3ikiyItTu3WT1kAUVce+zU=;
        b=NZ64LygFcEy0p01DvxZcBPWuByqXbZp0JQxN0SRjQfueeZpb/l8vu5i55epvjL+8vt
         TkKPrhReEZaEnS/TqoVAljZP51cnVhCy4CoVsnN/pxYRODaTYUJeMWET0yKVnYf3mKZE
         veNarJXpi1iqx3uCqCCuDD7q35tI+SrQjM9JGBQw26fR4uwvkaLVmXaY2WcxvEhrHm+Z
         1vy0yqV8Nt9+n8CYsBkiNXrR89q6q4HZBYWi+0v6puN99DaIlw0rR++yE3FvFj2ZlhZ0
         k79TprWloOxBZ29oO784sN7lNtCsJRVMiinOifCh8Tq8NyJ36lDYryVbKoBPHGm//xCb
         YVhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKNzgoJcT+P80bvBNdXdXEP2RSEmqs8NPHymj+4xVXcAlTHlHcC/om+7gn6v/mpD90ivFbE93Qy2+cMTjnvjPvioY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzYUE7FDXvmKJVbbJ7Xi/uWZbvJP+CAMuBaD2/HvJnco0/lpEhc
	SAULnLMHWQXHxWXaPhCkAa9RpEwxfBwySCb6ccXl4TRKP77CAIc28MCTRhcCk3resTGBCosCm1n
	8PFeUVUBriXjFW8ToiS8XQsbIB3bjfT8=
X-Gm-Gg: ASbGncsniw6IzRIEG2zlByn80wrbBSkjnVvEC9RHedhL85yyWh87f6Rvk/DpWKOdhL7
	5ywqA0u7HVl3ykgIq6AQJJeGAJ3Npm/5dDYyvuZaREsxw4UMUoiFQ7u2gluggPH4aSHFaJcTc0Q
	QR5pgoQZQ6eOVKbDuQePrAKqtW9tXI2663nljdIiSjuPCrqnUk9cNcFxiYln0JSnH6MyzuQ+6Dx
	Rj2QHyDsenp04QWNIP27jODbM/n2A8BxKhVUMYgyA8HiOkC
X-Google-Smtp-Source: AGHT+IEkr7FHVsRzrcz7m2WsmOMrunQowsKJacTJfRzJmkYaOwGGo/fHRYPZOcrP1sChikhzi6/sqdnXlyBN8Bu/tG8=
X-Received: by 2002:ad4:5d61:0:b0:707:73d0:281c with SMTP id
 6a1803df08f44-70ba7bfa5femr12343776d6.27.1755250776940; Fri, 15 Aug 2025
 02:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250815041114.481650-1-karn.jye.lau@intel.com>
 <AS1PR10MB569789D04BA92FFBEBDCB664FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CH3PR11MB870248A4F751C67B94D9E7D0D734A@CH3PR11MB8702.namprd11.prod.outlook.com>
 <AS1PR10MB5697355DC7874A906AB2E20EFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697DACCAF2B06BE08BF72ACFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj9bSkBW1DRgHe8JDvYxgsfjowYCAg8RCyxSi6pVtwhJXA@mail.gmail.com>
 <LV8PR11MB8699B8D2F8167A3F836B80F5D734A@LV8PR11MB8699.namprd11.prod.outlook.com>
 <CANNYZj_eghchJhG0DmgF=nUUrCuaq3okE1GUYCCtZ8FbqNs6Eg@mail.gmail.com> <AS1PR10MB56978F72114B25000930724BFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56978F72114B25000930724BFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Aug 2025 11:39:25 +0200
X-Gm-Features: Ac12FXwlNuewQ-U1-YFK-XDzgd467_c1-qjkce6n5jL10Q8vovF-bQDrql2zYuA
Message-ID: <CANNYZj-kk=gwG0G2tbzW1V4ZzZy2CV5NfRRgHXzcbSkoi5hWVA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher
 conflict by using SRC_URI.
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "Lau, Karn Jye" <karn.jye.lau@intel.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 09:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118969

On Fri, 15 Aug 2025 at 11:36, Marko, Peter <Peter.Marko@siemens.com> wrote:
> This was moved from scathgap-next to scarthgap yesterday, so timing is clear
> https://lists.openembedded.org/g/openembedded-devel/message/118942
>
> The successful autobuilder runs are a mystery.
> Maybe the code throws only if the sources are not in downloads (e.g. autobuilder has these from master).

The more worrying scenario is that there was no actual build at any
point before this landed, I hope that is not the case.

I don't object to the fixes, just want to find out where the quality
gating process failed.

Alex

