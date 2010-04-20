Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jtobias@viaas.com>) id 1O41ka-0002vJ-4d
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Apr 2010 02:55:40 +0200
Received: by gya1 with SMTP id 1so2649808gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 17:52:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.251.20 with HTTP; Mon, 19 Apr 2010 17:52:02 -0700 (PDT)
Date: Mon, 19 Apr 2010 17:52:02 -0700
Received: by 10.100.50.12 with SMTP id x12mr16076320anx.217.1271724722519; 
	Mon, 19 Apr 2010 17:52:02 -0700 (PDT)
Message-ID: <o2n66b2b2311004191752pd966e0b1p4ca15c275525c25e@mail.gmail.com>
From: John Tobias <jtobias@viaas.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: jtobias@viaas.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Catching signal interrupt on gst-launch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Apr 2010 00:55:41 -0000
Content-Type: text/plain; charset=UTF-8

Hi Guys,

I have a problem running this command: gst-launch v4l2src ! tih264  !
fakesink
The gst-launch did not catch the signal interrupt when I hit the ctrl+c. The
pipeline exited immediately instead of going through the _change_state
transition of the pipeline.

Then, I tried the gst-launch v4l2src ! fakesink, it works correctly.

Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock

<-- gst-launch detected the interrupt here..->

Caught interrupt -- handling interrupt.
Interrupt: Stopping pipeline ...
Execution ended after 1710703481 ns.
Setting pipeline to PAUSED ...
Setting pipeline to READY ...
clean stopped pipeline<6>
Starting of vpfe_release...<6>
 doing full release, started is 0
Setting pipeline to NULL ...
Freeing pipeline ...

I don't understand why the gst-launch giving me two different behavior with
regards to the signal handling. I am running Angstrom build for dm6446
chipset.

Can anyone tell me why I am getting different behavior?

Thanks,

John

