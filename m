Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Lzdre-0007lZ-QM
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 23:32:18 +0200
Received: by ewy20 with SMTP id 20so4097857ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Apr 2009 14:26:52 -0700 (PDT)
Received: by 10.210.88.3 with SMTP id l3mr1198187ebb.81.1241126812707;
	Thu, 30 Apr 2009 14:26:52 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 5sm4777753eyf.44.2009.04.30.14.26.51
	(version=SSLv3 cipher=RC4-MD5); Thu, 30 Apr 2009 14:26:52 -0700 (PDT)
Message-ID: <49FA1799.7010100@xora.org.uk>
Date: Thu, 30 Apr 2009 22:26:49 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090430140436.GA7335@pcimg12.dei.unipd.it>	<49F9B426.5020602@xora.org.uk>
	<20090430155320.GA7550@pcimg12.dei.unipd.it>
In-Reply-To: <20090430155320.GA7550@pcimg12.dei.unipd.it>
X-Enigmail-Version: 0.95.0
Subject: Re: receipe for libmicrohttpd
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
X-List-Received-Date: Thu, 30 Apr 2009 21:32:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ottavio Campana wrote:
> On Thu, Apr 30, 2009 at 03:22:30PM +0100, Graeme Gregory wrote:
>   
>> Ottavio Campana wrote:
>>     
>>> I wrote the receipe for libmicrohttpd, a LPGL library used to embedded a
>>> web server in programs.
>>>
>>> It works for me, but I'd like to have some feedback from you, if it is
>>> good or not and if you'd like to add it to OE.
>>>
>>> Ottavio
>>>
>>> PR = "r1"
>>> PN = "libmicrohttpd"
>>> DESCRIPTION = "GNU libmicrohttpd is a small C library that is supposed to make it easy to run an HTTP server as part of another application"
>>> HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
>>> SECTION = "libs"
>>> LICENSE = "LGPL"
>>>
>>> SRC_URI = "ftp://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.4.1.tar.gz"
>>>
>>> inherit autotools pkgconfig
>>>
>>> do_stage() {
>>>         oe_runmake DESTDIR="${D}" install
>>>         autotools_stage_all
>>> }
>>>
>>> do_qa_staging () {
>>> }
>>>
>>>   
>>>       
>> You need to run the recipe through oe-stylize (found in contrib directory).
>>
>> Why did you override do_qa_staging() ?
>>
>> Apart from this recipe looks good, cleanup and submit as a git-diff.
>>     
>
> here it is. I hope it's good.
>
>   
I missed it first time, but you dont need to set PN =

PN is derived from the .bb file name and is already set for you.

Graeme



