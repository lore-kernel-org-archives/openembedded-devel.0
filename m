Received: from smtp-out12.han.skanova.net ([195.67.226.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@emagii.com>) id 1ULvFh-0002MD-7a
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Mar 2013 13:51:21 +0100
Received: from [10.175.196.242] (83.227.56.237) by smtp-out12.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 5140710C0047D2B8 for openembedded-devel@lists.openembedded.org;
	Sat, 30 Mar 2013 13:32:51 +0100
Message-ID: <5156DB73.4040507@emagii.com>
Date: Sat, 30 Mar 2013 13:32:51 +0100
From: Ulf Samuelsson <openembedded@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Finding out the IMAGE_BASENAME of the image beeing built
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
X-List-Received-Date: Sat, 30 Mar 2013 12:51:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Trying create a programming script recipe and need to find out the 
IMAGE_BASENAME of the bitbake target
so I can get the filename of the image

${MACHINE}-${IMAGE_BASENAME}.ubi

I.E: if I do

$ MACHINE=beagleboard  bitbake some-image

and "some-image_1.0.bb" contains

IMAGE_BASENAME = "renamed-image"

Then the resulting image will be

     "beagleboard-renamed-image.ubi"

How get this info from another recipe?

BR
Ulf Samuelsson



