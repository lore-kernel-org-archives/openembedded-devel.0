Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pu9nn-0007YZ-0d
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 21:34:43 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pu9mO-00007J-B6 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 12:33:16 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 28 Feb 2011 12:33:15 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 28 Feb 2011 12:33:15 -0800
Message-ID: <4D6C067A.5020202@mentor.com>
Date: Mon, 28 Feb 2011 13:32:58 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D6BC0EA.4000207@mentor.com>
	<20110228160659.GG5886@jama.jama.net>	<20110228161328.GH5886@jama.jama.net>
	<4D6BD384.90002@mentor.com> <20110228200440.GI5886@jama.jama.net>
In-Reply-To: <20110228200440.GI5886@jama.jama.net>
X-OriginalArrivalTime: 28 Feb 2011 20:33:15.0663 (UTC)
	FILETIME=[BA0461F0:01CBD786]
Subject: Re: shr-image failure
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
X-List-Received-Date: Mon, 28 Feb 2011 20:34:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2011 01:04 PM, Martin Jansa wrote:
> On Mon, Feb 28, 2011 at 09:55:32AM -0700, Tom Rini wrote:
>> On 02/28/2011 09:13 AM, Martin Jansa wrote:
>>> On Mon, Feb 28, 2011 at 05:06:59PM +0100, Martin Jansa wrote:
>>>> On Mon, Feb 28, 2011 at 08:36:10AM -0700, Tom Rini wrote:
>>>>> Hey all,
>>>>>
>>>>> Trying to build shr/shr-image/nokia900 fails with the following:
>>>>> http://pastebin.com/Z13aYd2Z which seems odd in that we're building:
>>>>>
>>>>> NOTE: Running task 5802 of 10948 (ID: 2141,
>>>>> /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/shr-image/DISTRO/shr/MACHINE/nokia900/label/sb-u804/recipes/efl1/elementary_svn.bb,
>>>>> do_setscene)
>>>>> NOTE: package elementary-2_0.7.0+svnr56372-r11: task do_setscene: Started
>>>>>
>>>>> And it's already past do_populate_sysroot before this starts.  I do see
>>>>> some svn complaining (and not doing something...) earlier on in the
>>>>> do_configure here.
>>>>
>>>> This looks like related to
>>>> http://www.mail-archive.com/bitbake-dev@lists.berlios.de/msg00880.html
>>>>
>>>> which was resolved later with scmdata=keep param
>>>> http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=05cbc1d1a01c667c77688f36fbc5b61c5f452a3a
>>>>
>>>> but that patch didn't make it to bitbake-1.10.2 release, but neither did
>>>> patch causing this in master/1.12
>>>> http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=f264cb6d43472525ad787b0887764ea696ec52ba
>>>>
>>>> Can you try that svnversion call in your checkout to get thath svn
>>>> error? It seems to be working here fine.
>>>
>>> $ mkdir test&&   cd test
>>> $ tar xzvf ../downloads/elementary_svn.enlightenment.org_.svn.e.trunk_56372_.tar.gz
>>> $ cd elementary
>>> $ (svnversion . | grep -v export || echo 0) | awk -F : '{printf("%s\n",$1);}' | tr -d ':MSP\n'
>>> 56372$
>>
>> The error is that the svn version is too old for the checkout.  Is there
>> a way we can figure this out without calling svn?
>
> I guess you have subversion<  1.6
> and 1.6 changed the format, so if efl repo was upgraded then it needs
> newer svn client
>
> http://subversion.apache.org/docs/release-notes/1.6.html
>
> Maybe it's time to force subversion-native as there were issues before
> ie with -trust-server-cert.

Stupid question.  Why aren't we just using ${SRCREV} ?  Or is this 
really bitbake calling out svn to do something?

-- 
Tom Rini
Mentor Graphics Corporation


