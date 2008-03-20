Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrew.paulsen@gmail.com>) id 1JcK4M-0008Fg-Ge
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Mar 2008 13:40:38 +0100
Received: by py-out-1112.google.com with SMTP id y77so892849pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2008 05:40:27 -0700 (PDT)
Received: by 10.64.153.4 with SMTP id a4mr3533698qbe.15.1206016827157;
	Thu, 20 Mar 2008 05:40:27 -0700 (PDT)
Received: by 10.65.249.15 with HTTP; Thu, 20 Mar 2008 05:40:27 -0700 (PDT)
Message-ID: <d46153c40803200540h522b735cq483a8f510020fe09@mail.gmail.com>
Date: Thu, 20 Mar 2008 07:40:27 -0500
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.233.166.181
X-SA-Exim-Mail-From: andrew.paulsen@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] ipaq-sleep backlight control
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Mar 2008 12:40:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I did a code cleanup on ipaq-sleep and added the option to use your
own backlight control script instead of gpe-conf to adjust brightness.

http://bugs.openembedded.org/show_bug.cgi?id=4101

I have since heard that all 2.6 devices use the standard
/sys/class/backlight/*/ method to control brightness and that we don't
need/want to support others.

So I have three options and I'd like some opinions:
1) Leave ipaq-sleep the way it is and ship a standard backlight
control script that can be overridden/changed per machine.  This still
allows the legacy gpe-conf method (the default right now)
2) Have ipaq-sleep write directly to /sys/class/backlight/*/ to tweak
the brightness and skip this whole mess
3) Have the option to select between 1&2 via conf file entry

Thanks!
Andrew


