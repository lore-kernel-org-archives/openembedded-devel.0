Received: from smtp-out21.han.skanova.net ([195.67.226.208])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@emagii.com>) id 1TwJnS-0004yx-LN
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jan 2013 22:48:30 +0100
Received: from [192.168.221.118] (83.227.56.195) by smtp-out21.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 50B624330129FFDE for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jan 2013 22:30:01 +0100
Message-ID: <50F9BED9.8020504@emagii.com>
Date: Fri, 18 Jan 2013 22:30:01 +0100
From: Ulf Samuelsson <openembedded@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: What determines the build location "OE_DIR/tmp/work/*" ?
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
X-List-Received-Date: Fri, 18 Jan 2013 21:48:31 -0000
X-List-Received-Date: Fri, 18 Jan 2013 21:48:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am building a driver which will load firmware at runtime.
For development purposes, I have defined two machines,
which will be used to build two different versions of the driver.

Have a separate recipe for the firmware.
Each machine defines FW_VERSION which is used to select
a subtree containing the firmware, so the same recipe is used for both 
machines.

The driver gets built in "$OE_DIR/tmp/work/<machine>-angstrom-linux/gnueabi"
but the firmware gets built in "$OE_DIR/tmp/work/armv7a-none-linux-gnueabi".
This means that the same tree is used for both machines,
which of course does not work.

Is there a way to define that the recipe should be built in
"$OE_DIR/tmp/work/<machine>-angstrom-linux/gnueabi"?

Otherwise, I guess I have to use two different recipes.


BR
Ulf Samuelsson


