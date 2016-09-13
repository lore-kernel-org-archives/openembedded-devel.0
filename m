Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2C61E771BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 15:27:21 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id 1so207840134wmz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=ZbhEotjfSmRqVP26OfLjMnxeMJBy+8BWivWcQUm1NVM=;
	b=EAK1zeIUsJPj0SEjkAPySzTznKZHgOXOkBapRLflkziX+EIOR1LdjZCZmi8Y3sqEcR
	caLs3VsNYMh1kOic8kDdPxMxPCPM+1jYhFhwB6Y+N6yBbAnJduFR9t9RGchEsVemAIeM
	4XYhh3UbV/e5Gm9DALRmnssnCuaZwGaXato75K2m0/nuQqQQ8ixv0XqfU9FXCPFtbr4q
	pKicUvpu1p3uFP0rga4jdarwX9fsxdTshdhPMaZ7L1cdc2Oq4y7HEMDSRoWVlEsdyDyY
	iBdXoAKALRGP68BDG9MQnWH0J46p+trC92KRjYrF8rOmVs344KMdgtbHj56HhbAG104R
	nSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ZbhEotjfSmRqVP26OfLjMnxeMJBy+8BWivWcQUm1NVM=;
	b=OyDYKpGYUFza0TrBq2VSed7eCT0Ck0icIfxekAp+5+I6Awim9DBjfikLQPh2dC4ZI5
	i0vChkby+3Whg+ccEPyJaNsoLlFtzssT/17EfNdem5mAUGaAdxNjDvJHuj64Sf7E2h7z
	GSe9XeWTDqIJMtVUrVu+aOvcQtoM7Cpgl381PtZcjnUPUrBZXfyKIw6B/ZEJAI1H/7Bf
	k6CmXI2m2/qKK1/6RnDnYi+Vzz4tq/opChPXIzM1Gy1b+rzZ41CJNk/sD3NlVhMlI+J9
	+QqhFos7nnL+ct3qkYW9TSGhIJ7C+LPtc8+tAySFMXNVygeAcJ6Mf6fWQP0uTIpVfb/Y
	bv6w==
X-Gm-Message-State: AE9vXwPCobOuBPjS17m7N2OoctGSVfxk/QuIdOYDlcnuRbMrGC9RvFUPtKySA+JHviNkSaI4a2CHlmoE4rqZtA==
X-Received: by 10.28.198.206 with SMTP id w197mr1393976wmf.30.1473780442108;
	Tue, 13 Sep 2016 08:27:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.128.143 with HTTP; Tue, 13 Sep 2016 08:27:01 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 13 Sep 2016 17:27:01 +0200
Message-ID: <CAPybu_2CDc4eD=vRuEL7TOL2eb0mN=ygDrx0jX8WxmLqqAYnnw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: update_font_cache intercept: qemu: uncaught target signal 4 (Illegal instruction)
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
X-List-Received-Date: Tue, 13 Sep 2016 15:27:23 -0000
Content-Type: text/plain; charset=UTF-8

Hi

Anyone else is getting this error while building the image:

NOTE: Running intercept scripts:
NOTE: > Executing update_font_cache intercept ...
qemu: uncaught target signal 4 (Illegal instruction) - core dumped
Illegal instruction
WARNING: The postinstall intercept hook 'update_font_cache' failed
(exit code: 132)! See log for details!
WARNING: The postinstalls for the following packages will be postponed
for first boot: liberation-fonts cantarell-fonts
NOTE: > Executing update_pixbuf_cache intercept ...
NOTE: > Executing update_icon_cache intercept ...
NOTE: > Executing update_gio_module_cache intercept ...
NOTE: Executing write_package_manifest ...


The image is usable. When I boot it and install other package,
font_cache is updated properly


Thanks!

-- 
Ricardo Ribalda

