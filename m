Return-Path: <ryanelkholy@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id EA881601A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 19:39:37 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 124so69470626iov.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=tyTGMfRlTC15w2T6t046ssJzTIPxcL1liJK0RcbjOWc=;
	b=z534oiZGznIuSP7evx6OQHXA/4m6AxHfT60lWMaaXIsClnZq88hxYxua3637X8DXQO
	IruhU+2Mbmlv5bo/JBlmvS1QvtuEk3bdNNGbIDaAU9KO9nnLFwRizTAdcx+Wp6RqPFLS
	s1HnArncsTwKNSaEuGg5RBns0PNYDs0D/PvDZk+3xbqYkQjJfO1ED3fz/bV+mKVFeomY
	54bPdZr0J4Y/pCj/JKP/uhAxsP1ziKhSLBUuTMgKRF+OJlZ5q1jpyaKxHqo8vfVgCZ5W
	cZWNs35KfXmCKrE73stiaXtAmyDHur4QOow9039fGELtxgldzkL5YbVeIOi2YN4ihU9I
	4PJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=tyTGMfRlTC15w2T6t046ssJzTIPxcL1liJK0RcbjOWc=;
	b=HuSNRT1QwtvUAB2UOTHolVDfsCSnm2nlpd6syELEJorxP2nt2OjqKlfIYI5ukjFHMN
	TB0TJ5JU4AyCSwNeSt86BG+2PkdF7TP1brejOE2lh5RasJsmy5WZ9LY5LR1J3W1wUOAe
	4D4pIp17F7c8M24KcrovDBTzP+IlQg9OEafmUQckQD41IxlTklpwb6/0hT3flKCjQAr/
	yMWQQBuGZq24vXbmrfHwbo39gn5TqToj2vj96wtlfG5tF7OdoLX5aJF+9TXKZTqj9uIn
	0CWHyCH9LIi8A8HpVSRrCt3x5ab1hvEnbmYYJIe6NKTHD2wVYpvahLqVsWsXr5S7HKjH
	/YIQ==
X-Gm-Message-State: AD7BkJJKQ3y/AfZSLWhZWYI2QWYHS8ynhEANqLaZ0n2ifiKb+/xvf4/n2K/e/fib86eDEffk75BCzSAtBXAwlQ==
MIME-Version: 1.0
X-Received: by 10.107.63.139 with SMTP id m133mr28023686ioa.157.1458589178369; 
	Mon, 21 Mar 2016 12:39:38 -0700 (PDT)
Received: by 10.64.26.227 with HTTP; Mon, 21 Mar 2016 12:39:38 -0700 (PDT)
Date: Mon, 21 Mar 2016 15:39:38 -0400
Message-ID: <CAMZfsd642_0FBYdmAhSj-J_U76Xh8vsG_cv9rTM7jQkWRMjhbQ@mail.gmail.com>
From: "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] QtCreator now allowing me to select qmake in SDK
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
X-List-Received-Date: Mon, 21 Mar 2016 19:39:38 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I have used bitbake core-image-minimal -c populate_sdk to build an SDK for
the Minnowboard to be used by QtCreator. After doing so, the SDK was built
in /opt/poky/2.0.1/sysroots...

1. Within /sysroots I have corei7-64-poky-linux and x86_64-pokysdk-linux
directories. My first question is which directory do I use when pointing to
my compiler, debugger and QtVersion (qmake) for QtCreator?

2. Secondly, when I try pointing to the qmake in
/opt/poky/2.0.1/sysroots/corei7-64-poky-linux/usr/bin/qt, QtCreator says
that the file does not exist. I have tried everything to add it but it just
wont work. I then thought I had to point to the one in x86_64-pokysdk-linux,
however there is no qmake there. Any ideas on what the problem may be?

Thanks!

