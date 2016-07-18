Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 931F2731C3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 13:38:39 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id u25so7012411qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 06:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=XkpdsrDArpGBCt4r91UDI6mHrjRB1mvv/oLCwxXHBUU=;
	b=Xs0CDgfx4W6B5phLbZD8BKWDkr8k77OmYMK4NTcpGRa5lKHCSlMoyqThv5PHEJxBED
	1wSmEUqlQ9TVmE5tRKGHLcDTpLA3VWVd6s1cnPpmMcdze5JsQ4EwWgfkEhjG1V12rLuR
	D92holbLWBSgITvjy9MbLxbJE9km13aLXP2oqesPPRYlsEvMAD7LULcu6m7+R1l87nHD
	iIU+P1TsL9Nwu1Xvsh33lGlWj8zZG5DDG+rVGpFpWaDjP2nX5C3zSDQnYGPAGhjsF+fO
	+2K6AFkuWeULvox0U3zO6I2139etkbThxZhvRbqlLi2mA9bn4IBZtsVGLPv7eddJ+DNL
	BPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:date:to:subject:user-agent;
	bh=XkpdsrDArpGBCt4r91UDI6mHrjRB1mvv/oLCwxXHBUU=;
	b=HTwZFrOx3uzNwHuVOEXZ2577+BuI9vPwm+hZrUOwOfr8rCtRuewZPLG3RML2Jv7h3g
	z5I6Lv5aZ/WVo6ek92b7xjjGLDhWpx9fG6koZ8wpkaYNFQk0dTNGEilifqN+XWZm2F0V
	D+Em3RBUE7UMsHABBjpFRbLnH623ge13e8jt/Ud1bHLYB5xlzsXHkyuNgOh/QiFKjy9a
	wBR344mNe970F7oSAZbpm2hOk+v5u7rOjZgqO55nGJt35Kn0kmwc6S5lOyWj00fLLl35
	7xSisVUPoQ/BQfuvYHFbqaf/9sz5ItyVG2P6eR64w38NOZPnQImT+EN9tnjLe21j7EN+
	+u8A==
X-Gm-Message-State: ALyK8tKVTe7k4BX0XlUZmi/F4fpSlkRhXRP3+gSZfdaMRARm2JggMYDxdV5nWbX0vLNYgA==
X-Received: by 10.237.33.111 with SMTP id 102mr3280057qtc.56.1468849119932;
	Mon, 18 Jul 2016 06:38:39 -0700 (PDT)
Received: from localhost ([177.100.227.79]) by smtp.gmail.com with ESMTPSA id
	c23sm1625391qtc.45.2016.07.18.06.38.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jul 2016 06:38:38 -0700 (PDT)
Message-ID: <578cdbde.1724c80a.9d11c.79fd@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Mon, 18 Jul 2016 10:38:32 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Mon, 18 Jul 2016 10:38:32 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.9
Subject: Updates to meta-java (master) in 2016-07-18
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
X-List-Received-Date: Mon, 18 Jul 2016 13:38:39 -0000

Hello,

I pushed following updates:

commit dcef9ff46b9dc6f718cf2e63d48842dd0236bed1 (HEAD -> pending, yocto/master-next, yocto/master, m/master, m/krogoth)
Author: Daniel McGregor <daniel.mcgregor@vecima.com>
Date:   Thu Jul 7 10:55:18 2016 -0600

    openjdk-7, openjdk-8: use vardeps to fix shared state
    
    Previously if PARALLEL_MAKE changed, so did the task signature
    for do_configure. Use vardepsvalue so that the signature remains
    constant.
    
    Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
    Signed-off-by: Maxin B. John <maxin.john@intel.com>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

