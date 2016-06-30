Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1C41B60616
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 23:03:07 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id hl6so32501598pac.2
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 16:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=JdyA5e9e8cGPSPva1gKfq9rs7DpFmLWV//og5oxYWKM=;
	b=WOO8wEwo2MAl3Rjc0JR7Ax3WHFP+Un2BoM99L5DOwsnEdqlGUF2EYIYgGILC5Djc4y
	sfhOkONj6yTOwjhpjqzPyNJJfDLuMO89jESah3yVM0f4yAIXg0evQ6nLYBoQOlU3Egz8
	LmD7+IiYU2FzNaIZm9inUEqezL3jOtpp5MCXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=JdyA5e9e8cGPSPva1gKfq9rs7DpFmLWV//og5oxYWKM=;
	b=dNbU5ZmhDl14x3J6LXet4AxPzL/XqZ3N/+jjPvYpbQwpzpE0A53hVm665XL68poi6z
	IA5OwsFVJRUCVUBITAquHP8yaVX0rjVMqPR4CdO56HLdzmKnlwm2TpnM1i/s3Wn5Dfy/
	bagO/hRfqNhh2oU1qKxFoogVhe4ddsYoBvFSriAwDOmqs2Qb38gnXKd7S6yLZtid3JAo
	a2GlHUzSSi1Mfl90zIC/rs6FyKmdTL+kqAeXpTe85OM1EMxGhm2Tx1r5z8etpOlK2dyd
	qUhqisroLhiooCpTSaN1U/yVQK8WGA4uGYsESEeTeRc+Gf/JTdTjr9U79ss81QL3+IFQ
	nGqg==
X-Gm-Message-State: ALyK8tLDnuXD/EgdkWS42Jgs8jzeBzsRGYFP0rNVr0DqBr+hQOUIaizihTAk4FYDbQVczch8
X-Received: by 10.66.234.65 with SMTP id uc1mr25495792pac.81.1467327788549;
	Thu, 30 Jun 2016 16:03:08 -0700 (PDT)
Received: from yct-desktop.lan ([2001:470:b:16e:222:4dff:fe50:c906])
	by smtp.gmail.com with ESMTPSA id s12sm168716pfj.57.2016.06.30.16.03.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jun 2016 16:03:07 -0700 (PDT)
To: bitbake-devel@lists.openembedded.org,
	Openembedded-core@lists.openembedded.org,
	Openembedded-devel@lists.openembedded.org, yocto@yoctoproject.org
From: Michael Halstead <mhalstead@linuxfoundation.org>
Message-ID: <ae4e2654-ca20-85d1-d53b-b0b05ab25a26@linuxfoundation.org>
Date: Thu, 30 Jun 2016 16:03:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
Subject: Patchwork upgrade tonight
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
X-List-Received-Date: Thu, 30 Jun 2016 23:03:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

After 2 weeks of testing and some performance tuning we are going to
proceed with the Patchwork upgrade. Data entered into the current
version in the next few hours may need to be re-entered after the upgrade.

All features of the current Patchwork install work in the new version.
So while there are still issues surrounding detection of patch series
there are no known regressions. Series detection can be addressed after
the upgrade.

The rollback plan can be executed very quickly if needed.

Please reach out if you have concerns.

-- 
Michael Halstead
Linux Foundation / SysAdmin

