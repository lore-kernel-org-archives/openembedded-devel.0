Return-Path: <cjb.sw.nospam@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id E07336011C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jul 2016 17:07:37 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id u201so200748110oie.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jul 2016 10:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=ztV6cwvnmkj4HXxaGPeTuHKChSp0lSeVHDgwgdUyDmY=;
	b=y617Adpgofiwk0ywNSwTwuOseRSGO8+rQIizTusyiRzb3TGjURhkfU6fZrUnXnzJf8
	RvP7HFV9+AlGu3HHolPtpZ9lLrIV8oP4uTD+FlQZMABXtfhAU6ZEVn7xTyt+LADvHQiK
	XlFgQY6WsZyjlR0aFO5ju/pVBqM0A91m62RGkSY/BNDUTs/1mazkHEyTnPCLQoz9rfPa
	4hH45T5x31ojEGSj8FLVSfpEHRWNh/edvSHduYCe24o4XgRnVlGV9ckLWjB5LVXSVnyg
	ZebnuifJ9fgSKOumL7JFG3QE9BhJnwSoixrJqaRyheyuhQu0LbaVdhn2NNj++nZjOG3m
	qONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=ztV6cwvnmkj4HXxaGPeTuHKChSp0lSeVHDgwgdUyDmY=;
	b=KXvzvXWb6BUXw32nTqee2FTuIQ6+hTQ5jWxGHfhZ+xJdvjGEk6g6W109g6zhWlCupo
	7zZl4/siq9ba7l2NBuEAX95NDPKVuL1PEgo15s8kSFlMTudhVZckso6iqXJwc1DZYpCY
	X/15IVfU8IgbY675vFjySfHuJtP4eg8/ZJb6epdWNBOTn6yEkJcRssHXC1wA0sHFto4Q
	gMvAaDZFHU6jmvn2r5/2oUPn0f/AjCCQw2tsE08gT+fVN6UXK7HSG74K2TxLjlRiTERv
	4XMYCu/SQySBbrUeHGijHWKDQG6ynusyg5gUt3RnbKRzowsHy0Matt/3cjU0Sk4mcNdt
	EA2g==
X-Gm-Message-State: ALyK8tJDjfByaL9jO3C8CToUaNGBd6JWMllvLeXI59P2akjBlwUR7b/caSFBUCiMrdSPYXCY7QZRJ6X70HArLQ==
X-Received: by 10.202.172.195 with SMTP id v186mr7253749oie.10.1467652058250; 
	Mon, 04 Jul 2016 10:07:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.9 with HTTP; Mon, 4 Jul 2016 10:07:37 -0700 (PDT)
From: Cjb_SW Freescale <cjb.sw.nospam@gmail.com>
Date: Mon, 4 Jul 2016 19:07:37 +0200
Message-ID: <CAOFdb6mAPJ1OJowpp_f+=-c1VoS=TZoKKYVnFWu2-zmKvP-MOg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: Simone CJB <simone.arianti@cjb.it>
Subject: proftpd 1.3.5 cannot authenticate with any user
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
X-List-Received-Date: Mon, 04 Jul 2016 17:07:39 -0000
Content-Type: text/plain; charset=UTF-8

Hello,
I am facing some problems with Proftpd and I cannot login with any user.
I am aligned with poky 1.8, and the version of proftpd is 1.3.5
The ftp client can connect to the server, but with the "correct"
password I get an error 530 Login Failed.

The only thing that I changed from the standard configuration, is the line:
RootLogin  on

I know that I shouldn't do it, but I really need it.
Anyhow, I tried also other users, and passwords, nothing works.

Any suggestion?
Thank you
Simone

