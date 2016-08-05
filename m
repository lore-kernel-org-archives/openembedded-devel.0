Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E0CD0770DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 16:39:40 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i5so4496329wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2016 09:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nhpA4kR6aRZ7E/x45QDuqXagYp1hClcoHV/KjwPyRts=;
	b=oShbK2u0dcCisafYfef0r1blELe4WQsuzWRbVy7q1Qeg+CtJjqebMArgOklvq2c/NL
	abBZVx9mXv6PRYur8iFToU5WKZajtLXThDjppCpwEOVNllCz+Kt5gsa++PdBiFhTi41n
	XptGOPU8vR6BPUCEF1HpC/oiS96IZEnntxVRPid5gPxeaLNDyuvof4mDNv260xCZI9Nr
	c1sKmB8G6EdfXjsIXcmac/mc0TAApPz9OHHZkiVaxdWaU2ru9/+AN9zVkZ7OyhBnA0AB
	ZiiMB+5ZPlUlI6YFTiUVC1kYjdCVyVYAVh8oGr3qrna5FC5MoafW+spFTvQ5h+riZeyb
	rwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nhpA4kR6aRZ7E/x45QDuqXagYp1hClcoHV/KjwPyRts=;
	b=YP9IkScyxiO7uhRVx6d3nwGvbwALIkMlWIJLJO022VZWDUo99whyX1d/JJl+0g9VmK
	JqMF56oMOLi7eCup57/EIKU+fUPu+KyfnXEY++oKoThRcmQ04kvsBJpGSPvBsotdwlOf
	lFWf5yBctEcJJv9G/On7i+S+oYDeHYuXwVHRE9/okGa8Drn437aPhWX+vMP6Hhs5QdvD
	pxuUnduzRcY+h+qaLOsm1YtsOo+Xp2rUPaoBkSER26XAcjYI90bSYZ99Y/yJ3gGO8y30
	Sb76ZNYvF0ERe+DRcsk6nj6yDDlSsre0+VcojyTZiRrygFqRG5bGvJCnI8dg0I1t7jnc
	yxEA==
X-Gm-Message-State: AEkoousJXSQunMapL6RnNsqGJdq9FCWQad0niW4c2woHgzr9qFQZdvM3RDhFKO3lKKWqMP9PyCEHSrVw4RfHYw==
X-Received: by 10.194.185.116 with SMTP id fb20mr49292890wjc.32.1470415181001; 
	Fri, 05 Aug 2016 09:39:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.139.148 with HTTP; Fri, 5 Aug 2016 09:39:20 -0700 (PDT)
In-Reply-To: <1470415127-13908-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1470415127-13908-1-git-send-email-ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 5 Aug 2016 18:39:20 +0200
Message-ID: <CAPybu_3d8q+Fs9G08NYpAX_BT5MkdPWY4dkH1PbZV3k-jHLjPw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <Martin.Jansa@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>, 
	Khem Raj <raj.khem@gmail.com>, ml@embed.me.uk
Subject: Re: [meta-oe][PATCH] opencv: Fix build with gcc 6.0
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
X-List-Received-Date: Fri, 05 Aug 2016 16:39:41 -0000
Content-Type: text/plain; charset=UTF-8

Sorry for the resend, but I forgot to add the Mailing list.


Regards

