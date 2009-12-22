Received: from qmta01.westchester.pa.hmc1.comcast.net ([76.96.53.8])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john@soundmetrics.com>) id 1NNDQa-0007dN-15
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 23:42:07 +0100
Received: from omta03.westchester.pa.hmc1.comcast.net ([76.96.53.19])
	by qmta01.westchester.pa.hmc1.comcast.net with comcast
	id LLGQ1d0050Qry6401NgCKh; Tue, 22 Dec 2009 22:40:12 +0000
Received: from [192.168.10.133] ([75.147.191.205])
	by omta03.westchester.pa.hmc1.comcast.net with bizsmtp
	id LNgB1d0014SLwm301NgB3E; Tue, 22 Dec 2009 22:40:12 +0000
Message-ID: <4B314ACA.1020907@soundmetrics.com>
Date: Tue, 22 Dec 2009 14:40:10 -0800
From: John Faith <john@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17
	(Ubuntu-1.1.17+nobinonly-0ubuntu1)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <op.u5b0cczimn1qzu@guohr-laptop-ubuntu>	<4B30E03B.1040500@mwester.net>
	<20091222195157.GB2271@denix.org>
	<ac9c93b10912221425g4fee3ca0kdc0257be7eb677bc@mail.gmail.com>
In-Reply-To: <ac9c93b10912221425g4fee3ca0kdc0257be7eb677bc@mail.gmail.com>
X-SA-Exim-Connect-IP: 76.96.53.8
X-SA-Exim-Mail-From: john@soundmetrics.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why rootfs directory in temp is empty
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
X-List-Received-Date: Tue, 22 Dec 2009 22:42:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2009/12/22 Denys Dmytriyenko <denis@denix.org>:
>   
>> On Tue, Dec 22, 2009 at 09:05:31AM -0600, Mike Westerhof wrote:
>>     
>>> Guo Hongruan wrote:
>>>       
>>>> Hi guys,
>>>>   Today, I build an base-image using OE. And I want to check the content
>>>> of rootfs, but I found the directory rootfs in building directory is
>>>> empty. I remember there was the ontent of the target root filesystem.
>>>> Why have to remove them? Does it means the rootfs directory is unuseful?
>>>>
>>>> Thanks a lot!
>>>>
>>>>         
>>> Add IMAGE_KEEPROOTFS = "1" to your local.conf file.
>>> I'm not sure why the change was made to clean it out every build, though.
>>>       
>> To prevent people from using it as an NFS share and having problems.
>>     
>
> Ehm, can you please clarify why this would cause a problem?
> (btw if I recall correctly the rootfs is still there in the work dir,
> and anyway you can build a rootfs in a tar.gz file and untar that).
>
> Frans
>   

The first time I tried to boot a system using files from the temp 
rootfs, I quickly found that some parts were missing, like all the /dev 
nodes, due to permissions when constructing the rootfs if I recall 
correctly.

That was a while ago so maybe things are different now, but I'm glad 
that the "wrong" files are removed now to reduce (my) confusion.

,
John




