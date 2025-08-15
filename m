Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C479CA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 09:29:59 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.7996.1755250197717774001
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 02:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CSk9pRxN;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-70ba7aa136fso2415916d6.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755250197; x=1755854997; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YMEashfwMoLzil56DNht4EGOgU4ZXIvhX6n6c7ENH8M=;
        b=CSk9pRxNdMIdJyS4H8KuatOSTPhs0j4r/mwIRiVRX+xjolKtthoW7laTgaJ0NDjqTk
         Q8aqfTnQfIZIeXmyLTd2RfWlVa4YiC/FSRS1sYxpU7HWd3GP5OjKLtsPhm5KmSCm9HEZ
         xlo2lxyZUjLZaEzzPWQ+PzWb/s/i3jkoVmMjpbhWS9g2babuX2sNT8DwM+mydREWL46D
         AErfk2yVk3YXRCq9gPTFk3pC/272NpJ9tQin/qLwlKgoA7lt6AAznrPVPZbD9RGh4Y/S
         9EHp2KkVV7XtCt7dNpkA9xj5IQXuCq0684SF6u2ZEF+sZ9fO6xxrlKe+8mitwY3QSIkw
         lwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755250197; x=1755854997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMEashfwMoLzil56DNht4EGOgU4ZXIvhX6n6c7ENH8M=;
        b=FXrE0XXXnwrNSfcmJ3gX1bkN3KADdcnE1MLaJRNg1Vrl0ANEZGMF4ZVF/3t65Y4z6x
         /1ROJg8d4dnTFdE5rP/3W7Pz4Si+vHOrgyqSuRhfImLqUEtIQyZWrbbflONa+iECpw18
         OLvjHjZyjq379jHXH2sFHTUK+ebZ6ZsBlDcQjppQg+IJvtvfBfAiw71ZPKpv4LTrpF7X
         JLuhz/Ta+nl54vlD4gzgss0CdWemtdPHRtt+xOvEUmzOK1YIaQeNABxsh/n7bh+GM04n
         pcmVmVeuzreecUlj47rdxPY2PFxbWt7z89yeBg+CNsBSYuFdXaivSg+6TJr6nEjRkvBY
         aigA==
X-Forwarded-Encrypted: i=1; AJvYcCXekqBxXr9sAgrYWTwzgpeJgYMi/ChgplmHII1f3hRWJBF6tF3cToSsp7SonBf2FPE4qlPKOv66D439DcnA9ry+zeM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzW8XFCQM5YV+1Vm1t2ckPiVswr7mKRz26HGONFNFAlceGhEYsp
	ncfPiBAGXlkjib+VqrSkgYFRSFbtlqjsVfSICtEdzwQ3dr7OM0qrvHqAf8j3CFxZmUVIebZNZ5E
	vKIkXFcBvuiAJqUIRz5+vdoQmBg0ywKwErQ==
X-Gm-Gg: ASbGnctVhkllGrA1QhpfwQsDVHFFbkdAGPbC84AlUO3Kw0QhpEUfw6/zWS1TEaEPN3F
	UDfalRjyG1UReoEsIUDzkjjcNgBwA+YbzCAt7IiqaVn95eIG7mfPqKUnJ/y8fTfAOVJNa5kJZeN
	H//I15i9IcZDGpYDioomi2W+i4a1NaWFZgDAZDJZFotrPIXd0oEJcPkgv1+3ILf0EbqVrWykoL4
	QGB6utS7AtBOoISw0a+NorRTKD1rd8+7+kzjrfrSfPcym7k
X-Google-Smtp-Source: AGHT+IGKxjePwpV+MVqBcA5MwZ1zVbjjwdjwJFK7vT/4MrL2EEplvfOtJEovp9MfeWuef0Z7+6JOKCQuUMw1o7W12bo=
X-Received: by 2002:a05:6214:2aad:b0:707:7b4f:6e35 with SMTP id
 6a1803df08f44-70ba7c610f0mr11550276d6.34.1755250196737; Fri, 15 Aug 2025
 02:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250815041114.481650-1-karn.jye.lau@intel.com>
 <AS1PR10MB569789D04BA92FFBEBDCB664FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CH3PR11MB870248A4F751C67B94D9E7D0D734A@CH3PR11MB8702.namprd11.prod.outlook.com>
 <AS1PR10MB5697355DC7874A906AB2E20EFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697DACCAF2B06BE08BF72ACFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj9bSkBW1DRgHe8JDvYxgsfjowYCAg8RCyxSi6pVtwhJXA@mail.gmail.com> <LV8PR11MB8699B8D2F8167A3F836B80F5D734A@LV8PR11MB8699.namprd11.prod.outlook.com>
In-Reply-To: <LV8PR11MB8699B8D2F8167A3F836B80F5D734A@LV8PR11MB8699.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Aug 2025 11:29:45 +0200
X-Gm-Features: Ac12FXw0LS-7tsZLlaBiHASiPzRyAmRAshR0yu7rAwO7IX1NvMPC1Pb8umbwVqc
Message-ID: <CANNYZj_eghchJhG0DmgF=nUUrCuaq3okE1GUYCCtZ8FbqNs6Eg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher
 conflict by using SRC_URI.
To: "Lau, Karn Jye" <karn.jye.lau@intel.com>
Cc: "peter.marko@siemens.com" <peter.marko@siemens.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 09:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118966

On Fri, 15 Aug 2025 at 11:21, Lau, Karn Jye <karn.jye.lau@intel.com> wrote:
> https://github.com/openembedded/meta-openembedded/commit/6dedea42620332987d92044a7e8c8e85fa07c107
> when this changes was make, scarthgap  already unbuildable
> unfortunately it get bump further to version 3.6.4 regardless.
> https://github.com/openembedded/meta-openembedded/commit/2c9126bd0dd0f62021f5db34d698489bb814ebda

But how did either change manage to land in scarthgap without failing
in testing at any point? Something doesn't compute here, especially
because people started reporting the failure only today.

Alex

