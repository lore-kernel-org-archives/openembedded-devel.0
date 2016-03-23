Return-Path: <sandro.stiller@elfin.de>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5001C60132
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 14:22:52 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id p65so26612085wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=elfin-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=5mZjaNxVkHOdsfWF2tQvNCSSQ78e0vm2jctr7zU8mKo=;
	b=GV3adTdIytP+or7DOhzCbREciudy0Y0tyH+kUYZHFhzGb6YHDTvrUurbbyJYlinAEC
	1un8ITWYeKS5c34YCoJrFi07IarumS2HB6SsqKDY+JtgkQYpD/GqX7KQRsvsbTGBN3AX
	gnLuNWPdGsP2bl62vqc+p3ojAJLXYJHm6q7RH5uqfO2P6UkDHDsBT1WDBmrEl0LF8EW1
	952nkIDY/MclWJmxybjrXMlwO/m9lrzguSXZCAp5UTuq2smuFgy3g4/fn48LL6Lir+WM
	RCb4rMcG7ndswuSpSMvj18sM9AVx3KPL3EUErwCCKyaGwx+zCvDNHtd/I+kRP80H1dzp
	lp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=5mZjaNxVkHOdsfWF2tQvNCSSQ78e0vm2jctr7zU8mKo=;
	b=Fmasyr8QF4w1rfLMQ17D9slZmqSAi77DAhfv83f69jOyGetYoZkmle0A6dOs0KO741
	QHl5LC6xo6ypz8KfkdQeuP/ndDDkk2rVrpQWko35kVIpEdrE8acaFdFzOj8k9fhJndIR
	0iCYdLL7/k7VY3RcVbBqQC37hYFphaydfnCsdzdavs7ef4WeyNX1Jh+LSz7ZqsYLISdF
	4pwNly2yN8vj3wd7romCw8d3uex7T/g2Pj9arxWUzCShyOsejvogoueqkKQuqMajXINJ
	f0FBbpwEoLANIk9CgaEXWhvczZgWPfjipaCILC758fQUNLMSakHr4saKkEEcalzgR3CY
	47gg==
X-Gm-Message-State: AD7BkJL877nHAO1dxWmzjtZSc0AdSBAXpLRt2BrTRlscPv4fhuhC3L21viUtN1D1YVBe5g==
X-Received: by 10.28.179.84 with SMTP id c81mr26522730wmf.13.1458742973491;
	Wed, 23 Mar 2016 07:22:53 -0700 (PDT)
Received: from [192.168.2.147] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.googlemail.com with ESMTPSA id
	jf6sm2871718wjb.2.2016.03.23.07.22.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2016 07:22:52 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <56E01535.6030509@elfin.de>
From: Sandro Stiller <sandro.stiller@elfin.de>
Message-ID: <56F2A6BB.7000701@elfin.de>
Date: Wed, 23 Mar 2016 15:22:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56E01535.6030509@elfin.de>
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
X-List-Received-Date: Wed, 23 Mar 2016 14:22:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

If anyone is interested:

The reason why systemd service works if installed using opkg and fails 
if I create an image:

The systemctl executable of OE is a shell script which handles the 
.service file in a different way.
I had a blank space behind the "WantedBy" line. The "real" systemctl has 
no problem with it, but the shell script silently ignores the entry 
without any error message and the service is not enabled in the image.


