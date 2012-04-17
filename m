Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SKEJS-00078J-OO
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Apr 2012 21:43:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3HJYEtP017311
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2012 12:34:15 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 17 Apr 2012 12:34:14 -0700
Message-ID: <4F8DC5B5.600@windriver.com>
Date: Tue, 17 Apr 2012 14:34:13 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com>
In-Reply-To: <4F8DBFF3.2060508@gmail.com>
Subject: Re: [oe-core] ld segfault cant figure it out
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
X-List-Received-Date: Tue, 17 Apr 2012 19:43:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/12 2:09 PM, j wrote:
> On 04/17/2012 09:13 AM, J. L. wrote:
>> <snip>
>>
>>
>>              <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>
>>
>>
> I went for a build on the borrowed machine again but this time I did not
> go into X just stayed in RL3. Then ran bitbake perl, on a clean build
> dir. It is just about to finish building a few steps away but where I
> normally get the segfaults, it has not spit those out. There are no QA
> logs being generated either. So looks like it had/has something to do
> with running X, both systems are running nvidia graphics cards. The
> laptop has a new mobile one, borrowed an old one that is nouveau
> compatible. So both open and closed nvidia drivers were tried. But
> something when in the graphical environment is giving the segfault
> issues I have been seeing. I have not yet verified if killing X on the
> laptop builds and eliminates the issues as well.
>
> Will post back once I have built the kernel on both machines with no X
> running.

There is a known issue w/ nvidia drivers, segfaulting and QEMU.  Is something in 
perl (or elsewhere) trying to run qemu to finish up a task?

--Mark

> Thank you
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



