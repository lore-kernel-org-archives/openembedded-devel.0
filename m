Received: from ams-iport-1.cisco.com ([144.254.224.140])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hgune@cisco.com>) id 1PNLZ7-0006tI-36
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 09:27:57 +0100
Authentication-Results: ams-iport-1.cisco.com;
	dkim=neutral (message not signed) header.i=none
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmcEACZE9EyQ/khMgWdsb2JhbACUf44LFQEBFiIipgebWYVHBIRahgeDDw
X-IronPort-AV: E=Sophos;i="4.59,279,1288569600"; d="scan'208";a="70415787"
Received: from ams-core-3.cisco.com ([144.254.72.76])
	by ams-iport-1.cisco.com with ESMTP; 30 Nov 2010 08:26:33 +0000
Received: from [64.104.132.131] (dhcp-64-104-132-131.cisco.com
	[64.104.132.131])
	by ams-core-3.cisco.com (8.14.3/8.14.3) with ESMTP id oAU8QWrN001835
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 08:26:32 GMT
Message-ID: <4CF4B540.4020108@cisco.com>
Date: Tue, 30 Nov 2010 13:56:40 +0530
From: harshada <hgune@cisco.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 144.254.224.140
X-SA-Exim-Mail-From: hgune@cisco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gstreamer not getting populated in file system
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
X-List-Received-Date: Tue, 30 Nov 2010 08:27:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

We created new image by adding following into minimal-image.bb:
             gstreamer \
             gst-plugins-base \
             gst-plugins-good \
             gst-plugins-bad \
             gst-plugins-ugly
Image is getting built without any compiling issues. But we are not able 
to find required
gstreamer plugins in the file system image. In ipk directory, we could 
find all of the corresponding ipks.
What to do to get the filesystem populated with these gstreamer plugins?

thanks and regards,
Harshada




