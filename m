Received: from [65.254.253.109] (helo=mailout13.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <SRS0=i4+37W=6D=ngndg.com=tim@yourhostingaccount.com>)
	id 1LTHRU-0000qD-NW for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 16:07:32 +0100
Received: from mailscan15.yourhostingaccount.com ([10.1.15.15]
	helo=mailscan15.yourhostingaccount.com)
	by mailout13.yourhostingaccount.com with esmtp (Exim)
	id 1LTHJu-0000yd-Bc for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 09:59:42 -0500
Received: from impout02.yourhostingaccount.com ([10.1.55.2]
	helo=impout02.yourhostingaccount.com)
	by mailscan15.yourhostingaccount.com with esmtp (Exim)
	id 1LTHJu-0006RT-39 for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 09:59:42 -0500
Received: from authsmtp09.yourhostingaccount.com ([10.1.18.9])
	by impout02.yourhostingaccount.com with NO UCE
	id AEzh1b00G0BkWne0000000; Sat, 31 Jan 2009 09:59:41 -0500
X-EN-OrigOutIP: 10.1.18.9
X-EN-IMPSID: AEzh1b00G0BkWne0000000
Received: from 92-237-114-21.cable.ubr03.chms.blueyonder.co.uk
	([92.237.114.21] helo=[192.168.1.104])
	by authsmtp09.yourhostingaccount.com with esmtpa (Exim)
	id 1LTHJt-0000vf-FU for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 09:59:41 -0500
Message-Id: <9342BA46-9CBB-4462-8D0F-C2C7F325DEA5@ngndg.com>
From: Tim Ellis <tim@ngndg.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Sat, 31 Jan 2009 14:59:39 +0000
References: <C2AB3E43-BDA7-4353-9496-C57DE480F612@ngndg.com>
X-Mailer: Apple Mail (2.930.3)
X-EN-UserInfo: b8ae887d91300d60195f6ea73d56f3bc:43527cee0c82d0ab5dc2dc3726f6afdf
X-EN-AuthUser: tim@ngndg.com
Sender: Tim Ellis <tim@ngndg.com>
X-EN-OrigIP: 92.237.114.21
X-EN-OrigHost: 92-237-114-21.cable.ubr03.chms.blueyonder.co.uk
Subject: Re: krb recipe
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
X-List-Received-Date: Sat, 31 Jan 2009 15:07:33 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

>
> - This doesn't work.  First, I don't think the unpack belongs in  
> do_configure, but be that as it may.  The big
> issue is that the patch creates a source file, which causes patching  
> to fail because the source file
> already exists for any subsequent attempt to run do_configure.
>
> do_configure() {
>       tar xzf ${WORKDIR}/krb5-1.6.3.tar.gz -C ${WORKDIR}/
>       patch -p1 < ${WORKDIR}/fix-uclibc-ruserpass-collision.patch
>       oe_runconf
> }
>
> foonas email is a bit broken so using this one atm. I am unable to  
> recreate a failure here - I am unsure also why it would fail for you  
> or need a subsequent do_configure, do you have more information? I  
> can put this in a do_unpack - since this ships as a signed tar.gz in  
> a tar archive this looked like the least messy way to do it.
>
> - do_configure failes if TARGET_LINK_HASH_STYLE is not set.  Right  
> now it's only set for Angstrom distros,
> so this recipe only builds for Angstrom.  Note the extra space  
> between "-O1" and "-lpthread" in the first
> line; something stripped extra white space as it was passed through  
> somewhere.
>
> configure: error: `LDFLAGS' has changed since the previous run:
> configure:   former value:  -L/u/slug/slugos/tmp/staging/armv5teb- 
> linux-gnueabi/usr/lib -Wl,-rpath-link,/u/slug/slugos/\
> tmp/staging/armv5teb-linux-gnueabi/usr/lib -Wl,-O1  -lpthread
> configure:   current value: -L/u/slug/slugos/tmp/staging/armv5teb- 
> linux-gnueabi/usr/lib -Wl,-rpath-link,/u/slug/slugos/\
> tmp/staging/armv5teb-linux-gnueabi/usr/lib -Wl,-O1 -lpthread
> configure: error: changes in the environment can compromise the build
>
> Since I am working with angstrom I am unable to recreate this  
> unfortunately. It would be great if we can track down what exactly  
> is doing this though to make it fail for your distribution. I will  
> take a look.
>
> Tim



