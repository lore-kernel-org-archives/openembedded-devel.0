Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PpM4U-0007oh-N2
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 15:40:06 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PpM3L-0000pU-Rk from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 06:38:55 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 15 Feb 2011 06:38:55 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 15 Feb 2011 07:38:54 -0700
Message-ID: <4D5A8FF2.2010200@mentor.com>
Date: Tue, 15 Feb 2011 07:38:42 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=bPrL+J+sA6wR+BEK9GuLxbMJRohVAPie-_u_i@mail.gmail.com>
In-Reply-To: <AANLkTi=bPrL+J+sA6wR+BEK9GuLxbMJRohVAPie-_u_i@mail.gmail.com>
X-OriginalArrivalTime: 15 Feb 2011 14:38:54.0673 (UTC)
	FILETIME=[121C0410:01CBCD1E]
Subject: Re: git head: build of rpm-native fails
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
X-List-Received-Date: Tue, 15 Feb 2011 14:40:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/14/2011 11:48 PM, Frans Meulenbroeks wrote:
> Hi,
>
> Yesterday I tried whether I could cross compile a helloworld.rpm to
> try on a fedora-arm box, but I failed in building rpm-native.
> This issue was verified by Jay. His log:
> http://tinderbox.openembedded.net/public/logs/task/25555153.txt
>
> apparently this is the failing part is:
>
> file -C -m ./magic.mime
> ./magic.mime, 187: Warning: string extension `B' invalid
> ./magic.mime, 401: Warning: string extension `B' invalid
> ./magic.mime, 618: Warning: string extension `B' invalid
> ./magic.mime, 623: Warning: string extension `B' invalid
> ./magic.mime, 627: Warning: string extension `B' invalid
> ./magic.mime, 628: Warning: string extension `B' invalid
> ./magic.mime, 672: Warning: no need to escape `#'
> ./magic.mime, 674: Warning: no need to escape `#'
> file: could not find any magic files!
> make[4]: *** [magic.mime.mgc] ÐžÑˆÐ¸Ð±ÐºÐ° 1
> make[4]: *** ÐžÐ¶Ð¸Ð´Ð°Ð½Ð¸Ðµ Ð·Ð°Ð²ÐµÑ€ÑˆÐµÐ½Ð¸Ñ Ð·Ð°Ð´Ð°Ð½Ð¸Ð¹..
>
> I tried the command in a devshell and there it also fails, but I have
> not really an idea what is wrong (and I don't know too much about RPM
> anyway)
> Suggestions? Fixes ?

rpm depends on having a specific version of file around and there's 
probably a mis-match.

-- 
Tom Rini
Mentor Graphics Corporation


