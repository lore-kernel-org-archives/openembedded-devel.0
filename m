Return-Path: <vincent.libre@cryostase.eu>
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mail.openembedded.org (Postfix) with ESMTP id ED67E6FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 06:47:54 +0000 (UTC)
Received: from [192.168.1.159] (unknown [50.131.250.131])
	(Authenticated sender: vincent.rubiolo)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id EFD7819F5AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 07:47:53 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <8a55e15b-21d5-8dfa-5adb-09f84b7809fe@cryostase.eu>
From: Vincent Rubiolo <vincent.libre@cryostase.eu>
Message-ID: <20cef3e4-ca81-deaa-014a-2e8e57b0af5d@cryostase.eu>
Date: Thu, 29 Dec 2016 22:47:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <8a55e15b-21d5-8dfa-5adb-09f84b7809fe@cryostase.eu>
Subject: Re: [meta-maker] Octoprint on Intel Edison (yocto dizzy): failed python-flask RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Dec 2016 06:47:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hello again,

On 12/29/2016 10:14 PM, Vincent Rubiolo wrote:
> Another possibility could be to use the meta-intel-edison from the yocto
> project git repo[2] with meta-openembedded & meta-maker on master but I
> have yet to try that.

I have tried to do that after I sent this email and this does not appear 
to be possible. I hit an error about the SAVANNAH_GNU_MIRROR being 
missing when bitbake is called:
+++
ERROR: ExpansionError during parsing 
/yocto/build_edison/../poky/meta-openembedded/meta-oe/recipes-support/lzip/lzip_1.16.bb: 
Failure expanding variable do_fetch[file-checksums], expression was 
${@bb.fetch.get_checksum_file_list(d)} which triggered exception 
MalformedUrl: The URL: '${SAVANNAH_GNU_MIRROR}/lzip/lzip-1.16.tar.gz' is 
invalid and cannot be interpreted
+++

It looks like this is because meta-openembedded and poky have to 
version-match[1].

I thus look forward to your advice very much (as I do not see any 
workaround anymore).

Thanks again,

Vincent

[1] 
https://lists.yoctoproject.org/pipermail/yocto/2014-September/021716.html

