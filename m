Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1PkyyS-0007q2-RN
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 14:11:48 +0100
Received: from [192.168.0.101] (91-64-83-241-dynip.superkabel.de
	[91.64.83.241])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 14AEC1B10C05;
	Thu,  3 Feb 2011 13:20:36 +0000 (UTC)
Message-ID: <4D4AA95C.5000103@freyther.de>
Date: Thu, 03 Feb 2011 14:10:52 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch.de>
References: <4D4929CB.6040009@dresearch.de>	<4D49552D.3010705@dresearch.de>	<4D4A6796.1070006@dresearch.de>	<AANLkTinyw5W+jaZVba1LyAn5h1c-1kCDt9vXPBERhzk2@mail.gmail.com>	<4D4A88FC.3090706@dresearch.de>
	<4D4A91D9.2040406@freyther.de> <4D4A96A0.4080402@dresearch.de>
	<4D4A9739.6040909@freyther.de> <4D4A9A94.6030108@dresearch.de>
	<4D4A9C30.8010803@freyther.de> <4D4AA84C.1050001@dresearch.de>
In-Reply-To: <4D4AA84C.1050001@dresearch.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: profiling howto?
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
X-List-Received-Date: Thu, 03 Feb 2011 13:11:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/03/2011 02:06 PM, Steffen Sledz wrote:

>> I am not sure why you want to use gprof but anyway...
>>
>> a) do not use gprof on glibc...
> 
> I'm not interested in using gprof on glibc. I'm interested in profiling some other libs/apps only.
> 
> But the suggested method to prepare just some packages for profiling does not work jet (see other subthread).

1.) use oprofile... install the -dbg packages on the device... install
oprofile itself... start sampling with opcontrol --start -p library -c 7 or
such.. then stop... use opreport -l to look...

2.) if you want to have backtraces... recompile with -fno-omit-frame-pointer
as I have mentioned...

3.) if you do not want sampling based profiling, yes use gprof... enable it
for the libs and apps you want... using bitbake -e you should be able to
figure out how bitbake selects the variables...



