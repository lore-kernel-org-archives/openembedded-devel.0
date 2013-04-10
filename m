Received: from mail-vc0-f173.google.com ([209.85.220.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPvXC-000717-Gf
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 15:57:58 +0200
Received: by mail-vc0-f173.google.com with SMTP id gf11so371021vcb.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 06:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=hbVnkr47MiIwQE5o1ogFAPL0URFGk8Slr83OoP97euU=;
	b=ZYkBAYCs1MFFjimk5i4g+4ta7aeS6ZT4l8vf6weVQsuU3wkMJAitfJV6pO1qkoortU
	X7dVuaLJPIfAlK3/oX/1PmjUvpQsovV2NBMU7HDZCK3qAhql2QcDPRly771HQx+Pq3eY
	rL6G1SEoPzR8V9iAJET43+RX9vzfsFeYy2oPddhmL4FvqNRXjju1+gNw1/kseFt7OnB8
	+e90x9S6Dkv3Zg9F0HXUvmLi0Zb8EJme3+U8sfIuCb0alTegyLaltxj80KIJERJd9297
	TN37tvoiP9M8vFKqyu5Ws+UHCi4Zjno9Jsen97qWxEqmPStzLHEvzjEbMmFPLEU4aq1G
	1heg==
X-Received: by 10.220.140.18 with SMTP id g18mr1486630vcu.54.1365601236596;
	Wed, 10 Apr 2013 06:40:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 10 Apr 2013 06:40:16 -0700 (PDT)
In-Reply-To: <CAOT3miKm12uZ75LrH5fvRxrSvZ7wbyi+ioxMQgROsF3B-mJTvQ@mail.gmail.com>
References: <CAOT3miKm12uZ75LrH5fvRxrSvZ7wbyi+ioxMQgROsF3B-mJTvQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Apr 2013 14:40:16 +0100
Message-ID: <CAJTo0LZLF9JhAd_Eo3Hr5n2LxXxgGCD_D9K4=ZQ8cSjwvWL6Uw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkogjbjMWdtvWTUx9Tboqm5sRSQS/uefM+3ufAA78jUYVMaktJQeF5Uk2QrquE+NO+hogou
Subject: Re: why does gupnp depends on gnome-icon-theme?
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
X-List-Received-Date: Wed, 10 Apr 2013 13:57:59 -0000
Content-Type: text/plain; charset=UTF-8

On 10 April 2013 14:12, Nicolas Dechesne <ndec13@gmail.com> wrote:
> i have noticed that gupnp (in meta-multimedia/recipes-connectivity)
> depends on gnome-icon-theme, and I don't really understand why, see
>
> http://cgit.openembedded.org/meta-openembedded/tree/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc#n5

That's historical, the only dependency on g-i-t is in gupnp-tools.
Patch welcome to remove it!

> i was able to build an image with gupnp even after patching DEPENDS to
> get rid of the dependency, and the main concern with this dependency
> is that it brings:
>
> RRECOMMENDS_${PN} = "librsvg-gtk"
> and as such attempts to build gtk+, while I am trying to make a
> directfb image without GTK.

That's also a bit annoying isn't it...  Maybe that should be removed
generally, and we'll leave it to distros/products to decide/know
whether they are using SVG icons or not.

Ross


