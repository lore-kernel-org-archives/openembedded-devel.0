Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RtcUs-0004ui-3A
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 11:05:30 +0100
Received: by eekd41 with SMTP id d41so1238300eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Feb 2012 01:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Vz003phxghPCQqSPES3I1fy2R1dxaC7uTWab45heqv4=;
	b=KqAJIhxNWfjMMzTVOq+Sko4aZVuAHfnulex2BsWJ0C10u8WVRSR1ZQYCzpLp0klxwy
	Exm3bb2T1n8SShlIUtF6R8ESZV5GQbUMmnU3MmzB9OUWQEAS1OervkTAbLdd/0VMUHJ2
	uO/ZRIoAIq3yFZA/Q1t5hAelhhXKE3HEVmy7E=
Received: by 10.14.127.5 with SMTP id c5mr3453996eei.17.1328349451085;
	Sat, 04 Feb 2012 01:57:31 -0800 (PST)
Received: from [192.168.0.10] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id
	e12sm32841949eea.5.2012.02.04.01.57.30 (version=SSLv3 cipher=OTHER);
	Sat, 04 Feb 2012 01:57:30 -0800 (PST)
Message-ID: <4F2D0090.2040300@gmail.com>
Date: Sat, 04 Feb 2012 10:55:28 +0100
From: Peter Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20120112 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1328132338-15939-1-git-send-email-tworaz666@gmail.com>
	<1328310612-2098-1-git-send-email-tworaz666@gmail.com>
	<20120204021443.GA26306@sakrah.homelinux.org>
In-Reply-To: <20120204021443.GA26306@sakrah.homelinux.org>
Subject: Re: [meta-oe][PATCH v3] tmux: Add initial recipe for version 1.6.
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
X-List-Received-Date: Sat, 04 Feb 2012 10:05:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2012 03:14 AM, Khem Raj wrote:
> On (04/02/12 00:10), Peter Tworek wrote:
>> Run tested on netbook pro.
>>
>> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
>> Acked-by: Paul Menzel<paulepanter@users.sourceforge.net>
>> ---
>>   meta-oe/recipes-extended/tmux/tmux_1.6.bb |   18 ++++++++++++++++++
>>   1 files changed, 18 insertions(+), 0 deletions(-)
>>   create mode 100644 meta-oe/recipes-extended/tmux/tmux_1.6.bb
>>
>> diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
>> new file mode 100644
>> index 0000000..fa58065
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
>> @@ -0,0 +1,18 @@
>> +DESCRIPTION = "Terminal multiplexer"
>> +HOMEPAGE = "http://tmux.sourceforge.net"
>> +SECTION = "console/utils"
>> +
>> +LICENSE = "ISC"
> what is ISC license ? I thought tmux is more like BSD license here is
> what I read in NOTES files
>
> tmux is intended to be a simple, modern, BSD-licensed alternative....

Technically ISC is a BSD license [1]. Looking at the actual license text 
in tmux [2] it seems that it uses exactly this license. OE-core seems to 
also distinguish between BSD and ISC (meta/files/common-licenses/ISC), 
so I decided to use it.

[1] http://en.wikipedia.org/wiki/ISC_license
[2] 
http://tmux.svn.sourceforge.net/viewvc/tmux/trunk/tmux.c?revision=2697&view=markup

/ptw


