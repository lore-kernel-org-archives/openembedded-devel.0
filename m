Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JNpM3-0001aF-Tb
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Feb 2008 14:02:52 +0100
Received: by py-out-1112.google.com with SMTP id y77so3890873pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Feb 2008 05:03:05 -0800 (PST)
Received: by 10.65.154.2 with SMTP id g2mr12780252qbo.55.1202562184356;
	Sat, 09 Feb 2008 05:03:04 -0800 (PST)
Received: from ?192.168.1.207? ( [24.107.189.117])
	by mx.google.com with ESMTPS id v66sm19079786pyh.5.2008.02.09.05.03.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 09 Feb 2008 05:03:03 -0800 (PST)
Message-ID: <47ADA484.6090402@gmail.com>
Date: Sat, 09 Feb 2008 07:03:00 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	angstrom-distro-devel@linuxtogo.org
References: <1201531952.5882.32.camel@hammer.suse.cz>	<47A2D0A5.3030806@gmail.com>
	<1202075654.17746.7.camel@utx.utx.cz>
In-Reply-To: <1202075654.17746.7.camel@utx.utx.cz>
Subject: Re: [patch commit request] kernel fixes for Zaurus akita+spitz
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Feb 2008 13:02:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2008 03:54 PM, Stanislav Brabec wrote:
> Junqian Gordon Xu wrote:
>> On 01/28/2008 08:52 AM, Stanislav Brabec wrote:
> 
>>> -CONFIG_MTD_SHARP_SL=y
>>> +CONFIG_MTD_SHARP_SL=m
> 
>>> +CONFIG_SHARPSL_RC=m
>> Shouldn't defconfig-akita be updated as well? Pleas advice.
> 
> Probably yes for CONFIG_SHARPSL_RC=m. It should work there, too.
> 
> Optionally for CONFIG_MTD_SHARP_SL=m. On akita, the reported bug
> (missing PROM access when compiled as module) does not happen, because
> mtd support is compiled directly into the kernel. On the other hand it
> is possible, because access to the initial PROM is probably not
> mandatory for boot (and even rarely used). Please test.

Anybody has an akita to test?

Regards
Gordon


