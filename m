Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PNplW-0005We-Nd for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 17:42:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PNpk5-0007mf-Qo for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 17:41:17 +0100
Received: from adsl-76-205-222-173.dsl.snlo01.sbcglobal.net ([76.205.222.173])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 17:41:17 +0100
Received: from harvey.tim by adsl-76-205-222-173.dsl.snlo01.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 17:41:17 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Tim Harvey <harvey.tim@gmail.com>
Date: Wed, 01 Dec 2010 08:40:56 -0800
Message-ID: <4CF67A98.2010708@gmail.com>
References: <4CF4B540.4020108@cisco.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: adsl-76-205-222-173.dsl.snlo01.sbcglobal.net
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
In-Reply-To: <4CF4B540.4020108@cisco.com>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gstreamer not getting populated in file system
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
X-List-Received-Date: Wed, 01 Dec 2010 16:42:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/2010 12:26 AM, harshada wrote:
> We created new image by adding following into minimal-image.bb:
> gstreamer \
> gst-plugins-base \
> gst-plugins-good \
> gst-plugins-bad \
> gst-plugins-ugly
> Image is getting built without any compiling issues. But we are not able
> to find required
> gstreamer plugins in the file system image. In ipk directory, we could
> find all of the corresponding ipks.
> What to do to get the filesystem populated with these gstreamer plugins?
>
> thanks and regards,
> Harshada

I believe you need to place the actual plugins in your image - do a find 
tmp/deploy/ipk -name gst-plugin-*

Tim



