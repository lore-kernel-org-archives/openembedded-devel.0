Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 94ACE6E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 19:37:00 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id f92so14193229qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 12:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=favDfuZUo2iih3G7cmBgDIg9P28qqQFdE+Laz9iOW6A=;
	b=g8YgRQgITylJk7+7J0+iuDfXR4Tl55ozptdRPzHNW5dPMkBVDTCNhBEXx70TFQbl5v
	0fZLCwwJXwVXs2MVliY856OYOSdFnBRIAWAJzyYZuAW70H/7ETKT3HruWQIVarAOgfN3
	RN1w4Y+t5Rsn3oXBcgMSOouuIH1S4YWEBnl5xmJQu8+twg6pX2GBoOrerN1BbQFAmcfk
	fIuKin8T9AAheduUI09hJuOwC8LI+0/V9uaufloGvyFLsd5arFUpM2blZWKkQhTgLDcl
	fqLf7B4p3uU2P/8qI87YjTxOmObBOowjnpAm/vRDABdxpXuiHZDjyqja1ReARaAI7D9u
	QLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:date:to:subject:user-agent;
	bh=favDfuZUo2iih3G7cmBgDIg9P28qqQFdE+Laz9iOW6A=;
	b=iacc5ti3/69hwiQke/ru0pNZG32kcQlqt5IMMxm/B1SziwLuD7exK+v506C0JMIBMU
	hLFpPI3DKFNSYGMxJk7MBi4WGRTenFTldaE0Bx7rAsBaPpgQV3oKYBD93esst+UH+cCy
	oeRGnwtayAoqFLCm+MQjNGWPsNdghdrP08V3iaEFOJwiAbKF7VPZFf/YJPK3YGMbsUYz
	IUN76qOlKaSI5B35dg/nzUdlDYahJXYKOFfBZyqiLW0UA5MXSzjKxGDMIjKLjTkoRAN9
	rXXhjD5zmkebrBBUAN2yqTQ4j24ApyB1XtK6TOhbkiBKY2U8kjjHRtCMsN7fUvIolLeh
	eHCg==
X-Gm-Message-State: AOPr4FWfNB8YOlA8f7R6Pz4NDlWmEk2yqm0T3Ib4RLXcqcCT5DPU7GzlIo7qbg0KJLIC2A==
X-Received: by 10.140.102.108 with SMTP id v99mr3515373qge.27.1463513820362;
	Tue, 17 May 2016 12:37:00 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	r130sm2154964qha.25.2016.05.17.12.36.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 May 2016 12:36:59 -0700 (PDT)
Message-ID: <573b72db.88c48c0a.2060f.ffff8104@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Tue, 17 May 2016 16:36:47 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Tue, 17 May 2016 16:36:47 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.8
Subject: Updates to meta-browser (master) in 2016-05-17
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
X-List-Received-Date: Tue, 17 May 2016 19:37:00 -0000

Hello,

I pushed following updates:

commit 37695ddb190d0e39f93d446af11975f8954cb27a (HEAD -> pending, origin/master, origin/HEAD)
Author: Carlos Rafael Giani <dv@pseudoterminal.org>
Date:   Sun May 8 14:20:38 2016 +0200

    chromium: Upgrade to version 48.0.2548.0
    
    Not upgrading to M49 or M50 in this commit since this is currently the
    latest version that is supported by ozone-wayland
    
    Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 835351945e0cab3529b3b96048a81bd616545d5d
Author: Carlos Rafael Giani <dv@pseudoterminal.org>
Date:   Sun May 8 14:20:37 2016 +0200

    chromium: Create chromium-browser.inc to simplify upgrades
    
    This eases the chromium browser upgrade process while ensuring that the
    chromium embedded framework is still supported. With this new structure,
    chromium.inc contains common code for cef3 and the browser, while
    chromium-browser.inc contains common code for browser releases (and itself
    includes chromium.inc). The actual .bb files then mainly set several
    values (and may contain release specific functions).
    
    Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit f0b4ccd050854cdfedc1ca6ccac05d547f14d95e
Author: Carlos Rafael Giani <dv@pseudoterminal.org>
Date:   Sun May 8 14:20:36 2016 +0200

    chromium: Replace deprecated base_* wrapper calls
    
    Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

