Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pu8EQ-0004f2-N5
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 19:54:06 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pu8Cq-00054h-Rs from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 10:52:28 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 28 Feb 2011 10:52:28 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 28 Feb 2011 10:52:27 -0800
Message-ID: <4D6BEEDA.3000203@mentor.com>
Date: Mon, 28 Feb 2011 11:52:10 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D6BAE92.1080409@eoimaging.com>
In-Reply-To: <4D6BAE92.1080409@eoimaging.com>
X-OriginalArrivalTime: 28 Feb 2011 18:52:28.0685 (UTC)
	FILETIME=[A5BCC3D0:01CBD778]
Subject: Re: QA issues with libvmime
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
X-List-Received-Date: Mon, 28 Feb 2011 18:54:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2011 07:17 AM, Nathan Harris wrote:
> I am working on a recipe for the VMime library (http://www.vmime.org/).
> My target environment is the Overo (Gumstix). Currently, bitbake is
> failing during the final QA. My recipe, patch and bitbake output are
> below. Hopefully, this error is familiar to someone. Thanks!
[snip]
> inherit scons
[snip]
> ERROR: QA Issue with staging: vmime.pc failed sanity test (tmpdir) in
> path
> /home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconfig

So, what this means it that vmime.pc wasn't properly cleaned.  If you 
add pkgconfig to the inherit list (which brings in 
classes/pkgconfig.bbclass, take a peek at what it's doing) this will go 
away.

Arguably we should make the error clearer and say, like the gettext one 
something about missing inherit pkgconfig in the recipe.

-- 
Tom Rini
Mentor Graphics Corporation


