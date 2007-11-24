Received: from [64.233.166.183] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <xjqian@gmail.com>) id 1Ivoei-0003Av-FU
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Nov 2007 07:38:21 +0100
Received: by py-out-1112.google.com with SMTP id a25so98340pyi
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2007 22:35:49 -0800 (PST)
Received: by 10.35.12.10 with SMTP id p10mr195735pyi.1195884665625;
	Fri, 23 Nov 2007 22:11:05 -0800 (PST)
Received: from ?192.168.1.204? ( [24.107.180.75])
	by mx.google.com with ESMTPS id p57sm3594184pyb.2007.11.23.22.11.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 23 Nov 2007 22:11:01 -0800 (PST)
Message-ID: <4747C073.50509@gmail.com>
Date: Sat, 24 Nov 2007 00:10:59 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.14pre (X11/20071020)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1IvR63-00056z-6R@linuxtogo.org>
	<47468C05.3090600@student.utwente.nl>
In-Reply-To: <47468C05.3090600@student.utwente.nl>
Subject: Re: [oe-commits] org.oe.dev gcc-(cross)_4.1.2: enable gfortran and gfortran packaging
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
X-List-Received-Date: Sat, 24 Nov 2007 06:38:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/2007 02:15 AM, Koen Kooi wrote:
>>  	# Symlinks so we can use these trivially on the target
>>  	ln -sf ${TARGET_SYS}-g77 g77
>> +	ln -sf ${TARGET_SYS}-gfortran gfortran
>>  	ln -sf ${TARGET_SYS}-g++ g++
>>  	ln -sf ${TARGET_SYS}-gcc gcc
>>  	ln -sf g77 f77
>> +	ln -sf gfortran f95
>>  	ln -sf g++ c++
>>  	ln -sf gcc cc
>>  	ln -sf ${bindir}/${TARGET_SYS}-cpp ${D}${base_libdir}/cpp
> 
> Could you add ' || true ' after those link statements so that people can
> disable fortran if they want?

committed in revision 1aa5367f28f9d932c635b4de64f9c152ffc30570

regards
Gordon


