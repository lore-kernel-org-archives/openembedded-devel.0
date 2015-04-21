Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBDF65CF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2015 11:00:29 +0000 (UTC)
Received: by widdi4 with SMTP id di4so16970097wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2015 04:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=g2+dwkaBvrfo8MFfzv5FnpIDBKN+RFdXz1a7LSZy7ZA=;
	b=SDBjhNrkJlinmnT2rJdq0k1GYH6qu+guRBbqkIuffnIK/sO6tN6QmE4xjkgz9I1jOe
	4f3cEOZZWNe1KfEyMk+laXIdfOO9vdkke9/PULjGqdvZQOq27N3R6qhJlitdABHtaLjl
	r8BnGQuzJah5h6DaipT2YLJdNv8wGlT/MmqX9w237lNu77KL6nVGuMqBHqwpxTI7YO9B
	5sTl4lAgBbpKtVLOlBbYT8Yi8P3vPHG7W1tYxWIeVk4LCZRcnxRdV43gN8YfVlePXo0Q
	yzW5BIXCfizUABId0LQOSLNocj3b+X5n8V5T2oHIFxG67atrKOnWGGMtBh7REbPyOw5Y
	MgNA==
X-Received: by 10.180.107.70 with SMTP id ha6mr4690252wib.20.1429614030102;
	Tue, 21 Apr 2015 04:00:30 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id jq3sm2101189wjc.22.2015.04.21.04.00.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Apr 2015 04:00:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 21 Apr 2015 13:00:33 +0200
To: openembedded-devel@lists.openembedded.org,
	Richard Bevan <rbevan@restdeveloper.com>
Message-ID: <20150421110033.GA2725@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [rbevan@restdeveloper.com: meta-ruby / compiling gems on the target machine]
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
X-List-Received-Date: Tue, 21 Apr 2015 11:00:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm not a ruby expert forwarding to ML where it belongs.

----- Forwarded message from Richard Bevan <rbevan@restdeveloper.com> -----

Date: Tue, 21 Apr 2015 11:06:35 +0100
Subject: meta-ruby / compiling gems on the target machine
From: Richard Bevan <rbevan@restdeveloper.com>
To: Martin.Jansa@gmail.com

Hello Martin,

Sorry for the direct email.

Thanks for your work on meta-ruby. I have found a small problem and also
have a suggestion but don't know how to fix it in the .bb file.

The --sysroot=/ is set to the host path, when using ruby on a target
machine.

This only becomes a problem with compiling native support using gems.

eg.....

gem install thin

The makefile will fail when run on the target machine. I have been running
the below command to sort the --sysroot out on my target machine before
running gem install.

/bin/sed -i "s/sysroot=[0-9a-z\/\-]*/sysroot=\//g"
/usr/lib/ruby/*/*/rbconfig.rb

The above replaces --sysroot=/path/on/my/host/machine/ to --sysroot=/ in
the rbconfig.rb file.

Then gem install with native supports works after running the above.

Can we add this into the .bb file?

Thanks,

Richard

----- End forwarded message -----

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

