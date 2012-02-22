Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=392e25361=rich.pixley@palm.com>)
	id 1S0IF6-0004qi-NH for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 20:52:48 +0100
X-IronPort-AV: E=Sophos;i="4.73,465,1325491200"; d="scan'208";a="11840117"
Received: from unknown (HELO ushqusdns4.palm.com) ([148.92.223.164])
	by smtp-relay2.palm.com with ESMTP; 22 Feb 2012 11:44:27 -0800
Received: from fuji.noir.com ([10.100.2.13])
	by ushqusdns4.palm.com (8.14.4/8.14.4) with ESMTP id q1MJiQvx018745;
	Wed, 22 Feb 2012 11:44:26 -0800
Message-ID: <4F45459B.6050402@palm.com>
Date: Wed, 22 Feb 2012 11:44:27 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.1) Gecko/20120208 Thunderbird/10.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4F452A74.6040603@palm.com> <1886014.FJCS6mMrjt@helios>
In-Reply-To: <1886014.FJCS6mMrjt@helios>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Still no luck with runqemu
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
X-List-Received-Date: Wed, 22 Feb 2012 19:52:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2/22/12 09:57 , Paul Eggleton wrote:
> On Wednesday 22 February 2012 09:48:36 Rich Pixley wrote:
>> It boots, and opens a window, but when I type in the window, the keys
>> are scrambled.
>>
>> Screen shot attached.  The characters you see are the result of typing
>> "root<return>" into that window.
>>
>> Does this look familiar to anyone?  Who can tell me what I need to do to
>> be able to use the qemu?
> Some quick googling suggests that adding the following to the runqemu command
> line might help:
>
> qemuparams="-k en"
qemuparms="-k en-us" did it for me.

Thank you.

--rich


