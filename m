Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1SznL8-0007Am-19
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 13:25:14 +0200
Received: from cpc8-live22-2-0-cust106.know.cable.virginmedia.com
	([82.42.168.107] helo=[127.0.0.1])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>)
	id 1Szn95-0002vQ-7W; Fri, 10 Aug 2012 11:12:47 +0000
Message-ID: <5024ECCB.5@dynamicdevices.co.uk>
Date: Fri, 10 Aug 2012 12:13:15 +0100
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <5024E843.2050709@dynamicdevices.co.uk> <1717286.mDh904HIi2@helios>
In-Reply-To: <1717286.mDh904HIi2@helios>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Best practise using .bbappend
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
X-List-Received-Date: Fri, 10 Aug 2012 11:25:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

 >approach assuming this is a layer intended to apply some policy (i.e. 
a distro layer).

Good to know. I'm currently working with most of this in local.conf but
my plan is to migrate it to a distro configuration when I've figured out 
what I'm
doing, yes.

 >In practice this is unlikely to come up too often - in OE-Core we 
usually delete the old recipe when upgrading to a new version, and thus 
if you have a bbappend for the old version in your layer you will get an 
error after parsing indicating the bbappend had no matching recipe.

Ah very good. So if I update from the git repo and a recipe I've 
extended has changed
I would get a build error rather than it silently dropping my changes. 
Good :)

Many thanks,

Alex



