Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <zecke@selfish.org>) id 1IYhXS-00036n-Jo
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Sep 2007 14:23:19 +0200
Received: from rosine65.inf.fu-berlin.de ([160.45.116.65])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1IYhTZ-0007Wc-9J
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Sep 2007 14:19:17 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <46EECDA8.167F241D@vollmann.ch>
References: <46EECDA8.167F241D@vollmann.ch>
Message-Id: <76671493-8747-4B67-A84E-E85E111215FD@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Fri, 21 Sep 2007 14:19:04 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
Subject: Re: calling python functions or mixing shell and python code
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
X-List-Received-Date: Fri, 21 Sep 2007 12:23:20 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 17.09.2007 um 20:55 schrieb Detlef Vollmann:

> Hello,
>
> how can I mix shell and python code in the same task?
>
> To be more concrete, here is what I tried:
> python do_fetch_more () {
>     import bb
>
>     bb.data.setVar('SRC_URI', '${SRC_URI_BASEPACKS}', d)
>     base_do_fetch
> }
> addtask fetch_more before do_unpack after do_fetch
>
> But this doesn't work.
>
> Another approach was:
> do_fetch_base () {
>     export SRC_URI=${SRC_URI_BASEPACKS}
>     base_do_fetch
> }
>
> But of course this also doesn't work...
>
> Any help appreciated,

Hi,
as no one else answered I will try to do that. The common practice is  
to add an intermediate python function that is calling the two other  
functions.

Using bb.build.exec_func and bb.build.exec_task you can call the  
functions/tasks you want.

I hope this helps.

	z.




