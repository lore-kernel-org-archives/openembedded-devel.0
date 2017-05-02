Return-Path: <list@xenhideout.nl>
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	by mail.openembedded.org (Postfix) with ESMTP id 21B2760191
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 May 2017 04:38:04 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.signet.nl (Postfix) with ESMTP id 4919E7244F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 May 2017 06:38:03 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 02 May 2017 06:38:03 +0200
From: Xen <list@xenhideout.nl>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <60efb2f4be96b3eba98acf834cb98556@xenhideout.nl>
References: <8abc320ccb1265aac68072693427f8eb@xenhideout.nl>
	<60efb2f4be96b3eba98acf834cb98556@xenhideout.nl>
Message-ID: <2a03627aa6ef860a55161cb321f99baf@xenhideout.nl>
X-Sender: list@xenhideout.nl
User-Agent: Roundcube Webmail/1.2.4
Subject: Re: cacao-native 1.6.1 failing because compiler not produced?
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
X-List-Received-Date: Tue, 02 May 2017 04:38:06 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

I just symlinked the required files to /usr/bin/java and it proceeded.

Next up the C++ compiler refuses a negative left hand value in a left 
shift in

build/tmp-glibc/work/armv5e-oe-linux-gnueabi/openjdk-7-jre/99b00-2.6.5-r6.1/icedtea-2.6.5/build/openjdk/hotspot/src/share/vm/code/dependencies.hpp

     all_types           = ((1 << TYPE_LIMIT) - 1) & ((-1) << 
FIRST_TYPE),

But that was not the only one. So much pain.

Botched up the hotspot tree, trying to rerun -c unpack and -c patch and 
-c configure but not working...

Not a great way to spend your evening.

Eventually bitbake openjdk-7-jre -C configure caused it to configure 
again.

I hoped I could pass environment variable OE_CXXFLAGS but that didn 
work. Changing meta/conf/bitbake.conf caused the entire build to be 
invalidated, oops. Of course, bit to be expected.

Already spent at least an hour trying to get a CXXFLAG to be 
recognised...

And will take many more hours now...

Really useful that you can't shift -1 but ~0 also doesn't work. But I 
find it impossible to get any values passed through the bitbake command?

CXXFLAGS doesn'st work, EXTRA_CFLAGS doesn't work, OE_CXXFLAGS doesn't 
work, changing the entire bitbake.conf doesn't work.

Already not worth that much to me anymore...

Well, I'm sorry for this ranting. Trying gcc 5.4.0 to see if that works.

