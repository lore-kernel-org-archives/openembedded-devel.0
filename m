Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jtobias@viaas.com>) id 1O2Ed8-00048M-DA
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 04:16:35 +0200
Received: by gwb17 with SMTP id 17so6920gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Apr 2010 19:13:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.251.20 with HTTP; Wed, 14 Apr 2010 19:12:59 -0700 (PDT)
Date: Wed, 14 Apr 2010 19:12:59 -0700
Received: by 10.101.170.38 with SMTP id x38mr8104476ano.101.1271297579940; 
	Wed, 14 Apr 2010 19:12:59 -0700 (PDT)
Message-ID: <w2w66b2b2311004141912k6097ccf1m13d381af528f3ff4@mail.gmail.com>
From: John Tobias <jtobias@viaas.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: jtobias@viaas.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Amstrong build ->Gstreamer
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
X-List-Received-Date: Thu, 15 Apr 2010 02:16:35 -0000
Content-Type: text/plain; charset=UTF-8

Hi All,

I have a gstreamer pipeline that works OK on my old Kernel and old
filesystem. Now, I have an Amstrong filesystem with same version of
gstreamer (0.10) and I was trying to configure it correctly.

When I execute the gst-launch with my pipeline in command line and hitting
ctrl+c while it's running, the pipeline immediately exited without going
through the _change_state transition of the pipeline. But, in my old
filesystem, hitting a ctrl+c the pipeline went to the _change_state
transition.

Any idea what was wrong in my Amstrong build?

Thanks,

John

