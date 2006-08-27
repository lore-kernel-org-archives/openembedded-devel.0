Received: from [212.27.42.27] (helo=smtp1-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <amine.saya@free.fr>) id 1GHLvF-0008J8-Ix
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Aug 2006 16:47:37 +0200
Received: from [82.243.163.8] (cag06-3-82-243-163-8.fbx.proxad.net
	[82.243.163.8])
	by smtp1-g19.free.fr (Postfix) with ESMTP id F20A3BA97
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2006 16:45:44 +0200 (CEST)
Message-ID: <44F1BF9A.2010908@free.fr>
Date: Sun, 27 Aug 2006 17:51:54 +0200
From: Mohammed Amine SAYA <amine.saya@free.fr>
User-Agent: Thunderbird 1.5.0.5 (X11/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
References: <44F06A3D.8030102@free.fr> <44F0AD2B.1010401@free.fr>
	<74d0deb30608270048t1098d042ne95ed5df666fae7a@mail.gmail.com>
In-Reply-To: <74d0deb30608270048t1098d042ne95ed5df666fae7a@mail.gmail.com>
Subject: Re: sysvinit-2.86 fails
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Aug 2006 14:47:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

pHilipp Zabel wrote:
>> Hi all,
>>
>> As I said before, sysvinit don't build successfully so I replaced
>>
>> ln -s ../init.d/stop-bootlogd ${D}${sysconfdir}/rc$level.d/S99stop-bootlogd
>>
>> with
>>
>> ln -sf ../init.d/stop-bootlogd ${D}${sysconfdir}/rc$level.d/S99stop-bootlogd
>>
>>
>> But I am not sure that is the right way ? Any comment on this workaround please ?
>>     
>
> I think the problem lies here:
>
> NOTE: package sysvinit-2.86-r28: task do_install: started
> NOTE: package sysvinit-2.86-r28: task do_install: completed
> NOTE: package sysvinit-2.86-r28: task do_package: started
> ERROR: function do_install failed
>
> PACKAGEFUNCS in package.bbclass contains do_install as first element,
> so do_install is run twice. After removing do_install from
> PACKAGEFUNCS, installation works fine.
>   
Hi All, Hi Philipp,

Thanks a lot for your help, this actually solves all the problems I 
reported before.
busybox, sysvinit are now working fine without tweaking their bb files.

Do you have any doc on BITBAKE variables. I know that DEPENDS and RDEPENDS
functions have changed with the new bitbake version, can you point me to 
a link
where all these variables are explained ?


Thanks again.

Best regards,
Amine.


