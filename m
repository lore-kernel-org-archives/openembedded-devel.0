Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QUNXv-0003pg-Bz
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 20:32:03 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QUNUk-00003S-7B from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 11:28:46 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 8 Jun 2011 11:24:36 -0700
Received: from [172.30.36.148] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 8 Jun 2011 11:28:44 -0700
Message-ID: <4DEFBF58.1010903@mentor.com>
Date: Wed, 8 Jun 2011 11:28:40 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1307481663432021500@rkmorris.us>
In-Reply-To: <1307481663432021500@rkmorris.us>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 08 Jun 2011 18:24:36.0766 (UTC)
	FILETIME=[52812BE0:01CC2609]
Subject: Re: Builds Failing
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
X-List-Received-Date: Wed, 08 Jun 2011 18:32:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/07/2011 02:21 PM, Russell Morris wrote:
> Hi,
> 
> I am trying to build OE with the latest source (i.e. from MASTER) -
> but images that used to work are now failing (x11-gpe-image,
> console-image). The failure seems to be in bash, as you can see in
> the attached log files.

Ah ha!  So, what's going on here is that upstream patches that we fetch
have the 'bad' behavior of encoding '..' into the path and newer
versions of 'patch' fail to apply these due to security concerns.

We can kludge around this by making the recipe use say 'git' as the
patch apply tool but someone should go yell at upstream.  Or we need to
update to a newer version of bash where maybe upstream is publishing
better behaved patches.

-- 
Tom Rini
Mentor Graphics Corporation


