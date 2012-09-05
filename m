Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9HRv-0001Mw-QQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 17:23:27 +0200
Received: from localhost ([127.0.0.1]:36662 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9HFw-0008Nl-9m
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 15:11:04 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=gmQScUV3xugRpw/oYUcixH
	rJzJo=; b=OZvMrqy8YlePfbOFsMx+926WNV20Y45S5AgDr9+8//CE8GtAx1ERdo
	2ocsoI3sgUV1Vh1Qp3d8X0Q9ibjBdOmVdXafY2TDryZjZoUnn2ixGictFgcThQI2
	l+CBDk8ro/TBvUpDstZuLA61EF7UyRy5+iatnTDOzNj2gt8s9WT0Y=
Received: from [195.171.99.130] (port=60043 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9HFw-0008Nh-5K
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 15:11:04 +0000
Message-ID: <50476BCC.1090801@communistcode.co.uk>
Date: Wed, 05 Sep 2012 16:12:12 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: XBMC build for Raspberry Pi
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
X-List-Received-Date: Wed, 05 Sep 2012 15:23:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ok, so I'm delving in a little over my head here but you've got to start 
somewhere, right ;)

I'm trying to build XBMC for the Raspberry Pi and have run into the 
following error which I don't know how to fix:

configure: error: in 
`/home/jack/Projects/poky-rasp/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+5ea1d22052f4b6a13a10b1f2e80c90abfcd6023b/git':
configure: error:
   Could not link test program to Python. Maybe the main Python library 
has been
   installed in some non-standard library path. If so, pass it to configure,
   via the LDFLAGS environment variable.
   Example: ./configure LDFLAGS="-L/usr/non-standard-path/python/lib"
============================================================================
    ERROR!
    You probably have to install the development version of the Python 
package
    for your distribution.  The exact name of this package varies among 
them.
============================================================================

Adding python-dev to DEPENDS seems to be a bit extreme, or is there 
another way around this?

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



