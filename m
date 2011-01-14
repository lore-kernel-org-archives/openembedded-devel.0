Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pdkkb-0005SI-DD
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 15:35:37 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pdkk2-0001a9-28 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 06:35:02 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 14 Jan 2011 06:35:01 -0800
Received: from [172.30.80.234] ([172.30.80.234]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 14 Jan 2011 07:35:00 -0700
Message-ID: <4D305F0D.4000107@mentor.com>
Date: Fri, 14 Jan 2011 07:34:53 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D301DFC.4090900@nedap.com>
In-Reply-To: <4D301DFC.4090900@nedap.com>
X-OriginalArrivalTime: 14 Jan 2011 14:35:00.0957 (UTC)
	FILETIME=[3995C8D0:01CBB3F8]
Subject: Re: chattr not found?
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
X-List-Received-Date: Fri, 14 Jan 2011 14:35:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/14/2011 02:57 AM, Jaap de Jong wrote:
> Hi All!
>
> for some reason chattr is linked to chattr.e2fsprogs instead of
> ../usr/bin/chattr.e2fsprogs
>
> # ls -l /bin/chattr*
> lrwxrwxrwx 1 root root 16 2011-01-14 10:37 /bin/chattr -> chattr.e2fsprogs
>
> # ls -l /usr/bin/chattr*
> -rwxr-xr-x 1 root root 7304 2010-12-10 01:12 /usr/bin/chattr.e2fsprogs
>
> I have no time to investigate this.
> Look simple...

I'm pushing a fix for this now, thanks for the report.

-- 
Tom Rini
Mentor Graphics Corporation


