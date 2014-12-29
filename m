Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 16A6172513
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 21:05:30 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 20so6761421yks.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 13:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=9XOHL4//wDzwh4JAsi3KLnnNZx0odpEOK/vhWLSGizs=;
	b=wl7p+gwRC2cgIhmUd52DAaZ+Iqd54clNmaEy4QobQnlGgLqOH77dcioruAAwCdETi6
	oQC+4JIvmjb7qVvrLjghM6WTL/fyeopAPjiO9Cm1S4Lf/f8NaqvZxS81qXQOHtWI1YES
	E9vDj+mhW1o/e2v8MlmQQ1A0y+XFKiQVC9q0JzO8B3xlZBhLY2d0QD4sOkbcL+K+Diox
	VrE/+SEI0Nk4RqC8IOqueWWGozVeM50WBXjZDT7cY33YuMY86EAiqgpZnyHgbZ7SMQAj
	r3axN5FQJGmSiTiJiJP2PurfnEHoTDssqGGUUPjVt5AcPDVBwpnXcdMYpRDm7gnZCwI6
	SS/g==
MIME-Version: 1.0
X-Received: by 10.236.30.98 with SMTP id j62mr29748002yha.105.1419887130183;
	Mon, 29 Dec 2014 13:05:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Mon, 29 Dec 2014 13:05:30 -0800 (PST)
In-Reply-To: <02BDCB585301A044B5DBBDB58DDFDA0113EDF7@dor-sms-xch01.digi.com>
References: <02BDCB585301A044B5DBBDB58DDFDA0113EDF7@dor-sms-xch01.digi.com>
Date: Mon, 29 Dec 2014 19:05:30 -0200
X-Google-Sender-Auth: T3_-FH0bB2CS5Q6VazRowFgMq5Y
Message-ID: <CAP9ODKqGELnQYMttXvrHTcaL=J6HqvBrBpaWwpBqH1Y5jKO4eg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Exception running x11 application
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
X-List-Received-Date: Mon, 29 Dec 2014 21:05:35 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 27, 2014 at 6:02 PM, Gonzalez, Alex <Alex.Gonzalez@digi.com> wrote:
> When running an example graphical application on X11 I get the following exception:
>
> Exception in thread "main" java.awt.AWTError: Toolkit not found: sun.awt.X11.XToolkit
>         at java.awt.Toolkit$2.run(Toolkit.java:875)
>         at java.security.AccessController.doPrivileged(Native Method)
>         at java.awt.Toolkit.getDefaultToolkit(Toolkit.java:860)
>         at java.awt.Toolkit.getEventQueue(Toolkit.java:1730)
>         at java.awt.EventQueue.invokeLater(EventQueue.java:1217)
>         at javax.swing.SwingUtilities.invokeLater(SwingUtilities.java:1287)
>         at HelloWorldSwing.main(HelloWorldSwing.java:17)
>
> This is similar to an issue reported for the dora branch on https://github.com/woglinde/meta-java/issues/60, however the suggested revert leaves a non buildable system.
>
> Has anyone succeeded in running a graphical java application over X11?

I didn't for a while (but succeed in past).

Anyway I tried to revert the change and it opens a can of worms. The
initial fix I ended needing to work was to fix QEMU call and this,
after some scratch head worked. However this didn't fix the build as
QEMU eats a lot of memory doing the processing and eventually is
killed:

[1673545.675672] Out of memory: Kill process 22041 (qemu-arm) score
960 or sacrifice child
[1673545.675963] Killed process 22041 (qemu-arm) total-vm:31542644kB,
anon-rss:31482564kB, file-rss:1368kB

So this is very frustrating ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

