Received: from drewtech.com ([66.36.241.150] helo=server.drewtech.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joravec@drewtech.com>) id 1Pp4ps-0005Sd-1v
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 21:15:52 +0100
Received: (qmail 8096 invoked from network); 14 Feb 2011 15:18:20 -0500
Received: from adsl-75-58-206-177.dsl.sfldmi.sbcglobal.net (HELO
	?192.168.0.152?) (75.58.206.177)
	by j2534-3.com with SMTP; 14 Feb 2011 15:18:20 -0500
Message-ID: <4D598D30.3080506@drewtech.com>
Date: Mon, 14 Feb 2011 15:14:40 -0500
From: Joey Oravec <joravec@drewtech.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.14) Gecko/20110207 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D544976.6010800@drewtech.com>
	<4D545173.8080904@mentor.com>	<4D54734B.7060705@drewtech.com>
	<4D547643.2020600@mentor.com>
In-Reply-To: <4D547643.2020600@mentor.com>
Subject: Re: openembedded with a prebuilt external toolchain
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
X-List-Received-Date: Mon, 14 Feb 2011 20:15:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2/10/2011 6:35 PM, Tom Rini wrote:
>> Both the -csl.bb and -generic.bb copy a bunch of stuff to STAGING_DIR in
>> do_stage(). Of course in the long-run I need for the recipe to copy C
>> libraries, but for now I should be able to leave the body blank. At
>> least it'll use my compiler and run to completion. Right?
>
> Well, as you saw, it fails in some cases.  This is because, yeah, 
> we're telling the toolchain stuff lives ...here now, and it doesn't.

Thanks for the additional help on chat! This followup is to share my 
results with the mailing list.

Regarding my "bitbake nano" failure, that was a symptom of a sysroot 
issue. An external cross compiler has some default sysroot where it 
looks for libraries. By default it looks like OE passes nothing to 
change this. As a result do_configure() didn't look for libraries in 
staging dir, decided that ncurses didn't exist, and the build failed. 
One solution is to add:

TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"

to your build/conf/local.conf and make sure your compiler's default 
sysroot (libc, etc) gets copied into the staging dir. That way you can 
call *-gcc from somewhere in your path but it'll look for everything 
under OE's staging directory.

-joey


