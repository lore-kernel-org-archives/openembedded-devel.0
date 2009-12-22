Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NNDX3-0002ln-T0
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 23:48:49 +0100
Received: (qmail 15998 invoked by uid 1003); 22 Dec 2009 22:46:52 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 22 Dec 2009 22:46:52 -0000
Message-ID: <4B314C5B.8000703@balister.org>
Date: Tue, 22 Dec 2009 17:46:51 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <op.u5b0cczimn1qzu@guohr-laptop-ubuntu>	<4B30E03B.1040500@mwester.net>
	<20091222195157.GB2271@denix.org>
	<ac9c93b10912221425g4fee3ca0kdc0257be7eb677bc@mail.gmail.com>
In-Reply-To: <ac9c93b10912221425g4fee3ca0kdc0257be7eb677bc@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
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
X-List-Received-Date: Tue, 22 Dec 2009 22:48:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2009 05:25 PM, Frans Meulenbroeks wrote:
> 2009/12/22 Denys Dmytriyenko<denis@denix.org>:
>> On Tue, Dec 22, 2009 at 09:05:31AM -0600, Mike Westerhof wrote:
>>> Guo Hongruan wrote:
>>>> Hi guys,
>>>>    Today, I build an base-image using OE. And I want to check the content
>>>> of rootfs, but I found the directory rootfs in building directory is
>>>> empty. I remember there was the ontent of the target root filesystem.
>>>> Why have to remove them? Does it means the rootfs directory is unuseful?
>>>>
>>>> Thanks a lot!
>>>>
>>>
>>> Add IMAGE_KEEPROOTFS = "1" to your local.conf file.
>>> I'm not sure why the change was made to clean it out every build, though.
>>
>> To prevent people from using it as an NFS share and having problems.
>
> Ehm, can you please clarify why this would cause a problem?
> (btw if I recall correctly the rootfs is still there in the work dir,
> and anyway you can build a rootfs in a tar.gz file and untar that).

Someone correct me if I get this wrong ...

Since OE does not run as root, the file ownership are not suitable for 
use as a true rootfs. During the assembly of the tarball, the file owner 
information is "fixed" so that if you unpack the tarball as root, the 
files have the proper owners.

So the temporary root file system will not do what people expect.

Philip


