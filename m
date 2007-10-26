Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <zecke@selfish.org>) id 1IlPZo-0006bj-Mp
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2007 15:50:16 +0200
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=[192.168.1.23]) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1IlPSa-0006c5-RK
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2007 15:42:48 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <47217083.4000103@student.utwente.nl>
References: <E1IlBjn-00084R-Qk@linuxtogo.org>
	<47217083.4000103@student.utwente.nl>
X-Gpgmail-State: !signed
Message-Id: <CA5EEB08-2B31-4DC9-A7C7-2CB56243E808@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Fri, 26 Oct 2007 15:42:24 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
Subject: Re: [oe-commits] org.oe.dev packages/webkit: Build and package naming fixes (when using debian renaming)
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
X-List-Received-Date: Fri, 26 Oct 2007 13:50:17 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 26.10.2007 um 06:43 schrieb Koen Kooi:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> freyther commit schreef:
>> packages/webkit: Build and package naming fixes (when using debian  
>> renaming)
>>     We do not want the package to be named libwebkitgtk-launcher  
>> but want to
>>     keep the webkit-gtklauncher names.
>
> Do we? I created and maintain those recipes, and I made the  
> decision to
> name it libwebkitgtk-launcher when using debian naming. I would have
> used DEBIAN_NOAUTONAME_webkit-gtklauncher otherwise. Which brings  
> me to
> my second point:
>

Hi Koen,

please enlighten me. I want to put webkit-gtklauncher into my image.  
Due the package renaming do_rootfs will fail. Do you want people to  
put webkit-gtklauncher into their image? How can they do it?

I will restore webkit-gtk_svn.bb but would like to keep the qt and  
qtopia variant like it is (minus probably removing the python code).

Regarding the python code. Do we have some kind of janitor tasks for  
newbies? They could kill it from ~5-10 recipes as well.


z.






