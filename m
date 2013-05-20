Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UeUwj-0004MO-F3
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 May 2013 20:36:39 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id E245729348
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2013 20:18:14 +0200 (CEST)
Message-ID: <519A68E8.9080503@pseudoterminal.org>
Date: Mon, 20 May 2013 20:18:16 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Subject: Error message about multiple EGL / GLES providers
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
X-List-Received-Date: Mon, 20 May 2013 18:36:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I am currently adapting the cubox layer for dylan, and get these errors:

ERROR: Multiple .bb files are due to be built which each provide 
virtual/libgles1
ERROR: Multiple .bb files are due to be built which each provide 
virtual/libgles2
ERROR: Multiple .bb files are due to be built which each provide virtual/egl

I set the PREFERRED_PROVIDERS in the machine config file like this:

PREFERRED_PROVIDER_virtual/egl_cubox ?= "marvell-libgfx"
PREFERRED_PROVIDER_virtual/libgles1_cubox ?= "marvell-libgfx"
PREFERRED_PROVIDER_virtual/libgles2_cubox ?= "marvell-libgfx"

which is the way pretty much all layers seem to do it.

I remember a discussion about this, with the outcome that these errors 
are inevitable in danny, and that dylan has
special features in place to deal with the collisions between platform 
EGL/GLES drivers and mesa. However, I cannot
find such a feature.

Does anybody know more?

cheers


