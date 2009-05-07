Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1M29pN-0002v4-2M
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 22:04:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 28AB742CA45
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2009 15:58:13 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28219-08 for <openembedded-devel@lists.openembedded.org>; 
	Thu,  7 May 2009 15:58:12 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 65E112E5E13
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2009 15:58:12 -0400 (EDT)
Message-ID: <4A033D54.2000709@cbnco.com>
Date: Thu, 07 May 2009 15:58:12 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A03277B.1090402@cbnco.com>	<1241720835-17998-1-git-send-email-msmith@cbnco.com>	<1241720835-17998-2-git-send-email-msmith@cbnco.com>	<c384c5ea0905071218v3978ea4cpe791a5283f05c2df@mail.gmail.com>
	<be7a9f3d0905071226m78b94d44u50a4e63c927200f5@mail.gmail.com>
In-Reply-To: <be7a9f3d0905071226m78b94d44u50a4e63c927200f5@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 2/3] grub: use ${libdir}, not /usr/lib
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
X-List-Received-Date: Thu, 07 May 2009 20:04:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Otavio Salvador wrote:
> On Thu, May 7, 2009 at 4:18 PM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
>> Why do we install menu.cfg in ${libdir} anyway?
>>
>> All desktop distro's I have seen have the menu.lst in /boot/grub/ on the rootfs.
> 
> I second this change; it makes easier for people to find it.

All of the stage1/stage1_5/stage2 files are installed by grub into 
/usr/lib/grub/i386-oe/. I believe they're then copied to /boot during 
the grub install process. I think what the original 0.97 packager was 
going for was to avoid having duplicate copies of the files, so 
/boot/grub became a symlink to /usr/lib/grub/i386-oe, and then menu.lst 
needed to go there, too.

I would prefer to install all the files to /boot/grub rather than 
/usr/lib, since that's where they're used. I'll have to check if the 
grub install script is OK with that.

Mike


