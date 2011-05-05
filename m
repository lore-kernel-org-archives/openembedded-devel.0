Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1QHwIm-0000Kj-KQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 May 2011 13:01:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 29186A4C1E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2011 11:58:22 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Av18NY89IAHy
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2011 11:58:21 +0100 (BST)
Received: from [192.168.254.74] (smwsedi.demon.co.uk [80.176.158.134])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 933E8A4C1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2011 11:58:21 +0100 (BST)
Message-ID: <4DC282D5.5000004@xora.org.uk>
Date: Thu, 05 May 2011 11:58:29 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201105051150.06842.sgh@sgh.dk> <4DC2827E.9020801@mlbassoc.com>
In-Reply-To: <4DC2827E.9020801@mlbassoc.com>
Subject: Re: perl-native fails on Ubuntu 11.04
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
X-List-Received-Date: Thu, 05 May 2011 11:01:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 05/05/2011 11:57, Gary Thomas wrote:
> On 05/05/2011 03:50 AM, S=F8ren Holm wrote:
>> Please apply this patch to make perl-native build on Ubuntu 11.04
>>
>> https://gist.github.com/raw/925006/4217f358fb00b5b7f1dfbd1ce5f4afa4f64=
b0bb0/0001-perl-native-multilib-patch-for-ubuntu-11.04.patch=20
>>
>
> This patch only works for x86_64 systems.  A corrected version
> replaces `uname -m` with * in
>   ++test -f /usr/lib/*-linux-gnu/libc.so &&=20
> glibpth=3D"/usr/lib/*-linux-gnu $glibpth"
>
Probably best to merge the fix from oe-core where its had testing.

Graeme



