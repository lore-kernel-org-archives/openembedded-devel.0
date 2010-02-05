Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NdNd1-0002Q5-F3
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 13:49:46 +0100
Received: (qmail 15815 invoked by uid 1003); 5 Feb 2010 12:47:13 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 5 Feb 2010 12:47:13 -0000
Message-ID: <4B6C134F.9020305@balister.org>
Date: Fri, 05 Feb 2010 07:47:11 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <D15778FFF6A6CA4FAF01B8D2C3780300499DAE1590@ushqwmb02.palm1.palmone.com>
	<hkh3ea$jf9$1@ger.gmane.org>
In-Reply-To: <hkh3ea$jf9$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Issues with .list files
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
X-List-Received-Date: Fri, 05 Feb 2010 12:49:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2010 07:37 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 05-02-10 04:24, Michael Morrell wrote:
>> If I understand the algorithm in package_do_shlibs correctly, each package creates a .list file which is a list of all the shared libraries provided by that package.  It also generates a list of all the libraries that it needs and looks for those in .list files created by other packages so it can create a runtime dependency against that package.
>>
>> The way it looks for .list files is to simply scan all *.list files in the directory.  This has two problems that I can see.
>>
>> First, it is inefficient.  It should only have to look through .list files creates by packages created by bb files which were DEPENDed on by this bb file.
>
> Ehm, no. If it did that you'd get missing shlibs in lots of cases. OE
> won't error out, but you're stabbing users of the packages in the eye
> since they get stuck with the mess.

But it does seem like using a library created by something the recipe 
does not DEPEND on is a problem that should be corrected sooner, rather 
than later.

Philip


