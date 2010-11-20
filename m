Received: from dsl027-183-242.sfo1.dsl.speakeasy.net ([216.27.183.242]
	helo=mail.qvxlabs.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <afalls@qvxlabs.com>) id 1PJvNs-0002hc-2r
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Nov 2010 22:54:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.qvxlabs.com (Postfix) with SMTP id 26575743866
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 13:53:03 -0800 (PST)
Received: from earth.localnet (unknown [10.1.1.34])
	by mail.qvxlabs.com (Postfix) with ESMTP id B7433743865
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 13:53:02 -0800 (PST)
From: Ardavon Falls <afalls@qvxlabs.com>
Organization: QVXLabs Inc
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Nov 2010 13:53:02 -0800
User-Agent: KMail/1.13.5 (Linux/2.6.35-22-generic; KDE/4.5.1; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201011201353.02321.afalls@qvxlabs.com>
X-DSPAM-Result: Whitelisted
X-DSPAM-Processed: Sat Nov 20 13:53:03 2010
X-DSPAM-Confidence: 0.9987
X-DSPAM-Probability: 0.0000
X-DSPAM-Signature: 4ce8433f16461642515012
X-SA-Exim-Connect-IP: 216.27.183.242
X-SA-Exim-Mail-From: afalls@qvxlabs.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	URI_NOVOWEL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gst-plugins-base_0.10.30.bb fails to build
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
X-List-Received-Date: Sat, 20 Nov 2010 21:54:13 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Any suggestions here is the compile output from bitbake

| make[3]: Leaving directory `/home/ardy/code/OE/build/tmp/work/armv5te-
angstrom-linux-gnueabi/gst-plugins-base-0.10.30-r11.0/gst-plugins-
base-0.10.30/gst/volume'
|   CC     libgstdecodebin2_la-gstdecodebin2.lo
|   CC     libgstdecodebin2_la-gsturidecodebin.lo
| arm-angstrom-linux-gnueabi-libtool: link: `libgstffmpegcolorspace_la-
gstffmpegcolorspace.lo' is not a valid libtool object
| make[3]: *** [libgstffmpegcolorspace.la] Error 1
| make[3]: Leaving directory `/home/ardy/code/OE/build/tmp/work/armv5te-
angstrom-linux-gnueabi/gst-plugins-base-0.10.30-r11.0/gst-plugins-
base-0.10.30/gst/ffmpegcolorspace'
| make[2]: *** [ffmpegcolorspace] Error 2
| make[2]: *** Waiting for unfinished jobs....
|   CC     libgstdecodebin2_la-gstfactorylists.lo
| arm-angstrom-linux-gnueabi-libtool: link: `libgsttcp_la-gsttcpplugin.lo' is 
not a valid libtool object
| make[4]: *** [libgsttcp.la] Error 1
| make[4]: Leaving directory `/home/ardy/code/OE/build/tmp/work/armv5te-
angstrom-linux-gnueabi/gst-plugins-base-0.10.30-r11.0/gst-plugins-
base-0.10.30/gst/tcp'
| make[3]: *** [all] Error 2
| make[3]: Leaving directory `/home/ardy/code/OE/build/tmp/work/armv5te-
angstrom-linux-gnueabi/gst-plugins-base-0.10.30-r11.0/gst-plugins-
base-0.10.30/gst/tcp'
| make[2]: *** [tcp] Error 2
|   CC     libgstdecodebin2_la-gstplay-enum.lo
| gstinputselector.c: In function 'gst_input_selector_class_init':
| gstinputselector.c:790: error: 'gst_play_marshal_INT64__VOID' undeclared 
(first use in this function)
| gstinputselector.c:790: error: (Each undeclared identifier is reported only 
once
| gstinputselector.c:790: error: for each function it appears in.)
| gstinputselector.c:840: error: 'gst_play_marshal_VOID__OBJECT_INT64_INT64' 
undeclared (first use in this function)
| gstdecodebin2.c: In function 'gst_decode_bin_class_init':
| gstdecodebin2.c:603: error: 'gst_play_marshal_VOID__OBJECT_BOOLEAN' 
undeclared (first use in this function)
| gstdecodebin2.c:603: error: (Each undeclared identifier is reported only once
| gstdecodebin2.c:603: error: for each function it appears in.)
| gstdecodebin2.c:652: error: 'gst_play_marshal_BOOLEAN__OBJECT_BOXED' 
undeclared (first use in this function)
| gstdecodebin2.c:678: error: 'gst_play_marshal_BOXED__OBJECT_BOXED' 
undeclared (first use in this function)
| gstdecodebin2.c:701: error: 'gst_play_marshal_BOXED__OBJECT_BOXED_BOXED' 
undeclared (first use in this function)
| gstdecodebin2.c:735: error: 'gst_play_marshal_ENUM__OBJECT_BOXED_OBJECT' 
undeclared (first use in this function)
| gstdecodebin.c: In function 'gst_decode_bin_class_init':
| gstdecodebin.c:247: error: 'gst_play_marshal_VOID__OBJECT_BOOLEAN' 
undeclared (first use in this function)
| gstdecodebin.c:247: error: (Each undeclared identifier is reported only once
| gstdecodebin.c:247: error: for each function it appears in.)
| make[4]: *** [libgstplaybin_la-gstinputselector.lo] Error 1
| make[4]: *** Waiting for unfinished jobs....
| gsturidecodebin.c: In function 'gst_uri_decode_bin_class_init':
| gsturidecodebin.c:422: error: 'gst_play_marshal_BOOLEAN__OBJECT_BOXED' 
undeclared (first use in this function)
| gsturidecodebin.c:422: error: (Each undeclared identifier is reported only 
once
| gsturidecodebin.c:422: error: for each function it appears in.)
| gsturidecodebin.c:448: error: 'gst_play_marshal_BOXED__OBJECT_BOXED' 
undeclared (first use in this function)
| gsturidecodebin.c:481: error: 'gst_play_marshal_ENUM__OBJECT_BOXED_OBJECT' 
undeclared (first use in this function)
| make[4]: *** [libgstdecodebin_la-gstdecodebin.lo] Error 1
| make[4]: *** [libgstdecodebin2_la-gstdecodebin2.lo] Error 1
| make[4]: *** [libgstdecodebin2_la-gsturidecodebin.lo] Error 1
| make[4]: Leaving directory `/home/ardy/code/OE/build/tmp/work/armv5te-
angstrom-linux-gnueabi/gst-plugins-base-0.10.30-r11.0/gst-plugins-
base-0.10.30/gst/playback'
| make[3]: *** [all] Error 2
| make[3]: Leaving directory `/home/ardy/code/OE/build/tmp/work/armv5te-
angstrom-linux-gnueabi/gst-plugins-base-0.10.30-r11.0/gst-plugins-
base-0.10.30/gst/playback'
| make[2]: *** [playback] Error 2
| make[2]: Leaving directory `/home/ardy/code/OE/build/tmp/work/armv5te-
angstrom-linux-gnueabi/gst-plugins-base-0.10.30-r11.0/gst-plugins-
base-0.10.30/gst'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/ardy/code/OE/build/tmp/work/armv5te-
angstrom-linux-gnueabi/gst-plugins-base-0.10.30-r11.0/gst-plugins-
base-0.10.30'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package gst-plugins-base-0.10.30-r11.0: task do_compile: Failed

!DSPAM:4ce8433f16461642515012!




