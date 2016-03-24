Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB556057B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 04:25:47 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id j35so29783498qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 21:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=HKGEcZlFaml8/3lxp21mJpaJA7k+4fFhlKKRnuyCvFw=;
	b=XBCmJWU7oBUolF8J/T141jok50R3IkrPZHXvpCKQKg3lk1idpw+DKQP+w+mHgw+IvM
	vfQ9JzfrsExSByWrm5oe3op+uFYJZ2YccEw2FlSFDnpKMDjrTUr+RW96AP9hdXGjCohJ
	17qIClTrOTPGbhe7cMRBYahtZNmuVt3Y8G0+OvL9Fg0HQ0zNBVWRa7loWx5puoROBib+
	FFAZ2AgQ6rt+7YL9mDYXIDAOJdrCUTbSTow5LQcr4p01G5JcSUaIeku6KPY0XxS+x998
	BbIFW/jKSM8EJS0c/gYG9Rb+8sCJOTquQtaaSgDi36okhBhOcToMXEb06VWCR7di6quj
	DWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=HKGEcZlFaml8/3lxp21mJpaJA7k+4fFhlKKRnuyCvFw=;
	b=F8zETOM5krNO3qrrxmErOqTFqFAdCzgh87PZQESdk0tOqGrqL6dB9n1iTe99PofZ9N
	FLtpziyURCAfa1DeepcktAecU6M4s39qjiIlJIOVTxgUTNNmonde06ZiMx5sC6oL5U2I
	SHhy49XqbthC1orkLUFRrBwZx5vtecw2j0kYGON9U4YvxhpmT8MUljyDucWpGp4IF8D7
	I9SlxeAvVmz4zWVLB5uL4N6kieVWzvyM7TwKyeeLJL6hgIp9JNORNDEJnslf5rAaal0p
	ZXwqxsxx8k3+FVNKnhWjpF1kngCDX4cIxjtBdZdebo6QgVQfIszr9aLl17fz4e1D0OGV
	eHBA==
X-Gm-Message-State: AD7BkJIgAFWyzNYuPZpiLEQ1JjuduVZRswC7UTskkD4mgIuv7Q8FVaKz/KI4IBk3j+JIcz3mLnhW9KlzIpdVGA==
MIME-Version: 1.0
X-Received: by 10.140.98.239 with SMTP id o102mr8069648qge.44.1458793547885;
	Wed, 23 Mar 2016 21:25:47 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Wed, 23 Mar 2016 21:25:47 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Wed, 23 Mar 2016 21:25:47 -0700 (PDT)
In-Reply-To: <56F2A6BB.7000701@elfin.de>
References: <56E01535.6030509@elfin.de>
	<56F2A6BB.7000701@elfin.de>
Date: Wed, 23 Mar 2016 21:25:47 -0700
Message-ID: <CAMKF1sr0vGVi0v6yGSp2zZBaJiNGdTFXjc1MbjSCv80mGeFkQw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: systemd service not enabled when adding simple recipe to image
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
X-List-Received-Date: Thu, 24 Mar 2016 04:25:48 -0000
Content-Type: text/plain; charset=UTF-8

This is a bug. Can you please create a bug in bugzilla so it can be
addressed
On Mar 23, 2016 7:23 AM, "Sandro Stiller" <sandro.stiller@elfin.de> wrote:

> If anyone is interested:
>
> The reason why systemd service works if installed using opkg and fails if
> I create an image:
>
> The systemctl executable of OE is a shell script which handles the
> .service file in a different way.
> I had a blank space behind the "WantedBy" line. The "real" systemctl has
> no problem with it, but the shell script silently ignores the entry without
> any error message and the service is not enabled in the image.
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

