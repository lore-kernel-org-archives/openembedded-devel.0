Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXDZk-0001kd-E6
	for openembedded-devel@openembedded.org; Wed, 11 Feb 2009 12:48:20 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LXDYe-0003CW-2f
	for openembedded-devel@openembedded.org; Wed, 11 Feb 2009 11:47:12 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 11 Feb 2009 11:47:12 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Feb 2009 11:47:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 11 Feb 2009 12:47:02 +0100
Message-ID: <gmudrn$n1p$1@ger.gmane.org>
References: <mailman.0.1234264323.11785.openembedded-devel@lists.openembedded.org>
	<20090211105104.67620@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090131 Shredder/3.0b2pre
In-Reply-To: <20090211105104.67620@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: Problem with baking GStreamer Plugins
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
X-List-Received-Date: Wed, 11 Feb 2009 11:48:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-02-09 11:51, Ali Botorabi wrote:
> Hello,
>
> I am trying to include some of the GStreamer plugins into an own image. The image bases on angstrom base and X11 images. Koen helped me to setup a task for the GStreamer plugins:

[snip]

> The major problem is that the plugins do not end in the image.

There is a simple solution to this, but I'm not sure everyone will like it:

--- a/packages/gstreamer/gst-plugins.inc
+++ b/packages/gstreamer/gst-plugins.inc
@@ -3,8 +3,6 @@ DESCRIPTION = "Plugins for GStreamer"
  DEPENDS = "gstreamer libmikmod liboil libogg tremor libvorbis"
  DEPENDS += "${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad 
libid3tag', d)}"

-PACKAGES_DYNAMIC = "gst-plugin-*"
-

--- /dev/null   2008-08-09 15:46:29.777083446 +0200
+++ gst-plugins.bb      2009-02-11 12:43:23.000000000 +0100
@@ -0,0 +1,5 @@
+
+DEPENDS = "gst-plugins-good gst-plugins-bad gst-plugins-ugly"
+
+PACKAGES_DYNAMIC = "gst-plugin-*"
+

Doing it like that will git rid of the PACKAGES_DYNAMIC statements 
confusing eachother. It also means you have to build *all* plugin sets.

regards,

Koen



