Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.6930.1588927596463758734
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 01:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=A1bmTr6J;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id z8so908008wrw.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2020 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=qqlufQ6TtA3rKeCeeCZtYUEhrnFKNlMxdH170sbWz6U=;
        b=A1bmTr6JP1qszLWi+4GBqJbCxzH0Zr3GSBR+l9RD6a8h/BayU/G/Np6cqiOxvTCqpZ
         lqB7X0xlHF3d/24dFvHHnXE4fZknEUvV39DdMQVGVaXNYs4HpltnE8evyM2GQzUo619o
         Hi8vzE8BBjlrU5I2xw6EJOk13Sq7xEFRIIm8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=qqlufQ6TtA3rKeCeeCZtYUEhrnFKNlMxdH170sbWz6U=;
        b=LI+cv9zGdEdi9+jFV6guP5PGBS0covMC+Pcl8mJ5Hh/mLTYCA1BaotVkwBboWPZAwm
         VSXYc+pU1w7UBPyKHhobbjeVxl0qDiU4xRz6VcMMJtAPc9hS5d0ZjmTCKyW5krizN8CA
         y4a2rqq56nrarDn2MnV5MkmmDTqcbIwoaRb+wnMY7oZXhUmV9GSMPln9IMLo/axccgbU
         QTBAvjwC50TIpbV5TQGRnGhftYmnJg97yHmWEmxS4SQ0H5GpAY9LO6F2563j2etAeKVe
         h/GzLNNkWIlp7nKVQ0rB4JtpFCpUYeMWeeHE+7d113CbQzmORnOobL0Nfu2OWl+CbmJb
         y/Yw==
X-Gm-Message-State: AGi0PuYazmko/YXrZ3xQG5EcjKwIXKAYm6KHsHbsHTXfqdjDlIf+8eql
	Nqa6AJUqJ52LRJ2TKnU01kmlKw==
X-Google-Smtp-Source: APiQypLdPZ6TYUA2cShjEog2FBcYrcDEBAEvrQ8NLtcIVFffGN38Qyrh4P50NL6t5rVXWJFXJq7trg==
X-Received: by 2002:adf:e34d:: with SMTP id n13mr1752041wrj.249.1588927594955;
        Fri, 08 May 2020 01:46:34 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id b23sm9704299wmb.26.2020.05.08.01.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 01:46:34 -0700 (PDT)
Date: Fri, 8 May 2020 09:46:30 +0100
From: "Paul Barker" <pbarker@konsulko.com>
To: qaz79462008@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-networking] This version of TShark was not built with support for capturing packets
Message-ID: <20200508094630.00b00026@ub1910>
In-Reply-To: <edvX.1588926473120380747.XE0J@lists.openembedded.org>
References: <edvX.1588926473120380747.XE0J@lists.openembedded.org>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 08 May 2020 01:27:53 -0700
qaz79462008@gmail.com wrote:

> I build my Yocto with wireshark_1.12.4.bb ( https://git.congatec.com/yocto/meta-openembedded/blob/fido/meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb )
> put it on my machine and run tshark, it shows "tshark: This version of TShark was not built with support for capturing packets."
> one line of the recipe *EXTRA_OECONF += "--with-qt=no --enable-usr-local=no --enable-tshark --with-pcap=no --enable-pcap-ng-default"
> 
> * So does this mean that I have tshark enable?
> How should I modify the recipe?
> Thanks

You're looking at a very old Yocto Project release there. I'd recommend
switching to something more recent so that we can support you on this mailing
list.

Thanks,

-- 
Paul Barker
Konsulko Group
