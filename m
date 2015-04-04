Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id B275E724DC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Apr 2015 19:27:58 +0000 (UTC)
Received: by ierf6 with SMTP id f6so366709ier.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Apr 2015 12:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=PpXa2mfvJsOoPosbtRmr9DqAHrdd8CrNAOqogiZ9ukI=;
	b=Og7UO4Cz3vLGCzT+HVCJa5jwnnSA+zlZMlL6KVh9E79EqH586FbaRJHKohH6LwT5xh
	b+RVriPVcAxcbhfXqh0bPSm1D/xZZa8W52lG/4grfGg0Nb3DHdhYdyfEKoNpLn1bZ+oD
	uxXCoZbd5wOQrYKXo8Zdd/s/yMGW5wHIel2u3pXZS6aqXjIMpnYUGDCiQfdNbMF4/L/y
	TXzcEPeZfknidaufLqMsHBIqUBI72NJ3qm7FZhdHf8/fU9DZjDORb67rcRb0a6y/MGcx
	ZX65A7yUA4SPTtoIx8qfQqUNhgwHsdEghNNwXngovHL/rUYYc4Z2cmtzp42Ha+Qlbhp8
	FuVg==
MIME-Version: 1.0
X-Received: by 10.50.66.37 with SMTP id c5mr12642199igt.26.1428175679431; Sat,
	04 Apr 2015 12:27:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Sat, 4 Apr 2015 12:27:59 -0700 (PDT)
In-Reply-To: <CAD0=qk+2f1qORQLQzD_r8p_VaF0+mAkVu+E=yz5-zzipf7RHXQ@mail.gmail.com>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
	<CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>
	<551C4F35.7020001@gmail.com>
	<CAEHkU3Xg=NSPw2gc1rmPLy3RD68BRNK5hczmS5e6tTE9gEBk+A@mail.gmail.com>
	<551DA5BA.3050505@gmail.com>
	<CAP9ODKqazzhOMQtsdKaGhA-1pNQOHNRQ2vvp_uXDtq+gce2gqg@mail.gmail.com>
	<551E4A44.7050708@gmail.com>
	<CAP9ODKr4Xz8_OLD+DKqZ1wxx4c0Rc6bdSDwqLecFnhZa2x5kVg@mail.gmail.com>
	<CAD0=qk+2f1qORQLQzD_r8p_VaF0+mAkVu+E=yz5-zzipf7RHXQ@mail.gmail.com>
Date: Sat, 4 Apr 2015 16:27:59 -0300
X-Google-Sender-Auth: XgORKqjmhZm9vMv_ojfW8fvTOoM
Message-ID: <CAP9ODKqgAQqCxNg=fWMC6iW1Ks3HDd4c-YroMVOgJ=doTmsWLQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Trying to update openjdk-7 to icedtea 2.5.4 and jdk75b13
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
X-List-Received-Date: Sat, 04 Apr 2015 19:27:58 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 3, 2015 at 5:24 PM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
> Okay, thanks for the reply! I'm going to run it with debug symbols within
> the next days.
> But I have one more question. Icedtea7-native needs xsltproc native. Do you
> know the recipe which is providing it?

commit d5a2a31aaad8f6bdf19860f7a858b10d7dba08b6 (HEAD, pending)
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Sun Jan 25 23:11:51 2015 -0200

    openjdk-6: Add libxslt-native as dependency

    The build system looks for xsltproc during configure, when bootstrap
    is required, so we need to have it around. This has been catch when
    building the recipe in a clean tmp directory.

    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

